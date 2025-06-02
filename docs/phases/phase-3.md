# 🤖 Fase 3: Autómatas Básicos

**Estado:** 🚧 PLANIFICADO  
**Duración:** Septiembre - Noviembre 2025 (3 meses)  
**Horas Totales:** 75 horas  
**Prioridad:** 🔥 ALTA

---

## 🎯 Objetivos Principales

La Fase 3 introduce los **autómatas básicos** al juego, estableciendo las fundaciones para la automatización industrial. Los jugadores podrán crear, programar y gestionar unidades autónomas que ejecuten tareas simples en la grilla cuadrada.

### **🤖 Sistemas a Implementar**

#### **🏗️ Sistema de Autómatas**
- **Creación:** Spawn de autómatas en tiles específicos
- **Movimiento:** Navegación inteligente en grilla cuadrada
- **Estados:** Sistema de estados finitos (FSM)
- **Programación:** Lenguaje visual simple para comandos

#### **🧠 Inteligencia Artificial Básica**
- **Pathfinding:** Algoritmo A* optimizado para grillas cuadradas
- **Toma de decisiones:** Árbol de comportamiento simple
- **Detección:** Sistema de sensores para el entorno
- **Memoria:** Capacidad limitada de recordar tareas

#### **⚙️ Sistema de Comandos**
- **Interfaz visual:** Drag & drop para programación
- **Comandos básicos:** Mover, esperar, repetir, condicionales
- **Validación:** Prevención de comandos inválidos
- **Ejecución:** Intérprete de comandos en tiempo real

---

## 🔧 Arquitectura Técnica

### **📁 Estructura de Archivos**
```
Scripts/Automata/
├── Core/
│   ├── Automaton.cs           # Clase base de autómata
│   ├── AutomatonManager.cs    # Gestión global de autómatas
│   ├── AutomatonSpawner.cs    # Sistema de spawn
│   └── AutomatonStates.cs     # Estados y transiciones
├── AI/
│   ├── GridPathfinder.cs      # Pathfinding para grilla cuadrada
│   ├── BehaviorTree.cs        # Árbol de comportamiento
│   ├── SensorSystem.cs        # Sistema de sensores
│   └── DecisionMaker.cs       # Toma de decisiones
├── Programming/
│   ├── CommandSystem.cs       # Sistema de comandos
│   ├── VisualProgramming.cs   # Interfaz visual
│   ├── CommandValidator.cs    # Validación de comandos
│   └── CommandInterpreter.cs  # Intérprete de comandos
└── UI/
    ├── AutomatonPanel.cs      # Panel de gestión
    ├── ProgrammingUI.cs       # Interfaz de programación
    └── AutomatonHUD.cs        # HUD de información
```

### **🤖 Clase Automaton.cs**
```csharp
public class Automaton : MonoBehaviour
{
    [Header("Identificación")]
    public string automatonId;
    public string automatonName;
    public AutomatonType type;
    
    [Header("Posición en Grilla")]
    public Vector2Int gridPosition;
    public Vector2Int targetPosition;
    
    [Header("Estados")]
    public AutomatonState currentState;
    public Queue<Command> commandQueue;
    
    [Header("Capacidades")]
    public float movementSpeed = 1.0f;
    public int memoryCapacity = 10;
    public List<SensorType> sensors;
    
    [Header("Programación")]
    public List<Command> program;
    public int programCounter;
    
    // Métodos principales
    public void ExecuteNextCommand();
    public void MoveTo(Vector2Int target);
    public bool CanMoveTo(Vector2Int position);
    public void SetProgram(List<Command> newProgram);
    public void StartExecution();
    public void PauseExecution();
    public void ResetExecution();
}
```

