module ApplicationHelper
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
	
	def stateCancelado request
		return request.state.id == 3
	end

  def isTimeOver final_date
    return Time.parse(final_date.to_s).utc.to_i*1000 < Time.parse(DateTime.now.to_s).utc.to_i*1000
  end
end
