module Weblinc
  class StoreFront::Users::FacebookController < StoreFront::ApplicationController
    before_filter :ensure_not_locked, only: :create

    def create
      user = Weblinc::User.from_omniauth(auth_hash)

      if user.present? && user.valid?
        if(user.admin? || user.csr? || user.super_admin?)
          flash[:error] = "an admin or csr may not log in with Facebook."
          redirect_to login_path
        else
          unless check_current_email(auth_hash)
            flash[:error] = "Sorry, your facebook email and account email must match to connect with Facebook. You may change your email in My Account."
            redirect_back_or users_account_path and return
          end

          login(user)

          if current_order && checking_out?
            current_checkout.start_as(user)
            redirect_to checkout_path and return
          end

          login_service = Weblinc::Login.new(user, current_order).tap(&:perform)
          self.current_order = login_service.current_order

          flash[:success] = 'Login successful. Welcome back!'
          redirect_back_or users_account_path
        end
      else
        flash[:error] = "Sorry, we had a problem retrieving your information from Facebook. Please check your privacy settings, and try again."
        redirect_to login_path
      end
    end

  private

    def ensure_not_locked
      if Weblinc::User.login_locked?(params[:email])
        flash[:error] = 'This account has been locked for 30 minutes.'

        respond_to do |format|
          format.html { redirect_to(login_path) }
          format.json { render 'new' }
        end

        return false
      end
    end

    def auth_hash
      @auth_hash ||= request.env['omniauth.auth']
    end

    def check_current_email(auth)
      return true if auth.nil? || current_user.nil?
      current_user.email == auth.info.email
    end

    def checking_out?
      request.env['omniauth.origin'] == checkout_url
    end
  end
end
