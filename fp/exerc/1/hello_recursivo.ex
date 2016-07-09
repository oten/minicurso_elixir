defmodule HelloRecursivo do
	@moduledoc """
	Utilizando recursão, crie uma função que recebe um número e printa no
	console "hello world" n vezes.

	Exemplo:
	  entrada: 3
	  saída:
		hello world
		hello world
		hello world
	"""
	def recprint(0), do: :ok
	def recprint(n) do
		IO.puts "hello world"
		recprint n-1
	end
end
