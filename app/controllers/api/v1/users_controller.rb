class Api::V1::UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create]

    def index
        @users = User.all 
        render json: @users
    end

    def show
        @user = User.find_by(id: params[:id])
        render json: @user, :include => {
            :sessions => {
                :include => {
                   :topic => {
                       :only => [:id, :name, :vid_url]}, 
                   :category => {
                       :only => [:id, :name]},
                   :user => {
                       :only => [:name, :belt]}},
                   except: [:category_id, :topic_id, :created_at, :updated_at]
            }
        }
        
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token({user_id: @user.id})
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
    end

    def instructors
        @users = User.instructors
        render json: @users
    end

    private

    def user_params
        params.require(:user).permit(:email, :password, :name, :isAdmin, :age, :img_url, :belt, sessions_attributes: [:id, :topic, :category])
    end
end
