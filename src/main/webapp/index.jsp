<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Gestión - Menú Principal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="text-center mb-5">
        <h1 class="display-4 fw-bold text-primary">
            <i class="bi bi-shop"></i> Sistema de Gestión
        </h1>
        <p class="lead text-muted">Gestiona productos y categorías de forma eficiente</p>
        <hr class="my-4">
    </div>

    <div class="row g-4 justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-lg h-100 border-0">
                <div class="card-body text-center p-5">
                    <div class="mb-4">
                        <i class="bi bi-box-seam display-1 text-primary"></i>
                    </div>
                    <h3 class="card-title mb-3 fw-bold">Productos</h3>
                    <p class="card-text text-muted mb-4">
                        Administra el catálogo completo de productos del sistema
                    </p>
                    <a href="producto?action=listar" class="btn btn-primary btn-lg w-100">
                        <i class="bi bi-arrow-right-circle me-2"></i>Gestionar Productos
                    </a>
                </div>
            </div>
        </div>

        <div class="col-md-5">
            <div class="card shadow-lg h-100 border-0">
                <div class="card-body text-center p-5">
                    <div class="mb-4">
                        <i class="bi bi-tags display-1 text-success"></i>
                    </div>
                    <h3 class="card-title mb-3 fw-bold">Categorías</h3>
                    <p class="card-text text-muted mb-4">
                        Organiza y clasifica productos por categorías
                    </p>
                    <a href="categoria?action=listar" class="btn btn-success btn-lg w-100">
                        <i class="bi bi-arrow-right-circle me-2"></i>Gestionar Categorías
                    </a>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-5 text-center">
        <div class="card bg-info bg-opacity-10 border-info">
            <div class="card-body">
                <p class="mb-0 text-dark">
                    <i class="bi bi-info-circle me-2"></i>
                    <strong>Sistema desarrollado con:</strong> JSP + Servlet + MVC + JSTL + Bootstrap 5
                </p>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz4YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>