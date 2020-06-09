  
alias Captur.Repo
alias Captur.Games.Participant

Repo.insert! %Participant{
  user_id: 2,
  game_id: 1
}

Repo.insert! %Participant{
  user_id: 3,
  game_id: 2
}

Repo.insert! %Participant{
  user_id: 1,
  game_id: 3
}

Repo.insert! %Participant{
  user_id: 2,
  game_id: 3
}