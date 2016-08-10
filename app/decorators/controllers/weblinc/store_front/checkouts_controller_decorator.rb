module Weblinc
  decorate(StoreFront::CheckoutsController, with: 'weblinc_facebook') do
    decorated do
      helper StoreFront::FacebookHelper
    end
  end
end
