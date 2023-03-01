CREATE SCHEMA generation;
#create schema es para crear nuestra base, que es schema geneartion.
USE generation;
#use generation es para indicar que se va a usar el schema generation.
CREATE TABLE Cliente(
#cliente_id es un atributo de tipo integer, llave primaria
#autoincrementable y no puede ser nula
#por buena práctica hay que ocupar las palabras reservadas en mayúscula
#el último no lleva coma
#el cliente_id dice qu serán integer, será la primary key de la tabla, será auto incrementable(que la máquina irá incrementando) 
# not null indica que nunca puede ser null o vacío).
	cliente_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(25),
    dirección VARCHAR(50),
    correo VARCHAR(50),
    medioPago VARCHAR(20),
    valoracion INTEGER,
    rutCliente VARCHAR(15)

);

CREATE TABLE Boleta(
	boleta_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nroBoleta BIGINT,
    fecha DATE,
    total FLOAT

);

#Con esto se agrega la columna cliente_id a la tabla boleta. 
ALTER TABLE Boleta add cliente_id INTEGER NOT NULL;

#Crear las relaciones utilizando las foreign key
#Se va a alterar la tabla boleta, se le agrega una foreign key llamada cliente_id
#que hace referencia a cliente_id que está en Cliente. 
ALTER TABLE Boleta
ADD FOREIGN KEY (cliente_id) REFERENCES Cliente (cliente_id);


CREATE TABLE Producto(
	producto_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(25),
    precio DOUBLE

);

CREATE TABLE Proveedor(
	proveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(50),
    rol INTEGER,
    contacto VARCHAR(50),
    fechaVisita DATE

);

CREATE TABLE ProductoProveedor(
	productoPreveedor_id INTEGER PRIMARY KEY AUTO_INCREMENT NOT NULL
    
);


#Se crea una nueva columna 
ALTER TABLE ProductoProveedor add producto_id INTEGER NOT NULL;

ALTER TABLE ProductoProveedor
ADD FOREIGN KEY (producto_id) REFERENCES Producto (producto_id); 

ALTER TABLE ProductoProveedor add proveedor_id INTEGER NOT NULL;

ALTER TABLE ProductoProveedor
ADD FOREIGN KEY (proveedor_id) REFERENCES Proveedor (proveedor_id);

INSERT INTO Cliente (nombre, dirección, correo, medioPago, valoracion, rutCliente) 
VALUES("Isa", "calle", "isa@gmail.com", "efectivo", 5, "15746598-9");

INSERT INTO Cliente (nombre, dirección, correo, medioPago, valoracion, rutCliente)
VALUES("Diego", "calle124", "diego@gmail.com", "crédito", 4, "18546598-2");

SELECT * FROM Cliente;
#Se ve solo una nombre del cliente y medio de pago
SELECT Cliente.nombre, Cliente.medioPago FROM Cliente;

#Se edita con el set, y where puede ser cualquiera de las columnas. 
UPDATE Cliente
SET correo = "isa2@gmail.com"
WHERE cliente_id = 1;

UPDATE Cliente
SET correo = "isa3@gmail.com", medioPAgo = "Débito"
WHERE cliente_id = 3;

#Se elimina todo un cliente
DELETE FROM Cliente WHERE cliente_id = 3;

#Se elimina la columna correo
ALTER TABLE Cliente DROP COLUMN correo;

#Se renomabra la columna medioPago por medioDePago
ALTER TABLE Cliente RENAME COLUMN medioPago TO medioDePago; 

#Como borrar una tabla
#Primero eliminar las relaciones que existan
ALTER TABLE Boleta DROP CONSTRAINT boleta_ibfk_1;
#Luego se elimina la tabla.
DROP TABLE Cliente Cascade;




