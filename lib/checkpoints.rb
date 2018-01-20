require 'httparty'
require 'json'

module Checkpoints
  def create_submission(checkpoint_id, branch, commit_link, comment)
    sender = self.get_me["current_enrollment"]["id"]
    response = self.class.post(
      "/checkpoint_submissions",
      body: { "checkpoint_id": checkpoint_id, "assignment_branch": branch, "assignment_commit_link": commit_link, "comment": comment, "enrollment_id": sender },
      headers: { "authorization" => @auth_token })
    if response.success?
      puts "Checkpoint submitted."
    else
      puts response
    end
  end
end
