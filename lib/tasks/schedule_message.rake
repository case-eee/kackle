namespace :twilio_message do
  task :send_joke => :environment do
    User.active?.each do |user|
      joke = Joke.random(user)
      TwilioMessage.send(user.phone, joke.full)
      JokeUser.create(user: user, joke: joke)
    end
  end
end
