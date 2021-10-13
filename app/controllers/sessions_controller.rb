class SessionsController < ApplicationController
    def create
        puts 'params'
        puts params
        puts headers
        # puts current_user
        @user = User.find_by(email: params[:email])
        
        if @user&.valid_password?(params[:password])
            # console.log(current_user)s
            byebug
            render :create, status: :created
        else
            head(:unauthorized)
        end
    end

    def destroy

    end
end
