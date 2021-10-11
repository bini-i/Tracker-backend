class SessionsController < ApplicationController
    def create
        puts 'params'
        puts headers
        puts params
        @user = User.find_by(email: params[:email])

        if @user&.valid_password?(params[:password])
            render :create, status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy

    end
end
