package pe.edu.tecsup.crudjstl.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pe.edu.tecsup.crudjstl.dao.ICategoriaDAO;
import pe.edu.tecsup.crudjstl.dao.IProductoDAO;
import pe.edu.tecsup.crudjstl.dao.impl.CategoriaDAOImpl;
import pe.edu.tecsup.crudjstl.dao.impl.ProductoDAOImpl;
import pe.edu.tecsup.crudjstl.model.Categoria;
import pe.edu.tecsup.crudjstl.model.Producto;

import java.io.IOException;
import java.util.List;

@WebServlet("/producto")
public class ProductoServlet extends HttpServlet {
    private IProductoDAO productoDAO;
    private ICategoriaDAO categoriaDAO;

    @Override
    public void init() throws ServletException {
        productoDAO = new ProductoDAOImpl();
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
                eliminarProducto(request, response);
                break;
            default:
                listarProductos(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("guardar".equals(action)) {
            guardarProducto(request, response);
        } else if ("actualizar".equals(action)) {
            actualizarProducto(request, response);
        }
    }

    private void listarProductos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Producto> listaProductos = productoDAO.listar();
        request.setAttribute("listaProductos", listaProductos);
        request.getRequestDispatcher("/productos.jsp").forward(request, response);
    }

    private void mostrarFormularioNuevo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Categoria> listaCategorias = categoriaDAO.listar();
        request.setAttribute("listaCategorias", listaCategorias);
        request.getRequestDispatcher("/producto-form.jsp").forward(request, response);
    }

    private void mostrarFormularioEditar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Producto producto = productoDAO.obtenerPorId(id);
        List<Categoria> listaCategorias = categoriaDAO.listar();

        request.setAttribute("producto", producto);
        request.setAttribute("listaCategorias", listaCategorias);
        request.getRequestDispatcher("/producto-form.jsp").forward(request, response);
    }

    private void guardarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        double precio = Double.parseDouble(request.getParameter("precio"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        int categoriaId = Integer.parseInt(request.getParameter("categoriaId"));

        Producto producto = new Producto();
        producto.setNombre(nombre);
        producto.setDescripcion(descripcion);
        producto.setPrecio(precio);
        producto.setStock(stock);
        producto.setCategoriaId(categoriaId);

        if (productoDAO.agregar(producto)) {
            request.setAttribute("mensaje", "Producto agregado exitosamente");
        } else {
            request.setAttribute("error", "Error al agregar el producto");
        }

        listarProductos(request, response);
    }

    private void actualizarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");

            // Validar y convertir precio
            String precioStr = request.getParameter("precio");
            double precio = 0.0;
            if (precioStr != null && !precioStr.trim().isEmpty()) {
                precio = Double.parseDouble(precioStr);
            }

            // Validar y convertir stock
            String stockStr = request.getParameter("stock");
            int stock = 0;
            if (stockStr != null && !stockStr.trim().isEmpty()) {
                stock = Integer.parseInt(stockStr);
            }

            // Validar y convertir categoria_id
            String categoriaIdStr = request.getParameter("categoriaId");
            int categoriaId = 0;
            if (categoriaIdStr != null && !categoriaIdStr.trim().isEmpty()) {
                categoriaId = Integer.parseInt(categoriaIdStr);
            }

            Producto producto = new Producto(id, nombre, descripcion, precio, stock, categoriaId);
            productoDAO.actualizar(producto);

            response.sendRedirect("producto?action=listar&mensaje=Producto actualizado exitosamente");

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Error en el formato de los datos numéricos");
            listarProductos(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Error al actualizar producto: " + e.getMessage());
            listarProductos(request, response);
        }
    }

    private void eliminarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        if (productoDAO.eliminar(id)) {
            request.setAttribute("mensaje", "Producto eliminado exitosamente");
        } else {
            request.setAttribute("error", "Error al eliminar el producto");
        }

        listarProductos(request, response);
    }
}
