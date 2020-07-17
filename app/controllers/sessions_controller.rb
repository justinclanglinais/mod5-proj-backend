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
        # render json: { id: @session.id, topic: @session.topic, category: @session.category }
        render json: @session, include: [:topic, :category]
    end
end
