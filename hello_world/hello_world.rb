greet = "Hello world!"

puts "Escribe tu nombre"
nombre = gets.chomp
lista = ["Hola",nombre]
lista_frutas = [
	"manzana",
	"naranja",
	"mandarina",
	"limón",
	"sandía",
	"pera",
]

puts greet
puts lista.join(" ")
puts lista_frutas

for fruta in lista_frutas do
	if fruta == "limón"
		puts "me gusta el #{fruta}"
	else
		puts "me gusta la #{fruta}"
	end
end
