# ❌ Fase 4: Programación de Autómatas (NO IMPLEMENTADO)

**Estado:** ❌ NO IMPLEMENTADO  
**Duración:** Octubre - Diciembre 2025 (3 meses)  
**Horas Totales:** 0 horas  
**Progreso:** 0% ❌

---

## 🎯 Objetivos Principales

La **Fase 4** implementará el **sistema de programación de autómatas**, el corazón del juego. Los jugadores podrán programar sus autómatas usando un **pseudo-lenguaje visual** intuitivo para automatizar tareas complejas. Esta fase se ejecutará **después de completar las Fases 0, 1, 2 y 3**.

### **🧠 Concepto de Programación**
El **sistema de programación** permitirá a los jugadores crear **algoritmos visuales** para controlar el comportamiento de sus autómatas:

#### **📝 Pseudo-Lenguaje Visual**
- **Bloques de código** arrastrables y conectables
- **Sintaxis simple** similar a pseudocódigo
- **Validación en tiempo real** de la lógica
- **Debugging visual** con breakpoints y step-by-step

#### **🎯 Comandos Básicos**
- **Movimiento:** `mover_a(x, y)`, `mover_arriba()`, `mover_derecha()`
- **Condicionales:** `si (condición) entonces`, `sino`
- **Bucles:** `repetir N veces`, `mientras (condición)`
- **Sensores:** `detectar_material()`, `hay_obstáculo()`
- **Acciones:** `recoger_material()`, `depositar_material()`

#### **🔄 Ejecución en Tiempo Real**
- **Intérprete** que ejecuta el código paso a paso
- **Visualización** del estado actual del programa
- **Pausa y reanudación** de la ejecución
- **Logs de actividad** para debugging

### **🎨 Estilo Visual**
- **Vista:** Top-down (desde arriba)
- **Editor:** Interfaz visual con bloques de código
- **Debugging:** Indicadores visuales en la cuadrícula
- **Feedback:** Animaciones y efectos para mostrar ejecución

### **🌐 Integración con Backend**
- **Guardado:** Programas se sincronizan con el servidor (Fase 1)
- **Compartir:** Posibilidad de compartir programas entre jugadores
- **Versionado:** Historial de cambios en los programas

---

## 🏗️ Sistemas Por Implementar

#### **❌ Editor Visual de Programación**
- **Archivo:** `Scripts/Programming/VisualEditor.cs` (NO EXISTE)
- **Funcionalidad:** Interfaz drag & drop para crear programas
- **Características:** Bloques conectables, validación, syntax highlighting
- **Estado:** ❌ NO IMPLEMENTADO
- **Dependencia:** Requiere Fases 0, 1, 2 y 3 completadas

#### **❌ Intérprete de Pseudo-Lenguaje**
- **Archivo:** `Scripts/Programming/CodeInterpreter.cs` (NO EXISTE)
- **Funcionalidad:** Ejecutar programas paso a paso
- **Características:** Parsing, validación, ejecución controlada
- **Estado:** ❌ NO IMPLEMENTADO

#### **❌ Sistema de Debugging**
- **Archivo:** `Scripts/Programming/Debugger.cs` (NO EXISTE)
- **Funcionalidad:** Breakpoints, step-by-step, logs
- **Características:** Visualización de estado, inspección de variables
- **Estado:** ❌ NO IMPLEMENTADO

#### **❌ Biblioteca de Comandos**
- **Archivo:** `Scripts/Programming/CommandLibrary.cs` (NO EXISTE)
- **Funcionalidad:** Comandos disponibles para programar autómatas
- **Características:** Movimiento, sensores, acciones, lógica
- **Estado:** ❌ NO IMPLEMENTADO

#### **❌ Sistema de Validación**
- **Archivo:** `Scripts/Programming/CodeValidator.cs` (NO EXISTE)
- **Funcionalidad:** Validar sintaxis y lógica del programa
- **Características:** Detección de errores, sugerencias
- **Estado:** ❌ NO IMPLEMENTADO

