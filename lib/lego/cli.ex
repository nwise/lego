defmodule Lego.CLI do
  require Logger
  alias Lego.Color
  alias Lego.Repo

  def main(argv) do
    argv
    |> parse_args
    |> process

    Logger.info "Logs Parsed"
  end

  def parse_args(argv) do
    options = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help ])

    case options do
      { [ help: true ], _, _ } -> :help
      { _, [filename, table], _ } -> { filename, table }
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts """
    usage:  lego <filename> <table>
    """
    System.halt(0)
  end

  def process({filename, table}) do
    colors =
      Color.by_name("Blue")
      |> Repo.all

    Logger.info("Filename: #{filename} -> Table: #{table}")
    Logger.info(colors)
    File.read('colors.csv')
  end
end
