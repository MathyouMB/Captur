defmodule Captur.GamesTest do
  use Captur.DataCase

  alias Captur.Games

  describe "users" do
    alias Captur.Games.User

    @valid_attrs %{email: "some email", password: "some password", username: "some username"}
    @update_attrs %{email: "some updated email", password: "some updated password", username: "some updated username"}
    @invalid_attrs %{email: nil, password: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Games.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Games.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Games.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Games.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.password == "some password"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Games.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.password == "some updated password"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_user(user, @invalid_attrs)
      assert user == Games.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Games.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Games.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Games.change_user(user)
    end
  end

  describe "games" do
    alias Captur.Games.Game

    @valid_attrs %{description: "some description", end_date: ~N[2010-04-17 14:00:00], hidden: true, start_date: ~N[2010-04-17 14:00:00], title: "some title"}
    @update_attrs %{description: "some updated description", end_date: ~N[2011-05-18 15:01:01], hidden: false, start_date: ~N[2011-05-18 15:01:01], title: "some updated title"}
    @invalid_attrs %{description: nil, end_date: nil, hidden: nil, start_date: nil, title: nil}

    def game_fixture(attrs \\ %{}) do
      {:ok, game} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Games.create_game()

      game
    end

    test "list_games/0 returns all games" do
      game = game_fixture()
      assert Games.list_games() == [game]
    end

    test "get_game!/1 returns the game with given id" do
      game = game_fixture()
      assert Games.get_game!(game.id) == game
    end

    test "create_game/1 with valid data creates a game" do
      assert {:ok, %Game{} = game} = Games.create_game(@valid_attrs)
      assert game.description == "some description"
      assert game.end_date == ~N[2010-04-17 14:00:00]
      assert game.hidden == true
      assert game.start_date == ~N[2010-04-17 14:00:00]
      assert game.title == "some title"
    end

    test "create_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_game(@invalid_attrs)
    end

    test "update_game/2 with valid data updates the game" do
      game = game_fixture()
      assert {:ok, %Game{} = game} = Games.update_game(game, @update_attrs)
      assert game.description == "some updated description"
      assert game.end_date == ~N[2011-05-18 15:01:01]
      assert game.hidden == false
      assert game.start_date == ~N[2011-05-18 15:01:01]
      assert game.title == "some updated title"
    end

    test "update_game/2 with invalid data returns error changeset" do
      game = game_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_game(game, @invalid_attrs)
      assert game == Games.get_game!(game.id)
    end

    test "delete_game/1 deletes the game" do
      game = game_fixture()
      assert {:ok, %Game{}} = Games.delete_game(game)
      assert_raise Ecto.NoResultsError, fn -> Games.get_game!(game.id) end
    end

    test "change_game/1 returns a game changeset" do
      game = game_fixture()
      assert %Ecto.Changeset{} = Games.change_game(game)
    end
  end

  describe "participants" do
    alias Captur.Games.Participant

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def participant_fixture(attrs \\ %{}) do
      {:ok, participant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Games.create_participant()

      participant
    end

    test "list_participants/0 returns all participants" do
      participant = participant_fixture()
      assert Games.list_participants() == [participant]
    end

    test "get_participant!/1 returns the participant with given id" do
      participant = participant_fixture()
      assert Games.get_participant!(participant.id) == participant
    end

    test "create_participant/1 with valid data creates a participant" do
      assert {:ok, %Participant{} = participant} = Games.create_participant(@valid_attrs)
    end

    test "create_participant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_participant(@invalid_attrs)
    end

    test "update_participant/2 with valid data updates the participant" do
      participant = participant_fixture()
      assert {:ok, %Participant{} = participant} = Games.update_participant(participant, @update_attrs)
    end

    test "update_participant/2 with invalid data returns error changeset" do
      participant = participant_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_participant(participant, @invalid_attrs)
      assert participant == Games.get_participant!(participant.id)
    end

    test "delete_participant/1 deletes the participant" do
      participant = participant_fixture()
      assert {:ok, %Participant{}} = Games.delete_participant(participant)
      assert_raise Ecto.NoResultsError, fn -> Games.get_participant!(participant.id) end
    end

    test "change_participant/1 returns a participant changeset" do
      participant = participant_fixture()
      assert %Ecto.Changeset{} = Games.change_participant(participant)
    end
  end

  describe "challenges" do
    alias Captur.Games.Challenge

    @valid_attrs %{answer: "some answer", body: "some body", body_format: "some body_format", description: "some description", end_date: ~N[2010-04-17 14:00:00], explanation: "some explanation", explanation_format: "some explanation_format", hidden: true, points: 42, start_date: ~N[2010-04-17 14:00:00], title: "some title"}
    @update_attrs %{answer: "some updated answer", body: "some updated body", body_format: "some updated body_format", description: "some updated description", end_date: ~N[2011-05-18 15:01:01], explanation: "some updated explanation", explanation_format: "some updated explanation_format", hidden: false, points: 43, start_date: ~N[2011-05-18 15:01:01], title: "some updated title"}
    @invalid_attrs %{answer: nil, body: nil, body_format: nil, description: nil, end_date: nil, explanation: nil, explanation_format: nil, hidden: nil, points: nil, start_date: nil, title: nil}

    def challenge_fixture(attrs \\ %{}) do
      {:ok, challenge} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Games.create_challenge()

      challenge
    end

    test "list_challenges/0 returns all challenges" do
      challenge = challenge_fixture()
      assert Games.list_challenges() == [challenge]
    end

    test "get_challenge!/1 returns the challenge with given id" do
      challenge = challenge_fixture()
      assert Games.get_challenge!(challenge.id) == challenge
    end

    test "create_challenge/1 with valid data creates a challenge" do
      assert {:ok, %Challenge{} = challenge} = Games.create_challenge(@valid_attrs)
      assert challenge.answer == "some answer"
      assert challenge.body == "some body"
      assert challenge.body_format == "some body_format"
      assert challenge.description == "some description"
      assert challenge.end_date == ~N[2010-04-17 14:00:00]
      assert challenge.explanation == "some explanation"
      assert challenge.explanation_format == "some explanation_format"
      assert challenge.hidden == true
      assert challenge.points == 42
      assert challenge.start_date == ~N[2010-04-17 14:00:00]
      assert challenge.title == "some title"
    end

    test "create_challenge/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_challenge(@invalid_attrs)
    end

    test "update_challenge/2 with valid data updates the challenge" do
      challenge = challenge_fixture()
      assert {:ok, %Challenge{} = challenge} = Games.update_challenge(challenge, @update_attrs)
      assert challenge.answer == "some updated answer"
      assert challenge.body == "some updated body"
      assert challenge.body_format == "some updated body_format"
      assert challenge.description == "some updated description"
      assert challenge.end_date == ~N[2011-05-18 15:01:01]
      assert challenge.explanation == "some updated explanation"
      assert challenge.explanation_format == "some updated explanation_format"
      assert challenge.hidden == false
      assert challenge.points == 43
      assert challenge.start_date == ~N[2011-05-18 15:01:01]
      assert challenge.title == "some updated title"
    end

    test "update_challenge/2 with invalid data returns error changeset" do
      challenge = challenge_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_challenge(challenge, @invalid_attrs)
      assert challenge == Games.get_challenge!(challenge.id)
    end

    test "delete_challenge/1 deletes the challenge" do
      challenge = challenge_fixture()
      assert {:ok, %Challenge{}} = Games.delete_challenge(challenge)
      assert_raise Ecto.NoResultsError, fn -> Games.get_challenge!(challenge.id) end
    end

    test "change_challenge/1 returns a challenge changeset" do
      challenge = challenge_fixture()
      assert %Ecto.Changeset{} = Games.change_challenge(challenge)
    end
  end

  describe "rewards" do
    alias Captur.Games.Reward

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def reward_fixture(attrs \\ %{}) do
      {:ok, reward} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Games.create_reward()

      reward
    end

    test "list_rewards/0 returns all rewards" do
      reward = reward_fixture()
      assert Games.list_rewards() == [reward]
    end

    test "get_reward!/1 returns the reward with given id" do
      reward = reward_fixture()
      assert Games.get_reward!(reward.id) == reward
    end

    test "create_reward/1 with valid data creates a reward" do
      assert {:ok, %Reward{} = reward} = Games.create_reward(@valid_attrs)
    end

    test "create_reward/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_reward(@invalid_attrs)
    end

    test "update_reward/2 with valid data updates the reward" do
      reward = reward_fixture()
      assert {:ok, %Reward{} = reward} = Games.update_reward(reward, @update_attrs)
    end

    test "update_reward/2 with invalid data returns error changeset" do
      reward = reward_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_reward(reward, @invalid_attrs)
      assert reward == Games.get_reward!(reward.id)
    end

    test "delete_reward/1 deletes the reward" do
      reward = reward_fixture()
      assert {:ok, %Reward{}} = Games.delete_reward(reward)
      assert_raise Ecto.NoResultsError, fn -> Games.get_reward!(reward.id) end
    end

    test "change_reward/1 returns a reward changeset" do
      reward = reward_fixture()
      assert %Ecto.Changeset{} = Games.change_reward(reward)
    end
  end
end
