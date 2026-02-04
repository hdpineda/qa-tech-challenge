Feature: Validación de Tabla de Gastos en Applitools

  Scenario: 1. Iniciar sesión y validar transacciones financieras
    Given que estoy en la página de inicio de sesión
    When ingreso el usuario "testuser" y contraseña "testpassword"
    Then debería ser redirigido al dashboard
    And debería ver exactamente 6 transacciones en la tabla
    And el balance total debería ser "350"
    And el crédito disponible debería ser "17,800"
    And los valores positivos deberían mostrarse en verde
    And los valores negativos deberían mostrarse en rojo
  
  @negative
  Scenario Outline: Validar manejo de errores en inicio de sesión
    Given que estoy en la página de inicio de sesión
    When ingreso el usuario "<usuario>" y contraseña "<password>"
    Then debería ver un mensaje de error que dice "<mensaje>"

    Examples:
      | usuario   | password      | mensaje                                 |
      |           |               | Please enter both username and password |

  