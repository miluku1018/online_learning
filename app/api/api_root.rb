class ApiRoot < Grape::API
  PREFIX = '/api'.freeze

  format :json

  before do
    header "Access-Control-Allow-Origin", "*"
  end
  
  mount ApiV0::Base
end