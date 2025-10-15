# Base de Datos de Productos

Este proyecto utiliza una base de datos MySQL para gestionar productos y categorías.

## Estructura de la Base de Datos

### Instalación

Ejecuta el siguiente script SQL para crear la base de datos y las tablas necesarias:
```sql
-- Crear base de datos
CREATE DATABASE IF NOT EXISTS db_productos;
USE db_productos;

-- Tabla Categoría
CREATE TABLE categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255)
);

-- Tabla Producto
CREATE TABLE producto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    categoria_id INT NOT NULL,
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

-- Datos de ejemplo
INSERT INTO categoria (nombre, descripcion) VALUES
('Electrónica', 'Productos electrónicos y tecnología'),
('Ropa', 'Prendas de vestir'),
('Alimentos', 'Productos alimenticios');

INSERT INTO producto (nombre, descripcion, precio, stock, categoria_id) VALUES
('Laptop HP', 'Laptop 15 pulgadas, 8GB RAM', 2500.00, 10, 1),
('Mouse Logitech', 'Mouse inalámbrico', 45.50, 50, 1),
('Camisa Polo', 'Camisa 100% algodón', 89.90, 25, 2),
('Arroz Premium', 'Arroz de grano largo 1kg', 5.50, 100, 3);
```

## Descripción de Tablas

- **categoria**: Almacena las categorías de productos
- **producto**: Almacena los productos con referencia a su categoría