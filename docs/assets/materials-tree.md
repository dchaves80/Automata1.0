# 🏭 Materiales y Transformación - Árbol Completo de Producción

## 🎯 Visión General del Sistema

El sistema de materiales y transformación es el **corazón económico** del juego, donde los jugadores crean cadenas de producción cada vez más complejas para fabricar autómatas avanzados y competir en el marketplace global.

---

## 🧱 Materiales Básicos (Tier 1)

### **Recursos Primarios** - Extraídos del terreno

| Material | Símbolo | Color | Abundancia | Uso Principal |
|----------|---------|-------|------------|---------------|
| **Hierro** | Fe | 🔴 Rojo | Alta | Estructura y componentes básicos |
| **Cobre** | Cu | 🟠 Naranja | Media | Circuitos y conductividad |
| **Carbón** | C | ⚫ Negro | Alta | Energía y aleaciones |
| **Silicio** | Si | 🔵 Azul | Media | Electrónicos y procesadores |
| **Litio** | Li | 🟡 Amarillo | Baja | Baterías y almacenamiento |

### Características de Extracción:
- **Hierro y Carbón:** Abundantes, fáciles de extraer
- **Cobre y Silicio:** Moderadamente raros, requieren exploración
- **Litio:** Escaso, encontrado en depósitos especiales

---

## ⚙️ Materiales Procesados (Tier 2)

### **Aleaciones y Compuestos** - Primera transformación

| Material | Componentes | Máquina | Tiempo | Valor |
|----------|-------------|---------|--------|-------|
| **Acero** | 2 Hierro + 1 Carbón | Horno Básico | 30s | 3x |
| **Bronce** | 3 Cobre + 1 Hierro | Horno Básico | 25s | 2.5x |
| **Cables** | 2 Cobre | Extrusora | 15s | 2x |
| **Chips** | 1 Silicio + 1 Cobre | Fab. Electrónica | 45s | 4x |
| **Baterías** | 2 Litio + 1 Cobre | Ensambladora | 60s | 5x |

### **Fórmulas de Transformación:**
```
Acero = 2Fe + 1C → 1 Acero (Valor: 3 unidades básicas)
Bronce = 3Cu + 1Fe → 1 Bronce (Valor: 2.5 unidades básicas)
Cables = 2Cu → 3 Cables (Valor: 2 unidades básicas)
Chips = 1Si + 1Cu → 1 Chip (Valor: 4 unidades básicas)
Baterías = 2Li + 1Cu → 1 Batería (Valor: 5 unidades básicas)
```

---

## 🔧 Componentes Avanzados (Tier 3)

### **Partes Especializadas** - Segunda transformación

| Componente | Materiales Requeridos | Máquina | Tiempo | Complejidad |
|------------|----------------------|---------|--------|-------------|
| **Motor** | 2 Acero + 3 Cables + 1 Chip | Ensambladora Avanzada | 120s | Media |
| **Procesador** | 3 Chips + 1 Batería + 2 Cables | Fab. Avanzada | 180s | Alta |
| **Chasis** | 4 Acero + 2 Bronce | Soldadora | 90s | Baja |
| **Sensor** | 2 Chips + 1 Silicio + 3 Cables | Fab. Electrónica | 150s | Media |
| **Actuador** | 1 Motor + 2 Acero + 1 Procesador | Ensambladora Avanzada | 200s | Alta |

### **Cadenas de Dependencia:**
```
Motor:
├── Acero (2) ← Hierro (4) + Carbón (2)
├── Cables (3) ← Cobre (6)
└── Chip (1) ← Silicio (1) + Cobre (1)

Procesador:
├── Chips (3) ← Silicio (3) + Cobre (3)
├── Batería (1) ← Litio (2) + Cobre (1)
└── Cables (2) ← Cobre (4)
```

---

## 🤖 Autómatas (Tier 4)

### **Tipos de Autómatas por Especialización**

