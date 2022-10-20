# Introduccion a dApps en Solidity


## Ejercicio Practico Nro 1

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

## Ejercicio Practico Nro 2

Sistema para que la administración de un consorcio de un edificio se haga mediante una dApp. Las características pensadas son:

- Debe haber un administrador, que va a ser quien haga deploy del contrato

- Pueden haber varios tipos de usuarios (pensando en usar herencia). Por ejemplo: usuarios que tengan responsabilidad de pagar expensas (y dentro de estos, que se dividan en inquilinos y propietarios) y usuarios que tengan que recibir un pago, por ejemplo un empleado del edificio como un portero o encargado.

- El admin es el unico que puede agregar usuarios. Ya sea tipo inquilino o tipo empleado

- La app debe tener una lista de usuarios que pagan expensas (inquilino/propietario) y debe tener una lista de usuarios de tipo empleados (portero/plomero/seguridad, etc)

- Los usuarios que pagan expensas, deben pagar a través de la app. Esta vez debe enviarse el valor en ethers y validar que la transferencia se haga correctamente.

- La app debe tener una lista de pagos que debe hacer (sueldos, arreglos, servicios, etc)

- La dApp debe tener un balance para saber con cuánta plata cuenta para ejecutar los pagos correspondientes.

- La app debe tener una función para pagar los servicios de la lista. Solamente el admin puede realizar el pago.

- La app debe tener una función para pagar cosas puntuales o eventos por separado. (Solamente el administrador puede hacer uso de esta función)

- Tener en cuenta que los empleados y servicios, van a ser indicados por un address. Con lo cual, un pago significa transferir ethers desde el contrato hacia otra cuenta (address).

- Cada contract debe ir un archivo separado (para usar imports)

