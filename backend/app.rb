require 'socket'


puts "Iniciando servidor..."
server = TCPServer.new 'localhost', 8000
puts "Servidor listo escuchando peticiones en http://localhost:8000"


app = Proc.new do
	[
		'200',
		{'Content-Type' => 'text/html'}, 
		["<h1>Hello world!, The time is #{Time.now}</h1>"],
]
end


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

