# 🧮 Calculadora de Eficiencia - Automata Factory Game

**Versión:** 1.0  
**Última Actualización:** Enero 2025  
**Estado:** 📋 Definido y Validado

---

## 🎯 Propósito de la Calculadora

La **Calculadora de Eficiencia** es una herramienta integrada que ayuda a los jugadores a optimizar sus fábricas, analizar rendimiento y tomar decisiones estratégicas basadas en datos precisos.

---

## 📊 Métricas Principales

### **⚡ Eficiencia Energética**

#### **🔋 Consumo vs Producción**
```
Fórmula Base:
Eficiencia = (Energía Producida / Energía Consumida) × 100%

Rangos de Eficiencia:
├── 🔴 Crítica: <50% (Déficit energético)
├── 🟡 Baja: 50-75% (Ineficiente)
├── 🟢 Buena: 75-90% (Aceptable)
├── 🔵 Excelente: 90-95% (Optimizada)
└── 🟣 Perfecta: >95% (Máxima eficiencia)
```

#### **📈 Cálculo Detallado**
```
Variables:
├── E_prod = Energía producida por generadores (kW/h)
├── E_maq = Energía consumida por máquinas (kW/h)
├── E_auto = Energía consumida por autómatas (kW/h)
├── E_base = Energía base de estructuras (kW/h)
└── E_total = E_maq + E_auto + E_base

Eficiencia = (E_prod / E_total) × 100%
```

### **🏭 Throughput de Producción**

#### **📦 Materiales por Hora**
```
Fórmula de Throughput:
TPH = (Unidades Producidas / Tiempo Transcurrido) × 3600

Factores de Modificación:
├── Velocidad de Máquinas (0.5x - 2.0x)
├── Eficiencia de Autómatas (0.7x - 1.3x)
├── Disponibilidad de Materiales (0.0x - 1.0x)
├── Tiempo de Inactividad (0.8x - 1.0x)
└── Bonus de Investigación (1.0x - 1.5x)

TPH_Real = TPH_Base × Π(Factores)
```

#### **🎯 Análisis de Cuellos de Botella**
```
Identificación Automática:
├── Máquina más lenta en cadena
├── Autómata con mayor tiempo de ciclo
├── Almacén que se llena/vacía frecuentemente
├── Ruta de transporte más congestionada
└── Recurso con mayor escasez
```

### **💰 Retorno de Inversión (ROI)**

#### **📊 Cálculo Financiero**
```
ROI = ((Beneficio - Inversión) / Inversión) × 100%

Componentes:
├── Inversión = Costo_Materiales + Costo_Construcción + Costo_Investigación
├── Ingresos = Ventas_Marketplace + Valor_Producción_Interna
├── Gastos = Mantenimiento + Energía + Materiales_Consumidos
└── Beneficio = Ingresos - Gastos

Período de Análisis: 1 hora, 1 día, 1 semana
```

---

## 🔧 Herramientas de Optimización

### **🎯 Optimizador de Layout**

#### **📐 Algoritmo de Colocación**
```
Factores de Optimización:
├── Distancia mínima entre estructuras relacionadas
├── Flujo eficiente de materiales
├── Acceso óptimo para autómatas
├── Expansión futura planificada
└── Consumo energético minimizado

Puntuación de Layout:
Score = (Eficiencia × 0.4) + (Velocidad × 0.3) + (Costo × 0.2) + (Flexibilidad × 0.1)
```

#### **🗺️ Sugerencias de Mejora**
```
Recomendaciones Automáticas:
├── 📍 Reubicación de estructuras ineficientes
├── 🔄 Reorganización de rutas de autómatas
├── ⚡ Optimización de distribución energética
├── 📦 Mejora de ubicación de almacenes
└── 🏗️ Expansión estratégica de terreno
```

### **🤖 Optimizador de Autómatas**

#### **📝 Análisis de Programas**
```
Métricas de Código:
├── Complejidad Ciclomática (líneas de código)
├── Eficiencia de Rutas (distancia vs óptima)
├── Tiempo de Ejecución (ciclos por tarea)
├── Uso de Memoria (variables utilizadas)
└── Robustez (manejo de errores)

Puntuación de Programa:
Score = Σ(Métrica_i × Peso_i) / Σ(Peso_i)
```

#### **🔄 Sugerencias de Código**
```
Optimizaciones Automáticas:
├── 🚀 Simplificación de rutas redundantes
├── 🔄 Eliminación de bucles innecesarios
├── 📊 Optimización de condiciones
├── 🎯 Mejora de algoritmos de búsqueda
└── 🤝 Coordinación entre autómatas
```

