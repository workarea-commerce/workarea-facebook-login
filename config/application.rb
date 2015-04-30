module MyApp
  class Application < Rails::Application

    config.to_prepare do
      Weblinc::StoreFront::ApplicationController.helper(Weblinc::StoreFront::FacebookHelper)
    end

  end
end
