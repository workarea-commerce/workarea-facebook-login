Workarea Facebook Login 2.1.0 (2019-12-17)
--------------------------------------------------------------------------------

*   Update RuboCop Config

    Tom Scott

*   Fix test that can randomly fail due to inconsistent RACK_ENV

    FACEBOOK-1
    Ben Crouse

*   This is my life now

    Tom Scott

*   Yeah apparently OmniAuth is poorly maintained...

    Tom Scott

*   Ensure Compatibility with v3.5.x of Workarea

    Fixes several issues when using this gem with v3.5:

    - Update decorated tests to use `session` instead of `cookies` for user
    identification.
    - Set up the gem for hosting on GitHub and CI with GitHub Actions
    - Update OmniAuth to v1.9+ to address security issue
    - Update configuration in `test/dummy` to be compatible with the latest Rails

    FACEBOOK-1
    Tom Scott

*   correct spec.files in gemspec

    Jake Beresford

*   rename gemspec

    Jake Beresford



Workarea Facebook 2.0.0 (2017-07-13)
--------------------------------------------------------------------------------


Workarea Facebook 2.0.0 (2017-07-13)
--------------------------------------------------------------------------------


Workarea Facebook 2.0.0 (2017-07-13)
--------------------------------------------------------------------------------

*   Rename plugin to FacebookLogin

    FBLOGIN-11
    Jake Beresford

*   Upgrade Facebook Login for Workarea V3

    Breaking Changes
    Remove partial from Users Accounts, "unlinking from facebook" served no purpose
    Storefront::Users::FacebookController was renamed to Storefront::Users::FacebookLoginsController
    FacebookHelper was removed and path is now in Workarea::Facebook.auth_path
    The storefront/_facebook partial was moved to storefront/users/_facebook_login

    FBLOGIN-8
    Eric Pigeon

*   Capitalize facebook in error message

    FBLOGIN-7
    Eric Pigeon
