# 🤖 Fase 2: Sistema de Programación

**Estado:** 📋 PLANIFICADO  
**Inicio:** Enero 2026  
**Fin Estimado:** Marzo 2026 (12 semanas)  
**Horas Totales:** 95 horas  
**Progreso:** 0%

---

## 🎯 Objetivos Principales

La Fase 2 implementará el **corazón del juego**: un sistema de programación visual que permite a los jugadores crear algoritmos para controlar sus autómatas usando pseudocódigo intuitivo. Este sistema será la diferencia clave que distingue nuestro juego de otros simuladores de fábrica.

### **🧠 Sistemas a Implementar**

#### **📝 Editor de Pseudocódigo Visual**
- **Interfaz:** Drag & drop con bloques de código
- **Sintaxis:** Pseudocódigo en español simplificado
- **Características:**
  - Autocompletado inteligente
  - Validación de sintaxis en tiempo real
  - Debugging visual con breakpoints
  - Templates de código predefinidos

#### **⚙️ Intérprete de Comandos**
- **Motor:** Intérprete personalizado en C#
- **Funcionalidades:**
  - Ejecución paso a paso
  - Variables y memoria local
  - Funciones y procedimientos
  - Manejo de errores robusto

#### **🔍 Sistema de Debugging**
- **Herramientas:** Debugging visual integrado
- **Características:**
  - Breakpoints y step-through
  - Inspector de variables
  - Stack trace visual
  - Performance profiling

#### **✅ Validación de Sintaxis**
- **Parser:** Analizador sintáctico personalizado
- **Características:**
  - Validación en tiempo real
  - Sugerencias de corrección
  - Highlighting de errores
  - Documentación contextual

---

## 📊 Cronograma Detallado

### **Semanas 1-2: Diseño del Lenguaje**
**Horas:** 16h | **Prioridad:** 🔴 Alta

#### **Especificación del Lenguaje:**
```pseudocode
Comandos Básicos:
├── MOVER(dirección)
├── RECOGER(material)
├── DEPOSITAR(material, cantidad)
├── ESPERAR(segundos)
├── SI (condición) ENTONCES ... FIN_SI
├── MIENTRAS (condición) HACER ... FIN_MIENTRAS
├── REPETIR (veces) ... FIN_REPETIR
└── LLAMAR(función)
```

#### **Variables y Tipos:**
```pseudocode
Tipos de Datos:
├── NUMERO: Valores numéricos
├── TEXTO: Cadenas de caracteres
├── BOOLEANO: Verdadero/Falso
├── MATERIAL: Tipos de materiales
├── POSICION: Coordenadas hexagonales
└── LISTA: Arrays de elementos
```

#### **Funciones del Sistema:**
```pseudocode
Funciones Integradas:
├── INVENTARIO_LLENO() → BOOLEANO
├── MATERIAL_DISPONIBLE(tipo) → NUMERO
├── DISTANCIA_A(posición) → NUMERO
├── SPAWNER_ACTIVO(id) → BOOLEANO
├── PRECIO_ACTUAL(material) → NUMERO
└── TIEMPO_TRANSCURRIDO() → NUMERO
```

### **Semanas 3-4: Parser y Lexer**
**Horas:** 16h | **Prioridad:** 🔴 Alta

#### **Analizador Léxico:**
```csharp
Componentes del Lexer:
├── TokenType: Enumeración de tipos de tokens
├── Token: Estructura de token con posición
├── Lexer: Analizador léxico principal
├── Keywords: Palabras reservadas del lenguaje
└── Operators: Operadores y símbolos especiales
```

#### **Analizador Sintáctico:**
```csharp
Componentes del Parser:
├── ASTNode: Nodo base del árbol sintáctico
├── Statement: Declaraciones y comandos
├── Expression: Expresiones y operaciones
├── Parser: Analizador sintáctico principal
└── SyntaxError: Manejo de errores de sintaxis
```

### **Semanas 5-6: Intérprete Core**
**Horas:** 16h | **Prioridad:** 🔴 Alta

#### **Motor de Ejecución:**
```csharp
Arquitectura del Intérprete:
├── Interpreter: Motor principal de ejecución
├── ExecutionContext: Contexto de ejecución
├── VariableScope: Gestión de variables y scope
├── FunctionRegistry: Registro de funciones
├── CallStack: Pila de llamadas
└── RuntimeError: Manejo de errores de ejecución
```

#### **Sistema de Variables:**
```csharp
Gestión de Memoria:
├── Variable: Estructura de variable tipada
├── MemoryManager: Gestión de memoria
├── ScopeStack: Pila de scopes
├── GarbageCollector: Recolección de basura
└── TypeChecker: Validación de tipos
```

### **Semanas 7-8: Editor Visual**
**Horas:** 16h | **Prioridad:** 🔴 Alta

#### **Interfaz de Usuario:**
```csharp
Componentes UI:
├── CodeEditor: Editor principal de código
├── SyntaxHighlighter: Resaltado de sintaxis
├── AutoComplete: Sistema de autocompletado
├── LineNumbers: Numeración de líneas
├── ErrorMarkers: Marcadores de errores
└── CodeFolding: Plegado de código
```

