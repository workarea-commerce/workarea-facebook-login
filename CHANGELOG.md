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
