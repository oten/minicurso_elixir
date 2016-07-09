defmodule ParImpar do

	@doc """
	Dado uma lista [1,2,3,4,5,6,7,8,9,10] crie uma função que escreva no console
	apenas os pares e outra apenas os ímpares

	Dica:
	  rem
	  div
	"""
	def pares(lista) when lista == [], do: :ok
	def pares(lista) do
		if hd(lista) |> rem(2) == 0 do 
			IO.puts hd(lista) 
		end
		tl(lista) |> pares()
	end
	
	def impares(lista) when lista == [], do: :ok
	def impares(lista) do
		if hd(lista) |> rem(2) == 1 do
			IO.puts hd(lista) 
		end
		tl(lista) |> impares()
	end
end