### **🧭 GridPathfinder.cs**
```csharp
public class GridPathfinder : MonoBehaviour
{
    [Header("Configuración de Grilla")]
    public GridManager gridManager;
    public LayerMask obstacleLayer;
    
    [Header("Algoritmo A*")]
    public bool useDiagonalMovement = true;
    public float diagonalCost = 1.4f;
    public float straightCost = 1.0f;
    
    // Algoritmo A* para grilla cuadrada
    public List<Vector2Int> FindPath(Vector2Int start, Vector2Int target)
    {
        var openSet = new List<PathNode>();
        var closedSet = new HashSet<Vector2Int>();
        var allNodes = new Dictionary<Vector2Int, PathNode>();
        
        var startNode = new PathNode(start, 0, GetHeuristic(start, target));
        openSet.Add(startNode);
        allNodes[start] = startNode;
        
        while (openSet.Count > 0)
        {
            var currentNode = GetLowestFCostNode(openSet);
            openSet.Remove(currentNode);
            closedSet.Add(currentNode.position);
            
            if (currentNode.position == target)
            {
                return ReconstructPath(currentNode);
            }
            
            foreach (var neighbor in GetNeighbors(currentNode.position))
            {
                if (closedSet.Contains(neighbor) || !IsWalkable(neighbor))
                    continue;
                
                var gCost = currentNode.gCost + GetMovementCost(currentNode.position, neighbor);
                var hCost = GetHeuristic(neighbor, target);
                
                if (!allNodes.ContainsKey(neighbor))
                {
                    var neighborNode = new PathNode(neighbor, gCost, hCost);
                    neighborNode.parent = currentNode;
                    allNodes[neighbor] = neighborNode;
                    openSet.Add(neighborNode);
                }
                else if (gCost < allNodes[neighbor].gCost)
                {
                    allNodes[neighbor].gCost = gCost;
                    allNodes[neighbor].parent = currentNode;
                }
            }
        }
        
        return new List<Vector2Int>(); // No path found
    }
    
    // Heurística Manhattan para grilla cuadrada
    private float GetHeuristic(Vector2Int a, Vector2Int b)
    {
        return Mathf.Abs(a.x - b.x) + Mathf.Abs(a.y - b.y);
    }
    
    // Obtener vecinos en grilla cuadrada (4 u 8 direcciones)
    private List<Vector2Int> GetNeighbors(Vector2Int position)
    {
        var neighbors = new List<Vector2Int>();
        
        // Movimientos cardinales (arriba, abajo, izquierda, derecha)
        neighbors.Add(position + Vector2Int.up);
        neighbors.Add(position + Vector2Int.down);
        neighbors.Add(position + Vector2Int.left);
        neighbors.Add(position + Vector2Int.right);
        
        // Movimientos diagonales (si están habilitados)
        if (useDiagonalMovement)
        {
            neighbors.Add(position + new Vector2Int(1, 1));
            neighbors.Add(position + new Vector2Int(1, -1));
            neighbors.Add(position + new Vector2Int(-1, 1));
            neighbors.Add(position + new Vector2Int(-1, -1));
        }
        
        return neighbors;
    }
}
```

---

## 🎮 Funcionalidades de Gameplay

### **🤖 Creación de Autómatas**
- **Spawn Point:** Los jugadores pueden designar tiles como puntos de spawn
- **Tipos:** Diferentes tipos de autómatas con capacidades específicas
- **Límites:** Sistema de límites para evitar spam
- **Costos:** Recursos requeridos para crear autómatas

### **📝 Programación Visual**
- **Interfaz Drag & Drop:** Arrastrar comandos para crear programas
- **Comandos Básicos:**
  - `MOVE(x, y)`: Mover a coordenadas específicas
  - `WAIT(seconds)`: Esperar tiempo determinado
  - `REPEAT(n)`: Repetir secuencia n veces
  - `IF(condition)`: Condicional simple
  - `GOTO(label)`: Salto a etiqueta

### **🧠 Comportamiento Inteligente**
- **Navegación:** Los autómatas evitan obstáculos automáticamente
- **Detección:** Sensores para detectar otros autómatas y objetos
- **Adaptación:** Reacción a cambios en el entorno
- **Optimización:** Rutas eficientes y comportamiento inteligente

---

## 📊 Especificaciones Técnicas

### **⚡ Rendimiento**
| Métrica | Objetivo | Medición |
|---------|----------|----------|
| Autómatas simultáneos | 50+ | Sin lag perceptible |
| Pathfinding | <5ms | Por cálculo de ruta |
| Actualización de IA | 60 FPS | Con 50 autómatas |
| Memoria por autómata | <1MB | Optimización de datos |

### **🎯 Límites del Sistema**
- **Máximo de autómatas:** 100 por jugador
- **Comandos por programa:** 50 comandos máximo
- **Distancia de sensores:** 5 tiles de radio
- **Memoria de autómata:** 10 comandos recordados

### **🔧 Configuración**
```csharp
[System.Serializable]
public class AutomatonConfig
{
    [Header("Límites")]
    public int maxAutomataPerPlayer = 100;
    public int maxCommandsPerProgram = 50;
    public int maxMemoryCapacity = 10;
    
    [Header("Rendimiento")]
    public float pathfindingUpdateRate = 0.1f;
    public int maxPathfindingPerFrame = 5;
    public bool usePathfindingCache = true;
    
    [Header("Comportamiento")]
    public float defaultMovementSpeed = 1.0f;
    public float sensorRange = 5.0f;
    public bool allowDiagonalMovement = true;
}
```

---

## 🎨 Diseño Visual

### **🤖 Sprites de Autómatas**
- **Diseño:** Sprites cuadrados que encajan perfectamente en la grilla
- **Animaciones:** Movimiento suave entre tiles
- **Estados visuales:** Diferentes colores según el estado
- **Indicadores:** Flechas para mostrar dirección y objetivo

### **🎮 Interfaz de Usuario**
- **Panel de Autómatas:** Lista de todos los autómatas creados
- **Editor de Programas:** Interfaz visual para programación
- **Información en tiempo real:** Estado actual de cada autómata
- **Controles:** Botones para pausar, reanudar y resetear

