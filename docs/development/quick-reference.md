# ⚡ Guía de Referencia Rápida

**Para consulta rápida durante el desarrollo**

---

## 🔄 Flujo de Trabajo Rápido

```bash
# 1. PLANIFICAR
# Revisar docs/phases/fase-X.md

# 2. IMPLEMENTAR
# Escribir código...

# 3. DOCUMENTAR
# Actualizar documentación...

# 4. COMMIT
git add .
git commit -m "[EMOJI] [tipo]: [descripción]"
git push origin [branch]

# 5. ACTUALIZAR PROGRESO
# Actualizar porcentaje en documentación de fase
```

---

## 🎨 Emojis de Commit Más Usados

| Emoji | Código | Uso |
|-------|--------|-----|
| ✨ | `:sparkles:` | Nueva funcionalidad |
| 🐛 | `:bug:` | Corrección de bugs |
| 📚 | `:books:` | Documentación |
| 🔧 | `:wrench:` | Configuración |
| 🚧 | `:construction:` | Work in progress |
| 🎉 | `:tada:` | Fase completada |
| 🗄️ | `:file_cabinet:` | MongoDB/Base de datos |
| 🎮 | `:video_game:` | Unity/Cliente |
| 🌐 | `:globe_with_meridians:` | API/Backend |
| 💄 | `:lipstick:` | UI/Interfaz |
| 🛠️ | `:hammer_and_wrench:` | Herramientas/Scripts |
| 📦 | `:package:` | Cambios mixtos/varios |

---

## 📚 Commits de Documentación - Casos Específicos

### **📋 Tipos de Documentación**
```bash
# Actualizar documentación de fase
git commit -m "📚 docs: Actualizar progreso Fase 1 a 25%"

# Crear nueva documentación
git commit -m "📚 docs: Crear lineamientos de desarrollo"

# Documentación técnica
git commit -m "📚 docs: Documentar API de autenticación"

# Actualizar README
git commit -m "📚 docs: Actualizar tabla de progreso en README"

# Documentación de arquitectura
git commit -m "📚 docs: Agregar esquemas de base de datos"

# Guías de desarrollo
git commit -m "📚 docs: Crear guía de referencia rápida"

# Roadmap y planificación
git commit -m "📚 docs: Actualizar timeline del proyecto"

# Documentación de gameplay
git commit -m "📚 docs: Documentar mecánicas de autómatas"
```

### **🎯 Documentación por Fases**
```bash
# Fase 0 - Menú Principal
git commit -m "📚 docs: Actualizar especificaciones UI Fase 0"

# Fase 1 - Backend
git commit -m "📚 docs: Documentar endpoints de autenticación"

# Fase 2 - Terreno
git commit -m "📚 docs: Especificar sistema de cimientos"

# Fase 3 - Autómatas
git commit -m "📚 docs: Definir comportamientos de autómatas"

# Fase 4 - Programación
git commit -m "📚 docs: Documentar pseudo-lenguaje"
```

---

## 📝 Plantillas de Commit

```bash
# Nueva funcionalidad
git commit -m "✨ feat: Implementar [funcionalidad]"

# Bug fix
git commit -m "🐛 fix: Corregir [problema]"

# Documentación
git commit -m "📚 docs: Actualizar [documento]"

# Configuración
git commit -m "🔧 config: Configurar [sistema]"

# MongoDB
git commit -m "🗄️ db: [cambio en base de datos]"

# Unity
git commit -m "🎮 unity: [cambio en cliente]"

# API
git commit -m "🌐 api: [cambio en backend]"

# UI
git commit -m "💄 ui: [cambio en interfaz]"

# WIP
git commit -m "🚧 wip: [trabajo en progreso]"

# Herramientas/Scripts
git commit -m "🛠️ tool: [herramienta o script]"

# Fase completada
git commit -m "🎉 milestone: Completar Fase X"

# Cambios mixtos/varios
git commit -m "📦 varios: [descripción de cambios mixtos]"
```

### **🔗 Commits con Issues de GitHub**

