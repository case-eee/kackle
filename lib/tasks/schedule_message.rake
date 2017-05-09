namespace :twilio_message do
  task :schedule => :environment do
    User.active?.each do |user|
      TwilioMessage.send(user.phone)
    end
  end
end
