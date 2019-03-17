class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user_enrollment_lesson

    def show
        
    end 
    
    private
  def require_user_enrollment_lesson
    if  !current_user.enrolled_in?(current_lesson.section.course)  
      redirect_to course_url(current_lesson.section.course), alert: 'You must be enrolled to view lessons'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
