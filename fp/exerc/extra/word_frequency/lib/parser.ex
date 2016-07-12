defmodule WordFreq.Parser do
	def to_arr(file_name) do
		{:ok, texto} = File.read file_name
		arr = texto
			  |> String.Casing.downcase 
			  |> String.split 
	end
	
	def add_freq(termo, m) do
		if m[termo] == nil do
			m = Map.put(m, termo, 1)
		else
			m = Map.put(m, termo, Map.get(m, termo) + 1)
		end
		m
	end
	
	def group(arr, m) when arr == [], do: m
	def group(arr, m) do
		m = arr 
			|> hd 
			|> add_freq(m)
		arr 
		|> tl 
		|> group(m)
	end
	
end
