class Administrador
	attr_reader :nombreAdministrador, :arregloVehiculos, :arregloTemporal
	def initialize(nombreAdministrador)
		@nombreAdministrador = nombreAdministrador
		@arregloVehiculos = []
	end

	def registrarVehiculo(vehiculo)
		@arregloVehiculos.push(vehiculo)		
	end

	def retornarClasificacionPorPlaca(numeroPlaca)
		for i in arregloVehiculos
			if numeroPlaca == i.placa
				return i.retornarClasificacion			
			end
		end
	end

	def calcularCapacidadCargaModerno
		suma = 0
		for i in arregloVehiculos
			if i.retornarClasificacion == "MODERNO"
				  suma += i.capacidadCarga
			end
		end
		return suma
	end

	def listarVehiculoRenovar
		arregloTemporal = []
		for i in arregloVehiculos
			if i.retornarClasificacion == "ANTIGUO"
				arregloTemporal.push(i)
			end
		end
		return arregloTemporal
	end
end

class Vehiculo
	attr_reader :placa, :año, :capacidadCarga
	def initialize(placa, año, capacidadCarga)
		@placa = placa
		@año = año
		@capacidadCarga = capacidadCarga
	end

	def retornarClasificacion
		if año < 2000
			return "ANTIGUO"
		elsif año >= 2000 && año < 2015
			return "NORMAL"
		elsif año >= 2015
			return "MODERNO"			
		end
	end
end

adm = Administrador.new("OMAR")
v1 = Vehiculo.new("ABC-123" , 2001, 1000)
v2 = Vehiculo.new("ABC-124" , 2010, 1000)
v3 = Vehiculo.new("ABC-125" , 2011, 1000)
v4 = Vehiculo.new("ABC-126" , 2008, 1000)
v5 = Vehiculo.new("ABC-127" , 1999, 1000)
v6 = Vehiculo.new("ABC-128" , 1980, 1000)
v7 = Vehiculo.new("ABC-129" , 1990, 1000)
v8 = Vehiculo.new("ABC-130" , 2030, 1000)
v9 = Vehiculo.new("ABC-131" , 2020, 1000)
v10 = Vehiculo.new("ABC-132" , 2025, 1000)

# a) Permitir el registro de 10 vehículos en la empresa. 
adm.registrarVehiculo(v1)
adm.registrarVehiculo(v2)
adm.registrarVehiculo(v3)
adm.registrarVehiculo(v4)
adm.registrarVehiculo(v5)
adm.registrarVehiculo(v6)
adm.registrarVehiculo(v7)
adm.registrarVehiculo(v8)
adm.registrarVehiculo(v9)
adm.registrarVehiculo(v10)

# b) Obtener la clasificación de un vehículo de la empresa ingresando la placa
puts "La clasificacion para la placa digitada es: "  + adm.retornarClasificacionPorPlaca("ABC-127")
puts

# c) Elaborar un método que permita calcular la capacidad de carga total de todos los vehículos modernos dentro de la empresa
puts "La capacidad de carga total de los vehículos modernos es : #{adm.calcularCapacidadCargaModerno} KG"
puts
# d) Elaborar un método que liste y muestre los datos de todos los vehículos dentro de la empresa que se deben renovar por ser antiguos.
for i in adm.listarVehiculoRenovar
	puts "El vehículo de placa #{i.placa}, año #{i.año} y con capacidad de carga #{i.capacidadCarga} necesita ser renovado"
end