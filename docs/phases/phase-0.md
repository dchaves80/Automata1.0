# 🚀 Fase 0: Menú Principal - Fundación del Proyecto

**Estado:** 🚧 EN DESARROLLO  
**Duración:** Enero 2025 (1 mes)  
**Horas Estimadas:** 40 horas  
**Progreso:** 0% 🚧

---

## 🎯 Objetivos Principales

**Fase 0** es la **verdadera fundación** del proyecto. Crear una **experiencia de usuario completa y profesional** desde el primer momento, estableciendo la identidad visual del juego y proporcionando una base sólida para todas las futuras funcionalidades.

### **🎮 Visión de la Fase 0**

La Fase 0 será el **primer contacto** del jugador con **Automata Factory Game**, por lo que debe:

1. **Transmitir la esencia** del juego de fábrica y automatización
2. **Ofrecer navegación intuitiva** y profesional
3. **Establecer la identidad visual** que se mantendrá en todo el juego
4. **Preparar la arquitectura UI** para futuras expansiones
5. **Crear la base técnica** para todo el desarrollo posterior
6. **Implementar sistema de autenticación** moderno y seguro

---

## 🎨 Diseño Visual y UX

### **🎭 Identidad Visual**
```
Estética del Juego:
├── 🏭 Tema Industrial Moderno
├── 🎨 Paleta de Colores Tecnológica
├── 🔧 Iconografía de Automatización
├── 💡 Iluminación Futurista
├── 🎯 Diseño Minimalista y Funcional
└── 🎮 Vista Top-Down con Pixel Art
```

### **🎨 Estilo Visual del Juego**
- **Vista:** Top-down (desde arriba) - Sin perspectivas
- **Arte:** Pixel art 2D clásico
- **Perspectiva:** Vista plana, sin elementos 3D
- **Grid:** Cuadrícula clara y visible
- **Estilo:** Minimalista pero funcional

### **🎨 Paleta de Colores Principal**
- **Primario:** `#2C3E50` (Azul Oscuro Industrial)
- **Secundario:** `#3498DB` (Azul Tecnológico)
- **Acento:** `#E74C3C` (Rojo de Alerta/Energía)
- **Neutro:** `#ECF0F1` (Gris Claro)
- **Fondo:** `#34495E` (Gris Azulado)

### **🖼️ Elementos Visuales**
- **Fondo:** Animación sutil de engranajes y circuitos
- **Logo:** Diseño moderno con elementos de automatización
- **Botones:** Estilo industrial con efectos hover suaves
- **Transiciones:** Animaciones fluidas y profesionales

---

## 🏗️ Arquitectura del Menú

### **📱 Estructura de Pantallas (NUEVO FLUJO)**

```
🏠 AUTOMATA FACTORY - Menú Principal
├── 🔐 Estado NO AUTENTICADO
│   ├── [🔑 INICIAR SESIÓN]     # Botón principal
│   ├── [📝 REGISTRARSE]        # Para nuevos usuarios
│   ├── [⚙️ CONFIGURACIÓN]      # Settings básicos
│   └── [❌ SALIR]              # Cerrar aplicación
└── ✅ Estado AUTENTICADO
    ├── Bienvenido, [Usuario]    # Saludo personalizado
    ├── [🚀 COMENZAR JUEGO]      # Va directo al juego único
    ├── [👤 MI PERFIL]           # Stats y progreso
    ├── [⚙️ CONFIGURACIÓN]       # Settings completos
    └── [🚪 CERRAR SESIÓN]       # Logout
```

### **🔐 Pantallas de Autenticación**

```
🔑 Login
├── 📧 Email/Usuario
├── 🔒 Contraseña
├── [💾 Recordarme]
├── [🔑 INICIAR SESIÓN]
├── [📝 ¿No tienes cuenta?]
└── [🔄 ¿Olvidaste tu contraseña?]

📝 Registro
├── 👤 Nombre de Usuario
├── 📧 Email
├── 🔒 Contraseña
├── 🔒 Confirmar Contraseña
├── [✅ Acepto términos]
├── [📝 REGISTRARSE]
└── [🔑 ¿Ya tienes cuenta?]
```

### **🎯 Funcionalidades Core**

#### **🔐 Sistema de Autenticación**
- **Login obligatorio** para acceder al juego
- **Registro de nuevos usuarios** con validación
- **Recordar sesión** para comodidad del usuario
- **Recuperación de contraseña** por email
- **Validación en tiempo real** de formularios

#### **🚀 Comenzar Juego (Post-Login)**
- **Un juego único por usuario** - no hay múltiples partidas
- **Carga automática** del progreso del usuario
- **Continuidad perfecta** - siempre donde lo dejaste
- **Sincronización en la nube** transparente

#### **👤 Perfil de Usuario**
- **Estadísticas de progreso** (tiempo jugado, logros)
- **Información de la fábrica** (tamaño, producción)
- **Historial de sesiones** y actividad
- **Configuración de cuenta** (cambiar contraseña, email)

