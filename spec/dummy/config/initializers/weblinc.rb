Weblinc.configure do |config|
  config.sites = [
    {
      id: 1,
      name: 'WebLinc Facebook',
      domain: 'www.example.com',
      api_token: '4f621e1970321568a5000005',
      email: {
        accounts: 'accounts@weblinc.com',
        orders: 'orders@weblinc.com',
        customer_service: 'customerservice@weblinc.com'
      },
      facets: %w(Sex Color Size),
      price_ranges: [
        { to: 9.99 },
        { from: 10, to: 19.99 },
        { from: 20, to: 29.99 },
        { from: 30, to: 39.99 },
        { from: 40 }
      ]
    }
  ]

  config.asset_store = :file_system, {
    root_path: '/tmp/weblinc_facebook',
    server_root: '/tmp/weblinc_facebook'
  }
end
