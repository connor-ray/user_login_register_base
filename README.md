This is a skeleton for setting up a site that can register users and let them login and logout. User data is stored in a database.

This is meant to be a reference so we don't have to keep looking up the same syntax and setup steps.

I'll list the steps it took to get from the mvc skeleton dbc provides to here.

tl;dr :

- clone
- add bcrypt to gemfile
- run bundle install
- run be shotgun

- run rake generate:model NAME=User
- run rake generate:migration NAME=CreateUsers

- create users_controller.rb in controllers folder
- create sessions_controller.rb in controllers folder
- create index.rb in controllers folder
- create users folder in views folder
- create sessions folder in views folder
- make an index.erb file in the views folder (homepage)
- make a new.erb file in the users folder (register)
- make a new.erb file in the sessions folder (login)
- make a show.erb file in the users folder (profile page)
- make a session_helper.rb file in the helpers folder
- make an images folder in the public folder (if you want images on your site)

- fill out user.rb model and create users migration files as shown
- use csv parsing or hard code data into the seed file
- run rake db:create
- run rake db:migrate
- run rake db:seed

- edit controller, view, layout, and session_helper files as shown
- get all routes working with minimal html (just a tag identifying each page) so you know the routes work
- then add forms and route logic, etc.

- tailor to specific needs of site/project



Long Version:

Basic setup:
- Clone from this repo into local repo.
- Add bcrypt to the gemfile.
- Run bundle install.
- (pray the gems all install correctly; if they aren't, try running bundle update on each gem that didn't install correctly, for example bundle update pg. Then try bundle install again.)
- run be shotgun.
- navigate to localhost to check that the server is connected, even though sinatra will just display it doesn't know that ditty because there's no home page yet

Making migrations and models:
- open second tab in iterm (first tab just runs connection to server. this second tab is for rake and git commands and such)
- only have one class, user, that needs to be stored in the database as permanent entities. sessions are just temporary entities to keep track of users being logged in or not so they don't need a class and they don't need to be stored in the database.
- (if the next two steps don't work, add bundle exec before the commands)
- need to create a model for user class so in second tab of iterm run rake generate:model NAME=User
- then run rake generate:migration NAME=CreateUsers
- now you have empty model and migration files (we'll fill them in soon)

Folders and files:
- this is just creating all the files and folders we'll need
- we'll need controllers for users and sessions so create users_controller.rb and sessions_controller.rb
- we'll also need an index.rb controller to handle the homepage route '/'
- we'll need views for users and sessions so create a users folder and a sessions folder in the views folder
- thinking about which views we'll need just for logging in and registering and a basic profile page and home page, we only need a few views
- make an index.erb file in the views folder (this is the homepage)
- for users, we want to be able to make a new user (register) so we need a new.erb file in users
- we also want to be able to access a specific user profile page after they register or login so we need a show.erb file in users
- for just logging in and registering users, we don't need an index.erb or edit.erb file because we won't be editing a user or ever showing all users at once
- for sessions (logging in), we really only ever need to make a new session (we won't edit them, show all of them at once, or even show just one of them; we'll just show the user associated with the session, not the session itself so no need for a show.erb). so just create a new.erb file in the sessions folder
- that's it for views and controllers. we also need a helper file for the sessions to keep track of whether users are logged in or not. so create a session_helper.rb file in the helpers folder
- last, if you want to include images on your site, create an images folder in the public folder (where the css and js are)

Creating, migrating, seeding the database:
- now we need to flesh out the user model and the createusers migration
- based on what info you need for your user, fill out the migration and user model files as shown
- use something like csv parsing or something to make the seed file (or be like me and just hard code object hashes in the seed file just to have something to test functionality with)
- now you can run rake db:create
- run rake db:migrate
- run rake db:seed
- you can test if stuff worked by running rake console and doing something like User.all


Routes and views:
- files to edit: controller files, view files, session_helper file, layout file
- in each of these files, I put in comments explaining what I did and why
- i try to start by getting all the basic routes working with minimal html; i just put a p or h1 tag in each view identifying what it is so i can tell that the routes are all working as expected
- once all the routes go to the places i expect, then i start adding forms to the views so they can get data to send to various routes and views

Then just add the things your specific site needs, now that you have the base all set! (Suggestions of common things are shown in comments in each file.)