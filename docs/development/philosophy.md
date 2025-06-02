# 🎯 Filosofía y Lineamientos de Desarrollo

**Proyecto:** Automata Factory Game  
**Versión:** 1.0  
**Fecha:** Enero 2025  

---

## 🧠 Filosofía de Desarrollo

### **🎯 Principios Fundamentales**

#### **📚 Documentación Primero**
- **Toda funcionalidad debe estar documentada** antes de ser implementada
- **Actualizar documentación** es tan importante como escribir código
- **Documentación viva** - mantener sincronizada con el código

#### **🔄 Desarrollo Iterativo y Progresivo**
- **Fases bien definidas** con objetivos claros
- **Progreso medible** en cada commit
- **Funcionalidades completas** antes de pasar a la siguiente fase

#### **🎨 Calidad sobre Velocidad**
- **Código limpio y mantenible** desde el primer día
- **Testing** integrado en el proceso de desarrollo
- **Refactoring** constante para mejorar la arquitectura

#### **🌐 Preparación para el Futuro**
- **Arquitectura escalable** desde el inicio
- **APIs extensibles** para futuras funcionalidades
- **Base sólida** para crecimiento del proyecto

### **🛠️ Herramientas de Desarrollo**

#### **Script de Commits (`commit.ps1` / `commit.sh`)**
- **Ubicación:** Raíz del proyecto
- **Propósito:** Automatizar commits siguiendo convenciones
- **Uso Windows:** `.\commit.ps1`
- **Uso Linux/macOS:** `./commit.sh`
- **Ventajas:** 
  - Consistencia en mensajes de commit
  - Validación automática
  - Gestión de ramas integrada
  - **Vinculación automática con issues de GitHub**
  - **Verificación automática del estado de issues**
  - Compatible con cualquier configuración de PowerShell/Bash
  - Soporte multiplataforma (Windows/Linux/macOS)
  - Feedback inmediato sobre el cierre de issues

---

## 🔄 Flujo de Trabajo de Desarrollo

### **📋 Proceso Estándar para Cada Feature**

```
1. 📖 PLANIFICAR
   ├── Revisar documentación de la fase
   ├── Definir objetivos específicos
   ├── Identificar dependencias
   └── Estimar tiempo y complejidad

2. 🔧 IMPLEMENTAR
   ├── Crear/modificar código
   ├── Seguir convenciones establecidas
   ├── Implementar funcionalidad completa
   └── Realizar testing básico

3. 📚 DOCUMENTAR
   ├── Actualizar documentación técnica
   ├── Comentar código complejo
   ├── Actualizar README si es necesario
   └── Documentar cambios en la fase

4. 🧪 VALIDAR
   ├── Testing funcional
   ├── Verificar que no rompe funcionalidades existentes
   ├── Validar contra objetivos de la fase
   └── Review de código propio

5. 📝 COMMIT
   ├── git add (archivos específicos)
   ├── Commit con emoji y mensaje descriptivo
   ├── Push al repositorio
   └── Actualizar progreso en documentación
```

---

## 🎨 Convenciones de Commits con Emojis

### **📊 Tipos de Commit Principales**

| Tipo de Cambio | Emoji | Código | Ejemplo |
|----------------|-------|--------|---------|
| **Nueva funcionalidad** | ✨ | `:sparkles:` | `✨ Implementar sistema de autenticación JWT` |
| **Corrección de bugs** | 🐛 | `:bug:` | `🐛 Corregir error de conexión a MongoDB` |
| **Documentación** | 📚 | `:books:` | `📚 Actualizar documentación de Fase 1` |
| **Configuración** | 🔧 | `:wrench:` | `🔧 Configurar conexión a base de datos` |
| **Trabajo en progreso** | 🚧 | `:construction:` | `🚧 WIP: Implementando controlador de usuarios` |
| **Refactoring** | 🔨 | `:hammer:` | `🔨 Refactorizar estructura de modelos` |
| **Performance** | 🐎 | `:racehorse:` | `🐎 Optimizar consultas a MongoDB` |
| **Testing** | 🚨 | `:rotating_light:` | `🚨 Agregar tests para AuthController` |
| **Seguridad** | 🔒 | `:lock:` | `🔒 Implementar validación de JWT tokens` |
| **Cambios mixtos/varios** | 📦 | `:package:` | `📦 Actualizar docs y corregir bugs menores` |

