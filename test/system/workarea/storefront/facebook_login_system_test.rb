require "test_helper"

module Workarea
  class Storefront::FacebookLoginsSystemTest < Workarea::SystemTest
    include Testing::FacebookLogingSupport

    def test_logging_in
      with_omniauth_testing do
        visit storefront.login_path

        click_link t("workarea.storefront.facebook.connect_with_facebook")

        assert(
          page.has_current_path?(storefront.users_account_path),
          "Expected page to have current path #{storefront.users_account_path}"
        )
      end
    end
  end
end
