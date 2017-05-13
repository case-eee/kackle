class Sms::UsersController < Sms::BaseController
  def update
    user = User.find_by_phone(params["From"])
    if (params["Body"].upcase[0..1] == "NO" || params["Body"].upcase[0..10] == "UNSUBSCRIBE") && user
      user.active = false
      user.save
    end

    render :nothing => true, :status => 200, :content_type => 'text/html'
  end
end
