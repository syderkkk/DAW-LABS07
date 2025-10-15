<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${categoria != null ? 'Editar' : 'Nueva'} Categoría</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body class="bg-light">
<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-header bg-success text-white">
                    <h2 class="mb-0">
                        <i class="bi bi-${categoria != null ? 'pencil-square' : 'plus-circle'}"></i>
                        ${categoria != null ? 'Editar' : 'Nueva'} Categoría
                    </h2>
                </div>
                <div class="card-body">
                    <form action="categoria" method="post">
                        <c:if test="${categoria != null}">
                            <input type="hidden" name="action" value="actualizar">
                            <input type="hidden" name="id" value="${categoria.id}">
                        </c:if>
                        <c:if test="${categoria == null}">
                            <input type="hidden" name="action" value="insertar">
                        </c:if>

                        <div class="mb-3">
                            <label for="nombre" class="form-label fw-bold">
                                <i class="bi bi-tag"></i> Nombre de la Categoría *
                            </label>
                            <input type="text"
                                   class="form-control form-control-lg"
                                   id="nombre"
                                   name="nombre"
                                   value="${categoria.nombre}"
                                   placeholder="Ej: Electrónica, Ropa, Alimentos"
                                   required>
                            <small class="text-muted">
                                Ingrese un nombre descriptivo para la categoría
                            </small>
                        </div>

                        <div class="mb-4">
                            <label for="descripcion" class="form-label fw-bold">
                                <i class="bi bi-card-text"></i> Descripción *
                            </label>
                            <textarea class="form-control"
                                      id="descripcion"
                                      name="descripcion"
                                      rows="4"
                                      placeholder="Describe la categoría y qué tipo de productos incluye..."
                                      required>${categoria.descripcion}</textarea>
                            <small class="text-muted">
                                Proporcione una descripción clara de la categoría
                            </small>
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-success btn-lg flex-fill">
                                <i class="bi bi-save"></i> Guardar Categoría
                            </button>
                            <a href="categoria?action=listar" class="btn btn-secondary btn-lg flex-fill">
                                <i class="bi bi-x-circle"></i> Cancelar
                            </a>
                        </div>

                        <div class="alert alert-info mt-4 mb-0">
                            <i class="bi bi-info-circle"></i>
                            <strong>Nota:</strong> Los campos marcados con * son obligatorios
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz4YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>