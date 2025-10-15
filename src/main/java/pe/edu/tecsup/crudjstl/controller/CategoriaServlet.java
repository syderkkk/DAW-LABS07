package pe.edu.tecsup.crudjstl.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.tecsup.crudjstl.dao.ICategoriaDAO;
import pe.edu.tecsup.crudjstl.dao.impl.CategoriaDAOImpl;
import pe.edu.tecsup.crudjstl.model.Categoria;

import java.io.IOException;
import java.util.List;

@WebServlet("/categoria")
public class CategoriaServlet extends HttpServlet {
    private ICategoriaDAO categoriaDAO;

    @Override
    public void init() throws ServletException {
        categoriaDAO = new CategoriaDAOImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "listar";
        }

        switch (action) {
            case "nuevo":
                mostrarFormularioNuevo(request, response);
                break;
            case "editar":
                mostrarFormularioEditar(request, response);
                break;
            case "eliminar":
                eliminarCategoria(request, response);
                break;
            default:
                listarCategorias(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("guardar".equals(action)) {
            guardarCategoria(request, response);
        } else if ("actualizar".equals(action)) {
            actualizarCategoria(request, response);
        }
    }

    private void listarCategorias(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Categoria> listaCategorias = categoriaDAO.listar();
        request.setAttribute("listaCategorias", listaCategorias);
        request.getRequestDispatcher("/categorias.jsp").forward(request, response);
    }

    private void mostrarFormularioNuevo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/categoria-form.jsp").forward(request, response);
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Categoria categoria = categoriaDAO.obtenerPorId(id);
        request.setAttribute("categoria", categoria);
        request.getRequestDispatcher("/categoria-form.jsp").forward(request, response);
    }

    private void guardarCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");

        Categoria categoria = new Categoria();
        categoria.setNombre(nombre);
        categoria.setDescripcion(descripcion);

        if (categoriaDAO.agregar(categoria)) {
            request.setAttribute("mensaje", "Categoría agregada exitosamente");
        } else {
            request.setAttribute("error", "Error al agregar la categoría");
        }

        listarCategorias(request, response);
    }

    private void actualizarCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");

        Categoria categoria = new Categoria();
        categoria.setId(id);
        categoria.setNombre(nombre);
        categoria.setDescripcion(descripcion);

        if (categoriaDAO.actualizar(categoria)) {
            request.setAttribute("mensaje", "Categoría actualizada exitosamente");
        } else {
            request.setAttribute("error", "Error al actualizar la categoría");
        }

        listarCategorias(request, response);
    }

    private void eliminarCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        if (categoriaDAO.eliminar(id)) {
            request.setAttribute("mensaje", "Categoría eliminada exitosamente");
        } else {
            request.setAttribute("error", "Error al eliminar la categoría");
        }

        listarCategorias(request, response);
    }
}