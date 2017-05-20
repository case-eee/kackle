class Messages::Twilio::UsersController < Messages::Twilio::BaseController
  def update
    user = User.find_by_phone(params["From"])
    user.update_status(params["Body"]) if user

    head :ok
  end
end
