package pe.edu.tecsup.crudjstl.dao;

import pe.edu.tecsup.crudjstl.model.Producto;

import java.util.List;

public interface IProductoDAO {
    List<Producto> listar();
    Producto obtenerPorId(int id);
    boolean agregar(Producto producto);
    void actualizar(Producto producto);
    boolean eliminar(int id);
}