### **🏗️ Tipos de Commit Específicos del Proyecto**

| Tipo de Cambio | Emoji | Código | Ejemplo |
|----------------|-------|--------|---------|
| **Fase completada** | 🎉 | `:tada:` | `🎉 Completar Fase 1: Servidor Backend` |
| **MongoDB/Base de datos** | 🗄️ | `:file_cabinet:` | `🗄️ Crear esquemas de usuario en MongoDB` |
| **Unity/Cliente** | 🎮 | `:video_game:` | `🎮 Implementar cliente HTTP en Unity` |
| **API/Backend** | 🌐 | `:globe_with_meridians:` | `🌐 Crear endpoints de autenticación` |
| **UI/Interfaz** | 💄 | `:lipstick:` | `💄 Diseñar pantalla de login` |
| **Autómatas** | 🤖 | `:robot:` | `🤖 Implementar lógica básica de autómatas` |
| **Materiales** | 📦 | `:package:` | `📦 Agregar sistema de materiales` |
| **Marketplace** | 🏪 | `:convenience_store:` | `🏪 Implementar intercambio entre usuarios` |
| **Herramientas/Scripts** | 🛠️ | `:hammer_and_wrench:` | `🛠️ Mejorar script de commits` |

### **🔧 Tipos de Commit Técnicos**

| Tipo de Cambio | Emoji | Código | Ejemplo |
|----------------|-------|--------|---------|
| **Dependencias** | ➕ | `:heavy_plus_sign:` | `➕ Agregar paquete JWT para ASP.NET` |
| **Eliminar dependencias** | ➖ | `:heavy_minus_sign:` | `➖ Remover librería obsoleta` |
| **Docker** | 🐳 | `:whale:` | `🐳 Configurar contenedor MongoDB` |
| **CI/CD** | 💚 | `:green_heart:` | `💚 Configurar pipeline de deployment` |
| **Hotfix crítico** | 🚑 | `:ambulance:` | `🚑 Corregir fallo crítico en autenticación` |
| **Deploy** | 🚀 | `:rocket:` | `🚀 Deploy versión 0.1 a producción` |
| **Cambios mixtos/varios** | 📦 | `:package:` | `📦 Actualizar dependencias y documentación` |

---

## 📝 Formato de Mensajes de Commit

### **🎯 Estructura Estándar**
```
[EMOJI] [TIPO]: [DESCRIPCIÓN BREVE]

[DESCRIPCIÓN DETALLADA OPCIONAL]

[REFERENCIAS A ISSUES/FASES]
```

### **✅ Ejemplos Correctos**
```bash
# Nueva funcionalidad
✨ feat: Implementar sistema de registro de usuarios

Agregar endpoint POST /api/auth/register con validación de email
y encriptación de contraseñas usando BCrypt.

Fase 1 - Progreso: 25%

# Corrección de bug
🐛 fix: Corregir error de timeout en conexión MongoDB

El timeout por defecto era muy bajo para el VPS.
Aumentado a 30 segundos.

# Documentación
📚 docs: Actualizar lineamientos de desarrollo

Agregar convenciones de commits con emojis y flujo de trabajo
estándar para el equipo.

# Configuración
🔧 config: Configurar variables de entorno para producción

Agregar configuración para MongoDB en puerto 27020
y JWT secret key.

# Cambios mixtos/varios
📦 varios: Actualizar documentación y corregir bugs menores

- Actualizar README con nuevas instrucciones
- Corregir typos en comentarios del código
- Ajustar configuración de desarrollo

# Commit con issue vinculado
✨ feat: Implementar autenticación JWT (closes #15)

Sistema completo de autenticación con tokens JWT,
validación de usuarios y middleware de autorización.

Fase 1 - Progreso: 40%
```

### **❌ Ejemplos Incorrectos**
```bash
# Muy vago
fix stuff

# Sin emoji
Add user registration

# Muy largo en el título
✨ Implementar todo el sistema completo de autenticación con JWT, validación de email, encriptación de contraseñas y recuperación de contraseña
```

### **🔗 Vinculación con Issues de GitHub**

#### **📋 Palabras Clave Soportadas**
- `closes #123` - Cierra el issue automáticamente al hacer merge
- `fixes #123` - Corrige y cierra el issue
- `resolves #123` - Resuelve y cierra el issue  
- `ref #123` - Solo referencia sin cerrar

