# 📋 Fase 1.6: Backend API y Base de Datos

**Estado:** 📋 PLANIFICADO  
**Inicio:** Agosto 2025  
**Fin Estimado:** Diciembre 2025 (15 semanas)  
**Horas Totales:** 117 horas  
**Progreso:** 0%

---

## 🎯 Objetivos Principales

La Fase 1.6 establecerá la **infraestructura backend** completa del juego, implementando una API REST robusta con ASP.NET Core y una base de datos MongoDB escalable. Esta fase es **crítica** para habilitar el multiplayer y la persistencia de datos.

### **🏗️ Sistemas a Implementar**

#### **🌐 API REST con ASP.NET Core**
- **Framework:** ASP.NET Core 8.0+
- **Arquitectura:** Clean Architecture con DDD
- **Funcionalidades:**
  - Autenticación JWT
  - CRUD completo para todas las entidades
  - Validación robusta de datos
  - Manejo de errores centralizado

#### **🗄️ Base de Datos MongoDB**
- **Motor:** MongoDB 7.0+
- **Características:**
  - Esquemas flexibles para evolución
  - Índices optimizados para consultas
  - Replicación para alta disponibilidad
  - Sharding preparado para escalabilidad

#### **🔐 Sistema de Autenticación**
- **Método:** JWT (JSON Web Tokens)
- **Características:**
  - Registro y login de usuarios
  - Refresh tokens para seguridad
  - Roles y permisos
  - Validación de sesiones

#### **🔗 Integración Unity-Backend**
- **Comunicación:** HTTP REST + JSON
- **Características:**
  - Cliente HTTP optimizado
  - Manejo de errores de red
  - Cache local inteligente
  - Sincronización automática

---

## 📊 Cronograma Detallado

### **Semanas 1-2: Configuración Base**
**Horas:** 16h | **Prioridad:** 🔴 Alta

#### **Tareas Principales:**
- ✅ Configurar proyecto ASP.NET Core
- ✅ Configurar MongoDB Atlas/Local
- ✅ Implementar estructura de carpetas
- ✅ Configurar Docker para desarrollo
- ✅ Setup de CI/CD básico

#### **Entregables:**
```
Backend/
├── AutomataAPI/
│   ├── Controllers/
│   ├── Models/
│   ├── Services/
│   ├── Repositories/
│   └── Middleware/
├── AutomataAPI.Tests/
├── docker-compose.yml
└── README.md
```

### **Semanas 3-4: Modelos de Datos**
**Horas:** 16h | **Prioridad:** 🔴 Alta

#### **Modelos Principales:**
```csharp
Entidades Core:
├── 👤 User: Información de usuario
├── 🏭 Factory: Estado de la fábrica
├── 🤖 Automata: Autómatas del jugador
├── 📦 Material: Inventario de materiales
├── 🏪 MarketplaceListing: Ofertas del marketplace
├── 💰 Transaction: Historial de transacciones
└── 📊 GameSession: Sesiones de juego
```

#### **Especificaciones de Modelos:**

**User Model:**
```csharp
public class User
{
    public ObjectId Id { get; set; }
    public string Username { get; set; }
    public string Email { get; set; }
    public string PasswordHash { get; set; }
    public DateTime CreatedAt { get; set; }
    public DateTime LastLogin { get; set; }
    public UserStats Stats { get; set; }
    public UserPreferences Preferences { get; set; }
}
```

**Factory Model:**
```csharp
public class Factory
{
    public ObjectId Id { get; set; }
    public ObjectId UserId { get; set; }
    public string Name { get; set; }
    public HexGrid TerrainData { get; set; }
    public List<Building> Buildings { get; set; }
    public List<Spawner> Spawners { get; set; }
    public Inventory Materials { get; set; }
    public DateTime LastUpdated { get; set; }
}
```

### **Semanas 5-6: Repositorios y Servicios**
**Horas:** 16h | **Prioridad:** 🔴 Alta

#### **Patrón Repository:**
```csharp
Repositorios:
├── IUserRepository & UserRepository
├── IFactoryRepository & FactoryRepository
├── IAutomataRepository & AutomataRepository
├── IMarketplaceRepository & MarketplaceRepository
└── ITransactionRepository & TransactionRepository
```

