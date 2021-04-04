defmodule MyApp.Auth.UserTest do
  use ExUnit.Case
  import Seraph.Query

  alias MyApp.Auth.User

  test "can create a User node" do
    user = %User{
      identifier: "phred",
      password: "foobar",
      email: "phred@example.net",
      name: "Phred"
    }
    assert {:ok, new_user} = MyApp.Repo.Node.create(user)
    IO.inspect(new_user)
  end

  test "can query for a User node" do
    original_user = %User{
      identifier: "phred",
      password: "foobar",
      email: "phred@example.net",
      name: "Phred"
    }
    assert {:ok, created_user} = MyApp.Repo.Node.create(original_user)

    result = match([{u, User}])
    |> where([u.identifier == "phred" and u.password == "foobar"])
    |> return([u])
    |> MyApp.Repo.one()
  end
end
