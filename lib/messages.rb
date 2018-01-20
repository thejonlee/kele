require 'httparty'
require 'json'

module Messages
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
