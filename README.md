# Introduccion a dApps en Solidity


Ejercicio Practico

Desarrollar un sistema para un gimnasio. El gym tiene un sistema de créditos, donde cada alumno tiene una cantidad disponible para usar. A su vez, el gym tiene clases y cada una requiere créditos para poder asistir. Cuantos créditos consume cada clase está determinado por el administrador del gym.

Entonces las características y funcionalidades del sistema son:

- El gym tiene una lista de clases disponibles.

- Las clases tienen 2 atributos: nombre y créditos.

- El gym también tiene una lista de usuarios (address) y cada usuario tiene una cantidad de créditos disponibles.

- El address del admin del gym se asigna cuando se hace deploy del sistema (en el constructor)

- El admin del gym puede agregar clases y asignar la cantidad de créditos que consume esa clase. Validar que un usuario NO pueda agregar clases.

- Los usuarios se tienen que dar de alta y agregar cuantos creditos quieren tener disponibles (uint, no ethers todavía)

- El sistema tiene que tener una función para poder “asistir a una clase”, esto significa que se deben restar los créditos correspondientes a un usuario, cuyo address se pasa por parámetro (o el address que interactúe con el contrato),. El sistema debe validar que el usuario tenga los créditos necesarios.

- El sistema debe tener una función para retornar un address y la cantidad de créditos disponibles. 