### **📊 Feedback Visual**
- **Rutas:** Líneas que muestran el camino planificado
- **Estados:** Iconos que indican el estado actual
- **Errores:** Alertas visuales para comandos inválidos
- **Progreso:** Barras de progreso para tareas largas

---

## 🧪 Plan de Testing

### **🔍 Pruebas Unitarias**
- **Pathfinding:** Verificar rutas óptimas en diferentes escenarios
- **Estados:** Transiciones correctas entre estados
- **Comandos:** Ejecución correcta de cada tipo de comando
- **Validación:** Prevención de comandos inválidos

### **⚡ Pruebas de Rendimiento**
- **Carga:** 50+ autómatas ejecutándose simultáneamente
- **Memoria:** Uso eficiente de RAM
- **CPU:** Optimización de algoritmos de IA
- **FPS:** Mantener 60 FPS constantes

### **🎮 Pruebas de Usabilidad**
- **Interfaz:** Facilidad de uso del editor visual
- **Aprendizaje:** Curva de aprendizaje suave
- **Feedback:** Claridad de la información mostrada
- **Errores:** Manejo graceful de errores de usuario

---

## 📈 Cronograma Detallado

### **🗓️ Mes 1: Fundaciones (25 horas)**
| Semana | Tarea | Horas | Entregable |
|--------|-------|-------|------------|
| 1 | Diseño de arquitectura de autómatas | 8h | Documentación técnica |
| 2 | Implementación de clase base Automaton | 8h | Automaton.cs funcional |
| 3 | Sistema de spawn y gestión básica | 6h | AutomatonManager.cs |
| 4 | Estados básicos y transiciones | 3h | AutomatonStates.cs |

### **🗓️ Mes 2: IA y Navegación (25 horas)**
| Semana | Tarea | Horas | Entregable |
|--------|-------|-------|------------|
| 5 | Implementación de pathfinding A* | 10h | GridPathfinder.cs |
| 6 | Sistema de sensores y detección | 8h | SensorSystem.cs |
| 7 | Árbol de comportamiento básico | 5h | BehaviorTree.cs |
| 8 | Optimización y testing de IA | 2h | IA optimizada |

### **🗓️ Mes 3: Programación y UI (25 horas)**
| Semana | Tarea | Horas | Entregable |
|--------|-------|-------|------------|
| 9 | Sistema de comandos básicos | 8h | CommandSystem.cs |
| 10 | Interfaz visual de programación | 10h | VisualProgramming.cs |
| 11 | Validación e intérprete de comandos | 5h | Validación completa |
| 12 | UI/UX y pulido final | 2h | Interfaz terminada |

---

## 🎯 Criterios de Éxito

### **✅ Mínimo Viable (MVP)**
- [ ] Autómatas pueden moverse en grilla cuadrada
- [ ] Pathfinding A* funcional
- [ ] 5 comandos básicos implementados
- [ ] Interfaz de programación visual básica
- [ ] 10 autómatas simultáneos sin lag

### **🎯 Objetivo Ideal**
- [ ] 50+ autómatas simultáneos
- [ ] 10+ comandos diferentes
- [ ] Sistema de sensores completo
- [ ] Interfaz intuitiva y pulida
- [ ] Comportamiento inteligente avanzado

### **🚀 Stretch Goals**
- [ ] 100+ autómatas simultáneos
- [ ] Programación con bucles y condicionales complejas
- [ ] IA adaptativa que aprende
- [ ] Colaboración entre autómatas
- [ ] Optimización automática de rutas

---

## 🔗 Integración con Otras Fases

### **⬅️ Dependencias**
- **Fase 1:** Sistema de grillas cuadradas funcional
- **Fase 2:** Sistema de programación básico
- **Fase 1.5:** UI base para interfaces

### **➡️ Preparación para Futuras Fases**
- **Fase 4:** Autómatas listos para manipular materiales
- **Fase 5:** Base para automatización de mercado
- **Fase 6:** Datos para optimización con IA avanzada

---

## 🚨 Riesgos y Mitigaciones

### **⚠️ Riesgos Técnicos**
| Riesgo | Probabilidad | Impacto | Mitigación |
|--------|--------------|---------|------------|
| Rendimiento con muchos autómatas | Media | Alto | Optimización temprana y profiling |
| Complejidad del pathfinding | Baja | Medio | Usar algoritmos probados (A*) |
| Usabilidad del editor visual | Media | Alto | Testing continuo con usuarios |

### **🛡️ Plan de Contingencia**
- **Rendimiento:** Implementar LOD y culling de autómatas
- **Complejidad:** Simplificar comandos si es necesario
- **Usabilidad:** Iteración rápida basada en feedback

---

**Estado:** 🚧 **LISTO PARA DESARROLLO**  
**Siguiente:** [🏭 Fase 4: Materiales y Transformaciones](phase-4.md) | **Anterior:** [⚙️ Fase 2: Sistema de Programación](phase-2.md) | **Volver a:** [🏠 README Principal](../../README.md) 