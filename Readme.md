# Laboratorio Terraform + Docker

Implementación progresiva de dos entornos independientes, DEV y QA,
administrados con Terraform y el provider kreuzwerker/docker.

Cada entorno tendrá un frontend Nginx, un backend Node.js y una base
de datos PostgreSQL.

## Arquitectura prevista

Flujo: Frontend → Backend → PostgreSQL.

| Entorno | Contenedor | Tecnología | Puerto local → contenedor |
|---------|------------|------------|---------------------------|
| DEV | web-dev | Nginx | 4001 → 80 |
| DEV | api-dev | Node.js | 4002 → 3000 |
| DEV | bd-dev | PostgreSQL | 4003 → 5432 |
| QA | web-qa | Nginx | 5001 → 80 |
| QA | api-qa | Node.js | 5002 → 3000 |
| QA | bd-qa | PostgreSQL | 5003 → 5432 |

## Estado

Repositorio inicial. La infraestructura todavía no está implementada.

Las instrucciones de instalación, ejecución y limpieza se incorporarán
conforme se validen durante el laboratorio.