require 'socket'

app = Proc.new do
	[
		'200',
		{'Content-Type' => 'text/html'}, 
		[	
			'<head> <title>Welcome</title> <meta charset="UTF-8"> </head>',

			"<h1>Hello world! The time is #{Time.now.strftime("%d/%b/%Y, %I:%M %p")}</h1>",

			"<h3>Bienvenido a este sitio de prueba, sólo es un backend sencillo con Ruby</h3>",
			
			"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
			labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco 
			laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in 
			voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat 
			non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>"
		],
	]
end

puts "Iniciando servidor..."
server = TCPServer.new 'localhost', 3000
puts "Servidor listo escuchando peticiones en http://localhost:3000"

while session = server.accept 
	request = session.gets 
	puts request 

	status, headers, body = app.call({})

	session.print "HTTP/1.1 #{status}\r\n"

 	headers.each do |key, value|
 		session.print "#{key}:#{value}\r\n"
 	end

 	session.print "\r\n"

 	body.each do |part|
 		session.print part
 	end

	session.close
end

