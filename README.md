# 🏭 Automata Factory Game

Un juego de automatización industrial donde los jugadores programan autómatas para transportar materiales, transformarlos y crear mejores autómatas que pueden venderse a otros jugadores.

## 🎯 Concepto del Juego

- **Fábrica automatizada** con autómatas programables que transportan materiales
- **Programación por pseudocódigo** - Los jugadores escriben código paso a paso para controlar sus autómatas
- **Cadena de producción** para transformar materiales básicos en autómatas avanzados
- **Economía entre jugadores** vendiendo autómatas mejorados a través de marketplace online
- **Expansión de terreno** para hacer crecer la fábrica
- **🌐 Sistema multiplayer** con guardado en la nube y una fábrica por usuario

## 📚 Documentación

### 🗺️ **Roadmap y Planificación**
- **[📋 Roadmap General](docs/roadmap/overview.md)** - Visión general del desarrollo
- **[📅 Timeline y Cronograma](docs/roadmap/timeline.md)** - Fechas y estimaciones detalladas
- **[🎯 Releases y Milestones](docs/roadmap/releases.md)** - Versiones y características principales

### 🏗️ **Fases de Desarrollo**
- **[🚧 Fase 0: Menú Principal](docs/phases/phase-0.md)** - Fundación del proyecto y UI base (EN DESARROLLO)
- **[❌ Fase 1: Servidor Backend](docs/phases/phase-1.md)** - Backend para estado del juego por usuario (NO IMPLEMENTADO)
- **[❌ Fase 2: Terreno/Foundations](docs/phases/phase-2.md)** - Sistema de cimientos cuadriculados (NO IMPLEMENTADO)
- **[❌ Fase 3: Autómatas](docs/phases/phase-3.md)** - Entidades móviles básicas (NO IMPLEMENTADO)
- **[❌ Fase 4: Programación de Autómatas](docs/phases/phase-4.md)** - Pseudo-lenguaje y editor visual (NO IMPLEMENTADO)
- **[❌ Fase 5: Materiales](docs/phases/phase-5.md)** - Sistema de recursos y materiales (NO IMPLEMENTADO)
- **[❌ Fase 6: Marketplace](docs/phases/phase-6.md)** - Intercambio entre usuarios (NO IMPLEMENTADO)
- **[❌ Fase 7: Producción](docs/phases/phase-7.md)** - Cadenas de producción y fábricas (NO IMPLEMENTADO)
- **[❌ Fase 8: Calculadora y Anotaciones](docs/phases/phase-8.md)** - Herramientas de planificación (NO IMPLEMENTADO)

### 🏛️ **Arquitectura Técnica**
- **[🔧 Stack Tecnológico](docs/architecture/tech-stack.md)** - Unity, C#, ASP.NET Core, MongoDB
- **[🗄️ Base de Datos](docs/architecture/database.md)** - Modelos y esquemas MongoDB
- **[🌐 API REST](docs/architecture/api.md)** - Endpoints y servicios
- **[🔐 Seguridad](docs/architecture/security.md)** - Autenticación y validación

### 🎨 **Assets y Recursos**
- **[🏭 Materiales y Transformación](docs/assets/materials-tree.md)** - Árbol completo de producción
- **[🎮 Gameplay](docs/assets/gameplay.md)** - Mecánicas y flujo de juego
- **[🧮 Calculadora Integrada](docs/assets/calculator.md)** - Herramienta de optimización y análisis
- **[💰 Costos y Infraestructura](docs/assets/costs.md)** - Estimaciones económicas

### 📋 **Reorganización del Proyecto**
- **[🗂️ Nueva Estructura de Fases](docs/phases/NUEVA-ESTRUCTURA-FASES.md)** - Documentación completa de la reorganización

### 🛠️ **Desarrollo y Lineamientos**
- **[🎯 Filosofía de Desarrollo](docs/development/philosophy.md)** - Principios, flujo de trabajo y convenciones
- **[⚡ Guía de Referencia Rápida](docs/development/quick-reference.md)** - Comandos y emojis para commits
- **[🎨 Convenciones de Código](docs/development/coding-standards.md)** - Estándares y mejores prácticas
- **[🔄 Proceso de Review](docs/development/review-process.md)** - Criterios de calidad y merge

## 🚀 Estado Actual

**Fase 0 en desarrollo** - Implementando menú principal y fundación del proyecto.  
**Próximo objetivo:** Completar la experiencia de usuario base y servidor backend.  
**Meta principal:** 🎯 **Alcanzar la Fase 4 para el primer release jugable (Alpha v0.1)**

## 🛠️ Tecnologías Utilizadas

- **Unity 2022.3+** - Motor de juego
- **C#** - Lenguaje de programación principal
- **ASP.NET Core** - Backend API REST
- **MongoDB** - Base de datos NoSQL
- **Custom Scripting Language** - Para programar autómatas

## 📁 Estructura del Proyecto

