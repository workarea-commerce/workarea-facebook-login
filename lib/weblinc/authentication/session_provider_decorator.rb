Weblinc::Authentication::SessionProvider.class_eval do
  def logout_with_facebook
    if current_user && current_user.is_omniauthed?
      user = current_user
      user.is_omniauthed = false
      user.save
    end
    logout_without_facebook
  end
  alias_method_chain :logout, :facebook
end
