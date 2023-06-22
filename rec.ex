defmodule Recursion do
    def print_multipe_times(msg, n) when n > 0 do
        IO.puts(msg)
        print_multipe_times(msg, n - 1)
    end

    #this is pattern match
    def print_multipe_times(_msg, 0) do
        :ok
    end
end


#使用了下面这种语法
defmodule Test do
    def print_n(n) do
        if n == 0 do
            0
        else
            IO.puts(n)
            print_n(n - 1)
        end
    end
end