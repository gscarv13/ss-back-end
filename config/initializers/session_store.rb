# update the domain to the production origin
Rails.application.config.session_store :cookie_store, key: '_authentication', domain: 'https://localhost:3000'
