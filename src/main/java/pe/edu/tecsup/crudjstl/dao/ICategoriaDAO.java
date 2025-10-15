package pe.edu.tecsup.crudjstl.dao;

import pe.edu.tecsup.crudjstl.model.Categoria;

import java.util.List;

public interface ICategoriaDAO {
    List<Categoria> listar();
    Categoria obtenerPorId(int id);
    boolean agregar(Categoria categoria);
    boolean actualizar(Categoria categoria);
    boolean eliminar(int id);
}