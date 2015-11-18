defmodule Lego.Repo.Migrations.CreateColorsTable do
  use Ecto.Migration

  def up do
    create table(:colors) do
      add :name, :string, size: 128

      timestamps
    end
  end

  def down do
    drop table(:colors)
  end
end
