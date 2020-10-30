class Administrador
	attr_reader :nombreAdministrador, :arregloPedido, :arregloRecepcion
	def initialize(nombreAdministrador)
		@nombreAdministrador = nombreAdministrador
		@arregloPedido = []
		@arregloRecepcion = []
	end

	def registrarPedido(pedido)
		@arregloPedido.push(pedido)
	end

	def registrarRecepcionPedido(recepcion,pedido)
		@arregloRecepcion.push(recepcion,pedido)
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
		else
			return "FUERA DE FECHA"
		end
	end


end

adm = Administrador.new("OMAR")
p1 = Pedido.new(1,10,3,1000)
p2 = Pedido.new(2,20,6,2000)
p3 = Pedido.new(3,30,16,3000)
# a)	Permitir que la empresa realice el registro de un Pedido a un proveedor y realizar el registro de 10 pedidos a un proveedor.
adm.registrarPedido(p1)
adm.registrarPedido(p2)
adm.registrarPedido(p3)

for i in adm.arregloPedido
	puts "#{i}"
end
