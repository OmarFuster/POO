class Administrador
	attr_reader :nombre, :arregloPedido, :arregloRegistroDeRecepcion
	def initialize(nombre)
		@nombre = nombre
		@arregloPedido = []
		@arregloRegistroDeRecepcion = []
	end

	def registrarPedido(pedido)
		@arregloPedido.push(pedido)
	end

	def registrarRecepcionPedido(recepcion,pedido)
		@arregloRegistroDeRecepcion.push(recepcion,pedido)
	end

	def retornarPedidoPrioritario
		arregloTemporal = []
		for i in arregloPedido
			if i.prioridad == "PRIORITARIO" 
				arregloTemporal.push(i)
			end
		end
		return arregloTemporal
	end

	def retornarPedidoIntermedio
		arregloTemporal = []
		for i in arregloPedido
			if i.prioridad == "INTERMEDIO" 
				arregloTemporal.push(i)
			end
		end
		return arregloTemporal
	end

	def retornarPedidoBajo
		arregloTemporal = []
		for i in arregloPedido
			if i.prioridad == "BAJO" 
				arregloTemporal.push(i)
			end
		end
		return arregloTemporal
	end

	def verificarPlazoEstablecido
		for i in arregloRegistroDeRecepcion
			if i.cantidadDiasTranscurridos > 0 && i.cantidadDiasTranscurridos < 5
				return "CUMPLIÓ CON LOS DÍAS ESTABLECIDOS PARA EL TIPO DE ENTREGA PRIORITARIO"
			elsif i.cantidadDiasTranscurridos >= 5 && i.cantidadDiasTranscurridos < 15
				return "CUMPLIÓ CON LOS DÍAS ESTABLECIDOS PARA EL TIPO DE ENTREGA INTERMEDIO"
			elsif i.cantidadDiasTranscurridos >= 15 && i.cantidadDiasTranscurridos < 30
				return "CUMPLIÓ CON LOS DÍAS ESTABLECIDOS PARA EL TIPO DE ENTREGA BAJO"
			else
				return "NO CUMPLIÓ CON EL PLAZO ESTABLECIDO"
			end
		end
	end


end

class Pedido
	attr_reader :codigo, :cantidad, :prioridad, :monto
	def initialize(codigo, cantidad, prioridad, monto)
		@codigo = codigo
		@cantidad = cantidad
		@prioridad = prioridad
		@monto = monto	
	end

end

class Logistica
	attr_reader :codigoPedido, :cantidadDiasTranscurridos, :arregloRecepcion
	def initialize(codigoPedido, cantidadDiasTranscurridos)
		@codigoPedido = codigoPedido
		@cantidadDiasTranscurridos = cantidadDiasTranscurridos
	end
end

adm = Administrador.new("LUIS")

p1 = Pedido.new(1, 10, "PRIORITARIO", 100)
p2 = Pedido.new(2, 20, "PRIORITARIO", 200)
p3 = Pedido.new(3, 30, "PRIORITARIO", 300)
p4 = Pedido.new(4, 40, "INTERMEDIO", 400)
p5 = Pedido.new(5, 50, "INTERMEDIO", 500)
p6 = Pedido.new(6, 60, "INTERMEDIO", 600)
p7 = Pedido.new(7, 70, "BAJO", 700)
p8 = Pedido.new(8, 80, "BAJO", 800)
p9 = Pedido.new(9, 90, "BAJO", 900)
p10 = Pedido.new(10, 100, "BAJO", 1000)
adm.registrarPedido(p1)
adm.registrarPedido(p2)
adm.registrarPedido(p3)
adm.registrarPedido(p4)
adm.registrarPedido(p5)
adm.registrarPedido(p6)
adm.registrarPedido(p7)
adm.registrarPedido(p8)
adm.registrarPedido(p9)
adm.registrarPedido(p10)

l1 = Logistica.new(p1.codigo, 4)
l2 = Logistica.new(p2.codigo, 3)
l3 = Logistica.new(p3.codigo, 1)
l4 = Logistica.new(p4.codigo, 5)
l5 = Logistica.new(p5.codigo, 6)
l6 = Logistica.new(p6.codigo, 7)
l7 = Logistica.new(p7.codigo, 16)

adm.registrarRecepcionPedido(l1,p1)
adm.registrarRecepcionPedido(l2,p2)
adm.registrarRecepcionPedido(l3,p3)
adm.registrarRecepcionPedido(l4,p4)
adm.registrarRecepcionPedido(l5,p5)
adm.registrarRecepcionPedido(l6,p6)
adm.registrarRecepcionPedido(l7,p7)

puts adm.verificarPlazoEstablecido






