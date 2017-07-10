module Workarea
  module FacebookLogin
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::FacebookLogin
    end
  end
end
