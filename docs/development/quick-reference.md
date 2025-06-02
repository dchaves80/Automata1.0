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

**Referencia completa:** [📋 Filosofía de Desarrollo](philosophy.md) 