#### **⚙️ Configuración Completa**
- **Gráficos:** Calidad, resolución, fullscreen
- **Audio:** Música, efectos, volumen maestro
- **Controles:** Keybindings personalizables
- **Gameplay:** Velocidad, dificultad, ayudas
- **Cuenta:** Configuración de perfil y privacidad

---

## 🛠️ Implementación Técnica

### **📁 Estructura de Archivos**
```
Assets/
├── Scripts/
│   ├── UI/
│   │   ├── MainMenu/
│   │   │   ├── MainMenuManager.cs      # Gestión principal del menú
│   │   │   ├── AuthenticationUI.cs     # UI de login/registro
│   │   │   ├── UserProfileUI.cs        # Interfaz de perfil
│   │   │   ├── MenuNavigator.cs        # Navegación entre pantallas
│   │   │   └── SettingsManager.cs      # Gestión de configuración
│   │   ├── Components/
│   │   │   ├── AnimatedButton.cs       # Botones con animaciones
│   │   │   ├── FormValidator.cs        # Validación de formularios
│   │   │   ├── MenuTransition.cs       # Transiciones suaves
│   │   │   └── UIEffects.cs            # Efectos visuales
│   │   └── Core/
│   │       ├── UIManager.cs            # Gestión global de UI
│   │       ├── SceneLoader.cs          # Carga de escenas
│   │       └── SessionManager.cs       # Gestión de sesión
│   └── Backend/
│       ├── AuthManager.cs              # Comunicación con backend
│       ├── UserDataManager.cs          # Gestión de datos de usuario
│       └── APIClient.cs                # Cliente HTTP
├── Scenes/
│   ├── MainMenu.unity                  # Menú principal
│   ├── Authentication.unity            # Pantallas de login/registro
│   └── UserProfile.unity               # Perfil de usuario
├── UI/
│   ├── Prefabs/
│   │   ├── LoginPanel.prefab           # Panel de login
│   │   ├── RegisterPanel.prefab        # Panel de registro
│   │   ├── UserProfilePanel.prefab     # Panel de perfil
│   │   └── MenuButtons.prefab          # Botones del menú
│   ├── Sprites/
│   └── Fonts/
└── Audio/
    ├── Music/
    └── SFX/
```

### **🎯 Componentes Principales**

#### **🎮 MainMenuManager.cs**
```csharp
Responsabilidades:
├── 🔐 Gestión de estado de autenticación
├── 🔄 Navegación entre pantallas autenticadas/no autenticadas
├── 💾 Carga/guardado de configuración
├── 🎵 Control de audio
├── 🎨 Efectos visuales
└── 🌐 Comunicación con backend (Fase 1)
```

#### **🔐 AuthenticationUI.cs**
```csharp
Funcionalidades:
├── 📝 Formularios de login y registro
├── ✅ Validación en tiempo real
├── 🔄 Comunicación con AuthManager
├── 💾 Recordar sesión
├── 🎨 Feedback visual de estados
└── 🔄 Recuperación de contraseña
```

#### **👤 UserProfileUI.cs**
```csharp
Características:
├── 📊 Visualización de estadísticas
├── 🏭 Información de la fábrica
├── ⚙️ Configuración de cuenta
├── 📈 Progreso y logros
└── 🔄 Sincronización con backend
```

#### **🧭 MenuNavigator.cs**
```csharp
Funcionalidades:
├── 📱 Stack de pantallas con estados
├── 🔄 Transiciones animadas
├── ⌨️ Navegación por teclado
├── 🎯 Gestión de focus
└── 🔐 Control de acceso por autenticación
```

---

## 🎮 Experiencia de Usuario

### **🚀 Flujo de Usuario Ideal (NUEVO)**

1. **Inicio del Juego**
   - Logo animado con sonido
   - Verificación de sesión guardada
   - Transición al estado apropiado (login/menú autenticado)

2. **Primera Vez (No Autenticado)**
   - Pantalla de bienvenida clara
   - Opciones de Login/Registro prominentes
   - Configuración básica disponible

3. **Login/Registro**
   - Formularios intuitivos y validados
   - Feedback inmediato de errores
   - Proceso rápido y sin fricciones

4. **Post-Autenticación**
   - Saludo personalizado al usuario
   - Botón "Comenzar Juego" prominente
   - Acceso a perfil y configuración completa

5. **Comenzar Juego**
   - Carga automática del progreso único del usuario
   - Transición épica al gameplay
   - Sincronización transparente con la nube

### **🎨 Animaciones y Efectos**

#### **🌟 Efectos Visuales**
- **Partículas sutiles** en el fondo
- **Glow effects** en botones activos
- **Parallax** en elementos de fondo
- **Smooth transitions** entre pantallas

