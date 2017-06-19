module Workarea
  module Testing
    module FacebookLogingSupport
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
