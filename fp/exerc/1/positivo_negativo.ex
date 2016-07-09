defmodule PositivoNegativo do
	@moduledoc """
	Crie uma função que dado um número retorne:
	-> "positivo" caso positivo
	-> "negativo" caso negativo
	-> "zero" caso 0
	"""
	def signal(n) when n > 0, do: "positivo"
	def signal(n) when n < 0, do: "negativo"
	def signal(0), do: "zero"
end
