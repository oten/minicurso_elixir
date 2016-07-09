defmodule MiniCalculadora do
	@doc """
	Dado uma tupla de entrada do tipo: {atom, valor1, valor2}. No qual:
	atom = :soma || :multiplica || :subtrai || :divide
	valor1 = número
	valor2 = número

	Crie uma estrutura que realize a operação usando qualquer aplicação  do
	PatternMatching

	Exemplo:
	entrada: {:soma, 1, 1}
	saída: 2

	entrada: {:multiplica, 2, 2}
	saída: 4

	entrada: {:to_list, 33, 10}
	saída: 23

	entrada: {nil, 1, 7}
	saída: 'invalid'
	"""
	def calc({atom, valor1, valor2}) when atom == :soma, do: valor1 + valor2
	def calc({atom, valor1, valor2}) when atom == :multiplica, do: valor1 * valor2
	def calc({atom, valor1, valor2}) when atom == :subtrai, do: valor1 - valor2
	def calc({atom, valor1, valor2}) when atom == :divide, do: valor1 / valor2
end
