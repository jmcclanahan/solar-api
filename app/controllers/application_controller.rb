class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ::ActionController::Serialization
  #before_filter :authenticate_user!
end
