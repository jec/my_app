defmodule MyApp.Auth.User do
  use Seraph.Schema.Node
  import Seraph.Changeset

  node "User" do
    property :identifier, :string
    property :password, :string, redact: true
    property :name, :string
    property :email, :string
  end

  def changeset(%MyApp.Auth.User{} = user, params \\ %{}) do
    user
    |> cast(params, [:identifier, :password, :name, :email])
  end
end
