function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env entorno de anbiente es :', env);
  if (!env) {
    env = 'dev'; // a default value
  }
  var config = {
    env: env,
    urlBase: '',
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
    config.urlBase = 'https://petstore.swagger.io/v2';
  } else if (env == 'e2e') {
    // customize
  config.urlBase = 'https://petstore.swagger.io/v2';
  }
  return config;
}