defmodule MyApp.Auth.UserTest do
  use ExUnit.Case

  test "can create a User node" do
    user = %MyApp.Auth.User{
      identifier: "phred",
      password: "foobar",
      email: "phred@example.net",
      name: "Phred"
    }
    IO.inspect(user)
    {:ok, user} = MyApp.Repo.Node.create(user)
  end
end
