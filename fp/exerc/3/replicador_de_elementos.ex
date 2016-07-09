defmodule ReplicadorDeElementos do
	@moduledoc """
	Dado uma lista de inteiros e um número, retorne uma lista que repita
	n vezes cada elemento da lista de entrada

	Exemplo:
	entrada -> [1,2,3], 2
	Saída -> [1,1,2,2,3,3]

	Nota:
	Uma solução possível para esse problema é usar o `for`. Apesar de não
	funcionar como um for tradicional, também serve para interagir com listas
	"""
	
	def repete(elem, 1), do: elem
	def repete(elem, vezes) do
		elem ++ repete(elem, vezes-1)
	end
	def replicador(lista, vezes) when lista == [], do: []
	def replicador(lista, vezes) do
		([hd(lista)] |> repete(vezes)) ++ (tl(lista) |> replicador(vezes))
	end
end
