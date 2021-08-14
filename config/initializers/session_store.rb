# update the domain to the production origin
if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_authentication', domain: 'set/proper/domain'
else
  Rails.application.config.session_store :cookie_store, key: '_authentication'
end
