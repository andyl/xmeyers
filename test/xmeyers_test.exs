defmodule XmeyersTest do
  use ExUnit.Case

  test "loads card data from data/" do
    assert [%{"Weather" => [_ | _]} | _] = Xmeyers.data("home")
    assert [%{"American River Canyon" => [_ | _]} | _] = Xmeyers.data("maps")
  end
end
