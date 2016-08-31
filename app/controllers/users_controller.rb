# for paths, you need the slash before the first word
# for erb stuff, you don't put a slash before the first word

# the path after the get or post is where the route gets info from
# any redirects (or form actions in the view pages) are where info gets sent to

# this is for the register page. it displays the users/new view
# it sets the variable @user equal to a new User object
get '/users/new' do
	@user = User.new

	erb :'users/new'
end

# this is for the user profile page.
# it sets the @user variable equal to the user object with the id specified in the url
get '/users/:id' do
	@user = User.find(params[:id])
	# if there is currently a logged in user, it displays the users/show page (profile page)
	if current_user
		erb :'users/show'
	# otherwise it redirects to the login page so the person can login
	else
		redirect '/sessions/new'
	end
end

# we only need these two get routes and these two views because we are only ever going to create new users or view an existing user
# we don't ever need to see all users at once (so no get '/users' and no index.erb)
# we don't need to edit a user (so no get '/users/:id/edit' and no edit.erb)
# we don't need to update or delete users so no put or delete routes either


# this handles the form data sent from the register page (the path specified by the form's action attribute
# triggers this route)
post '/users' do
	# first it checks that the password confirmation entered matches the password entered
	# these are both accessed using their params keys, password is nested in user since that's how it appears in the form
	if params[:password_confirmation] == params[:user][:password]
		# it creates a new user object based on the input fields from the form
		# because all the input fields except password confirmation are nested in the user key, you can just get :user from params and it will contain the info for all of the attributes
		@user = User.new(params[:user])
		# if there is no problem saving this new user to the database (no missing fields, etc)
		if @user.save
			# then the session is set to the user id so that they are logged in once they register
			session[:id] = @user.id
			# it's then redirected to their user page so they end up there after registering 
			redirect "/users/#{@user.id}"
			# NOTE: need double quotes here because interpolation #{} only works with double quotes
		else
			# if for some reason the user couldn't be saved to the database, set the error messages
			# not 100% sure how these error messages work, I just look up the syntax each time; now I can just use this reference :)
			@errors = @user.errors.full_messages
			# then redirect to the register page so they can try registering again
			redirect '/users/new'
		end
	else
		# if the password confirmation entered didn't match the password entered (from way at the top of this)
		# then set the errors (they should always be a string in an array so they are consistent across all their forms)
		@errors = ["Password and password confirmation don't match"]
		# then display the register page so they can try entering the info again
	end			
end




