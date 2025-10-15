<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${producto != null ? 'Editar' : 'Nuevo'} Producto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body class="bg-light">
<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <h2 class="mb-0">
                        <i class="bi bi-${producto != null ? 'pencil-square' : 'plus-circle'}"></i>
                        ${producto != null ? 'Editar' : 'Nuevo'} Producto
                    </h2>
                </div>
                <div class="card-body">
                    <form action="producto" method="post">
                        <c:if test="${producto != null}">
                            <input type="hidden" name="action" value="actualizar">
                            <input type="hidden" name="id" value="${producto.id}">
                        </c:if>
                        <c:if test="${producto == null}">
                            <input type="hidden" name="action" value="insertar">
                        </c:if>

                        <div class="mb-3">
                            <label for="nombre" class="form-label fw-bold">
                                <i class="bi bi-tag"></i> Nombre del Producto *
                            </label>
                            <input type="text"
                                   class="form-control"
                                   id="nombre"
                                   name="nombre"
                                   value="${producto.nombre}"
                                   placeholder="Ej: Laptop HP"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label for="descripcion" class="form-label fw-bold">
                                <i class="bi bi-card-text"></i> Descripción *
                            </label>
                            <textarea class="form-control"
                                      id="descripcion"
                                      name="descripcion"
                                      rows="3"
                                      placeholder="Describe el producto..."
                                      required>${producto.descripcion}</textarea>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="precio" class="form-label fw-bold">
                                    <i class="bi bi-currency-dollar"></i> Precio (S/.) *
                                </label>
                                <input type="number"
                                       class="form-control"
                                       id="precio"
                                       name="precio"
                                       value="${producto.precio}"
                                       step="0.01"
                                       min="0"
                                       placeholder="0.00"
                                       required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label for="stock" class="form-label fw-bold">
                                    <i class="bi bi-box"></i> Stock *
                                </label>
                                <input type="number"
                                       class="form-control"
                                       id="stock"
                                       name="stock"
                                       value="${producto.stock}"
                                       min="0"
                                       placeholder="0"
                                       required>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="categoria_id" class="form-label fw-bold">
                                <i class="bi bi-tags"></i> Categoría *
                            </label>
                            <select class="form-select" id="categoria_id" name="categoria_id" required>
                                <option value="">Seleccione una categoría</option>
                                <c:forEach var="categoria" items="${listaCategorias}">
                                    <option value="${categoria.id}"
                                        ${producto.categoriaId == categoria.id ? 'selected' : ''}>
                                            ${categoria.nombre}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-success flex-fill">
                                <i class="bi bi-save"></i> Guardar
                            </button>
                            <a href="producto?action=listar" class="btn btn-secondary flex-fill">
                                <i class="bi bi-x-circle"></i> Cancelar
                            </a>
                        </div>

                        <small class="text-muted d-block mt-3">
                            <i class="bi bi-info-circle"></i> Los campos marcados con * son obligatorios
                        </small>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz4YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>