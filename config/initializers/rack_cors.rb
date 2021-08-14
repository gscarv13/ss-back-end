Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # update later
    resource '*', #update later
        headers: :any, 
        methods: [:get, :post, :patch, :put, :options]
  end
end
