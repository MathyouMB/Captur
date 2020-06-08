  
alias Captur.Repo
alias Captur.Games.Game

Repo.insert! %Game{
  title: "game1",
  description: "This is game 1",
  start_date: ~N[2014-10-02 00:29:12],
  end_date: ~N[2014-10-02 00:29:12],
  hidden: false,
  user_id: 1
}

Repo.insert! %Game{
  title: "game2",
  description: "This is game 2",
  start_date: ~N[2014-10-02 00:29:12],
  end_date: ~N[2014-10-02 00:29:12],
  hidden: false,
  user_id: 2
}

Repo.insert! %Game{
  title: "game3",
  description: "This is game 3",
  start_date: ~N[2014-10-02 00:29:12],
  end_date: ~N[2014-10-02 00:29:12],
  hidden: false,
  user_id: 3
}