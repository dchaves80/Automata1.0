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

### **🔧 Tipos de Commit Técnicos**

| Tipo de Cambio | Emoji | Código | Ejemplo |
|----------------|-------|--------|---------|
| **Dependencias** | ➕ | `:heavy_plus_sign:` | `➕ Agregar paquete JWT para ASP.NET` |
| **Eliminar dependencias** | ➖ | `:heavy_minus_sign:` | `➖ Remover librería obsoleta` |
| **Docker** | 🐳 | `:whale:` | `🐳 Configurar contenedor MongoDB` |
| **CI/CD** | 💚 | `:green_heart:` | `💚 Configurar pipeline de deployment` |
| **Hotfix crítico** | 🚑 | `:ambulance:` | `🚑 Corregir fallo crítico en autenticación` |
| **Deploy** | 🚀 | `:rocket:` | `🚀 Deploy versión 0.1 a producción` |

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

---

## 🏗️ Estructura de Branches

### **🌿 Estrategia de Branching**

```
main (producción)
├── develop (desarrollo principal)
├── feature/fase-0-menu-principal
├── feature/fase-1-backend-auth
├── feature/fase-1-mongodb-integration
├── hotfix/critical-auth-bug
└── release/v0.1-alpha
```

### **📋 Convenciones de Nombres**

| Tipo | Formato | Ejemplo |
|------|---------|---------|
| **Feature** | `feature/fase-X-descripcion` | `feature/fase-1-backend-auth` |
| **Bugfix** | `bugfix/descripcion-corta` | `bugfix/mongodb-connection` |
| **Hotfix** | `hotfix/descripcion-critica` | `hotfix/auth-security-flaw` |
| **Release** | `release/vX.Y-nombre` | `release/v0.1-alpha` |
| **Docs** | `docs/tipo-documentacion` | `docs/development-guidelines` |

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