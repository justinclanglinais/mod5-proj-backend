class Api::V1::AuthController < ApplicationController
    # skip_before_action :authorized, only: [:create]

    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            token = encode_token( {user_id: @user.id})
            render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
            else
            render json: { message: 'Invalid email or password' }, status: :unauthorized
        end
    end

    def show
        token = request.headers['Authorization']
        @user = User.find_by(id: token)
        if @user
            render json: { user: UserSerializer.new(@user) }
        else
            render json: { message: 'Could not find this user' }
        end
    end

    private

    def user_login_params
        params.require(:user).permit(:email, :password)
    end
end
