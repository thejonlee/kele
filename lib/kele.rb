require 'httparty'
require 'json'
require_relative './roadmap'

class Kele
  include HTTParty
  include Roadmap
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

  def get_mentor_availability(mentor_id)
    response = self.class.get("/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token })
    @availability = JSON.parse(response.body)
  end

  def get_messages(page_number = nil)
    if page_number == nil
      response = self.class.get("/message_threads?1=", headers: { "authorization" => @auth_token })
    else
      response = self.class.get("/message_threads?#{page_number}=", headers: { "authorization" => @auth_token })
    end
    @messages = JSON.parse(response.body)
  end

  def create_message(sender, recipient_id, subject, text)
    response = self.class.post(
      "/messages",
      body: { "sender": sender, "recipient_id": recipient_id, "subject": subject, "stripped-text": text },
      headers: { "authorization" => @auth_token })
    if response.success?
      puts "Message sent."
    else
      puts response
    end
  end
end
