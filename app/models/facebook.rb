class Facebook < ActiveRecord::Base
  include HTTParty
  
  base_uri 'https://graph.facebook.com/'
   # default_params :output => 'json'
  format :json

   def self.object(id)
     get "/#{id}"
   end
end