#### **❌ Sincronización con Backend**
- **Archivo:** `Scripts/Backend/ProgramSync.cs` (NO EXISTE)
- **Funcionalidad:** Guardar/cargar programas desde servidor
- **Características:** Versionado, compartir, backup
- **Estado:** ❌ NO IMPLEMENTADO

---

## 📊 Plan de Implementación

### **🔧 Tareas Pendientes**
```
Sistemas a Implementar (Fase 4):
├── ❌ Editor Visual
│   ├── 🎨 Interfaz drag & drop
│   ├── 🧩 Bloques de código conectables
│   ├── ✅ Validación en tiempo real
│   └── 🎯 Syntax highlighting
├── ❌ Intérprete de Código
│   ├── 📝 Parser de pseudo-lenguaje
│   ├── ⚡ Motor de ejecución
│   ├── 🔄 Control de flujo
│   └── 📊 Gestión de estado
├── ❌ Sistema de Debugging
│   ├── 🔍 Breakpoints visuales
│   ├── ⏯️ Ejecución paso a paso
│   ├── 📋 Logs de actividad
│   └── 🎯 Inspección de variables
├── ❌ Biblioteca de Comandos
│   ├── 🚶 Comandos de movimiento
│   ├── 👁️ Comandos de sensores
│   ├── 🤏 Comandos de acciones
│   └── 🧠 Comandos de lógica
├── ❌ Integración con Backend
│   ├── 💾 Guardar programas
│   ├── 📥 Cargar programas
│   ├── 🔄 Sincronización automática
│   └── 📤 Compartir con otros jugadores
└── ❌ Testing y optimización
```

### **📁 Estructura de Archivos Planificada**
```
Scripts/Programming/ (NO EXISTE)
├── VisualEditor.cs        # Editor visual drag & drop
├── CodeInterpreter.cs     # Intérprete de pseudo-lenguaje
├── Debugger.cs            # Sistema de debugging
├── CommandLibrary.cs      # Biblioteca de comandos
├── CodeValidator.cs       # Validación de sintaxis
├── ProgramManager.cs      # Gestión de programas
└── UI/
    ├── CodeBlock.cs       # Bloques de código individuales
    ├── ConnectionLine.cs  # Líneas de conexión entre bloques
    ├── DebugPanel.cs      # Panel de debugging
    └── CommandPalette.cs  # Paleta de comandos disponibles

Scripts/Backend/ (DEPENDE DE FASE 1)
├── ProgramSync.cs         # Sincronización con servidor
└── ProgramData.cs         # Modelos de datos de programas
```

---

## 🔗 Dependencias de Fases Anteriores

### **✅ Requisitos Previos (de Fase 0):**
- ✅ **Identidad visual** para el editor de programación
- ✅ **Arquitectura UI** para interfaces complejas
- ✅ **Sistema de escenas** para transiciones
- ✅ **Configuración** para parámetros del editor

### **✅ Requisitos Previos (de Fase 1):**
- ✅ **APIs de estado del juego** para guardar programas
- ✅ **Autenticación** para asociar programas a usuario
- ✅ **Cliente Unity** para comunicación con backend
- ✅ **Sincronización** automática de datos

### **✅ Requisitos Previos (de Fase 2):**
- ✅ **Sistema de coordenadas** de la cuadrícula
- ✅ **Tiles y posiciones** para referencias en código
- ✅ **Navegación** en el terreno

### **✅ Requisitos Previos (de Fase 3):**
- ✅ **Autómatas básicos** para programar
- ✅ **Sistema de movimiento** en la cuadrícula
- ✅ **Estados de autómatas** para control
- ✅ **Comandos básicos** ya implementados

### **🔄 Integración con Fases Anteriores:**
- **Fase 3:** Los autómatas ejecutarán los programas creados
- **Fase 2:** Referencias a posiciones en la cuadrícula
- **Fase 1:** Guardado automático de programas
- **UI:** Editor integrado en la interfaz principal

