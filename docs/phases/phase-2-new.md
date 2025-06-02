# ❌ Fase 2: Terreno/Foundations (NO IMPLEMENTADO)

**Estado:** ❌ NO IMPLEMENTADO  
**Duración:** Mayo - Julio 2025 (3 meses)  
**Horas Totales:** 0 horas  
**Progreso:** 0% ❌

---

## 🎯 Objetivos Principales

La **Fase 2** establecerá el **sistema de fundaciones cuadriculadas**, creando los cimientos donde se asentarán todas las máquinas, autómatas y objetos del juego. Esta fase se ejecutará **después de completar la Fase 0** (Menú Principal) y **Fase 1** (Servidor Backend).

### **🏗️ Concepto de Fundación**
Las **fundaciones** son una **cuadrícula simple** con exactamente **dos tipos de tiles**:

#### **🔲 Suelo (Floor)**
- **Tiles interiores** de la cuadrícula donde se construye
- **Superficie transitable** para autómatas y objetos
- **Área de construcción** para máquinas y elementos del juego

#### **🧱 Pared (Wall)**
- **Tiles de borde** que delimitan la cuadrícula
- **Perímetro** que define los límites del área de construcción
- **Barrera visual** que enmarca el espacio de juego

**Estructura simple:** Una cuadrícula que tiene suelo en el interior y paredes en sus bordes. Nada más.

### **🎨 Estilo Visual**
- **Vista:** Top-down (desde arriba)
- **Arte:** Pixel art 2D
- **Perspectiva:** Sin perspectivas, vista plana
- **Grid:** Cuadrícula visible y clara desde arriba

### **🌐 Integración con Backend**
- **Guardado:** Estado del terreno se sincroniza con el servidor (Fase 1)
- **Persistencia:** Progreso guardado en la nube por usuario
- **Tiempo real:** Cambios se reflejan inmediatamente en el backend

---

## 🏗️ Sistemas Por Implementar

#### **❌ Sistema de Grillas Cuadriculadas (Fundaciones)**
- **Archivo:** `Scripts/Core/SceneGenerator.cs` (NO EXISTE)
- **Funcionalidad:** Generación de cuadrícula simple vista desde arriba
- **Estructura:** Grid 2D plano con tiles de suelo y pared
- **Vista:** Top-down sin perspectivas
- **Estado:** ❌ NO IMPLEMENTADO
- **Dependencia:** Requiere Fase 0 y Fase 1 completadas

#### **❌ Generación Procedural de Fundaciones**
- **Sistema:** Algoritmo de expansión de la cuadrícula 2D
- **Funcionalidad:** Ampliar el grid manteniendo vista top-down
- **Lógica:** Expandir área de suelo y recalcular perímetro de paredes
- **Estado:** ❌ NO IMPLEMENTADO
- **Integración:** Con sistema de guardado de Fase 1

#### **❌ Expansión de Área de Construcción**
- **Mecánica:** Sistema de compra para ampliar la cuadrícula
- **Resultado:** Más suelo interior, paredes se mueven al nuevo perímetro
- **Vista:** Expansión visible desde arriba
- **Estado:** ❌ NO IMPLEMENTADO
- **Backend:** Cambios se sincronizan con servidor

#### **❌ Sistema Visual de Fundaciones**
- **Archivo:** `Scripts/Core/SpriteCreator.cs` (NO EXISTE)
- **Funcionalidad:** Sprites pixel art para suelo y pared (vista top-down)
- **Diseño:** Pixel art simple, sin perspectivas ni 3D
- **Vista:** Tiles cuadrados vistos desde arriba
- **Estado:** ❌ NO IMPLEMENTADO
- **Estilo:** Seguirá identidad visual de Fase 0

#### **❌ Propiedades de Tiles**
- **Archivo:** `Scripts/Core/TileProperties.cs` (NO EXISTE)
- **Suelo:** Construible, transitable
- **Pared:** No construible, barrera
- **Estado:** ❌ NO IMPLEMENTADO

#### **❌ Sincronización con Backend**
- **Archivo:** `Scripts/Backend/TerrainSync.cs` (NO EXISTE)
- **Funcionalidad:** Guardar/cargar estado del terreno desde servidor
- **Tiempo real:** Sincronización automática de cambios
- **Estado:** ❌ NO IMPLEMENTADO

---

## 📊 Plan de Implementación

### **🔧 Tareas Pendientes**
```
Sistemas a Implementar (Fase 2):
├── ❌ Cuadrícula básica
│   ├── 🔲 Generación de suelo interior
│   └── 🧱 Generación de paredes en bordes
├── ❌ Sistema de expansión
│   ├── 🔲 Ampliar área de suelo
│   └── 🧱 Recalcular perímetro de paredes
├── ❌ Sprites simples
│   ├── 🔲 Sprite de suelo
│   └── 🧱 Sprite de pared
├── ❌ Propiedades básicas
│   ├── 🔲 Suelo: construible, transitable
│   └── 🧱 Pared: barrera, no construible
├── ❌ Integración con Backend
│   ├── 💾 Guardar estado en servidor
│   ├── 📥 Cargar estado desde servidor
│   └── 🔄 Sincronización en tiempo real
└── ❌ Optimización de rendimiento
```

