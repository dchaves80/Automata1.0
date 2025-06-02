# 🚧 Fase 1: Servidor Backend (EN DESARROLLO)

**Estado:** 🚧 EN DESARROLLO  
**Duración:** Enero - Abril 2025 (4 meses)  
**Horas Totales:** 5 horas  
**Progreso:** 15% 🚧

---

## 🎯 Objetivos Principales

La **Fase 1** establecerá el **servidor backend** que alojará el estado único del juego por usuario y proporcionará los servicios fundamentales para el sistema de autenticación obligatoria. Esta fase se ejecutará **en paralelo con la Fase 0** (Menú Principal con Login).

### **🌐 Concepto del Backend**
El **servidor backend** será el **corazón del sistema de usuario único** con las siguientes responsabilidades:

#### **👤 Gestión de Usuarios (OBLIGATORIA)**
- **Autenticación obligatoria** - no se puede jugar sin cuenta
- **Un juego único por usuario** - no hay múltiples partidas
- **Perfiles de usuario** con estadísticas y progreso
- **Sistema de sesiones** persistentes y seguras

#### **💾 Estado Único del Juego por Usuario**
- **Una fábrica por usuario** - concepto simplificado
- **Guardado automático** en la nube del progreso
- **Sincronización continua** entre sesiones
- **Recuperación automática** al hacer login

#### **🔐 Sistema de Autenticación Robusto**
- **Login obligatorio** para acceder al juego
- **Registro de nuevos usuarios** con validación
- **Gestión de sesiones** con JWT tokens
- **Recuperación de contraseñas** por email

#### **🔮 Servicios Futuros**
- **Base preparada** para marketplace (Fase 6)
- **Infraestructura** para intercambio de autómatas
- **APIs extensibles** para futuras funcionalidades sociales

### **🏗️ Sistemas Por Implementar**

#### **❌ API REST Backend**
- **Tecnología:** ASP.NET Core + C#
- **Base de Datos:** MongoDB
- **Funcionalidad:** Endpoints para autenticación y estado único del juego
- **Estado:** ❌ NO IMPLEMENTADO
- **Dependencia:** En desarrollo paralelo con Fase 0

#### **❌ Sistema de Autenticación Obligatoria**
- **Funcionalidad:** Login/registro obligatorio, gestión de sesiones
- **Seguridad:** JWT tokens, encriptación BCrypt, validación de email
- **Características:** Recordar sesión, recuperación de contraseña
- **Estado:** ❌ NO IMPLEMENTADO

#### **❌ Gestión de Estado Único del Juego**
- **Funcionalidad:** Una fábrica por usuario, guardado automático
- **Estructura:** Datos de terreno, autómatas, materiales, configuración
- **Sincronización:** Automática y transparente
- **Estado:** ❌ NO IMPLEMENTADO

#### **✅ Base de Datos MongoDB**
- **Colecciones:** Users, UserGameState (único), Sessions
- **Funcionalidad:** Almacenamiento escalable con un documento por usuario
- **Estado:** ✅ **COMPLETADO** - MongoDB instalado en VPS (puerto 27020)
- **Configuración:** 
  - **Host:** VPS Linux
  - **Puerto:** 27020
  - **Usuario:** edering
  - **Base de datos:** automata_factory
  - **Datos persistentes:** /mongodb

#### **❌ Integración con Unity**
- **Cliente:** Comunicación Unity ↔ Backend con autenticación
- **Funcionalidad:** Login automático, sincronización del estado único
- **Estado:** ❌ NO IMPLEMENTADO

---

## 📊 Plan de Implementación