---

## 📈 Simulador de Escenarios

### **🔮 Predicción de Rendimiento**

#### **📊 Modelos Predictivos**
```
Variables de Entrada:
├── Configuración actual de fábrica
├── Programas de autómatas
├── Disponibilidad de recursos
├── Condiciones de mercado
└── Objetivos de producción

Salidas del Modelo:
├── Producción estimada (próximas 24h)
├── Consumo energético proyectado
├── Cuellos de botella potenciales
├── ROI esperado
└── Tiempo hasta objetivos
```

#### **🎯 Análisis "What-If"**
```
Escenarios Simulables:
├── ➕ Agregar nueva máquina
├── 🤖 Aumentar número de autómatas
├── ⚡ Mejorar generación energética
├── 📦 Expandir capacidad de almacenamiento
├── 🧪 Aplicar nueva tecnología
└── 🏗️ Expandir a nuevo tile
```

### **📋 Comparador de Estrategias**

#### **⚖️ Análisis Comparativo**
```
Estrategia A vs Estrategia B:
├── 📊 Throughput: +15% vs +8%
├── ⚡ Eficiencia Energética: 92% vs 87%
├── 💰 ROI: 145% vs 132%
├── ⏱️ Tiempo de Implementación: 2h vs 45min
├── 🔧 Complejidad: Alta vs Media
└── 🎯 Recomendación: Estrategia A (Score: 8.7/10)
```

---

## 🎮 Casos de Uso Prácticos

### **🏭 Caso 1: Optimización de Línea de Acero**

#### **📋 Situación Inicial**
```
Configuración Actual:
├── 2 Extractores de Hierro (4 Fe/min cada uno)
├── 1 Extractor de Carbón (6 C/min)
├── 1 Horno de Acero (5 Acero/min, requiere 2 Fe + 1 C)
├── 3 Autómatas transportadores
└── Eficiencia actual: 67%
```

#### **🔍 Análisis de la Calculadora**
```
Problemas Identificados:
├── 🔴 Cuello de botella: Horno de Acero (capacidad insuficiente)
├── 🟡 Exceso de Carbón: +1 C/min sin usar
├── 🟡 Autómata #3: 23% tiempo inactivo
├── 🟢 Suministro de Hierro: Balanceado
└── 🔵 Rutas de transporte: Optimizadas

Recomendaciones:
├── ➕ Agregar 1 Horno de Acero adicional
├── 🔄 Reasignar Autómata #3 a otra tarea
├── 📊 Resultado esperado: 89% eficiencia
└── 💰 ROI proyectado: +34% en 2 horas
```

### **🏭 Caso 2: Decisión de Expansión**

#### **❓ Pregunta del Jugador**
```
Escenario: ¿Cuándo expandir a nuevo tile?

Variables Actuales:
├── Terreno actual: 85% utilizado
├── Producción: 45 unidades/hora
├── Demanda del mercado: 60 unidades/hora
├── Costo de expansión: 500 créditos
└── Créditos disponibles: 750
```

#### **🧮 Análisis de la Calculadora**
```
Simulación de Expansión:
├── 📈 Aumento de producción: +67% (75 unidades/hora)
├── ⚡ Consumo energético: +45%
├── 💰 Inversión requerida: 500 + 300 (nuevas máquinas) = 800 créditos
├── 🕐 Tiempo de recuperación: 3.2 horas
├── 📊 ROI a 24h: 156%
└── ✅ Recomendación: EXPANDIR AHORA

Justificación:
├── Demanda insatisfecha del 25%
├── ROI superior al 150%
├── Recursos suficientes disponibles
└── Tiempo de recuperación aceptable (<4h)
```

### **🏭 Caso 3: Optimización de Autómata**

#### **🤖 Programa Actual**
```pseudocode
// Autómata Recolector - Versión Original
MIENTRAS(VERDADERO) {
    MOVER(extractor_hierro)
    RECOGER("Hierro")
    MOVER(almacén_hierro)
    DEPOSITAR("Hierro")
    ESPERAR(2)
}

Métricas Actuales:
├── Ciclo completo: 12 segundos
├── Distancia por ciclo: 8 tiles
├── Eficiencia: 73%
└── Hierro transportado: 15 unidades/hora
```

