defmodule Function do
    
    def sum(a, b) do
        a + b
    end

    #this is a private function
    defp do_sum(a, b) do
        a + b
    end

    def zero?(0) do
        true
    end

    
    #function with guard statement
    #function with "?" reprents the return value that  type is boolean
    def zero?(x) when is_integer(x) do
        false
    end

    def zero?(0), do: true
    def zero?(x), when is_integer(x), do: false

    #use such syntax to get a function name
    fun = &Math.zero?/1

    fun.(0)

    #get the function parm
    fun = &(&1 + 1)
    fun.(1)

    #default arguments
end

defmodule Concat do
    def join(a, b, sep \\ "") do
        a <> sep <> b
    end
end