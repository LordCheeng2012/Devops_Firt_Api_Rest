Feature: Yo como usuario deseo Buscar una mascota por medio de id
  Background:
    * def URL = karate.get('urlBase')
    * def path = '/pet/'
    * karate.log('urlBase is:', URL)
    * def Espec = read('../../Utils/Responses/GET/EspectedSchema.json')

  @ID-455 @Happypath @componente
  Scenario Outline: Buscar mascota por su id ok
    Given url URL + path + <id>
    When method GET
    Then status 200
    ##validacion en integracion de datos
    And match response == Espec
    And match response.id == <id>
    And match response.name ==<namePet>
    Examples:
      |id|namePet|
      |1|"doggie"|
      |2|"Tom"|
      |3|"Whiskers Updated"|
      |5|"doggie"|

@ID-400 @UnhappyPath @componente
Scenario Outline: buscar mascota por id no existente no ok retornano 404 not found
  Given url URL + path + '<id>'
  When method GET
  Then status 404
  And match response.message == 'Pet not found'
  And match response.type == 'error'
  And match response.code == 1
  Examples:
  |id|
  |  -1 |
  |  1000 |
  |  2000 |

@ID-404  @UnhappyPath @componente
Scenario Outline: buscar mascota por id con caraceteres no validos o especiales
  Given url URL + path + '<id>'
  When method GET
  Then status 404
  And match response.code == 404
  And match response.type == 'unknown'
  Examples:
  |id|
  | aspdasd$22|
  |  0a |

  @ID-406 @UnhappyPath @componente
  Scenario Outline: buscar mascota por id vacio
    Given url URL + path + '<id>'
    When method GET
    Then status 404
    And match response.code == 404
    And match response.type == 'unknown'
    Examples:
      |id|
      | aspdasd$22|
      |  0a |
