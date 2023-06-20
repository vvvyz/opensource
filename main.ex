defmodule Main do
    
    list = [1, 2, 3, 4, 5]
    list1 = [1, 2, 3, 4, 5] ++ [1, 2]
    hd = hd(list)
    tl = tail(list)

    map = %{a: 1, b: 2}
    mapslice = map[:a]
    map1 = %{map | a: 3}

    defstruct name: "john", age: 27
    defexception message: "default messgage"

    def add(a, b) do
        a + b
    end
end

