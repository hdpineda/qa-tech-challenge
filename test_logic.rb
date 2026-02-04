require_relative 'src/logic/challenges'
el_numero=11
puts "Prueba Primos (#{el_numero} es primo?): #{Challenges.is_prime?(el_numero)}"
ordenar="perro gato casa Silla Almohada Cascada"
puts "Prueba Ordenar: #{Challenges.sort_string(ordenar)}"
palindromo='ana'
puts "Prueba Palindromo (#{palindromo}): #{Challenges.palindrome?(palindromo)}"
n_secuencia=7
puts "Prueba Fibonacci (#{n_secuencia}): #{Challenges.fibonacci(n_secuencia)}"
lista_numeros=[1, 2, 3, 5, 5]
target_suma=9
puts "Prueba Two Sum: #{Challenges.two_sum(lista_numeros, target_suma)}"