#### **🎯 Ejemplos de Uso**
```bash
# Cerrar issue específico
git commit -m "🐛 fix: Corregir validación de email (closes #23)"

# Múltiples issues
git commit -m "✨ feat: Sistema de autenticación (closes #15, #16)"

# Solo referencia
git commit -m "🚧 wip: Avance en terreno (ref #30)"

# Diferentes palabras clave
git commit -m "🔒 security: Implementar JWT (fixes #18)"
git commit -m "🐎 perf: Optimizar consultas (resolves #25)"
```

#### **🔄 Flujo con Issues**
1. **Crear issue** en GitHub describiendo la tarea
2. **Crear rama** relacionada: `feature/issue-15-auth-system`
3. **Desarrollar** la funcionalidad
4. **Commit** con referencia: `(closes #15)`
5. **Push** y crear Pull Request
6. **Merge** cierra automáticamente el issue

---

## 🏗️ Estructura de Branches

### **🌿 Estrategia de Branching**

```
main (producción)
├── develop (desarrollo principal)
├── feature/fase-1-backend-auth
├── feature/fase-2-terrain-system
├── tool/commit-helper-improvements
├── docs/development-guidelines
├── bugfix/mongodb-connection-timeout
├── hotfix/critical-auth-vulnerability
├── config/mongodb-production-setup
├── wip/experimental-automata-ai
└── release/v0.1-alpha
```

### **📋 Tipos de Ramas y Convenciones**

| Tipo | Prefijo | Uso | Ejemplo |
|------|---------|-----|---------|
| **Feature** | `feature/` | Nuevas funcionalidades | `feature/fase-1-user-auth` |
| **Tool** | `tool/` | Herramientas y scripts | `tool/commit-helper-v2` |
| **Docs** | `docs/` | Documentación | `docs/api-documentation` |
| **Config** | `config/` | Configuración | `config/docker-setup` |
| **Bugfix** | `bugfix/` | Corrección de bugs | `bugfix/login-validation` |
| **Hotfix** | `hotfix/` | Correcciones críticas | `hotfix/security-patch` |
| **WIP** | `wip/` | Trabajo experimental | `wip/new-ui-concept` |
| **DB** | `db/` | Base de datos | `db/user-schema-migration` |
| **Unity** | `unity/` | Cliente Unity | `unity/terrain-rendering` |
| **API** | `api/` | Backend/API | `api/auth-endpoints` |
| **UI** | `ui/` | Interfaz de usuario | `ui/login-screen-redesign` |
| **Test** | `test/` | Testing | `test/integration-tests` |
| **Security** | `security/` | Seguridad | `security/jwt-implementation` |
| **Perf** | `perf/` | Performance | `perf/database-optimization` |
| **Release** | `release/` | Preparación de releases | `release/v0.2-beta` |

### **🎯 Convenciones de Nomenclatura**

#### **📝 Formato General**
```
[tipo]/[fase-opcional]-[descripcion-corta]
```

#### **✅ Ejemplos Correctos por Fase**

**Fase 0 - Menú Principal:**
```bash
feature/fase-0-login-screen
ui/fase-0-main-menu-design
docs/fase-0-ui-specifications
```

**Fase 1 - Backend:**
```bash
feature/fase-1-user-authentication
api/fase-1-auth-endpoints
db/fase-1-user-schema
config/fase-1-mongodb-setup
```

**Fase 2 - Terreno:**
```bash
feature/fase-2-terrain-generation
unity/fase-2-terrain-rendering
perf/fase-2-chunk-optimization
```

**Fase 3 - Autómatas:**
```bash
feature/fase-3-automata-behavior
unity/fase-3-automata-ai
test/fase-3-automata-testing
```

**Herramientas y Mantenimiento:**
```bash
tool/commit-helper-improvements
tool/deployment-scripts
docs/development-workflow
config/ci-cd-pipeline
```

#### **❌ Ejemplos Incorrectos**
```bash
# Muy genérico
feature/auth
fix/bug

# Sin tipo
user-authentication
terrain-system

# Muy largo
feature/fase-1-implementar-sistema-completo-de-autenticacion-con-jwt-y-validacion

# Espacios o caracteres especiales
feature/fase 1 auth
feature/fase-1_auth!
```

### **🔄 Flujo de Trabajo por Tipo de Rama**

