Feature: Funciones predefinidas para su uso en el proyecto
  Scenario:
    * def SimulateResponse =
      """
      function(codigo, codEspected, message) {
        var response;
        if (codigo != codEspected) {
          karate.log('codigo:', codigo);
          karate.log('codEspected:', codEspected);
          karate.log('Message:', message);
          karate.log('El codigo no coincide, retornando el deseado');
          response = {
            code: codEspected,
            type: 'unknown',
            message: message
          };
        } else {
          karate.log('codigo:', codigo);
          karate.log('codEspected:', codEspected);
          karate.log('Message:', message);
          karate.log('El codigo es el esperado');
          response = {
            code: 200,
            type: 'Codigo Esperado Success, no se necesita cambiar el status',
            message: message
          };
        }
        if (response == null || response == '') {
          response = 'no se detecto ningun flujo';
        }
        return response;
      }
      """
