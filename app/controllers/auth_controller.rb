# frozen_string_literal: true

class AuthController < ApplicationController
  def show
    authenticate!
  end
end
