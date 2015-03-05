class ApplicationController < ActionController::Base
  inherit_resources

  protect_from_forgery
  respond_to           :json
  actions              :all
end
