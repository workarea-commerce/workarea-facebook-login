module Weblinc
  decorate(StoreFront::Users::LoginsController, with: 'weblinc_facebook') do
    class_methods do
      def destroy
        if current_user && current_user.is_omniauthed?
          Weblinc::User.setup_password_reset(current_user.email)
          email = current_user.email
          flash[:error] = "In order to login without Facebook you must reset your password, a password reset has been sent to '#{email}'"
        end
        super
      end
    end
  end
end
