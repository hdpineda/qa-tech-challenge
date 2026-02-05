require 'httparty'
require 'json'

class ReqresClient
  include HTTParty
  base_uri 'https://reqres.in'
  
  headers 'Content-Type' => 'application/json',
          #'User-Agent'   => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)',
          'x-api-key'    => 'reqres_a77a762c61d344cbbc220fe15e899dea' 

  def get_single_user(id)
    self.class.get("/api/users/#{id}")
  end

  def create_user(name, job)
    body = { name: name, job: job }.to_json 
    self.class.post("/api/users", body: body)
  end
end