#### **Servicios de Negocio:**
```csharp
Servicios:
├── UserService: Gestión de usuarios
├── FactoryService: Lógica de fábrica
├── AutomataService: Gestión de autómatas
├── MarketplaceService: Lógica de marketplace
├── GameStateService: Sincronización de estado
└── NotificationService: Sistema de notificaciones
```

### **Semanas 7-8: Controllers y Endpoints**
**Horas:** 16h | **Prioridad:** 🔴 Alta

#### **API Endpoints:**

**Authentication Controller:**
```http
POST /api/auth/register
POST /api/auth/login
POST /api/auth/refresh
POST /api/auth/logout
GET  /api/auth/profile
PUT  /api/auth/profile
```

**Factory Controller:**
```http
GET    /api/factory
PUT    /api/factory
POST   /api/factory/expand
GET    /api/factory/materials
POST   /api/factory/spawn
PUT    /api/factory/spawners/{id}
```

**Marketplace Controller:**
```http
GET    /api/marketplace/listings
POST   /api/marketplace/listings
PUT    /api/marketplace/listings/{id}
DELETE /api/marketplace/listings/{id}
POST   /api/marketplace/purchase/{id}
GET    /api/marketplace/history
```

**Automata Controller:**
```http
GET    /api/automata
POST   /api/automata
PUT    /api/automata/{id}
DELETE /api/automata/{id}
POST   /api/automata/{id}/program
GET    /api/automata/{id}/status
```

### **Semanas 9-10: Autenticación JWT**
**Horas:** 16h | **Prioridad:** 🟡 Media

#### **Sistema de Seguridad:**
```csharp
Componentes:
├── JwtTokenService: Generación y validación
├── AuthenticationMiddleware: Middleware personalizado
├── PasswordHasher: Hashing seguro de contraseñas
├── RefreshTokenService: Gestión de refresh tokens
└── RoleBasedAuthorization: Sistema de permisos
```

#### **Configuración JWT:**
```json
{
  "JwtSettings": {
    "SecretKey": "super-secret-key-256-bits",
    "Issuer": "AutomataAPI",
    "Audience": "AutomataGame",
    "ExpirationMinutes": 60,
    "RefreshExpirationDays": 7
  }
}
```

### **Semanas 11-12: Integración Unity**
**Horas:** 16h | **Prioridad:** 🔴 Alta

#### **Cliente HTTP Unity:**
```csharp
Componentes Unity:
├── APIClient: Cliente HTTP principal
├── AuthManager: Gestión de autenticación
├── DataSyncManager: Sincronización automática
├── OfflineManager: Manejo de modo offline
└── ErrorHandler: Gestión de errores de red
```

#### **Funcionalidades de Integración:**
- **Auto-sync:** Sincronización automática cada 30 segundos
- **Offline Mode:** Cache local para jugar sin conexión
- **Error Recovery:** Reintento automático de requests fallidos
- **Progress Tracking:** Indicadores de progreso para operaciones largas

### **Semanas 13-14: Testing y Documentación**
**Horas:** 16h | **Prioridad:** 🟡 Media

#### **Testing Strategy:**
```csharp
Tipos de Testing:
├── Unit Tests: Servicios y repositorios
├── Integration Tests: Controllers y API
├── Performance Tests: Carga y estrés
├── Security Tests: Vulnerabilidades
└── End-to-End Tests: Flujos completos
```

#### **Documentación:**
- **API Documentation:** Swagger/OpenAPI
- **Database Schema:** Diagramas ER
- **Deployment Guide:** Instrucciones de despliegue
- **Developer Guide:** Guía para desarrolladores

### **Semana 15: Deployment y Configuración**
**Horas:** 5h | **Prioridad:** 🟡 Media

#### **Infraestructura:**
```yaml
Servicios de Deployment:
├── 🌐 Azure App Service / AWS EC2
├── 🗄️ MongoDB Atlas
├── 🔒 Azure Key Vault / AWS Secrets
├── 📊 Application Insights
└── 🚀 GitHub Actions CI/CD
```

---

## 🔧 Arquitectura Técnica

### **🏗️ Clean Architecture**
```
Presentation Layer (Controllers)
    ↓
Application Layer (Services)
    ↓
Domain Layer (Models, Interfaces)
    ↓
Infrastructure Layer (Repositories, External Services)
```