#### **🚚 Autómata de Transporte**
**Función:** Movimiento eficiente de materiales
```
Componentes Requeridos:
├── Chasis (1) → 4 Acero + 2 Bronce
├── Motor (2) → 4 Acero + 6 Cables + 2 Chips
├── Sensor (1) → 2 Chips + 1 Silicio + 3 Cables
└── Procesador (1) → 3 Chips + 1 Batería + 2 Cables

Tiempo Total de Fabricación: ~15 minutos
Valor de Mercado: 50-80 créditos
```

#### **🔨 Autómata de Construcción**
**Función:** Construcción y reparación de estructuras
```
Componentes Requeridos:
├── Chasis (1) → 4 Acero + 2 Bronce
├── Actuador (2) → 2 Motores + 4 Acero + 2 Procesadores
├── Sensor (2) → 4 Chips + 2 Silicio + 6 Cables
└── Procesador (1) → 3 Chips + 1 Batería + 2 Cables

Tiempo Total de Fabricación: ~25 minutos
Valor de Mercado: 120-180 créditos
```

#### **⚡ Autómata de Energía**
**Función:** Gestión y distribución de energía
```
Componentes Requeridos:
├── Chasis (1) → 4 Acero + 2 Bronce
├── Baterías (3) → 6 Litio + 3 Cobre
├── Procesador (2) → 6 Chips + 2 Baterías + 4 Cables
└── Cables (10) → 20 Cobre

Tiempo Total de Fabricación: ~20 minutos
Valor de Mercado: 200-300 créditos
```

#### **🧠 Autómata Inteligente**
**Función:** Coordinación y optimización de procesos
```
Componentes Requeridos:
├── Chasis (1) → 4 Acero + 2 Bronce
├── Procesador (3) → 9 Chips + 3 Baterías + 6 Cables
├── Sensor (3) → 6 Chips + 3 Silicio + 9 Cables
└── Actuador (1) → 1 Motor + 2 Acero + 1 Procesador

Tiempo Total de Fabricación: ~35 minutos
Valor de Mercado: 400-600 créditos
```

---

## 🏭 Máquinas de Transformación

### **Máquinas Básicas (Fase 4)**

#### **🔥 Horno Básico**
- **Función:** Fusión de metales básicos
- **Procesa:** Hierro + Carbón → Acero, Cobre + Hierro → Bronce
- **Velocidad:** 1 unidad cada 30 segundos
- **Costo:** 10 Hierro + 5 Carbón

#### **🔌 Extrusora**
- **Función:** Formado de cables y componentes simples
- **Procesa:** Cobre → Cables
- **Velocidad:** 3 unidades cada 15 segundos
- **Costo:** 8 Hierro + 5 Cobre

#### **💻 Fábrica Electrónica**
- **Función:** Creación de componentes electrónicos
- **Procesa:** Silicio + Cobre → Chips, Chips + Componentes → Sensores
- **Velocidad:** 1 unidad cada 45 segundos
- **Costo:** 15 Hierro + 10 Cobre + 5 Silicio

### **Máquinas Avanzadas (Fase 5-6)**

#### **🏗️ Ensambladora Avanzada**
- **Función:** Ensamblaje de componentes complejos
- **Procesa:** Motores, Actuadores, Autómatas completos
- **Velocidad:** 1 unidad cada 2-5 minutos
- **Costo:** 25 Acero + 15 Chips + 10 Cables

#### **⚙️ Soldadora**
- **Función:** Unión de estructuras metálicas
- **Procesa:** Chasis y estructuras grandes
- **Velocidad:** 1 unidad cada 90 segundos
- **Costo:** 20 Acero + 10 Bronce + 5 Cables

---

## 📊 Economía y Balanceado