```bash
# Vincular commit a issue específico
git commit -m "✨ feat: Implementar autenticación JWT (closes #15)"

# Múltiples issues
git commit -m "🐛 fix: Corregir timeout MongoDB (closes #23, #24)"

# Referencias sin cerrar
git commit -m "🚧 wip: Avance en sistema de terreno (ref #30)"

# Fix que cierra issue
git commit -m "🐛 fix: Resolver error de validación (fixes #18)"
```

---

## 🌿 Comandos de Branch

### **🎯 Crear Ramas por Tipo**

```bash
# Feature branches (funcionalidades)
git checkout -b feature/fase-1-user-auth
git checkout -b feature/fase-2-terrain-generation

# Tool branches (herramientas)
git checkout -b tool/commit-helper-v2
git checkout -b tool/deployment-scripts

# Docs branches (documentación)
git checkout -b docs/api-documentation
git checkout -b docs/development-workflow

# Config branches (configuración)
git checkout -b config/mongodb-production
git checkout -b config/docker-setup

# Bugfix branches (corrección de bugs)
git checkout -b bugfix/login-validation
git checkout -b bugfix/mongodb-timeout

# Hotfix branches (correcciones críticas)
git checkout -b hotfix/security-patch
git checkout -b hotfix/critical-auth-bug

# WIP branches (trabajo experimental)
git checkout -b wip/new-ui-concept
git checkout -b wip/experimental-ai

# Branches específicos por área
git checkout -b db/user-schema-migration
git checkout -b unity/terrain-rendering
git checkout -b api/auth-endpoints
git checkout -b ui/login-screen-redesign
git checkout -b test/integration-tests
git checkout -b security/jwt-implementation
git checkout -b perf/database-optimization
```

### **🔄 Flujo de Trabajo por Tipo**

```bash
# Feature workflow
git checkout -b feature/fase-1-auth
# ... desarrollo ...
git checkout develop
git merge feature/fase-1-auth
git branch -d feature/fase-1-auth

# Tool workflow (directo a main)
git checkout -b tool/new-script
# ... desarrollo ...
git checkout main
git merge tool/new-script
git branch -d tool/new-script

# Hotfix workflow (a main y develop)
git checkout main
git checkout -b hotfix/critical-fix
# ... corrección ...
git checkout main
git merge hotfix/critical-fix
git checkout develop
git merge hotfix/critical-fix
git branch -d hotfix/critical-fix
```

### **📋 Gestión de Ramas**

```bash
# Listar todas las ramas
git branch -a

# Cambiar a rama
git checkout [branch-name]

# Crear y cambiar
git checkout -b [tipo]/[descripcion]

# Merge a develop
git checkout develop
git merge [branch-name]

# Eliminar rama local
git branch -d [branch-name]

# Eliminar rama remota
git push origin --delete [branch-name]

# Limpiar referencias remotas
git remote prune origin

# Actualizar desde remoto
git fetch origin
```

### **🎯 Ejemplos por Fase del Proyecto**

```bash
# Fase 0 - Menú Principal
git checkout -b feature/fase-0-login-screen
git checkout -b ui/fase-0-main-menu
git checkout -b docs/fase-0-specifications

# Fase 1 - Backend
git checkout -b feature/fase-1-user-auth
git checkout -b api/fase-1-auth-endpoints
git checkout -b db/fase-1-user-schema
git checkout -b config/fase-1-mongodb

# Fase 2 - Terreno
git checkout -b feature/fase-2-terrain-system
git checkout -b unity/fase-2-terrain-rendering
git checkout -b perf/fase-2-optimization

# Fase 3 - Autómatas
git checkout -b feature/fase-3-automata-ai
git checkout -b unity/fase-3-automata-behavior
git checkout -b test/fase-3-automata-testing

# Herramientas y Mantenimiento
git checkout -b tool/commit-helper-improvements
git checkout -b docs/development-guidelines
git checkout -b config/ci-cd-pipeline
```

---

## 📊 Actualizar Progreso

### En documentación de fase:
```markdown
**Progreso:** XX% → YY% 🚧
**Horas Totales:** X → Y horas
```

### En README.md:
```markdown
| **Fase X** | Nombre | 🚧 En Desarrollo | YY% | Fecha |
```

---

## ✅ Checklist Pre-Commit

```
□ Código compila
□ Funcionalidad completa
□ Documentación actualizada
□ Progreso actualizado
□ Commit message correcto
□ Testing básico
□ Issue vinculado (si aplica)
```

