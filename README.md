# Catalogo y pago

## Imagenes de catálogo:
Se utiliza poliformismo para poder asociar las imagenes al catálogo.
Se permite solo una url para los productos digitales. Los productos físicos no tienen límite de urls a asociar.

El esquema relacional del proyecto se distribuye de la siguiente manera:

![alt text](db_schema.png)

La relación a imágenes está hecha mediante exclusive arc a modo  de permitir solo un tipo se asociación por imagen.
Se utiliza un mecanismo similar para order_items, de forma que solo permita que cada registro tenga o un producto digital o un producto físico asociado.

## Animales (Parte II)
