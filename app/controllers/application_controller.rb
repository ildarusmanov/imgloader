require "application_responder"

class ApplicationController < ActionController::Base
  include DiContainer

  self.responder = ApplicationResponder

  respond_to :html

  protect_from_forgery with: :exception
end
