Feature: Pruebas de API en ReqRes

  Feature: Flujo completo de creación y verificación de usuarios

  @api @E2E
  Scenario: Crear usuario, extraer ID y validar persistencia de datos
    Given que el sistema ReqRes está disponible
    # Paso 1: POST
    When envío una solicitud para crear un usuario con:
      | name | Test User           |
      | job  | Automation Engineer |
    Then el código de respuesta debería ser 201
    And la respuesta debería cumplir con el contrato "create_user_contract.json"
    And extraigo el ID del usuario recién creado
    
    # Paso 2: GET (Usando el ID extraído)
    # el caso E2E falla la consulta del Get por usuario creado ya que no se guarda en la base de datos de ReqRes, 
    # ero se deja el paso para evidenciar el flujo
    When consulto los detalles del usuario con el ID extraído
    Then el código de respuesta debería ser 200
    And los datos obtenidos deberían coincidir con los enviados:
      | name | Test User           |
      | job  | Automation Engineer |
    And la respuesta debería cumplir con el contrato "user_contract.json"

  @api @APInegative
  Scenario: Validar error al buscar un usuario inexistente
    Given que el sistema ReqRes está disponible
    When consulto el usuario con ID 99999999
    Then el código de respuesta debería ser 404
    And la respuesta debería ser un objeto vacío

  @api @GETpositive
  #se crea escenario para evidenciar la consulta exitosa de un usuario existente y poder validar el contrato
  Scenario: Validar error al buscar un usuario inexistente
    Given que el sistema ReqRes está disponible
    When consulto el usuario con ID 1
    Then el código de respuesta debería ser 200
    And la respuesta debería cumplir con el contrato "user_contract.json"