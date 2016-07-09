defmodule TreinandoPM do
	@moduledoc """
	Treinando pattern matching!

	Recupere o valor 2 da estrutura [2,1,3]
	Recupere o valor 1 da estrutura [2,1,3]
	Recupere o valor "eu" da estrutura [{"elixir"}, "133", "eu"]
	Recupere o valor "a" da estrutura %{letters: ["A", "a", "B", "b"], numbers: [5,4,99]}
	"""
	def valor_2 do
		[valor, _, _] = [2, 1, 3]
		IO.puts valor
	end
	
	def valor_1 do
		[_, valor, _] = [2, 1, 3]
		IO.puts valor
	end
	
	def eu do
		[_, _, string]= [{"elixir"}, "133", "eu"]
		IO.puts string
	end
	
	def a do
		%{letters: [_, string, _, _], numbers: _} = %{letters: ["A", "a", "B", "b"], numbers: [5,4,99]}
		IO.puts string
	end
end
