defmodule Bit do
    
    #var string
    #string = "hello"

    string = "hello, World"
    
    len = String.length(string)
    
    bs = byte_size(string) 

    slice = String.split("1 2 3", " ")
    
    #but what happenes if the number have additional space between the numbers
    blank = String.split("1  2  3", " ", [trim: true])
    blankb = String.split("1 2 3", " ", trim: true)

    conect = "hello" <> "world"


    t = is_binary(string)
    IO.puts(t)


    #In elixir you can use ? in font of character literal
    #to reval its code point
    p = ?a
    t1 = "\u0061" == "a"
end