require 'date'

class Persona
	attr_accessor :nombre, :apellido, :email, :edad, :nacimiento

	def initialize(nombre, apellido) 
		@nombre = nombre
		@apellido = apellido 
		@email = ""
		@edad = 0
		@nacimiento = Date.new(1999,1,1)
	end

	def nombre_completo
		return "#{@nombre} #{@apellido}"
	end

end 

def main
	g = Persona.new("Gustavo","Robledo")
	g.email = "gustavo.allfadir@gmail.com"
	g.edad = 33
	g.nacimiento = Date.new(1987,8,6)
	puts "Su nombre completo es #{g.nombre_completo}"
	puts "Su email es #{g.email}"
	puts "La edad de #{g.nombre} es de #{g.edad} años"
	puts "Su fecha de nacimiento es #{g.nacimiento.strftime('%d-%b-%Y')}"
end

main()