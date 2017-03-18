defmodule HofiPhoenix.Schema do
  use Absinthe.Schema
  import_types HofiPhoenix.Schema.Types

  query do
    field :expenses, list_of(:expense) do
      resolve &HofiPhoenix.ExpenseResolver.all/2
    end
  end

end

