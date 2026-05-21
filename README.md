# Legacy Billing - Arquitectura IaC y CI/CD

Este repositorio contiene la infraestructura y el pipeline de despliegue automatizado para el módulo de Facturación y Finanzas (Legacy).

## Validación en Vivo (URL de la Aplicación)
La aplicación se encuentra desplegada y funcionando en la siguiente dirección:
**http://100.54.108.164:3000**

## Arquitectura CI/CD implementada

La solución utiliza principios de GitOps para automatizar todo el ciclo de vida de la aplicación:

1. **Integración Continua (CI):** GitHub Actions ejecuta automáticamente las pruebas unitarias (Jest) cada vez que se hace un push o pull request a la rama `develop`.
2. **Infraestructura como Código (IaC):** Utilización de Terraform de forma modular (red y cómputo) para provisionar una instancia EC2 con Amazon Linux 2023. El estado de Terraform se guarda de forma segura en un backend de **AWS S3**.
3. **Despliegue Continuo (CD):** Al hacer un merge a la rama `main`, GitHub Actions asume las credenciales de AWS y ejecuta `terraform apply` de forma automatizada, provisionando la infraestructura y ejecutando el script `user_data` que instala Node.js e inicia el servicio en segundo plano.
4. **Seguridad Integrada:** El Security Group restringe el acceso al puerto 3000 y 22 (SSH) únicamente a una IP específica (/32), cumpliendo con las mejores prácticas de endurecimiento de red.