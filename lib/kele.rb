require 'httparty'
require 'json'

class Kele
  include HTTParty
  base_uri 'https://www.bloc.io/api/v1/'

  def initialize(email, password)
    response = self.class.post("/sessions", body: {"email": email, "password": password})
    # puts response
    @auth_token = response["auth_token"]
    raise 'Invalid email or password' if response.code != 200
  end

  def get_me
    response = self.class.get("/users/me", headers: { "authorization" => @auth_token })
    @user_data = JSON.parse(response.body)
  end
end
