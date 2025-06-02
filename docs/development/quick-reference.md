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
```

---

## 🌿 Comandos de Branch

```bash
# Crear nueva feature branch
git checkout -b feature/fase-X-descripcion

# Cambiar a branch
git checkout [branch-name]

# Merge a develop
git checkout develop
git merge feature/fase-X-descripcion

# Eliminar branch local
git branch -d feature/fase-X-descripcion

# Eliminar branch remoto
git push origin --delete feature/fase-X-descripcion
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
```powershell
# Ejecutar helper de commits (desde la raíz)
.\commit.ps1

# Con alias (después de configurar)
ac
```

---

**Referencia completa:** [📋 Filosofía de Desarrollo](philosophy.md)