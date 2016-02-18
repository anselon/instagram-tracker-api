# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
# Avoid CORS issues when API is called from the frontend app
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests

# Read more: https://github.com/cyu/rack-cors
run Rails.application
