# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  private

  def authenticate!
    request_http_basic_authentication unless current_user.present?
  end

  def current_user
    @current_user ||= authenticate_with_http_basic do |user, password|
      user == ENV.fetch('ADMIN_USERNAME') && password == ENV.fetch('ADMIN_PASSWORD')
    end
  end
end