#### **🔊 Audio Design**
- **Música ambiental** industrial/electrónica
- **SFX de botones** con feedback táctil
- **Sonidos de transición** profesionales
- **Audio reactivo** a las acciones del usuario

---

## 📊 Plan de Desarrollo

### **📅 Cronograma (4 Semanas)**

| Semana | Tarea Principal | Horas | Entregables |
|--------|----------------|-------|-------------|
| **1** | Diseño UI y Assets | 10h | Mockups, Sprites, Paleta |
| **2** | Implementación Core | 12h | MenuManager, Navigator |
| **3** | Funcionalidades Avanzadas | 10h | Settings, SaveGame |
| **4** | Polish y Testing | 8h | Animaciones, Audio, QA |

### **🎯 Hitos Importantes**

#### **✅ Semana 1: Fundación Visual**
- [ ] Diseño completo de todas las pantallas
- [ ] Creación de assets gráficos
- [ ] Definición de paleta de colores
- [ ] Prototipo navegable en Unity

#### **✅ Semana 2: Funcionalidad Core**
- [ ] Sistema de navegación funcional
- [ ] Transiciones básicas implementadas
- [ ] Estructura de código establecida
- [ ] Integración con Unity UI

#### **✅ Semana 3: Características Avanzadas**
- [ ] Sistema de configuración completo
- [ ] Gestión de partidas guardadas
- [ ] Audio integrado
- [ ] Efectos visuales básicos

#### **✅ Semana 4: Pulido Final**
- [ ] Animaciones suaves y profesionales
- [ ] Audio design completo
- [ ] Testing exhaustivo
- [ ] Optimización de rendimiento

---

## 🔧 Especificaciones Técnicas

### **🎮 Compatibilidad**
- **Unity Version:** 2022.3 LTS+
- **Render Pipeline:** URP (Universal Render Pipeline)
- **Plataformas:** PC (Windows, Mac, Linux)
- **Resoluciones:** 1920x1080 a 3840x2160
- **Aspect Ratios:** 16:9, 16:10, 21:9

### **⚡ Rendimiento**
- **Target FPS:** 60 FPS constantes
- **Memoria:** <500MB en menú
- **Carga:** <3 segundos entre pantallas
- **Responsive:** <100ms de latencia en UI

### **💾 Persistencia de Datos**
```csharp
Datos Guardados:
├── 🎨 Configuración gráfica
├── 🔊 Preferencias de audio
├── ⌨️ Keybindings personalizados
├── 🎮 Configuración de gameplay
├── 💾 Lista de partidas guardadas
└── 📊 Estadísticas de uso
```

---

## 🚀 Importancia de la Fase 0

### **🎯 Por qué empezar aquí:**
1. **Primera impresión profesional** desde el inicio
2. **Base sólida** para toda la UI del juego
3. **Experiencia completa** incluso sin gameplay
4. **Feedback temprano** de usuarios sobre UX
5. **Motivación del equipo** al ver resultados inmediatos

### **🔮 Preparación para Futuras Fases**
1. **Arquitectura UI** reutilizable en todo el juego
2. **Sistema de configuración** extensible
3. **Gestión de escenas** preparada para gameplay
4. **Identidad visual** establecida y consistente
5. **Patrones de código** definidos desde el inicio

### **🎮 Impacto en el Desarrollo**
1. **Claridad de visión** del producto final
2. **Base técnica** sólida para futuras fases
3. **Experiencia de usuario** como prioridad desde el inicio
4. **Fundación sólida** para todo el proyecto

---

## 🎯 Conexión con Fases Posteriores

### **🔗 Fase 0 → Fase 1**
- **Transición:** Del menú al gameplay
- **Integración:** Sistema de guardado funcional
- **Preparación:** Arquitectura lista para terreno

### **🔗 Fase 0 → Todas las Fases**
- **UI Consistente:** Misma identidad visual
- **Configuración:** Settings aplicables a todo el juego
- **Navegación:** Patrones reutilizables

---

## 🎯 Próximos Pasos

### **🚀 Inmediato (Esta Semana)**
1. **Crear mockups** de todas las pantallas
2. **Definir paleta de colores** final
3. **Configurar escenas** en Unity
4. **Implementar navegación** básica

### **🔮 Siguiente Fase (Fase 1)**
Una vez completada la Fase 0, procederemos con:
1. **Sistema de terreno** (nueva Fase 1)
2. **Gameplay básico** 
3. **Integración** menú ↔ juego
4. **Sistema de guardado** funcional

---

**Estado Actual:** 🚧 **FASE 0 - INICIANDO DESARROLLO**  
**Prioridad:** 🔥 **MÁXIMA**  
**Próximo hito:** 🎨 **Diseño Visual Completo**

---

**Siguiente:** [❌ Fase 1: Fundaciones de Terreno](phase-1.md) | **Roadmap:** [📋 Roadmap General](../roadmap/overview.md) | **Volver a:** [🏠 README Principal](../../README.md) 