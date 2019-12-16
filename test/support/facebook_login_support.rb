module Workarea
  module Testing
    module FacebookLoginSupport
      extend ActiveSupport::Concern

      included do
        setup do
          # OmniAuth uses RACK_ENV to determine whether it should raise out
          # errors.
          # https://github.com/omniauth/omniauth/blob/master/lib/omniauth/failure_endpoint.rb#L20
          #
          # RACK_ENV can be inconsistent (doesn't always match RAILS_ENV).
          # Sometimes it'll end up as `development` in tests causing what look
          # like random failures because this is part of the default value of
          # `OmniAuth.config.failure_raise_out_environments`.
          #
          # Clearing these out ensures OmniAuth doesn't raise regardless of
          # RACK_ENV. This is helpful when want to test failure scenarios.
          #
          # Note that the errors will still log to STDOUT, but OmniAuth won't
          # actually raise the error causing the test to fail.
          #
          @_omni_auth_failure_raise_out_environments = OmniAuth.config.failure_raise_out_environments
          OmniAuth.config.failure_raise_out_environments = []
        end

        teardown do
          OmniAuth.config.failure_raise_out_environments = @_omni_auth_failure_raise_out_environments
        end
      end

      def with_omniauth_testing(successful = true, &blck)
        OmniAuth.config.test_mode = true
        OmniAuth.config.add_mock(:facebook,
          uid: "1234",
          info: { email: "epigeon@weblinc.com" },
          credentials: {
            token: "1234",
            expires_at: Time.now.to_i
          }
        )

        blck.call
      ensure
        OmniAuth.config.test_mode = false
        OmniAuth.config.mock_auth[:facebook] = nil
      end
    end
  end
end
