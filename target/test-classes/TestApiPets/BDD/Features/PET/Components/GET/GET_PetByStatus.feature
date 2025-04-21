Feature: yo como qa deseo listar las mascotas por su status
  Background:
    * def URL = karate.get('urlBase')
    * def path = '/pet/'
    * def ByStatus = 'findByStatus'
    * karate.log('url Base is:', URL+path+ByStatus)

  @ID-500 @componente @PetByStatus @Happypath
  Scenario Outline: buscar mascota por su status ok
    Given url URL + path + ByStatus
    And param status = '<status>'
    When method GET
    Then status 200
    * print response
    And match response[0].status == '<status>'
    Examples:
      | status     |
      | available  |
      | pending    |
      | sold       |

@ID-501 @componente @PetsByStatus
Scenario Outline: validar mascota por estado incorreto o inexistentes
  Given url URL + path + ByStatus
  And param status = '<status>'
  When method get
  Then status 200
  * print response
  And match response[0] == '#notpresent'
  Examples:
  |status|
  |   avaere4   |
  |             |
  |    32343255 |