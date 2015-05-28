module Weblinc
  module StoreFront
    decorate(CheckoutsController) do
      decorated do
        helper FacebookHelper
      end
    end
  end
end
