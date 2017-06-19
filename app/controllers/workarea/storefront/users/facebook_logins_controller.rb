module Workarea
  class Storefront::Users::FacebookLoginsController < Storefront::ApplicationController
    before_action :user_from_omniauth,     only: :create
    before_action :fail_admin_log_in,      only: :create
    before_action :validate_current_email, only: :create

    def create
      login(@user)

      login_service = Login.new(@user, current_order).tap(&:perform)
      self.current_order = login_service.current_order

      flash[:success] = t("workarea.storefront.flash_messages.logged_in")
      redirect_back_or users_account_path
    end

    def failure
      flash[:error] = t("workarea.storefront.facebook.flash_messages.failure")
      redirect_to login_path
    end

    private

      def auth_hash
        @auth_hash ||= request.env["omniauth.auth"]
      end

      def user_from_omniauth
        @user ||= Workarea::User.from_omniauth(auth_hash)
      end

      def fail_admin_log_in
        return unless @user.admin? || @user.super_admin?

        flash[:error] = t("workarea.storefront.facebook.flash_messages.admin_failure")
        redirect_to login_path
      end

      def validate_current_email
        return if current_user.nil? || current_user.email == auth_hash.info.email

        flash[:error] = t("workarea.storefront.facebook.flash_messages.email_mismatch")
        redirect_back_or users_account_path
      end
  end
end
