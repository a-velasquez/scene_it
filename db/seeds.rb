#Create Users
dylan = User.create(
  username: "dylan",
  email: "dylan@dylan.com",
  password: "password")
gary = User.create(
  username: "gary",
  email: "gary@gary.com",
  password: "password")


#Create and Associate Movies to Users
Movie.create(
  title: "Hackers",
  genre: "Thriller",
  release_date: 1995,
  description: "Hackers are blamed for making a virus that will capsize five oil tankers.",
  rating: 5,
  user_id: dylan.id)

Movie.create(
  title: "The Net",
  genre: "Thriller",
  release_date: 1995,
  description: "A computer programmer stumbles upon a conspiracy, putting her life and the lives of those around her in great danger.",
  rating: 5,
  user_id: gary.id)
