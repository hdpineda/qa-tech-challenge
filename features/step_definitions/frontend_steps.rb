# Importamos los Page Objects
require_relative '../../src/pages/login_page'
require_relative '../../src/pages/dashboard_page'

Given('que estoy en la página de inicio de sesión') do
  @login_page = LoginPage.new
  @login_page.load
end

When('ingreso el usuario {string} y contraseña {string}') do |user, password|
  @login_page.login(user, password)
end

Then('debería ser redirigido al dashboard') do
  @dashboard = DashboardPage.new
  # Esperamos a que la URL cambie 
  expect(page).to have_current_path(/hackathonAppV2\.html/)
end

Then('debería ver exactamente {int} transacciones en la tabla') do |cantidad|
  
  @dashboard.wait_until_transaction_rows_visible
  expect(@dashboard.transaction_rows.size).to eq(cantidad)
end

Then('el balance total debería ser {string}') do |balance_esperado|
  # Limpiamos el símbolo de dolar y espacios para comparar solo números
  texto_actual = @dashboard.total_balance.text.gsub(/[^\d\.,]/, '').strip
  expect(texto_actual).to eq(balance_esperado)
end

Then('el crédito disponible debería ser {string}') do |credito_esperado|
  texto_actual = @dashboard.credit_available.text.gsub(/[^\d\.,]/, '').strip
  expect(texto_actual).to eq(credito_esperado)
end

Then('los valores positivos deberían mostrarse en verde') do
  expect(@dashboard.validate_positive_colors).to be true
end

Then('los valores negativos deberían mostrarse en rojo') do
  expect(@dashboard.validate_negative_colors).to be true
end

Then('debería ver un mensaje de error que dice {string}') do |mensaje_esperado|
  # Esperamos que aparezca la alerta
  expect(@login_page).to have_alert_message
  # Validamos el texto
  expect(@login_page.alert_message.text).to include(mensaje_esperado)
end