---

## 🎯 Comandos Específicos del Proyecto

```bash
# Commit para MongoDB
git commit -m "🗄️ db: Crear esquema de usuarios"

# Commit para Unity
git commit -m "🎮 unity: Implementar cliente HTTP"

# Commit para ASP.NET
git commit -m "🌐 api: Crear AuthController"

# Commit para UI
git commit -m "💄 ui: Diseñar pantalla de login"

# Commit de configuración
git commit -m "🔧 config: Configurar conexión MongoDB"

# Commit de documentación
git commit -m "📚 docs: Actualizar Fase 1"

# Commit de herramientas
git commit -m "🛠️ tool: Crear script de commit helper"

# Commit con cambios mixtos
git commit -m "📦 varios: Actualizar docs y corregir bugs menores"

# Commit con issue vinculado
git commit -m "✨ feat: Sistema de autenticación (closes #12)"
```

---

## 🚀 Release y Tags

```bash
# Crear tag
git tag -a v0.1.0-alpha -m "🎉 Primera versión jugable"

# Push tags
git push origin --tags

# Ver tags
git tag -l
```

---

## **📋 Comandos del Proyecto**

### **Commits Automatizados**

#### **🪟 Windows (PowerShell)**
```powershell
# Ejecutar helper de commits
.\commit.ps1

# Con alias (después de configurar)
ac
```

#### **🐧 Linux/macOS (Bash)**
```bash
# Ejecutar helper de commits
./commit.sh

# Hacer ejecutable (primera vez)
chmod +x commit.sh

# Con alias (después de configurar)
alias ac='./commit.sh'
```

### **🔗 Funcionalidades de los Scripts**

- ✅ **17 tipos de commit** con emojis
- ✅ **Gestión de ramas** interactiva
- ✅ **Validación automática** de Git
- ✅ **Vinculación con issues** de GitHub
- ✅ **Verificación automática** del estado de issues
- ✅ **Push automático** opcional
- ✅ **Colores y formato** mejorado
- ✅ **Compatibilidad** Windows/Linux

### **📝 Ejemplo de Uso con Issues**

```bash
# El script preguntará:
# "¿Quieres vincular este commit a un issue de GitHub? (opcional)"
# "Numero de issue (presiona Enter para omitir): 15"

# Resultado:
# ":sparkles: feat: Implementar autenticación JWT (closes #15)"

# Después del push exitoso:
# "Verificando estado del issue en GitHub..."
# "Esperando 5 segundos para que GitHub procese el commit..."
# "Consultando issue #15 en usuario/repositorio..."
# 
# === ESTADO DEL ISSUE #15 ===
# Titulo: Implementar sistema de autenticación
# Estado: CLOSED
# Creado: 2025-01-15T10:30:00Z
# Cerrado: 2025-01-15T14:45:00Z
# URL: https://github.com/usuario/repositorio/issues/15
# 
# ✅ El issue fue cerrado exitosamente!
```

### **🎯 Palabras Clave para Issues**

- `closes #123` - Cierra el issue automáticamente
- `fixes #123` - Corrige y cierra el issue
- `resolves #123` - Resuelve y cierra el issue
- `ref #123` - Solo referencia sin cerrar

### **🔍 Verificación Automática de Issues**

Los scripts ahora incluyen verificación automática del estado de los issues:

- ⏱️ **Espera 5 segundos** después del push para que GitHub procese
- 🌐 **Consulta la API** de GitHub automáticamente
- 📊 **Muestra información completa** del issue (título, estado, fechas, URL)
- ✅ **Confirma si fue cerrado** o si aún está pendiente
- ⚠️ **Manejo de errores** si no se puede verificar

### **📋 Información Mostrada del Issue**

```
=== ESTADO DEL ISSUE #123 ===
Titulo: [Título del issue]
Estado: OPEN/CLOSED
Creado: [Fecha de creación]
Cerrado: [Fecha de cierre si aplica]
URL: [Enlace directo al issue]

✅ El issue fue cerrado exitosamente!
⏳ El issue aun esta abierto. Puede tardar unos minutos...
```

---

**Referencia completa:** [📋 Filosofía de Desarrollo](philosophy.md)