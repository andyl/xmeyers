defmodule Xmeyers do
  @moduledoc """
  Build-time helpers for the Xmeyers site.
  """

  @data_dir Path.expand("../data", __DIR__)

  @doc """
  Loads a YAML data file from `data/`, e.g. `Xmeyers.data("home")`.
  """
  def data(name) do
    @data_dir
    |> Path.join("#{name}.yml")
    |> YamlElixir.read_from_file!()
  end
end
