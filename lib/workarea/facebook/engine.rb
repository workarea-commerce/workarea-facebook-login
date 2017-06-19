module Workarea
  module Facebook
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::Facebook
    end
  end
end
