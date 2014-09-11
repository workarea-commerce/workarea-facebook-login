# Add routes for your plugin, like so:
#
# Weblinc::Admin::Engine.routes.draw do
#   resources :facebooks
# end
#
Weblinc::StoreFront::Engine.routes.draw do
  scope Weblinc::Core::Engine.ssl_options do
    get 'auth/facebook/callback', to: 'users/facebook#create'
  end
end
