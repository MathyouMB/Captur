  
alias Captur.Repo
alias Captur.Games.User

Repo.insert! %User{
  username: "user1",
  email: "user1@email.com",
  password: "1234"
}

Repo.insert! %User{
  username: "user2",
  email: "user2@email.com",
  password: "1234"
}

Repo.insert! %User{
  username: "user3",
  email: "user3@email.com",
  password: "1234"
}