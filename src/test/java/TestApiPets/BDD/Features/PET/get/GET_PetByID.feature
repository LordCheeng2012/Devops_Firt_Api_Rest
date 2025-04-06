Feature: yo como qa deseo buscar una mascota mediante su id
  Background:
    * def URL = karate.get('urlBase')
    * def path = '/pet/'
    * karate.log('urlBase is:', URL)

  @PetByIdOk @Happypath
  Scenario Outline: buscar mascota por su id ok
    Given url URL + path + <id>
    When method GET
    Then status 200
    Examples:
      | id |
      |  5 |

@PetByNoOk @UnhappyPath
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

Scenario Outline: buscar mascota por id con caraceteres no validos o especiales
  Given url URL + path + '<id>'
  When method GET
  Then status 404
  And match response.code == 404
  And match response.type == 'unknown'
  Examples:
  |id|
  |  aspdasd$22 |
  |  0a |

