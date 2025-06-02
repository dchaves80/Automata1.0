# 🛠️ Scripts de Desarrollo

Scripts útiles para automatizar tareas comunes del proyecto Automata Factory.

---

## 🎯 Commit Helper (`commit-helper.ps1`)

Script interactivo de PowerShell que guía paso a paso para hacer commits siguiendo las convenciones del proyecto.

**📍 Ubicación:** Raíz del proyecto (`commit-helper.ps1`)

### **🚀 Características**

- ✅ **Validación automática** de repositorio Git y cambios pendientes
- 🎨 **16 tipos de commit** con emojis predefinidos
- 🌿 **Gestión de ramas** - cambio automático o creación de nuevas ramas
- 📋 **Vista previa** del commit antes de confirmar
- 📤 **Push automático** opcional después del commit
- 🎯 **Sugerencias** de próximos pasos

### **📋 Tipos de Commit Disponibles**

| # | Emoji | Tipo | Descripción |
|---|-------|------|-------------|
| 1 | ✨ | `feat` | Nueva funcionalidad |
| 2 | 🐛 | `fix` | Corrección de bugs |
| 3 | 📚 | `docs` | Documentación |
| 4 | 🔧 | `config` | Configuración |
| 5 | 🚧 | `wip` | Work in progress |
| 6 | 🎉 | `milestone` | Fase completada |
| 7 | 🗄️ | `db` | MongoDB/Base de datos |
| 8 | 🎮 | `unity` | Unity/Cliente |
| 9 | 🌐 | `api` | API/Backend |
| 10 | 💄 | `ui` | UI/Interfaz |
| 11 | 🔨 | `refactor` | Refactoring |
| 12 | 🚨 | `test` | Testing |
| 13 | 🔒 | `security` | Seguridad |
| 14 | 🐎 | `perf` | Performance |
| 15 | 🚑 | `hotfix` | Hotfix crítico |
| 16 | 🛠️ | `tool` | Herramientas/Scripts |

### **🔧 Cómo Usar**

#### **Método 1: Desde la raíz del proyecto (recomendado)**
```powershell
# Ejecutar directamente desde la raíz
.\commit-helper.ps1
```

#### **Método 2: Crear alias global**
```powershell
# Agregar al perfil de PowerShell
echo 'function ac { & "$PWD\commit-helper.ps1" }' >> $PROFILE

# Recargar perfil
. $PROFILE

# Usar desde cualquier lugar del proyecto
ac
```

#### **Método 3: Desde cualquier directorio**
```powershell
# Navegar al proyecto y ejecutar
cd "C:\ruta\a\tu\proyecto\Automata"
.\commit-helper.ps1
```

### **📝 Flujo de Uso**

1. **🔍 Verificación inicial**
   - Verifica que estés en un repositorio Git
   - Detecta cambios pendientes
   - Muestra resumen de archivos modificados

2. **🎨 Selección de tipo**
   - Lista los 16 tipos de commit disponibles
   - Selecciona por número (1-16)

3. **📝 Mensaje del commit**
   - Ingresa descripción clara y concisa
   - El script construye el mensaje completo con emoji

4. **🌿 Gestión de ramas**
   - Muestra rama actual y ramas disponibles
   - Permite cambiar de rama o crear nueva
   - Cambio automático si es necesario

5. **📋 Confirmación**
   - Muestra resumen completo del commit
   - Confirmación antes de ejecutar

6. **🚀 Ejecución**
   - Ejecuta `git add .` y `git commit`
   - Opción de hacer push automático
   - Sugerencias de próximos pasos

### **💡 Ejemplos de Uso**

#### **Ejemplo 1: Documentación**
```
🎨 Selecciona el tipo de commit:
  3. 📚 Documentación

📝 Ingresa el mensaje del commit:
Mensaje: Actualizar lineamientos de desarrollo

📋 Mensaje del commit:
   📚 docs: Actualizar lineamientos de desarrollo
```

#### **Ejemplo 2: Nueva funcionalidad**
```
🎨 Selecciona el tipo de commit:
  1. ✨ Nueva funcionalidad

📝 Ingresa el mensaje del commit:
Mensaje: Implementar sistema de autenticación JWT

🌿 Ramas disponibles:
   Rama actual: main
   
🎯 ¿A qué rama quieres hacer commit?
Rama destino: feature/fase-1-auth

📋 Mensaje del commit:
   ✨ feat: Implementar sistema de autenticación JWT
```

#### **Ejemplo 3: Herramientas/Scripts**
```
🎨 Selecciona el tipo de commit:
  16. 🛠️ Herramientas/Scripts

📝 Ingresa el mensaje del commit:
Mensaje: Crear script interactivo para commits

📋 Mensaje del commit:
   🛠️ tool: Crear script interactivo para commits
```

### **⚠️ Requisitos**

- **PowerShell 5.0+** (incluido en Windows 10/11)
- **Git** instalado y configurado
- Estar en la **raíz del proyecto** Automata Factory

### **🔧 Configuración Opcional**

#### **Crear alias permanente**
```powershell
# Editar perfil de PowerShell
notepad $PROFILE

# Agregar esta línea al archivo:
function ac { & "C:\ruta\completa\a\Automata\scripts\commit-helper.ps1" }

# Guardar y recargar
. $PROFILE

# Ahora puedes usar 'ac' desde cualquier lugar
ac
```

### **🎯 Ventajas del Script**

- ✅ **Consistencia** - Todos los commits siguen las convenciones
- ⚡ **Rapidez** - Proceso guiado sin memorizar comandos
- 🛡️ **Seguridad** - Validaciones antes de ejecutar
- 📊 **Trazabilidad** - Commits bien estructurados y categorizados
- 🎨 **Visual** - Interfaz colorida y clara

### **🐛 Solución de Problemas**

#### **Error: "No se puede ejecutar scripts"**
```powershell
# Cambiar política de ejecución (una sola vez)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### **Error: "No estás en un repositorio Git"**
```powershell
# Verificar que estás en la raíz del proyecto
pwd
# Debe mostrar la carpeta Automata con .git

# Si no, navegar al proyecto
cd "C:\ruta\a\tu\proyecto\Automata"
```

#### **Error: "No hay cambios para commitear"**
```powershell
# Verificar estado
git status

# Agregar cambios si es necesario
git add .
```

---

**Creado:** Enero 2025  
**Versión:** 1.0  
**Compatibilidad:** PowerShell 5.0+, Git 2.0+ 