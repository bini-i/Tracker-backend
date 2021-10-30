# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user&.valid_password?(params[:password])
      @user.save
      render :create, status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy; end
end
