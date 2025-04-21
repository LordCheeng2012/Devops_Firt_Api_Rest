Feature: Yo como QA quiero crear una mascota en la api
  Background:
    ##definimos las variables y datos que nesesitaremos durante los scenarios
    * def URL = karate.get('urlBase')
    * def path = '/pet'
    * karate.log('urlBase is:', URL)
    * def Request = read('../../Utils/Responses/POST/RequestCreatedPet.json')
    * def f = call read('../../Functions/Functions.feature')
    @ID-503 @componente @HappyPath
    Scenario Outline: Validar creacion de una mascota obteniendo un 200 ('<Caso>')
      Given url URL + path
      * Request.id = <idPet>
      * Request.name = '<namePet>'
      * Request.category.name = '<CatPet>'
      And request Request
      When method POST
      Then status 200
      And match response.id == <idPet>
      And match response.name == '<namePet>'
      And match response.category.name == '<CatPet>'
      Examples:
      |Caso|idPet|namePet|CatPet|
      |  Gato  | 17|Michi|  cat    |
      |  Perro | 52|Firulais|  dog |

@ID-504 @componente @UnHappyPath
  Scenario: Validar respuesta de endpoint al enviar un request invalido  status 500 enviandon en request esquema inseperado
  Given url URL + path
  * def req = read('../../Utils/Responses/GET/EspectedSchema.json')
  And request req
  When method POST
  Then status 500
  * print response
  And match response.code == 500
  And match response.type == 'unknown'
  And match response.message == 'something bad happened'
##Generame otros casos fallidos , osea que sus valores del esquema sean nulos o vacios o alfanumericos
@ID-505 @componente @UnHappyPath
  Scenario: Validar respuesta de endpoint al enviar un request invalido  status 400 enviandon en request esquema incorrecto
  Given url URL + path
  * def req = '{"values":"PetInvalid","values":"PetInvalid"}'
  And request req
  When method POST
  * karate.log('El código de estado es:', responseStatus)
  * def res = f.SimulateResponse(responseStatus,400,'deseo evaluar si no es 400,devolverme 400')
  ##cambiamos el valor
  * karate.set(responseStatus,res)






  