#Top or Global
abc = "abc" 

#moudle scope
defmodule M do
    @doc "factorial"
    @limit 13

    #function scope
    def foo(n) do
        x = case n do
            0 -> 1
            i when i > 0 -> n * foo(n - 1)
            _ -> :undef
        end

        for x <- [1, 2, 3] do
            #statement scope
            -x
        end
    end

end