#### **Sistema Drag & Drop:**
```csharp
Funcionalidades:
├── CommandPalette: Paleta de comandos
├── DragDropHandler: Manejo de drag & drop
├── CodeBlocks: Bloques de código predefinidos
├── TemplateManager: Gestión de templates
└── SnippetLibrary: Biblioteca de snippets
```

### **Semanas 9-10: Sistema de Debugging**
**Horas:** 16h | **Prioridad:** 🟡 Media

#### **Herramientas de Debug:**
```csharp
Debugging Tools:
├── Debugger: Motor de debugging principal
├── Breakpoint: Sistema de breakpoints
├── StepExecution: Ejecución paso a paso
├── VariableInspector: Inspector de variables
├── CallStackViewer: Visualizador de stack
└── PerformanceProfiler: Profiler de rendimiento
```

#### **Visualización de Estado:**
```csharp
Estado Visual:
├── ExecutionPointer: Puntero de ejecución
├── VariableWatcher: Observador de variables
├── MemoryViewer: Visualizador de memoria
├── FlowDiagram: Diagrama de flujo
└── TimingAnalyzer: Análisis de tiempos
```

### **Semanas 11-12: Integración y Testing**
**Horas:** 15h | **Prioridad:** 🟡 Media

#### **Integración con el Juego:**
```csharp
Integración:
├── AutomataController: Control de autómatas
├── GameStateInterface: Interfaz con estado del juego
├── CommandExecutor: Ejecutor de comandos
├── EventSystem: Sistema de eventos
└── SaveLoadManager: Guardado/carga de programas
```

#### **Testing Comprehensivo:**
```csharp
Testing Strategy:
├── Unit Tests: Parser, intérprete, editor
├── Integration Tests: Flujo completo
├── Performance Tests: Programas complejos
├── User Experience Tests: Usabilidad
└── Stress Tests: Múltiples autómatas
```

---

## 🎮 Funcionalidades de Gameplay

### **📝 Experiencia de Programación**

#### **🎯 Flujo de Trabajo del Jugador:**
```
1. 🎮 Jugador selecciona autómata
2. 📝 Abre editor de programación
3. 🧩 Arrastra comandos o escribe código
4. ✅ Valida sintaxis automáticamente
5. ▶️ Ejecuta programa en modo debug
6. 🔍 Observa comportamiento del autómata
7. 🔧 Ajusta y optimiza el código
8. 💾 Guarda programa para reutilizar
```

#### **🧩 Templates Predefinidos:**
```pseudocode
Template "Recolector Básico":
MIENTRAS VERDADERO HACER
    SI INVENTARIO_LLENO() ENTONCES
        MOVER(DEPOSITO)
        DEPOSITAR(TODO)
    SINO
        MOVER(SPAWNER_MAS_CERCANO)
        RECOGER(MATERIAL_DISPONIBLE)
    FIN_SI
FIN_MIENTRAS
```

```pseudocode
Template "Optimizador de Rutas":
DEFINIR ruta_optima = CALCULAR_RUTA_EFICIENTE()
PARA CADA posicion EN ruta_optima HACER
    MOVER(posicion)
    SI MATERIAL_DISPONIBLE(posicion) > 0 ENTONCES
        RECOGER(MATERIAL_DISPONIBLE(posicion))
    FIN_SI
FIN_PARA
```

### **🔍 Sistema de Debugging Visual**

#### **🎯 Herramientas de Debug:**
- **Breakpoints:** Click en línea para pausar ejecución
- **Step Through:** Ejecutar línea por línea
- **Variable Watch:** Observar valores en tiempo real
- **Performance Monitor:** Analizar eficiencia del código
- **Error Highlighting:** Resaltar errores automáticamente

#### **📊 Métricas de Rendimiento:**
```
Métricas Mostradas:
├── ⏱️ Tiempo de ejecución por comando
├── 🔄 Número de iteraciones por loop
├── 💾 Uso de memoria del programa
├── ⚡ Eficiencia de movimientos
├── 📊 Throughput de materiales
└── 🎯 Cumplimiento de objetivos
```

---

## 🔧 Arquitectura Técnica

### **🏗️ Estructura del Sistema**
```
ProgrammingSystem/
├── Language/
│   ├── Lexer.cs
│   ├── Parser.cs
│   ├── AST/
│   └── Tokens/
├── Interpreter/
│   ├── Interpreter.cs
│   ├── ExecutionContext.cs
│   ├── VariableScope.cs
│   └── Functions/
├── Editor/
│   ├── CodeEditor.cs
│   ├── SyntaxHighlighter.cs
│   ├── AutoComplete.cs
│   └── UI/
├── Debugger/
│   ├── Debugger.cs
│   ├── Breakpoint.cs
│   ├── VariableInspector.cs
│   └── Profiler/
└── Integration/
    ├── AutomataInterface.cs
    ├── GameStateInterface.cs
    └── SaveSystem.cs
```

