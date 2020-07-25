class SessionsController < ApplicationController
    def index
        @sessions = Session.all 
        # render json: @sessions
        render json: @sessions, :include => {
            :topic => {
                :only => [:id, :name, :vid_url]}, 
            :category => {
                :only => [:id, :name]},
            :user => {
                :only => [:name, :belt]}},
            except: [:category_id, :topic_id, :created_at, :updated_at]
    end

    def show
        @session = Session.find_by(id: params[:id])
        render json: @session, include: [:topic, :category]
    end

    def update
        # byebug
        @session = Session.find_by(session_params[:id])
        @session.update(session_params)
        @session.save
        render json: @session
    end

    private

    def session_params
        params.require(:session).permit(:id, :topic_id, :category_id, :user_id, :time)
    end
end
