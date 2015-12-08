class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

helper_method :current_user

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

	def userIsCoordinator
    return current_user.role_id == 1
  end
	
	def userIsAdmin
		return current_user.role_id == 2
	end

	def userIsStudent
		return current_user.role_id == 3
	end
  
  def userIsAssistant
    return current_user.role_id == 4
  end

  def isTimeOver final_date
    return Time.parse(final_date.to_s).utc.to_i*1000 < Time.parse(DateTime.now.to_s).utc.to_i*1000
  end

  def firstClosure career_id
    closure = RequestsClosure.where(:career_id => career_id.to_i)[0]
    if !closure.blank?
      return true
    end
    return false
  end
  
  def getCareerClosure career_id
    closure = RequestsClosure.where(:career_id => career_id.to_i)[0]
    return closure.id.to_i
  end
end
