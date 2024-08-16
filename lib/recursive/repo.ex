defmodule Recursive.Repo do
  use Ecto.Repo,
    otp_app: :recursive,
    adapter: Ecto.Adapters.Postgres
end
