class DashboardPage < SitePrism::Page
  set_url '/hackathonAppV2.html'

  # Elementos de la cabecera
  element :total_balance, '#totalBalance > div:nth-child(2) > span:nth-child(1)'
  element :credit_available, '#creditAvailable'
  
  # Elementos de la tabla (filas)
  elements :transaction_rows, '#transactionsTable tbody tr'
  
  # Elementos específicos para validar colores (clases CSS típicas de este demo)
  # Buscamos celdas que contengan montos
  elements :amounts, '#transactionsTable tbody tr td:nth-child(5) span'

  def validate_positive_colors
    # Filtramos los montos que no tienen el signo menos
    positives = amounts.select { |span| !span.text.include?('-') }
    
    # Verificamos que todos tengan la clase 'text-success' (verde en Bootstrap)
    # o el estilo color: green (dependiendo de la implementación exacta)
    positives.all? { |span| span[:class].include?('text-success') || span[:style].include?('green') }
  end

  def validate_negative_colors
    # Filtramos los montos que TIENEN el signo menos
    negatives = amounts.select { |span| span.text.include?('-') }
    
    # Verificamos que todos tengan la clase 'text-danger' (rojo)
    negatives.all? { |span| span[:class].include?('text-danger') || span[:style].include?('red') }
  end
end