```
Assets/
├── Scripts/
│   ├── UI/
│   │   ├── MainMenu/         # Fase 0 - Menú Principal
│   │   ├── Components/       # Componentes UI reutilizables
│   │   └── Core/            # Gestión de UI y escenas
│   ├── Backend/             # Fase 1 - Cliente para servidor backend
│   ├── Core/                # Fase 2 - Fundaciones cuadriculadas (cimientos)
│   ├── Automata/            # Fase 3+ - Autómatas y lógica
│   ├── Programming/         # Fase 4 - Sistema de programación
│   ├── Materials/           # Fase 5 - Materiales y transformaciones
│   ├── Marketplace/         # Fase 6 - Sistema de intercambio
│   ├── Production/          # Fase 7 - Máquinas y producción
│   ├── Tools/               # Fase 8 - Calculadora y anotaciones
│   └── Editor/              # Herramientas de desarrollo
├── Scenes/
│   ├── MainMenu.unity       # Fase 0 - Menú principal
│   └── Gameplay.unity       # Fase 2+ - Juego principal
├── UI/
│   ├── Prefabs/             # Prefabs de interfaz
│   ├── Sprites/             # Sprites de UI
│   └── Fonts/               # Fuentes del juego
└── Audio/
    ├── Music/               # Música de fondo
    └── SFX/                 # Efectos de sonido

Backend/
├── AutomataFactoryAPI/      # Fase 1 - Servidor ASP.NET Core
│   ├── Controllers/         # Controladores de API
│   ├── Models/              # Modelos de datos
│   ├── Services/            # Lógica de negocio
│   └── Data/                # Acceso a datos MongoDB

docs/
├── phases/          # Documentación de cada fase
├── roadmap/         # Planificación y timeline
├── architecture/    # Documentación técnica
└── assets/          # Recursos y gameplay
```

## 🎮 Cómo Jugar (Visión Final)

1. **Diseña tu fábrica** expandiendo el terreno según tus necesidades
2. **Programa tus autómatas** usando pseudocódigo para automatizar tareas
3. **Optimiza la producción** creando cadenas eficientes de materiales
4. **Mejora tus autómatas** con mejores componentes y programas más inteligentes
5. **Compite en el marketplace** vendiendo tus mejores creaciones
6. **Expande tu imperio** reinvirtiendo ganancias en tecnología y expansión

## 📈 Progreso de Desarrollo

| Fase | Nombre | Estado | Progreso | Fecha Estimada |
|------|--------|--------|----------|----------------|
| **Fase 0** | Menú Principal | 🚧 En Desarrollo | 0% | Enero 2025 |
| **Fase 1** | Servidor Backend | 🚧 En Desarrollo | 15% | Enero-Abril 2025 |
| **Fase 2** | Terreno/Foundations | ❌ No Implementado | 0% | Mayo-Julio 2025 |
| **Fase 3** | Autómatas | ❌ No Implementado | 0% | Agosto-Septiembre 2025 |
| **Fase 4** | Programación de Autómatas | ❌ No Implementado | 0% | Octubre-Diciembre 2025 |
| **Fase 5** | Materiales | ❌ No Implementado | 0% | Enero-Febrero 2026 |
| **Fase 6** | Marketplace | ❌ No Implementado | 0% | Marzo-Abril 2026 |
| **Fase 7** | Producción | ❌ No Implementado | 0% | Mayo-Julio 2026 |
| **Fase 8** | Calculadora y Anotaciones | 🎯 Objetivo | 0% | **Agosto 2026** |

## 🎯 Enfoque de Desarrollo

### **🚀 Nueva Estructura de Fases (Reorganizada Enero 2025)**
1. **Fase 0 (Menú Principal)** - Establecer identidad visual y experiencia de usuario
2. **Fase 1 (Servidor Backend)** - Infraestructura multiplayer y guardado en la nube
3. **Fase 2 (Terreno/Foundations)** - Implementar cimientos cuadriculados donde se asientan objetos
4. **Fase 3 (Autómatas)** - Entidades móviles básicas
5. **Fase 4 (Programación de Autómatas)** - Corazón del juego: pseudo-lenguaje y editor visual
6. **Fase 5 (Materiales)** - Sistema de recursos y materiales
7. **Fase 6 (Marketplace)** - Intercambio social entre jugadores
8. **Fase 7 (Producción)** - Cadenas de producción y fábricas avanzadas
9. **Fase 8 (Calculadora y Anotaciones)** - Herramientas de planificación y optimización

### **💡 Ventajas de la Nueva Estructura**
- **Backend desde el inicio** - Guardado en la nube y base para multiplayer
- **Experiencia completa** desde el primer momento
- **Base sólida** para todo el desarrollo posterior
- **Escalabilidad** preparada para funcionalidades sociales
- **Feedback temprano** sobre UX y diseño

### **🔗 Dependencias Críticas**
- **Fase 1** es fundamental para **Fase 6** (Marketplace necesita backend)
- **Fase 2** es base para **Fases 3-8** (todo necesita el terreno)
- **Fase 4** es el corazón del juego (programación de autómatas)

## 🤝 Contribución

Este es un proyecto personal de desarrollo indie. La documentación está organizada para facilitar el seguimiento del progreso y la planificación.

## 📄 Licencia

Proyecto personal - Todos los derechos reservados.

---

*Desarrollado con ❤️ para los amantes de la programación y la automatización* 