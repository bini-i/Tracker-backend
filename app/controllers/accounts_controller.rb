class AccountsController < ApplicationController
  def create
    @user = User.create(email: params[:email], password: params[:password])
    if @user.valid?
      render :create, status: :created
    else
      head(:unprocessabile_entity)
    end
  end

  def destroy; end
end
