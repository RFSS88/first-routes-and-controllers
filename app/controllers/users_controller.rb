class UsersController < ApplicationController
    def index
        render json: User.all
    end

    def create
        user = User.new(user_params)

        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
            # 422 is the status code for an unprocessable entity.
            # You can either pass the status code or status symbol.
            # In other words, you can also return:
            # render json: user.errors.full_messages, status: 422
        end
    end

    def show
        render json: User.find(params[:id])
        #params[:id] gives us the number of we ask for in the params
        # like saying User.find(3) which would give us the third instance of user.
    end

    def update
        user = User.find(params[:id])
        
        if user.update_attributes(user_params)
            render json: user
        else
            render json: user.errors, status: 422
        end
    end

    def destroy
        User.destroy(params[:id])
        render json: 'The user has been destroyed, ouch'

    end

    private
    def user_params
        params.require(:user).permit(:name, :email)        
    end
end