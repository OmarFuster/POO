class Administrador
	attr_reader :nombreAdministrador, :arregloPedido
	def initialize(nombreAdministrador)
		@nombreAdministrador = nombreAdministrador
		@arregloPedido = []
	end

	def registrarPedido(pedido)
		arregloPedido.push(pedido)
	end


	def registrarRecepcionPedido(recepcion,pedido)
		
	end
end

class Pedido
	attr_reader :codigo, :cantidad, :prioridad, :monto
	def initialize(codigo, cantidad, prioridad, monto)
		@codigo = codigo
		@cantidad = cantidad
		@prioridad= prioridad
		@monto = monto
	end

	def calcularPlazoMaximo
		if prioridad >=0 && prioridad < 5
			return "PRIORITARIO"
		elsif prioridad >= 5 && prioridad < 15
			return "INTERMEDIO"
		elsif prioridad >= 15 && prioridad < 30				
			return "BAJO"
		end
	end
end

adm = Administrador.new("OMAR")
p1 = Pedido.new(1,10,4,1000)
adm.registrarPedido(p1)
for i in adm.arregloPedido
	puts i.codigo
end