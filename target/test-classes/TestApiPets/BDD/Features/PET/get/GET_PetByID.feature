Feature: Yo como usuario deseo Buscar una mascota por medio de id
  Background:
    * def URL = karate.get('urlBase')
    * def path = '/pet/'
    * karate.log('urlBase is:', URL)
    * def EspectedJson = read('../Utils/Responses/GET/Get_PetById.json')

  @PetByIdOk @Happypath @componente
  Scenario Outline: Buscar mascota por su id ok
    Given url URL + path + <id>
    When method GET
    Then status 200
    And match response $ == EspectedJson
    Examples:
      | id |Name|
      | 1 |doggie|
      | 2 |Cats|
      | 3 |Cats|
      | 4 |Dogs |
      | 5 |string|


@PetByNoOk @UnhappyPath @componente
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

  @PetByNoOk @UnhappyPath @componente
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

