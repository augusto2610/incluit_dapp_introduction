## Ejercicio Practico Nro 2

Sistema para que la administración de un consorcio de un edificio se haga mediante una dApp. Las características pensadas son:

- Debe haber un administrador. Se utiliza la libreria de OpenZeppelin Ownable.

- Hay un tipo de usuario base, BaseUser y dos hijos (herencia). Employee y Tenant

- El admin es el unico que puede agregar usuarios. Ya sea de tipo Employee o de tipo Tenant

- La app debe tener una lista de usuarios que pagan expensas (Tenant) y debe tener una lista de usuarios de tipo empleados (Employee)

- Los usuarios que pagan expensas, deben pagar a través de la app. Esta vez debe enviarse el valor en ethers y validar que la transferencia se haga correctamente.

- La dApp debe tener un balance para saber con cuánta plata cuenta para ejecutar los pagos correspondientes.

- La app debe tener una lista de pagos de servicios que debe hacer.

- La app debe tener una función para pagar los servicios de la lista. Solamente el admin puede realizar el pago.

- La app debe tener una función para pagar cosas puntuales o eventos por separado. (Solamente el administrador puede hacer uso de esta función)
