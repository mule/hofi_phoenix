defmodule HofiPhoenix.Schema.Types do
  use Absinthe.Schema.Notation

  object :expense do
    field :id, :id
    field :item, :string
    field :amount, :integer
    field :place, :string
  end
end