#### **🚀 Feature Branches**
```bash
# Crear feature branch
git checkout -b feature/fase-1-user-auth

# Desarrollo...
git commit -m ":sparkles: feat: Implementar registro de usuarios"

# Merge a develop
git checkout develop
git merge feature/fase-1-user-auth
```

#### **🛠️ Tool Branches**
```bash
# Crear tool branch
git checkout -b tool/commit-helper-v2

# Desarrollo...
git commit -m ":hammer_and_wrench: tool: Mejorar gestión de ramas"

# Merge directo a main (herramientas)
git checkout main
git merge tool/commit-helper-v2
```

#### **🐛 Bugfix Branches**
```bash
# Crear bugfix branch
git checkout -b bugfix/mongodb-timeout

# Corrección...
git commit -m ":bug: fix: Aumentar timeout de MongoDB"

# Merge a develop
git checkout develop
git merge bugfix/mongodb-timeout
```

#### **🚑 Hotfix Branches**
```bash
# Crear hotfix desde main
git checkout main
git checkout -b hotfix/critical-security

# Corrección crítica...
git commit -m ":ambulance: hotfix: Parche de seguridad crítico"

# Merge a main Y develop
git checkout main
git merge hotfix/critical-security
git checkout develop
git merge hotfix/critical-security
```

### **📊 Mapeo Rama-Commit**

| Tipo de Rama | Emoji de Commit | Tipo de Commit | Ejemplo |
|--------------|-----------------|----------------|---------|
| `feature/` | `:sparkles:` | `feat` | `:sparkles: feat: Nueva funcionalidad` |
| `tool/` | `:hammer_and_wrench:` | `tool` | `:hammer_and_wrench: tool: Mejorar script` |
| `docs/` | `:books:` | `docs` | `:books: docs: Actualizar documentación` |
| `config/` | `:wrench:` | `config` | `:wrench: config: Configurar MongoDB` |
| `bugfix/` | `:bug:` | `fix` | `:bug: fix: Corregir validación` |
| `hotfix/` | `:ambulance:` | `hotfix` | `:ambulance: hotfix: Parche crítico` |
| `wip/` | `:construction:` | `wip` | `:construction: wip: Experimento en progreso` |
| `db/` | `:file_cabinet:` | `db` | `:file_cabinet: db: Migración de esquema` |
| `unity/` | `:video_game:` | `unity` | `:video_game: unity: Renderizado de terreno` |
| `api/` | `:globe_with_meridians:` | `api` | `:globe_with_meridians: api: Endpoints de auth` |
| `ui/` | `:lipstick:` | `ui` | `:lipstick: ui: Rediseñar pantalla login` |
| `test/` | `:rotating_light:` | `test` | `:rotating_light: test: Tests de integración` |
| `security/` | `:lock:` | `security` | `:lock: security: Implementar JWT` |
| `perf/` | `:racehorse:` | `perf` | `:racehorse: perf: Optimizar consultas` |

### **🎯 Reglas de Merge**

#### **📋 Destinos de Merge por Tipo**

| Tipo de Rama | Merge a | Justificación |
|--------------|---------|---------------|
| `feature/` | `develop` | Funcionalidades van a desarrollo |
| `tool/` | `main` | Herramientas van directo a producción |
| `docs/` | `main` | Documentación va directo |
| `config/` | `develop` | Configuración necesita testing |
| `bugfix/` | `develop` | Bugs van a desarrollo primero |
| `hotfix/` | `main` + `develop` | Críticos van a ambos |
| `wip/` | No merge | Solo experimentación |
| `test/` | `develop` | Tests van a desarrollo |
| `security/` | `develop` | Seguridad necesita testing |
| `perf/` | `develop` | Performance necesita validación |

### **🏷️ Etiquetado y Limpieza**

#### **🧹 Limpieza de Ramas**
```bash
# Después del merge exitoso
git branch -d feature/fase-1-user-auth

# Eliminar rama remota
git push origin --delete feature/fase-1-user-auth

# Limpiar referencias remotas obsoletas
git remote prune origin
```

#### **🏷️ Tags por Fase**
```bash
# Al completar una fase
git tag -a fase-1-complete -m "🎉 Fase 1: Backend completado"

# Al hacer release
git tag -a v0.1.0-alpha -m "🚀 Primera versión jugable"
```

---

