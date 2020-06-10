defmodule Captur.UserResolver do
  alias Captur.Games 

  def all(_args, _info) do
    {:ok, Games.list_users()}
  end

  def find(%{id: id}, _info) do 
    case Games.get_user!(id) do
      nil -> {:error, "User id #{id} not found"}
      user -> {:ok, user}
    end
  end
end