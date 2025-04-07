Feature: yo como qa deseo listar las mascotas por su status
  Background:
    * def URL = karate.get('urlBase')
    * def path = '/pet/'
    * def ByStatus = 'findByStatus'
    * karate.log('url Base is:', URL+path+ByStatus)

  @PetByStatus @Happypath
  Scenario Outline: buscar mascota por su status ok
    Given url URL + path + ByStatus
    And param status = '<status>'
    When method GET
    Then status 200
    Examples:
      | status     |
      | available  |
      | pending    |
      | sold       |

    @PetByStatusNoOk @UnhappyPath
      Scenario : buscar stados de mascota segun un status  no existente
      Given url URL + path + ByStatus
      And param status = 'asfaf$584'
      When method GET
      Then status 200
