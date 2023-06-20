defmodule Statement do
    
    y = 1
    x = case {1, 2, 2} do
        {4, 5, 6} -> 
                "This clause won't match"
        {1, ^y, 3} ->
                "This clause will match and bind x to 2 in this clause"
        _         ->
                "This clause would match any value"
    
    #if you want to pattern match against an existing variable
    #you need to use the ^ operator
    # such ^x

    f = fn
        x, y when x > 0 -> x + y
        x, y -> x * y
    end

    cond do
        2 + 2 == 5 -> 
            "this will not be true"
        2 * 2 == 3 ->
            "not this"
    end

    if true then
        
    else

    end


end