# flutter_prueba_tecnica

Para la prueba tecnica se realiza la Opcion 1 que trata de lo siguiente:

Crear un proyecto mobile en flutter que tenga un formulario para crear un usuario con
Nombre, Apellido, fecha de nacimiento y agregar una dirección física a tu cuenta (puedes
tener muchas direcciones por usuario). El flujo deberá tener 3 pantallas, al menos. Te
recomendamos seguir buenas prácticas como control de errores, estados y todo lo que haga
que tu código sea elegante. Debemos poder pintar los datos del usuario en cualquier momento
de la aplicación.

## Getting Started

Para la funcionalidad de la bd que consume el aplicativo, se creó una bd en Posgresql 15 y un servicio en nodejs.
la base de datos Posgresql está en la carpeta bd junto al script de la tabla utlizada, se debe implementar en un servicio local de nodejs.

* Git del proyecto en node [https://github.com/ecarbono/api_prueba_tecnic.git]

## Comandos para proyecto de node: 
-npm i
-node app.js

## Comandos para proyecto de flutter: 
-flutter pub get


## Bade de datos versión
PostgreSQL 15

## Setings
* En la ruta del proyecto lib/provider/variables.dart, se encuentra la variable del endpoint del servicio de nodejs
const url = "http://localhost:8484/api/users";
nota : Si sale SocketException: Connection refused al momento de consultlar o registrar usuario, se debe cambiar la ip de la varialbe url por la ip del equipo en que se esta realizando la prueba ej: const url = "http://192.168.0.12:8484/api/users";




## Resultados en un emulador ios

<table>
<tr>
<th align="center">
<img width="441" height="1">
<p> 
<small>
Vista inicial
</small>
</p>
</th>
<th align="center">
<img width="441" height="1">
<p> 
<small>
Vista Opcion 1
</small>
</p>
</th>
</tr>
<tr>
<td align="center">
<img src="https://github.com/ecarbono/flutter_prueba_tecnica/blob/main/imagenes/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20Max%20-%202022-10-26%20at%2012.58.50.png" width="200"/>
  
</td>
<td align="center">
<img src="https://github.com/ecarbono/flutter_prueba_tecnica/blob/main/imagenes/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20Max%20-%202022-10-26%20at%2012.58.53.png" width="200"/>
  
</td>
</tr>
<tr>
<td align="center">
<img width="441" height="1">
<p> 
<small>
Vista Usuarios
</small>
</p>
</td>
<td align="center">
<img width="441" height="1">
<p> 
<small>
Vista Formulario 
</small>
</p>
</td>
</tr>
<td align="center">
<img src="https://github.com/ecarbono/flutter_prueba_tecnica/blob/main/imagenes/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20Max%20-%202022-10-26%20at%2012.58.56.png" width="200"/>
  
</td>
<td align="center">

<img src="https://github.com/ecarbono/flutter_prueba_tecnica/blob/main/imagenes/Simulator%20Screen%20Shot%20-%20iPhone%2014%20Pro%20Max%20-%202022-10-26%20at%2012.59.00.png" width="200"/>
  
</td>
</table>





# flutter-prueba-tecnica