## 📊 Seguimiento de Progreso

### **🎯 Actualización de Progreso por Commit**

Cada commit significativo debe actualizar:

1. **📈 Porcentaje de progreso** en la documentación de la fase
2. **✅ Estado de tareas** en el plan de implementación
3. **📅 Fechas estimadas** si hay cambios significativos
4. **🏆 Hitos completados** cuando corresponda

### **📝 Formato de Actualización**
```markdown
## Progreso Actual
- **Commit:** abc123f
- **Fecha:** 2025-01-XX
- **Progreso:** XX% → YY%
- **Completado:** [Descripción de lo implementado]
- **Siguiente:** [Próxima tarea a realizar]
```

---

## 🧪 Estándares de Calidad

### **✅ Checklist Pre-Commit**

```
□ Código compila sin errores
□ Funcionalidad implementada completamente
□ Documentación actualizada
□ Comentarios agregados donde es necesario
□ Testing básico realizado
□ No rompe funcionalidades existentes
□ Sigue convenciones de naming
□ Commit message con emoji y formato correcto
```

### **🎯 Criterios de Aceptación**

#### **📝 Para Código**
- **Legibilidad:** Código auto-documentado
- **Mantenibilidad:** Fácil de modificar y extender
- **Consistencia:** Sigue patrones establecidos
- **Performance:** Optimizado para el contexto

#### **📚 Para Documentación**
- **Actualizada:** Sincronizada con el código
- **Completa:** Cubre todos los aspectos importantes
- **Clara:** Fácil de entender para futuros desarrolladores
- **Estructurada:** Sigue el formato establecido

---

## 🔄 Proceso de Review

### **👀 Self-Review Checklist**
```
□ ¿El código hace lo que dice que hace?
□ ¿Está bien documentado?
□ ¿Sigue las convenciones del proyecto?
□ ¿Es la solución más simple posible?
□ ¿Considera casos edge?
□ ¿Es escalable para futuras fases?
```

### **🎯 Criterios de Merge**
- ✅ Pasa todos los tests
- ✅ Documentación actualizada
- ✅ Commit message correcto
- ✅ No conflictos con main/develop
- ✅ Funcionalidad completa

---

## 🚀 Deployment y Releases

### **📦 Versionado Semántico**
```
vMAJOR.MINOR.PATCH-STAGE

Ejemplos:
- v0.1.0-alpha (Primera versión jugable)
- v0.2.0-beta (Fase 2 completada)
- v1.0.0 (Release completo)
```

### **🏷️ Tags de Release**
```bash
# Crear tag con mensaje
git tag -a v0.1.0-alpha -m "🎉 Primera versión jugable - Fases 0-1 completadas"

# Push tags
git push origin --tags
```

---

## 📋 Plantillas de Commit

### **🎯 Comandos Frecuentes**
```bash
# Nueva funcionalidad
git commit -m "✨ feat: [descripción]"

# Bug fix
git commit -m "🐛 fix: [descripción]"

# Documentación
git commit -m "📚 docs: [descripción]"

# Configuración
git commit -m "🔧 config: [descripción]"

# Work in progress
git commit -m "🚧 wip: [descripción]"

# Fase completada
git commit -m "🎉 milestone: Completar [Fase X]"

# Cambios mixtos/varios
git commit -m "📦 varios: [descripción]"
```

---

## 🎯 Objetivos de Calidad

### **📊 Métricas de Éxito**
- **📈 Progreso medible** en cada commit
- **📚 Documentación al 100%** de cobertura
- **🐛 Bugs mínimos** en producción
- **🚀 Releases estables** y predecibles
- **🔄 Desarrollo sostenible** a largo plazo

### **🏆 Metas del Proyecto**
1. **Código limpio y mantenible** desde el día 1
2. **Documentación completa** para cada fase
3. **Arquitectura escalable** para futuras expansiones
4. **Proceso de desarrollo eficiente** y predecible
5. **Base sólida** para el crecimiento del proyecto

---

**Creado:** Enero 2025  
**Última actualización:** Enero 2025  
**Versión:** 1.0  

---

**Referencias:**
- [Git Commit Emoji Guide](https://gist.github.com/parmentf/035de27d6ed1dce0b36a)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)

---

**Volver a:** [🏠 README Principal](../../README.md) | **Documentación:** [📚 Índice de Docs](../README.md) 