defmodule Bit do
    
    #var string
    #string = "hello"

    string = "hello, World"
    
    len = String.length(string)
    
    bs = byte_size(string) 

    slice = String.split("1 2 3", " ")
    
    #but what happenes if the number have additional space between the numbers
    blank = String.split("1  2  3", " ", [trim: true])
    
    #when 
    blankb = String.split("1 2 3", " ", trim: true)

    conect = "hello" <> "world"


    ##1. keys must be atoms
    ##2. keyList are ordered
    ##3. keys can be given more than one

    keyList = [{:term true}]
    othestyle = [term: true]
    

    #map
    ##1. the key can be the any value
    ##2. the key are not be ordered
    map = %{:a => 1, 2 => :b}
    value = map.a
    value1 = map[:a]

    users = [
        john: %{age: 31, languages: ["Erlang", "Ruby", "Elixir"]}
    ]
    put_in users[:john].age, 31

    x = [a: true, b: true]
    x1 = x[:a]

    t = is_binary(string)
    IO.puts(t)

    #In elixir you can use ? in font of character literal
    #to reval its code point
    p = ?a
    t1 = "\u0061" == "a" 
end