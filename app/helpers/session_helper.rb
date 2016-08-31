helpers do

	# this checks if there is a current user instance variable already. if not, it sets the current user instance variable
	# equal to the user whose id matches the current session id, if there is a session right now
	def current_user
		@current_user ||= User.find(session[:id]) if session[:id]
	end

	# this is just a more english-friendly function name that calls the above function so does the exact same thing
	def logged_in?
		current_user
	end

end