# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app  
- scene_it/Gemfile: `gem 'sinatra'`
- Rakefile: `require 'sinatra/activerecord/rake'`


- [x] Use ActiveRecord for storing information in a database
- db/migrations,
- ActiveRecord methods used in movie_controller.rb:
  - line 14 .create
  - line 21 .save
  - line 73 .update
  - line 95 .destroy
  - line 108 .find_by


- [x] Include more than one model class (e.g. User, Post, Category)
- scene_it/app/models/movie.rb
- scene_it/app/models/user.rb


- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
- scene_it/app/models/user.rb

  `class User < ActiveRecord::Base`

  **`has_many :movies`**

  `has_secure_password`

  `validates_uniqueness_of :username`

  `validates :username, :email, :password, presence: true`

  `end`


- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)

- scene_it/app/models/movie.rb

  `class Movie < ActiveRecord::Base`

    **`belongs_to :user`**

    `validates :title, :genre, :release_date, :description, :rating, presence: true`

  `end`


- [x] Include user accounts with unique login attribute (username or email)

- scene_it/db/schema.rb

  **schema uses username, email, password_digest attributes used for creating user accounts and logging users in**
  - `create_table :users do |t|`

    -  `t.string :username`

    -  `t.string :email`

    -  `t.string :password_digest`

    `end`


- scene_it/app/views/users/login.erb

  **form used to login user:**

  - `<form action='/login' method="POST">`

    `<p>Username: <input type="text" id="username" name="username"></p>`

    `<p>Password: <input type="password" id="password" name="password"></p>`

    `<input type="Submit" value="Login">`

    `</form>

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying

- scene_it/app/controllers/movie_controller.rb

 **CREATE**

 -  `get '/movies'/new`
 -  `post '/movies'`

  **READ**

 -  `get '/movies'`
 -  `get '/movies/:id'`

  **UPDATE**

 -  `get '/movies/:id'/edit`
 -  `patch '/movies/:id'`

  **DESTROY**

 -  `get '/movies/:id/delete'`


- [x] Ensure that users can't modify content created by other users

- scene_it/app/controller/movie_controller.rb

- `get '/movies/:id/edit' do`

  -  `if logged_in?`  

   -  `get_movie` <mark><= calls private method to set specific instance of Movie equal to global variable *@movie = Movie.find_by(id: params[:id])*</mark>

   -  `if authorized?(@movie)` <mark><= calls helper method in application_controller.rb to check association of movie to current user</mark>

      - `erb :'movies/edit'`


- scene_it/app/controllers/application_controller.rb

-   `helpers do`
  -   `def authorized?(movie)`

      - `movie.user == current_user` <mark><=uses comparison operator to check if movie user passed as argument matches the user_id stored in session hash. If true, renders the edit form.</mark>

    - `end`

    `end`

- [x] Include user input validations

- scene_it/app/models/movie.rb

  `class Movie < ActiveRecord::Base`

    - `belongs_to :user`

    -  **`validates :title, :genre, :release_date, :description, :rating, presence: true`**   <mark><= uses ActiveRecord validation methods to validate user input when creating and editing movies.</mark>

  `end`



- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)


- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

- scene_it/README.md

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
