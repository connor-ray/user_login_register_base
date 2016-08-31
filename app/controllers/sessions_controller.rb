# for paths, you need the slash before the first word
# for erb stuff, you don't put a slash before the first word

# the path after the get or post is where the route gets info from
# any redirects (or form actions in the view pages) are where info gets sent to

# this is for the login page. it displays the sessions/new view
get '/sessions/new' do
	erb :'sessions/new'
end

# this is to handle the form data sent from the login page (the path specified by the action attribute of the form
# triggers this post route)
post '/sessions' do
	# first it finds the user that logged in (in this case it finds them by their username but it could be any of the inputs from the register form)
	# it does need to match the input field you specify in the login form. so if i do find_by username here, i need to have them enter username and password in the login form, not email and password for instance
	# the first argument of find_by specifies what column of the users table to search (the username column)
	# the second argument specifies what to look for (the params key :username, which comes from the form input field with the name 'username')
	@user = User.find_by(username: params[:username])
	# then it checks if that user exists in the database AND whether the stored password for that user matches the password entered in the login form
	# NOTE: it needs to go in this order with the stored password on the left and entered password on the right because of how bcrypt handles it or something
	if @user && @user.password == params[:password]
		# if the user exists and entered the right password in the login form, then it sets the session id to match this user's id
		session[:id] = @user.id
		# then it redirects to that user's profile page so that they end up there after logging in
		# NOTE: you need to use double quotes for this redirect because interpolation #{} only works with double quotes
		redirect "/users/#{@user.id}"
	else
		# if the user didn't exist in the database or the password was entered wrong, then it sets this as the error
		@errors = ["Username and/or password not found"]
		# it then just displays the login page so they can try logging in again
		erb :'/sessions/new'
	end
end

# this is to handle logging out. it ends a session by setting the session id back to nil
# it then redirects back to the homepage
delete '/sessions' do
	session[:id] = nil
	redirect '/'
end