Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "https://compassionate-sammet-e894d7.netlify.app"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end

  allow do
    origins "https://compassionate-sammet-e894d7.netlify.app"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end
end