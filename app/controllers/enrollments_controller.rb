class EnrollmentsController < ApplicationController
    def create
        byebug
    
        @enrollment = Enrollment.new(enrollment_params)
        if @enrollment.valid?
            render json: { enrollment: @enrollment }
        end
    end
    def index
        @enrollments = Enrollment.all
        render json: { enrollments: @enrollments }
    end
    private
    def enrollment_params
        params.require(:enrollment).permit(:user_id, :session_id, :id)
    end
end
