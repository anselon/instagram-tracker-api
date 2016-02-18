# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
# Avoid CORS issues when API is called from the frontend app
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests

# Read more: https://github.com/cyu/rack-cors
require 'rack/cors' 
use Rack::Cors do
 Rails.application.config.middleware.insert_before 0, "Rack::Cors" do
   allow do
     origins 'blooming-waters-27559.herokuapp.com/', 'localhost:5000'

     resource '*',
       headers: :any,
       methods: [:get, :post, :put, :patch, :delete, :options, :head]
   end
 end
run Rails.application
