defmodule Lego.Color do
  use Ecto.Model

  schema "colors" do
    field :name
  end

  def by_name(name) do
    query = from c in Lego.Color,
            where: c.name > ^name
  end
end
