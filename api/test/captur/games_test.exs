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
end