### **🔧 Tareas Pendientes**
```
Sistemas a Implementar (Fase 1):
├── ❌ Servidor ASP.NET Core
│   ├── 🔧 Configuración inicial del proyecto
│   ├── 🌐 Controllers para autenticación obligatoria
│   ├── 🔐 Middleware de autenticación JWT
│   └── 📧 Sistema de email para recuperación
├── ✅ Base de datos MongoDB (COMPLETADO)
│   ├── ✅ Instalación en VPS Linux
│   ├── ✅ Configuración de puerto 27020
│   ├── ✅ Usuario y contraseña configurados
│   ├── 🔧 Esquema de usuario único (pendiente)
│   ├── 🔧 Configuración de conexión desde API (pendiente)
│   ├── 🔧 Modelo de estado único por usuario (pendiente)
│   └── 🔧 Índices de seguridad (pendiente)
├── ❌ Sistema de autenticación obligatoria
│   ├── 👤 Registro con validación de email
│   ├── 🔑 Login obligatorio con JWT
│   ├── 💾 Recordar sesión automáticamente
│   ├── 🔄 Recuperación de contraseña
│   └── 🛡️ Validación y seguridad robusta
├── ❌ APIs de estado único del juego
│   ├── 💾 Guardar progreso automático
│   ├── 📥 Cargar estado único al login
│   ├── 🔄 Sincronización continua
│   └── 🏭 Gestión de fábrica única
├── ❌ Cliente Unity con autenticación
│   ├── 🌐 HTTP client con JWT
│   ├── 🔐 Gestión automática de sesiones
│   ├── 🔄 Sincronización transparente
│   └── 📱 Integración con UI de Fase 0
└── ❌ Testing y deployment
```

### **📁 Estructura del Proyecto Backend**
```
AutomataFactoryAPI/ (NO EXISTE)
├── Controllers/
│   ├── AuthController.cs         # Login/registro obligatorio
│   ├── UserController.cs         # Gestión de perfil único
│   ├── GameStateController.cs    # Estado único del juego
│   └── PasswordController.cs     # Recuperación de contraseña
├── Models/
│   ├── User.cs                   # Modelo de usuario
│   ├── UserGameState.cs          # Estado único del juego
│   ├── LoginRequest.cs           # DTOs de autenticación
│   ├── RegisterRequest.cs        # DTOs de registro
│   └── GameStateData.cs          # Estructura de datos del juego
├── Services/
│   ├── AuthService.cs            # Lógica de autenticación
│   ├── UserService.cs            # Lógica de usuarios
│   ├── GameStateService.cs       # Lógica de estado único
│   ├── EmailService.cs           # Envío de emails
│   └── JwtService.cs             # Gestión de tokens JWT
├── Data/
│   ├── MongoContext.cs           # Contexto de MongoDB
│   ├── UserRepository.cs         # Repositorio de usuarios
│   └── GameStateRepository.cs    # Repositorio de estado único
├── Middleware/
│   ├── JwtMiddleware.cs          # Middleware de autenticación
│   └── ErrorHandlingMiddleware.cs # Manejo de errores
└── Program.cs                    # Configuración principal
```

### **📁 Integración con Unity**
```
Assets/Scripts/Backend/ (NO EXISTE)
├── AuthManager.cs                # Gestión de autenticación
├── APIClient.cs                  # Cliente HTTP con JWT
├── GameStateSync.cs              # Sincronización automática
├── SessionManager.cs             # Gestión de sesiones
├── UserProfileManager.cs         # Gestión de perfil
└── Models/
    ├── LoginData.cs              # Datos de login
    ├── UserProfile.cs            # Perfil de usuario
    └── GameStateData.cs          # Estado del juego
```

---

## 🔗 Dependencias de Fase 0

### **✅ Requisitos Previos (de Fase 0):**
- ✅ **UI de login/registro** obligatorio en el menú principal
- ✅ **Pantallas de autenticación** con validación
- ✅ **Gestión de estados** (autenticado/no autenticado)
- ✅ **Sistema de configuración** para URLs del servidor
- ✅ **Transiciones** entre estados de autenticación

### **🔄 Integración con Fase 0:**
- **Login Obligatorio:** No se puede acceder al juego sin autenticación
- **Estado Único:** Botón "Comenzar Juego" carga la fábrica única del usuario
- **Perfil:** Información del usuario y estadísticas
- **Sesiones:** Recordar login automáticamente

---

## 🚀 Preparación para Fases Futuras

### **🎯 Fase 2 (Terreno/Foundations):**
- **Estado Único:** El terreno se guarda como parte del estado único del usuario
- **Sincronización:** Cambios automáticos sin intervención del usuario
- **Persistencia:** No hay múltiples partidas, solo una fábrica por usuario

### **🎯 Fase 6 (Marketplace):**
- **Usuarios Únicos:** Cada usuario tiene una identidad clara para comercio
- **Fábricas Únicas:** Intercambio entre fábricas únicas de diferentes usuarios
- **Autenticación:** Base sólida para transacciones seguras