#### **🔧 Optimización Sugerida**
```pseudocode
// Autómata Recolector - Versión Optimizada
inventario_lleno = FALSO
MIENTRAS(VERDADERO) {
    SI(NO inventario_lleno) {
        MOVER(extractor_hierro)
        MIENTRAS(MI_INVENTARIO.espacio_disponible() > 0 Y extractor_hierro.tiene_hierro()) {
            RECOGER("Hierro")
        }
        inventario_lleno = VERDADERO
    } SINO {
        MOVER(almacén_hierro)
        DEPOSITAR(TODOS)
        inventario_lleno = FALSO
    }
}

Métricas Proyectadas:
├── Ciclo completo: 8 segundos (-33%)
├── Distancia por ciclo: 6 tiles (-25%)
├── Eficiencia: 91% (+18%)
└── Hierro transportado: 22 unidades/hora (+47%)
```

---

## 🎯 Alertas y Notificaciones

### **⚠️ Sistema de Alertas Inteligentes**

#### **🔴 Alertas Críticas**
```
Problemas Urgentes:
├── 🔋 Déficit energético: <10% reserva
├── 📦 Almacén lleno: >95% capacidad
├── 🤖 Autómata bloqueado: >30 segundos inactivo
├── 🏭 Máquina averiada: Requiere mantenimiento
└── 💰 Fondos insuficientes: <100 créditos
```

#### **🟡 Alertas de Optimización**
```
Oportunidades de Mejora:
├── 📊 Eficiencia baja: <75% en alguna línea
├── 🎯 Cuello de botella: Detectado en producción
├── 💡 Mejora disponible: ROI >120%
├── 🔄 Ruta ineficiente: >150% distancia óptima
└── 📈 Demanda alta: Oportunidad de mercado
```

#### **🔵 Alertas Informativas**
```
Información Útil:
├── 🏆 Objetivo completado: Meta alcanzada
├── 🧪 Investigación lista: Nueva tecnología disponible
├── 📊 Reporte diario: Resumen de rendimiento
├── 🎯 Milestone: Hito de progresión alcanzado
└── 💰 Beneficio récord: Nuevo máximo de ingresos
```

---

## 📊 Dashboard de Métricas

### **📈 Vista General**
```
Panel Principal:
├── 📊 Eficiencia Global: 87% ↗️ (+3%)
├── ⚡ Balance Energético: +45 kW/h ↗️
├── 💰 Ingresos/Hora: 234 créditos ↗️ (+12%)
├── 🏭 Utilización: 92% ↗️ (+5%)
├── 🤖 Autómatas Activos: 15/18 ↗️
└── 🎯 Progreso Objetivo: 67% ↗️ (+8%)
```

### **🔍 Vista Detallada**
```
Análisis Profundo:
├── 📦 Throughput por Material:
│   ├── Hierro: 45/h (↗️ +5%)
│   ├── Acero: 22/h (↗️ +8%)
│   └── Componentes: 12/h (↘️ -2%)
├── ⚡ Consumo por Categoría:
│   ├── Máquinas: 67% (↗️ +3%)
│   ├── Autómatas: 28% (↘️ -1%)
│   └── Estructuras: 5% (→ 0%)
└── 💰 ROI por Inversión:
    ├── Última expansión: 145% ↗️
    ├── Nuevos autómatas: 167% ↗️
    └── Upgrade máquinas: 134% ↗️
```

---

## 🔧 Configuración y Personalización

### **⚙️ Parámetros Ajustables**

#### **📊 Frecuencia de Análisis**
```
Opciones de Actualización:
├── Tiempo Real: Cada 1 segundo (Alto CPU)
├── Rápida: Cada 5 segundos (Recomendado)
├── Normal: Cada 15 segundos (Balanceado)
├── Lenta: Cada 30 segundos (Bajo CPU)
└── Manual: Solo cuando se solicite
```

#### **🎯 Sensibilidad de Alertas**
```
Niveles de Sensibilidad:
├── Muy Alta: Alerta por cambios >1%
├── Alta: Alerta por cambios >5%
├── Media: Alerta por cambios >10% (Recomendado)
├── Baja: Alerta por cambios >20%
└── Muy Baja: Solo alertas críticas
```

### **📱 Exportación de Datos**

#### **📄 Formatos Disponibles**
```
Opciones de Exportación:
├── 📊 CSV: Para análisis en Excel
├── 📋 JSON: Para herramientas externas
├── 📈 PDF: Reportes formateados
├── 🖼️ PNG: Gráficos e imágenes
└── 📱 Compartir: Redes sociales
```

---

**Estado:** 📋 **DEFINIDO Y VALIDADO**  
**Próxima Revisión:** Abril 2025  
**Responsable:** Equipo de Analytics

---

**Volver a:** [🏠 README Principal](../../README.md) | **Ver también:** [🎮 Gameplay](gameplay.md) | **Materiales:** [🌳 Árbol de Materiales](materials-tree.md) 