---

## 🚀 Preparación para Fases Futuras

### **🎯 Fase 5 (Materiales):**
- **Comandos específicos:** Para manipular diferentes tipos de materiales
- **Sensores avanzados:** Para detectar materiales específicos
- **Lógica de inventario:** Para gestionar materiales en autómatas

### **🎯 Fase 6 (Marketplace):**
- **Programas compartidos:** Marketplace de algoritmos
- **Valoración:** Sistema de rating para programas
- **Monetización:** Venta de programas entre jugadores

### **🎯 Fase 7 (Producción):**
- **Automatización completa:** Programas para cadenas de producción
- **Optimización:** Algoritmos para maximizar eficiencia
- **Coordinación:** Múltiples autómatas trabajando juntos

---

## 🛠️ Especificaciones Técnicas

### **🎮 Rendimiento**
- **Target:** 60 FPS con hasta 100 autómatas ejecutando programas
- **Memoria:** Optimización para programas complejos
- **Ejecución:** Máximo 1000 instrucciones por frame
- **Debugging:** Herramientas que no afecten rendimiento

### **💾 Estructura de Programas**
```csharp
Estructura de Datos:
├── 📝 Program                # Programa completo
│   ├── 🆔 ProgramId          # Identificador único
│   ├── 📛 Name               # Nombre del programa
│   ├── 👤 Author             # Autor del programa
│   ├── 🧩 CodeBlocks[]       # Lista de bloques de código
│   ├── 🔗 Connections[]      # Conexiones entre bloques
│   ├── 📊 Variables[]        # Variables del programa
│   └── 🕐 LastModified       # Timestamp de modificación
├── 🧩 CodeBlock              # Bloque individual
│   ├── 🆔 BlockId            # Identificador del bloque
│   ├── 🏷️ BlockType          # Tipo (comando, condicional, bucle)
│   ├── 📝 Parameters[]       # Parámetros del bloque
│   ├── 📍 Position           # Posición en el editor
│   └── 🔗 Connections[]      # Conexiones de entrada/salida
└── 🔗 Connection             # Conexión entre bloques
    ├── 🆔 FromBlockId        # Bloque origen
    ├── 🆔 ToBlockId          # Bloque destino
    ├── 🏷️ ConnectionType     # Tipo de conexión
    └── 📊 Data               # Datos que fluyen por la conexión
```

### **🌐 Sincronización con Backend**
- **Frecuencia:** Guardado automático cada 60 segundos
- **Versionado:** Control de versiones para programas
- **Conflictos:** Resolución automática con merge
- **Offline:** Cache local para programación sin conexión

---

## 🎯 Próximos Pasos

### **⏳ Esperando Fases Anteriores:**
1. Completar Fase 0 (Menú Principal)
2. Completar Fase 1 (Servidor Backend)
3. Completar Fase 2 (Terreno/Foundations)
4. Completar Fase 3 (Autómatas)

### **🚀 Inmediato (Fase 4):**
1. Diseñar interfaz del editor visual
2. Implementar sistema de bloques conectables
3. Crear intérprete de pseudo-lenguaje
4. Desarrollar sistema de debugging
5. Integrar con autómatas de Fase 3
6. Conectar con backend de Fase 1

---

**Estado Final:** ❌ **NO IMPLEMENTADO - ESPERANDO FASES 0-3**  
**Decisión:** 🎯 **CORAZÓN DEL JUEGO - PROGRAMACIÓN VISUAL**  
**Próximo paso:** ✅ **COMPLETAR FASES ANTERIORES PRIMERO**

---

**Anterior:** [🤖 Fase 3: Autómatas](phase-3.md) | **Siguiente:** [📦 Fase 5: Materiales](phase-5.md) | **Roadmap:** [📋 Roadmap General](../roadmap/overview.md) | **Volver a:** [🏠 README Principal](../../README.md) 