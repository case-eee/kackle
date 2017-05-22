class Messaging::Twilio::BaseController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :require_authentication
end
