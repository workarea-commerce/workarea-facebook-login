module Weblinc
  decorate(Authentication, with: 'weblinc_facebook') do
    def logout
      if current_user && current_user.is_omniauthed?
        user = current_user
        user.is_omniauthed = false
        user.save
      end
      super
    end
  end
end