### **🗄️ Esquema de Base de Datos**

#### **Collections MongoDB:**
```javascript
Collections:
├── users: Información de usuarios
├── factories: Estado de fábricas
├── automata: Autómatas de jugadores
├── marketplace_listings: Ofertas del marketplace
├── transactions: Historial de transacciones
├── game_sessions: Sesiones de juego
└── system_logs: Logs del sistema
```

#### **Índices Optimizados:**
```javascript
Índices Principales:
├── users: { email: 1 }, { username: 1 }
├── factories: { userId: 1 }, { lastUpdated: -1 }
├── marketplace_listings: { price: 1 }, { createdAt: -1 }
├── transactions: { userId: 1, createdAt: -1 }
└── automata: { userId: 1 }, { factoryId: 1 }
```

### **🔐 Seguridad**

#### **Medidas de Seguridad:**
```csharp
Implementaciones:
├── 🔒 HTTPS obligatorio
├── 🛡️ Rate limiting por IP
├── 🔑 JWT con refresh tokens
├── 🧂 Password hashing con salt
├── 🚫 Validación de input estricta
├── 📊 Logging de seguridad
└── 🔍 Auditoría de accesos
```

---

## 📊 Métricas y Objetivos

### **🎯 Objetivos de Rendimiento**
- **Response Time:** <200ms para 95% de requests
- **Throughput:** 1000+ requests/segundo
- **Availability:** 99.9% uptime
- **Concurrent Users:** Soporte para 10,000+ usuarios

### **📈 Métricas de Calidad**
- **Test Coverage:** >80% para código crítico
- **Code Quality:** SonarQube score >8.0
- **Security:** Sin vulnerabilidades críticas
- **Documentation:** 100% de endpoints documentados

---

## 🚀 Preparación para Futuras Fases

### **🔌 APIs Preparadas para:**
- **Fase 2:** Endpoints para programación de autómatas
- **Fase 3:** Gestión de autómatas en tiempo real
- **Fase 4:** Sistema de materiales y transformaciones
- **Fase 5:** Marketplace completamente funcional

### **📊 Escalabilidad:**
- **Horizontal Scaling:** Load balancers preparados
- **Database Sharding:** Estrategia de particionamiento
- **Caching:** Redis para datos frecuentes
- **CDN:** Distribución de contenido estático

---

## ⚠️ Riesgos y Mitigaciones

### **🔴 Riesgos Técnicos**
- **Complejidad de MongoDB:** +2-4 semanas
  - *Mitigación:* Training intensivo y documentación
- **Integración Unity-API:** +1-2 semanas
  - *Mitigación:* Prototipo temprano y testing

### **🟡 Riesgos de Tiempo**
- **Scope Creep:** Nuevas características no planificadas
  - *Mitigación:* Scope freeze después de semana 2
- **Testing Complejo:** Debugging de integración
  - *Mitigación:* Testing continuo desde semana 1

---

## 🎯 Criterios de Éxito

### **✅ Objetivos Mínimos (MVP)**
- ✅ API REST funcional con CRUD básico
- ✅ Autenticación JWT implementada
- ✅ Base de datos MongoDB configurada
- ✅ Integración Unity básica funcionando

### **🌟 Objetivos Ideales**
- 🌟 Performance optimizado (<200ms response)
- 🌟 Testing coverage >80%
- 🌟 Documentación completa
- 🌟 Deployment automatizado

### **🚀 Objetivos Stretch**
- 🚀 Real-time features con SignalR
- 🚀 Advanced caching con Redis
- 🚀 Monitoring completo con telemetría
- 🚀 Multi-region deployment

---

**Estado:** 📋 **LISTO PARA INICIAR**  
**Dependencias:** ✅ Fase 1.5 completada  
**Bloqueadores:** ❌ Ninguno identificado

---

**Anterior:** [🚧 Fase 1.5: Menú Principal](phase-1-5.md) | **Siguiente:** [🤖 Fase 2: Programación](phase-2.md) | **Roadmap:** [📋 Roadmap General](../roadmap/overview.md) | **Volver a:** [🏠 README Principal](../../README.md) 