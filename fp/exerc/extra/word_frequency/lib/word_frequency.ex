defmodule WordFreq do
	def top(file_name, n) do
		arr = WordFreq.Parser.to_arr(file_name)
		grouped = WordFreq.Parser.group(arr, Map.new())
		Enum.sort(grouped, fn(x, y) -> elem(x, 1) > elem(y, 1) end) |> Enum.chunk(n) |> hd
	end
	
	def print(list) when list == [], do: :ok
	def print([head | tail]) do
		head 
		|> Tuple.to_list
		|> Enum.join(": ")
		|> IO.puts
		tail
		|> print
	end 
end
