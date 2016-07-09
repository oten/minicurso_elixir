defmodule ElementoPorLinha do
	@moduledoc """
	Dado uma lista de inteiros, escreva no console um elemento por linha usando
	recursão e guard

	Exemplo:
	  entrada -> [1,2,3,4,5]
	  Saída -> 1
			   2
			   3
			   4
			   5

	Dica:
	hd(list) -> retorna o primeiro elemento de uma lista.
	tl(list) -> retorna toda a lista exceto o primeiro elemento.
	"""

	def val(lista) when lista == [], do: :ok
	def val(lista) do
		hd(lista) |> IO.puts()
		tl(lista) |> val()
	end
end
