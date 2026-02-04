class Challenges
  
  # 1. números primos
  # Devuelve true si es primo, false si no.
  def self.is_prime?(n)
    return false if n <= 1
    # Revisa si ningún número desde 2 hasta la raíz de n lo divide
    (2..Math.sqrt(n)).none? { |i| n % i == 0 }
  end

  # 2. ordenamiento de cadenas
  # Entrada: "perro gato casa" -> Salida: "casa gato perro"
  def self.sort_string(str)
    # split: corta por espacios | sort_by: ordena sin importar mayúsculas | join: une de nuevo
    str.split.sort_by(&:downcase).join(' ')
  end

  # 3. palíndromos 
  # "radar" -> true
  def self.palindrome?(str)
    # Quitamos espacios y ponemos minúsculas para comparar bien
    clean = str.downcase.gsub(/\s+/, "") 
    clean == clean.reverse
  end

  # 4. Fibonacci
  # n=5 -> [0, 1, 1, 2, 3]
  def self.fibonacci(n)
    return [] if n <= 0
    return [0] if n == 1
    
    sequence = [0, 1]
    # Repetimos n-2 veces para completar la lista
    (n - 2).times do
      # Sumamos los dos últimos números
      sequence << sequence[-1] + sequence[-2]
    end
    sequence
  end

  # suma de dos números 
  # [1, 2, 3, 4, 5], target 9 -> [4, 5]
  def self.two_sum(nums, target)
    seen = {} # Un hash (diccionario) para recordar qué números ya vimos
    
    nums.each do |num|
      complement = target - num
      if seen.key?(complement)
        return [complement, num] # ¡Encontramos el par!
      end
      seen[num] = true # Marcamos este número como visto
    end
    return nil # Si no encontramos nada
  end
end