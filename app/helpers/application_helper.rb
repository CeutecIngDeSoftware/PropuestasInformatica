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

end