### **Progresión de Valor**
```
Materiales Básicos (Tier 1): 1 crédito base
├── Hierro, Carbón: 1 crédito
├── Cobre, Silicio: 1.5 créditos
└── Litio: 2 créditos

Materiales Procesados (Tier 2): 2-5 créditos
├── Acero, Bronce: 2-3 créditos
├── Cables, Chips: 3-4 créditos
└── Baterías: 5 créditos

Componentes (Tier 3): 10-50 créditos
├── Chasis, Motor: 10-20 créditos
├── Sensor, Procesador: 25-35 créditos
└── Actuador: 40-50 créditos

Autómatas (Tier 4): 50-600 créditos
├── Transporte: 50-80 créditos
├── Construcción: 120-180 créditos
├── Energía: 200-300 créditos
└── Inteligente: 400-600 créditos
```

### **Tiempo vs. Valor**
- **Materiales Básicos:** Extracción instantánea
- **Tier 2:** 15-60 segundos por unidad
- **Tier 3:** 90-200 segundos por unidad
- **Tier 4:** 15-35 minutos por autómata completo

---

## 🔄 Cadenas de Producción Optimizadas

### **Cadena Básica de Transporte**
```
Extracción → Procesamiento → Ensamblaje
├── 4 Hierro + 2 Carbón → 2 Acero (60s)
├── 7 Cobre → 3 Cables + 1 Chip (60s)
├── 1 Silicio → Chip adicional (45s)
└── Ensamblaje final → Autómata (15 min)

Tiempo Total: ~17 minutos
Recursos Totales: 4 Fe, 2 C, 7 Cu, 1 Si
```

### **Cadena Avanzada Inteligente**
```
Múltiples Líneas Paralelas:
├── Línea A: Procesadores (3x) → 180s cada uno
├── Línea B: Sensores (3x) → 150s cada uno
├── Línea C: Chasis + Actuador → 290s total
└── Ensamblaje Final → 35 minutos

Tiempo Total: ~45 minutos (con paralelización)
Recursos Totales: 20+ materiales básicos
```

---

## 🎯 Estrategias de Optimización

### **Early Game (Fases 1-2)**
- **Foco:** Acero y Cables para infraestructura básica
- **Prioridad:** Establecer líneas de Hierro y Cobre
- **Objetivo:** Primer autómata de transporte

### **Mid Game (Fases 3-4)**
- **Foco:** Diversificación hacia Chips y Baterías
- **Prioridad:** Exploración para Silicio y Litio
- **Objetivo:** Autómatas especializados

### **Late Game (Fases 5-6)**
- **Foco:** Optimización y autómatas inteligentes
- **Prioridad:** Eficiencia y marketplace
- **Objetivo:** Dominación económica

---

## 🏪 Marketplace y Competencia

### **Factores de Precio**
- **Rareza de materiales:** Litio y Silicio más valiosos
- **Complejidad de fabricación:** Más pasos = mayor valor
- **Demanda del mercado:** Oferta y demanda dinámica
- **Calidad del autómata:** Eficiencia del código programado

### **Estrategias Competitivas**
- **Especialización:** Dominar un tipo específico de autómata
- **Integración Vertical:** Controlar toda la cadena de suministro
- **Innovación:** Desarrollar algoritmos más eficientes
- **Velocidad:** Ser el primero en el mercado con nuevos diseños

---

## 📈 Métricas de Progresión

### **Indicadores de Eficiencia**
- **Tiempo por Autómata:** Objetivo < 10 minutos para básicos
- **Utilización de Recursos:** >90% de eficiencia en materiales
- **Throughput:** Autómatas por hora producidos
- **ROI del Marketplace:** Retorno de inversión por venta

### **Objetivos por Fase**
- **Fase 4:** Producir 1 autómata básico cada 20 minutos
- **Fase 5:** Línea de producción automatizada completa
- **Fase 6:** Dominación del marketplace en categoría especializada

---

**Relacionado:** [🎮 Mecánicas de Gameplay](gameplay.md) | [💰 Costos de Infraestructura](costs.md) | **Volver a:** [🏠 README Principal](../../README.md) 