### **🎯 Escalabilidad:**
- **Un Usuario = Una Fábrica:** Modelo simple y escalable
- **APIs Preparadas:** Endpoints listos para funcionalidades sociales
- **Base de Datos:** Esquema optimizado para crecimiento

---

## 🛠️ Stack Tecnológico

### **🖥️ Backend**
- **Framework:** ASP.NET Core 8.0
- **Lenguaje:** C#
- **Base de Datos:** MongoDB (un documento por usuario)
- **Autenticación:** JWT + BCrypt + Email verification
- **Email:** SendGrid/SMTP para recuperación de contraseñas
- **Hosting:** Azure/AWS (por definir)

### **📱 Cliente Unity**
- **HTTP Client:** UnityWebRequest con JWT automático
- **Serialización:** Newtonsoft.Json
- **Autenticación:** JWT storage persistente
- **Sincronización:** Automática y transparente

---

## 🔐 Modelo de Datos

### **👤 Usuario**
```csharp
User:
├── 🆔 UserId (ObjectId)          # ID único del usuario
├── 👤 Username (string)          # Nombre de usuario único
├── 📧 Email (string)             # Email único y verificado
├── 🔒 PasswordHash (string)      # Contraseña encriptada
├── ✅ EmailVerified (bool)       # Email verificado
├── 📅 CreatedAt (DateTime)       # Fecha de registro
├── 📅 LastLoginAt (DateTime)     # Último login
├── 🎮 GameStateId (ObjectId)     # Referencia al estado único del juego
└── 📊 Profile                    # Información del perfil
    ├── 🏭 FactoryName (string)   # Nombre de la fábrica
    ├── ⏱️ TotalPlayTime (int)     # Tiempo total jugado
    ├── 📈 Level (int)            # Nivel del jugador
    └── 🏆 Achievements (array)   # Logros obtenidos
```

### **🎮 Estado Único del Juego**
```csharp
UserGameState:
├── 🆔 GameStateId (ObjectId)     # ID único del estado
├── 👤 UserId (ObjectId)          # Propietario del estado
├── 📅 LastSaved (DateTime)       # Última sincronización
├── 🗺️ TerrainData               # Datos del terreno (Fase 2)
├── 🤖 AutomataData              # Datos de autómatas (Fase 3)
├── 📦 MaterialsData             # Datos de materiales (Fase 5)
├── ⚙️ SettingsData              # Configuración del juego
└── 📊 Statistics                # Estadísticas de la fábrica
    ├── 📏 FactorySize (int)      # Tamaño de la fábrica
    ├── 🤖 AutomataCount (int)    # Número de autómatas
    ├── 📦 MaterialsProduced (int) # Materiales producidos
    └── 💰 TotalValue (decimal)   # Valor total de la fábrica
```

---

## 🎯 Próximos Pasos

### **✅ Completado:**
1. ✅ **MongoDB instalado y configurado** en VPS Linux (puerto 27020)
2. ✅ **Base de datos funcionando** con usuario edering
3. ✅ **Persistencia configurada** en /mongodb

### **🚧 En Desarrollo Paralelo (Fase 0 + Fase 1):**
1. **Fase 0:** Menú principal con sistema de login obligatorio
2. **Fase 0:** UI de registro y autenticación
3. **Fase 1:** Configurar proyecto ASP.NET Core con autenticación JWT
4. **Fase 1:** Conectar API con MongoDB instalado

### **🚀 Inmediato (Fase 1):**
1. Crear proyecto ASP.NET Core para AutomataFactoryAPI
2. Configurar conexión a MongoDB (puerto 27020)
3. Diseñar esquemas de MongoDB para usuarios y estado único
4. Implementar sistema de registro y login obligatorio
5. Crear APIs para gestión de estado único del juego
6. Preparar integración con Unity (cuando Fase 0 esté lista)

---

**Estado Final:** 🚧 **EN DESARROLLO - MONGODB COMPLETADO**  
**Decisión:** 🎯 **AUTENTICACIÓN OBLIGATORIA + UN JUEGO POR USUARIO**  
**Próximo paso:** 🔧 **CREAR PROYECTO ASP.NET CORE + CONECTAR MONGODB**

---

**Anterior:** [🚧 Fase 0: Menú Principal](phase-0.md) | **Siguiente:** [❌ Fase 2: Terreno/Foundations](phase-2.md) | **Roadmap:** [📋 Roadmap General](../roadmap/overview.md) | **Volver a:** [🏠 README Principal](../../README.md) 