### **📁 Estructura de Archivos Planificada**
```
Scripts/Core/ (NO EXISTE)
├── SceneGenerator.cs      # Generación de cuadrícula simple
├── SpriteCreator.cs       # Dos sprites: suelo y pared
├── TileProperties.cs      # Propiedades básicas por tipo
├── GridCoordinates.cs     # Sistema de coordenadas
├── TerrainManager.cs      # Gestión de la cuadrícula
└── GameplayManager.cs     # Integración con Fases 0 y 1

Scripts/Backend/ (DEPENDE DE FASE 1)
├── TerrainSync.cs         # Sincronización con servidor
└── TerrainData.cs         # Modelos de datos del terreno
```

---

## 🔗 Dependencias de Fases Anteriores

### **✅ Requisitos Previos (de Fase 0):**
- ✅ **Identidad visual** establecida para sprites
- ✅ **Arquitectura UI** para mostrar progreso de construcción
- ✅ **Sistema de escenas** para transiciones al gameplay
- ✅ **Configuración** para parámetros del terreno

### **✅ Requisitos Previos (de Fase 1):**
- ✅ **APIs de estado del juego** para guardar terreno
- ✅ **Autenticación** para asociar terreno a usuario
- ✅ **Cliente Unity** para comunicación con backend
- ✅ **Sincronización** automática de datos

### **🔄 Integración con Fases Anteriores:**
- **Fase 0:** Transición del menú al gameplay con terreno
- **Fase 1:** Guardado automático del estado del terreno
- **UI:** Indicadores de sincronización y guardado

---

## 🚀 Preparación para Fases Futuras

### **🎯 Fase 3 (Autómatas):**
- **Colocación:** Los autómatas se colocarán en tiles de suelo
- **Navegación:** Sistema de pathfinding en la cuadrícula
- **Restricciones:** Paredes bloquean movimiento de autómatas

### **🎯 Fase 4 (Programación de Autómatas):**
- **Coordenadas:** Sistema de coordenadas para programación
- **Referencias:** Tiles como puntos de referencia para código
- **Debugging:** Visualización de rutas en la cuadrícula

### **🎯 Fase 5 (Materiales):**
- **Almacenamiento:** Materiales se colocan en tiles específicos
- **Transporte:** Movimiento de materiales por la cuadrícula
- **Organización:** Áreas designadas para diferentes materiales

---

## 🛠️ Especificaciones Técnicas

### **🎮 Rendimiento**
- **Target:** 60 FPS con cuadrículas de hasta 100x100
- **Memoria:** Optimización para grids grandes
- **Culling:** Solo renderizar tiles visibles
- **Pooling:** Reutilización de sprites de tiles

### **💾 Datos del Terreno**
```csharp
Estructura de Datos:
├── 📊 Grid2D<TileType>     # Matriz de tipos de tile
├── 🔢 GridSize             # Dimensiones actuales
├── 📍 ExpandedAreas        # Historial de expansiones
├── 💰 ExpansionCost        # Costo de próxima expansión
└── 🕐 LastModified         # Timestamp para sincronización
```

### **🌐 Sincronización con Backend**
- **Frecuencia:** Guardado cada 30 segundos o al cambiar
- **Compresión:** Delta compression para cambios
- **Conflictos:** Resolución automática con timestamp
- **Offline:** Cache local para juego sin conexión

---

## 🎯 Próximos Pasos

### **⏳ Esperando Fases Anteriores:**
1. Completar Fase 0 (Menú Principal)
2. Completar Fase 1 (Servidor Backend)
3. Verificar integración entre Fase 0 y Fase 1

### **🚀 Inmediato (Fase 2):**
1. Diseñar sprites de suelo y pared
2. Implementar generación básica de cuadrícula
3. Crear sistema de coordenadas
4. Integrar con APIs de Fase 1
5. Implementar expansión de terreno

---

**Estado Final:** ❌ **NO IMPLEMENTADO - ESPERANDO FASES 0 Y 1**  
**Decisión:** 🎯 **TERRENO COMO BASE PARA GAMEPLAY**  
**Próximo paso:** ✅ **COMPLETAR FASES 0 Y 1 PRIMERO**

---

**Anterior:** [❌ Fase 1: Servidor Backend](phase-1.md) | **Siguiente:** [❌ Fase 3: Autómatas](phase-3.md) | **Roadmap:** [📋 Roadmap General](../roadmap/overview.md) | **Volver a:** [🏠 README Principal](../../README.md) 