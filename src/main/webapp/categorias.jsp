<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Categorías</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body class="bg-light">
<div class="container py-4">
    <div class="card shadow">
        <div class="card-header bg-success text-white">
            <div class="d-flex justify-content-between align-items-center">
                <h2 class="mb-0"><i class="bi bi-tags"></i> Gestión de Categorías</h2>
                <div>
                    <a href="index.jsp" class="btn btn-light btn-sm me-2">
                        <i class="bi bi-house"></i> Inicio
                    </a>
                    <a href="categoria?action=nuevo" class="btn btn-warning btn-sm">
                        <i class="bi bi-plus-circle"></i> Nueva Categoría
                    </a>
                </div>
            </div>
        </div>
        <div class="card-body">
            <c:if test="${not empty mensaje}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="bi bi-check-circle"></i> ${mensaje}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="bi bi-exclamation-triangle"></i> ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <div class="table-responsive">
                <table class="table table-striped table-hover align-middle">
                    <thead class="table-success">
                    <tr>
                        <th width="80">ID</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th width="200" class="text-center">Acciones</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="categoria" items="${listaCategorias}">
                        <tr>
                            <td>${categoria.id}</td>
                            <td>
                                <strong>
                                    <i class="bi bi-tag-fill text-success"></i>
                                        ${categoria.nombre}
                                </strong>
                            </td>
                            <td>${categoria.descripcion}</td>
                            <td class="text-center">
                                <a href="categoria?action=editar&id=${categoria.id}"
                                   class="btn btn-sm btn-primary me-1"
                                   title="Editar">
                                    <i class="bi bi-pencil"></i>
                                </a>
                                <a href="categoria?action=eliminar&id=${categoria.id}"
                                   class="btn btn-sm btn-danger"
                                   onclick="return confirm('¿Está seguro de eliminar esta categoría? Se eliminarán también todos sus productos asociados.')"
                                   title="Eliminar">
                                    <i class="bi bi-trash"></i>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty listaCategorias}">
                        <tr>
                            <td colspan="4" class="text-center text-muted py-4">
                                <i class="bi bi-inbox fs-1"></i>
                                <p class="mt-2">No hay categorías registradas</p>
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz4YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>