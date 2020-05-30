## Application Function:
    [] - User can create, read, update and delete a post

## Interface:
    - User can view movie form
    - User can submit movie form
    - User can edit movie
    - User can delete movie

## User class:
    - attributes => username, email, password
    - user signs up/logs in
    - has many movies

## User controller and views:
    - '/users/signup' => renders signup form
    - '/users/signup' => processes signup from,. creates user, POST
    - 'users/login' => renders login form
    - 'users/login' => processes login form, POST
    - need to set session to login user
    - user can view their movies

## Movie class:
    - attributes => Title, Genre, Description, Rating, user_id
    - movie belongs to user

## Movie controller and views:
    - '/movies/new' => renders new post form
    - '/movies' => submits posts, POST
    - '/movies' => renders all orders
    - '/movies/:id' => renders one instance of Post
    - '/movies/:id/edit' => renders update form for an instance
    - '/movies/:id' => update instance, PATCH
    - '/movies/:id/delete' => deletes instance

## Where To Start?
    [ ] - setup classes
    [ ] - set up database
    [ ] - user_controller
    [ ] - movie_controller
