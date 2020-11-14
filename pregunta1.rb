class Hospital
	attr_reader :arregloTrabajadores
	def initialize()
		@arregloTrabajadores = []
	end

	def registrarTrabajador(trabajador)
		arregloTrabajadores.push(trabajador)
	end

	def obtenerCantidadTrabajadores
		arregloTrabajadores.size
	end

	def retornarArreglo
		return arregloTrabajadores
	end

	def obtenerDatosPorDocumento(documento)
		for i in retornarArreglo
			if documento == i.documento
				return i
			end
		end
	end

	def calcularTotalSueldos
		suma = 0
		for i in retornarArreglo
			suma += i.calcularSueldo
		end
		return suma
	end

	def obtenerMedicoMejorPagado
		mayor = 0
		medico = nil
		for i in retornarArreglo
			if i.codigo == "M" && i.calcularSueldo > mayor
				mayor = i.calcularSueldo
				medico = i
			end
		end
		return medico
	end

	def obtenerEnfermeroMenorPago
		menor = 999999
		medico = nil
		for i in retornarArreglo
			if i.codigo == "E" && i.calcularSueldo < menor
				menor = i.calcularSueldo
				medico = i
			end
		end
		return medico
	end

end

class Trabajador
attr_reader :codigo ,:documento, :nombreCompleto, :edad, :sueldoBase
	def initialize(codigo,documento,nombreCompleto,edad,sueldoBase)
		@codigo = codigo
		@documento = documento
		@nombreCompleto = nombreCompleto
		@edad = edad
		@sueldoBase = sueldoBase
	end

	def calcularSueldo
		
	end

	def mostrarDatos
		return "Documento: #{documento},Nombre Completo: #{nombreCompleto},Edad: #{edad},Sueldo: #{calcularSueldo}"
	end
end

class Medico < Trabajador
attr_reader :especialidad, :horasExtras
	def initialize(codigo,documento,nombreCompleto,edad,sueldoBase,especialidad,horasExtras)
		super(codigo,documento,nombreCompleto,edad,sueldoBase)
		@especialidad = especialidad
		@horasExtras = horasExtras
	end

	def calcularSueldo
		if especialidad == "Medicina General"
			return (sueldoBase + 3500) + horasExtras*60
		elsif especialidad == "Neumologia"
			return (sueldoBase + 4500) + horasExtras*60
		elsif especialidad == "Dermatologia"
			return (sueldoBase + 5500) + horasExtras*60
		elsif especialidad == "Hematologia"
			return (sueldoBase + 6500) + horasExtras*60
		elsif especialidad == "Cardiologia"
			return (sueldoBase + 6900) + horasExtras*60
		end

		def mostrarDatos
			datos = super()
			datos = datos + "Especialidad: #{@especialidad}, Horas Extras: #{@horasExtras}"
			return datos
		end
	end
end

class Enfermero < Trabajador
attr_reader :comisiones
	def initialize(codigo,documento,nombreCompleto,edad,sueldoBase,comisiones)
		super(codigo,documento,nombreCompleto,edad,sueldoBase)
		@comisiones = comisiones
	end

	def calcularSueldo
		return sueldoBase + comisiones
	end

	def mostrarDatos
		datos = super()
		return datos + ", Comisiones: #{@comisiones}"
		return datos
	end
end
hospital = Hospital.new
m1 = Medico.new("M","11111111","Omar Fuster",25,1500,"Medicina General",3)
m2 = Medico.new("M","22222222","Luis Fuster",26,1500,"Neumologia",3)
m3 = Medico.new("M","33333333","Alfredo Ildefonso",27,1500,"Cardiologia",3)
m4 = Medico.new("M","44444444","Ildefonso Alfredo",28,1500,"Hematologia",3)
e1 = Enfermero.new("E","5555555","Patricio Flores",30,1900,200)
e2 = Enfermero.new("E","6666666","Raul Fuentes",31,1900,200)
e3 = Enfermero.new("E","7777777","Obregon Fausto",32,1900,200)
e4 = Enfermero.new("E","8888888","Sergio Valderrama",33,1900,200)

# a) Registrar 8 colaboradores (4 médicos, 4 enfermeros)
hospital.registrarTrabajador(m1)
hospital.registrarTrabajador(m2)
hospital.registrarTrabajador(m3)
hospital.registrarTrabajador(m4)
hospital.registrarTrabajador(e1)
hospital.registrarTrabajador(e2)
hospital.registrarTrabajador(e3)
hospital.registrarTrabajador(e4)

# b) Obtener la cantidad de colaboradores. 
puts "Hay #{hospital.obtenerCantidadTrabajadores} Trabajadores en el hospital"

# c) Elaborar un método que permita obtener todos los datos de un colaborador enviando el número de documento como parámetro y mostrarlo en pantalla.
busquedaPordni = hospital.obtenerDatosPorDocumento("6666666")
puts busquedaPordni.mostrarDatos

# d) Elaborar un método que permita calcular la suma de los sueldos de todos los colaboradores registrados.
puts "El Sueldo de todos los trabajadores es S/.#{hospital.calcularTotalSueldos}"
puts

# e) Elaborar un método que permita obtener al médico mejor pagado en el hospital y mostrar todos sus datos en pantalla.
mejorMedicoPagado =  hospital.obtenerMedicoMejorPagado
puts "El médico mejor pagado tiene la siguiente información:\n #{mejorMedicoPagado.mostrarDatos}"
puts

# f) Elaborar un método que permita obtener al enfermero con el sueldo más bajo en el hospital y mostrar todos sus datos en pantalla.
menorEnfermeroPagado = hospital.obtenerEnfermeroMenorPago
puts "El médico con menos paga tiene la siguiente información:\n #{menorEnfermeroPagado.mostrarDatos}"