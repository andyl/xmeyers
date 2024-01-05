defmodule Mix.Tasks.Deploy do
  use Mix.Task

  @shortdoc "Copy the `_site` directory to `../docs`."

  @moduledoc """
  Copy the `_site` directory to `../docs`.
  """

  def run(_) do
    IO.puts "Deploying to ../docs"
    System.cmd("rm", ~w(-rf ../docs))
    System.cmd("cp", ~w(-r _site ../docs))
  end
end
