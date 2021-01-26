class Fibonacci
    max = 0
    def initialize(max)
        @max = max
    end

    def imprimir_secuencia()
        a = 0 
        b = 1
        c = a + b
        puts "Iniciando secuencia fibonacci del 0 al #{@max}"
        puts a
        puts b 
        while true
            puts c
            a = b
            b = c
            c = a + b
            if c > @max
                break
            end
        end
    end 
end

fib = Fibonacci.new(500)
fib.imprimir_secuencia