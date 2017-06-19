require "test_helper"

module Workarea
  module Storefront
    class Users::FacebookLoginsIntegrationTest < Workarea::IntegrationTest
      include Testing::FacebookLogingSupport

      delegate :t, to: I18n

      def test_redirects_if_omniauth_missing
        get storefront.auth_facebook_callback_path

        # the middleware will redirect to auth/failure
        follow_redirect!
        assert_redirected_to(storefront.login_path)
        assert_equal(
          t("workarea.storefront.facebook.flash_messages.failure"),
          flash[:error]
        )
      end

      def test_redirects_if_user_admin
        with_omniauth_testing do
          create_user(email: "epigeon@weblinc.com", super_admin: true)

          get storefront.auth_facebook_callback_path

          assert_redirected_to(storefront.login_path)
          assert_equal(
            t("workarea.storefront.facebook.flash_messages.admin_failure"),
            flash[:error]
          )
        end
      end

      def test_redirects_on_email_mismatch
        with_omniauth_testing do
          Users::FacebookLoginsController
            .any_instance
            .stubs(:current_user)
            .returns(create_user)

          get storefront.auth_facebook_callback_path

          assert_redirected_to(storefront.users_account_path)
          assert_equal(
            t("workarea.storefront.facebook.flash_messages.email_mismatch"),
            flash[:error]
          )
        end
      end

      def test_can_login_a_user
        with_omniauth_testing do
          get storefront.auth_facebook_callback_path

          assert_redirected_to(storefront.users_account_path)
          assert(response_cookies[:user_id].present?)
        end
      end

      private

        def response_cookies
          ActionDispatch::Cookies::CookieJar
            .build(request, response.cookies)
            .signed
        end
    end
  end
end