### **🔗 Integración con Unity**
```csharp
Componentes Unity:
├── ProgrammingUI: Canvas principal del editor
├── AutomataProgram: MonoBehaviour para autómatas
├── CodeExecutor: Ejecutor de código en autómatas
├── DebugVisualizer: Visualización de debug en escena
└── ProgramSaveData: ScriptableObject para persistencia
```

### **📊 Flujo de Datos**
```
Flujo de Ejecución:
Código Fuente → Lexer → Tokens → Parser → AST → Interpreter → Comandos → Autómata
                                    ↓
                              Debugger ← Variables ← ExecutionContext
```

---

## 🎯 Casos de Uso Específicos

### **🎮 Caso 1: Programador Novato**
```
Escenario: Jugador nuevo quiere automatizar recolección
├── 🎯 Objetivo: Recoger Hierro automáticamente
├── 🧩 Solución: Usar template "Recolector Básico"
├── 🔧 Personalización: Cambiar tipo de material
├── ▶️ Testing: Ejecutar en modo debug
└── ✅ Resultado: Autómata funcional en 5 minutos
```

### **🎮 Caso 2: Programador Avanzado**
```
Escenario: Optimizar cadena de producción compleja
├── 🎯 Objetivo: Maximizar eficiencia de 10 autómatas
├── 🧩 Solución: Algoritmo de coordinación personalizado
├── 🔧 Herramientas: Variables compartidas, funciones
├── 🔍 Debug: Profiler para identificar cuellos de botella
└── ✅ Resultado: 300% mejora en throughput
```

### **🎮 Caso 3: Resolución de Problemas**
```
Escenario: Autómata se queda atascado en loop infinito
├── 🚨 Problema: Programa no termina nunca
├── 🔍 Debug: Breakpoint en condición del loop
├── 👀 Inspección: Variable no se actualiza correctamente
├── 🔧 Fix: Agregar actualización de variable
└── ✅ Resultado: Programa funciona correctamente
```

---

## 📚 Sistema de Aprendizaje

### **🎓 Tutorial Progresivo**
```
Niveles de Tutorial:
├── 📚 Nivel 1: Comandos básicos (MOVER, RECOGER)
├── 📚 Nivel 2: Condicionales (SI...ENTONCES)
├── 📚 Nivel 3: Loops (MIENTRAS, REPETIR)
├── 📚 Nivel 4: Variables y funciones
├── 📚 Nivel 5: Debugging y optimización
└── 📚 Nivel 6: Algoritmos avanzados
```

### **💡 Sistema de Hints**
```
Ayudas Contextuales:
├── 💡 Sugerencias de autocompletado
├── 📖 Documentación inline
├── ⚠️ Warnings de posibles errores
├── 🎯 Sugerencias de optimización
└── 📊 Métricas de rendimiento en tiempo real
```

---

## 🚀 Preparación para Futuras Fases

### **🔌 Interfaces Preparadas**
```csharp
Extensibilidad:
├── ICommand: Para nuevos comandos
├── IFunction: Para funciones personalizadas
├── IDebugger: Para herramientas de debug
├── IValidator: Para validaciones personalizadas
└── IOptimizer: Para optimizaciones automáticas
```

### **📊 Datos para Analytics**
- **Métricas de uso:** Comandos más utilizados
- **Patrones de código:** Algoritmos populares
- **Errores comunes:** Para mejorar UX
- **Performance:** Optimizaciones necesarias

---

## ⚠️ Riesgos y Mitigaciones

### **🔴 Riesgos Técnicos**
- **Complejidad del Parser:** +2-3 semanas
  - *Mitigación:* Usar herramientas como ANTLR
- **Performance del Intérprete:** +1-2 semanas
  - *Mitigación:* Optimización temprana y profiling

### **🟡 Riesgos de UX**
- **Curva de aprendizaje:** Demasiado complejo
  - *Mitigación:* Tutorial extensivo y templates
- **Debugging confuso:** Herramientas poco intuitivas
  - *Mitigación:* Testing de usabilidad continuo

---

## 🎯 Criterios de Éxito

### **✅ Objetivos Mínimos (MVP)**
- ✅ Editor funcional con comandos básicos
- ✅ Intérprete que ejecuta programas simples
- ✅ Debugging básico con breakpoints
- ✅ Integración con autómatas

### **🌟 Objetivos Ideales**
- 🌟 Editor visual con drag & drop
- 🌟 Autocompletado inteligente
- 🌟 Profiler de rendimiento
- 🌟 Templates y biblioteca de código

### **🚀 Objetivos Stretch**
- 🚀 IA que sugiere optimizaciones
- 🚀 Colaboración en tiempo real
- 🚀 Marketplace de algoritmos
- 🚀 Compilación a código nativo

---

**Estado:** 📋 **LISTO PARA INICIAR**  
**Dependencias:** ✅ Fase 1.6 completada  
**Bloqueadores:** ❌ Ninguno identificado

---

**Anterior:** [📋 Fase 1.6: Backend API](phase-1-6.md) | **Siguiente:** [⚙️ Fase 3: Autómatas](phase-3.md) | **Roadmap:** [📋 Roadmap General](../roadmap/overview.md) | **Volver a:** [🏠 README Principal](../../README.md) 