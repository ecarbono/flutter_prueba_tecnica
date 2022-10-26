# flutter_prueba_tecnica

Para la prueba tecnica se realiza la Opcion 1 que trata de lo siguiente:

Crea un proyecto mobile en flutter que tenga un formulario para crear un usuario con
Nombre, Apellido, fecha de nacimiento y agregar una dirección física a tu cuenta (puedes
tener muchas direcciones por usuario). El flujo deberá tener 3 pantallas, al menos. Te
recomendamos seguir buenas prácticas como control de errores, estados y todo lo que haga
que tu código sea elegante. Debemos poder pintar los datos del usuario en cualquier momento
de la aplicación.

## Getting Started

Para la funcionalidad de la bd que consume el aplicativo, se creo una bd en postgres y un servicio en nodejs.
la base de datos posgrest esta en la carpeta bd, se debe importar en un servicio local de postgresql


## Setings
* En la ruta del proyecto lib/provider/variables.dart, se encuentra la variable del endpoint del servicio de nodejs
const url = "http://localhost:8484/api/users";

* Git del proyecot en node [https://github.com/ecarbono/api_prueba_tecnic.git]
# flutter-prueba-tecnica
