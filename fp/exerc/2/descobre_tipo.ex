defmodule DescobreTipo do
	@moduledoc """
	Crie uma função que recebe um valor e descobre se é integer, float ou não é
	um número.

	Exemplo:
	entrada: 1
	saída: é integer

	entrada: "abc"
	saída: não é um número

	Esse problema deve ser resolvido usando Guards
	"""
	def is_num(n) when is_integer(n), do: "é integer"
	def is_num(n) when is_float(n), do: "é flloat"
	def is_num(n), do: "não é um número"
end
