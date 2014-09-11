Weblinc::StoreFront::Users::LoginsController.class_eval do
  def destroy_with_facebook
    if current_user && current_user.is_omniauthed?
      Weblinc::User.setup_password_reset(current_user.email)
      email = current_user.email
      flash[:error] = "In order to login without Facebook you must reset your password, a password reset has been sent to '#{email}'"
    end
    destroy_without_facebook
  end
  alias_method_chain :destroy, :facebook
end
