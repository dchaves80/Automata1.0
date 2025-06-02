# 🏗️ Arquitectura Técnica - Visión General del Sistema

## 🎯 Introducción

Este documento describe la arquitectura técnica completa del **Automata Factory Game**, incluyendo el diseño del sistema, tecnologías utilizadas, patrones arquitectónicos y decisiones de diseño.

---

## 🌐 Arquitectura General del Sistema

### **Diagrama de Alto Nivel**

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Unity Client  │◄──►│  ASP.NET Core   │◄──►│    MongoDB      │
│   (Frontend)    │    │   (Backend)     │    │   (Database)    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Local Storage  │    │   Redis Cache   │    │  File Storage   │
│   (Save Data)   │    │   (Sessions)    │    │   (Assets)      │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### **Componentes Principales**

#### **1. Cliente Unity (Frontend)**
```
Unity Client:
├── Game Engine (Unity 2022.3 LTS)
├── UI System (UI Toolkit)
├── Networking (Unity Netcode)
├── Asset Management (Addressables)
├── Local Storage (PlayerPrefs + JSON)
└── Platform Integration (Steam, etc.)
```

#### **2. Servidor Backend (ASP.NET Core)**
```
Backend Services:
├── Web API (RESTful + SignalR)
├── Authentication & Authorization
├── Game Logic Services
├── Marketplace Services
├── Real-time Communication
└── Data Validation & Security
```

#### **3. Base de Datos (MongoDB)**
```
Database Collections:
├── Users (Profiles, Authentication)
├── Worlds (Game States, Terrain)
├── Marketplace (Items, Transactions)
├── Leaderboards (Rankings, Stats)
├── Analytics (Events, Metrics)
└── System (Configuration, Logs)
```

---

## 🎮 Arquitectura del Cliente (Unity)

### **Estructura de Capas**

#### **Capa de Presentación (UI)**
```
UI Layer:
├── Main Menu System
│   ├── MenuManager
│   ├── SettingsController
│   └── ProfileManager
├── Game UI System
│   ├── HUDController
│   ├── InventoryUI
│   └── ProgrammingUI
└── Modal System
    ├── DialogManager
    ├── NotificationSystem
    └── LoadingScreens
```

#### **Capa de Lógica de Juego**
```
Game Logic Layer:
├── Core Systems
│   ├── GameManager (Singleton)
│   ├── SceneManager
│   └── InputManager
├── Gameplay Systems
│   ├── TerrainSystem
│   ├── BuildingSystem
│   ├── AutomataSystem
│   └── InventorySystem
└── Networking
    ├── NetworkManager
    ├── ClientNetworking
    └── DataSynchronization
```

#### **Capa de Datos**
```
Data Layer:
├── Local Storage
│   ├── SaveSystem
│   ├── SettingsData
│   └── CacheManager
├── Network Data
│   ├── APIClient
│   ├── DataModels
│   └── ResponseHandlers
└── Asset Management
    ├── AddressableManager
    ├── ResourceLoader
    └── AssetCache
```

### **Patrones de Diseño Utilizados**

#### **Singleton Pattern**
```csharp
// Para managers globales
public class GameManager : MonoBehaviour
{
    public static GameManager Instance { get; private set; }
    
    private void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else
        {
            Destroy(gameObject);
        }
    }
}
```

#### **Observer Pattern**
```csharp
// Para eventos del juego
public static class GameEvents
{
    public static event Action<int> OnResourceChanged;
    public static event Action<Building> OnBuildingPlaced;
    public static event Action<Automata> OnAutomataCreated;
}
```

#### **Command Pattern**
```csharp
// Para acciones del jugador
public interface ICommand
{
    void Execute();
    void Undo();
}

public class PlaceBuildingCommand : ICommand
{
    private Building building;
    private Vector3 position;
    
    public void Execute() { /* Place building */ }
    public void Undo() { /* Remove building */ }
}
```

#### **Factory Pattern**
```csharp
// Para creación de objetos
public class BuildingFactory
{
    public static Building CreateBuilding(BuildingType type, Vector3 position)
    {
        return type switch
        {
            BuildingType.Extractor => new Extractor(position),
            BuildingType.Processor => new Processor(position),
            BuildingType.Storage => new Storage(position),
            _ => throw new ArgumentException("Invalid building type")
        };
    }
}
```

---

## 🌐 Arquitectura del Backend (ASP.NET Core)

### **Estructura de Capas**

#### **Capa de Presentación (Controllers)**
```
Controllers:
├── AuthController (Login, Register, JWT)
├── GameController (World Data, Save/Load)
├── MarketplaceController (Trading, Listings)
├── LeaderboardController (Rankings, Stats)
├── UserController (Profile, Settings)
└── AdminController (Management, Analytics)
```

#### **Capa de Lógica de Negocio (Services)**
```
Services:
├── AuthenticationService
├── GameLogicService
├── MarketplaceService
├── LeaderboardService
├── NotificationService
└── AnalyticsService
```

#### **Capa de Acceso a Datos (Repositories)**
```
Repositories:
├── UserRepository
├── WorldRepository
├── MarketplaceRepository
├── LeaderboardRepository
└── AnalyticsRepository
```

### **API Design (RESTful)**

#### **Endpoints Principales**
```
Authentication:
POST /api/auth/login
POST /api/auth/register
POST /api/auth/refresh
DELETE /api/auth/logout

Game Data:
GET /api/game/world/{userId}
PUT /api/game/world/{userId}
POST /api/game/world/backup
GET /api/game/leaderboard

Marketplace:
GET /api/marketplace/listings
POST /api/marketplace/listing
PUT /api/marketplace/listing/{id}
DELETE /api/marketplace/listing/{id}
POST /api/marketplace/purchase
```

#### **Real-time Communication (SignalR)**
```csharp
public class GameHub : Hub
{
    public async Task JoinWorld(string worldId)
    {
        await Groups.AddToGroupAsync(Context.ConnectionId, worldId);
    }
    
    public async Task SendMarketUpdate(string worldId, object data)
    {
        await Clients.Group(worldId).SendAsync("MarketUpdate", data);
    }
}
```

### **Middleware Pipeline**
```csharp
app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();
app.UseRateLimiting();
app.UseResponseCaching();
app.UseResponseCompression();
app.MapControllers();
app.MapHub<GameHub>("/gamehub");
```

---

## 🗄️ Diseño de Base de Datos (MongoDB)

### **Esquemas de Colecciones**

#### **Users Collection**
```json
{
  "_id": "ObjectId",
  "username": "string",
  "email": "string",
  "passwordHash": "string",
  "profile": {
    "displayName": "string",
    "avatar": "string",
    "level": "number",
    "experience": "number",
    "achievements": ["string"]
  },
  "settings": {
    "graphics": "object",
    "audio": "object",
    "controls": "object"
  },
  "createdAt": "DateTime",
  "lastLogin": "DateTime"
}
```

#### **Worlds Collection**
```json
{
  "_id": "ObjectId",
  "userId": "ObjectId",
  "worldName": "string",
  "terrain": {
    "size": "number",
    "hexagons": [
      {
        "q": "number",
        "r": "number",
        "type": "string",
        "resources": "object"
      }
    ]
  },
  "buildings": [
    {
      "id": "string",
      "type": "string",
      "position": "object",
      "config": "object"
    }
  ],
  "automata": [
    {
      "id": "string",
      "type": "string",
      "program": "string",
      "position": "object",
      "inventory": "object"
    }
  ],
  "resources": "object",
  "statistics": "object",
  "lastSaved": "DateTime"
}
```

#### **Marketplace Collection**
```json
{
  "_id": "ObjectId",
  "sellerId": "ObjectId",
  "itemType": "string",
  "itemData": "object",
  "price": "number",
  "quantity": "number",
  "description": "string",
  "tags": ["string"],
  "status": "string",
  "createdAt": "DateTime",
  "expiresAt": "DateTime"
}
```

### **Índices para Optimización**
```javascript
// Users
db.users.createIndex({ "email": 1 }, { unique: true })
db.users.createIndex({ "username": 1 }, { unique: true })

// Worlds
db.worlds.createIndex({ "userId": 1 })
db.worlds.createIndex({ "lastSaved": -1 })

// Marketplace
db.marketplace.createIndex({ "itemType": 1, "status": 1 })
db.marketplace.createIndex({ "sellerId": 1 })
db.marketplace.createIndex({ "createdAt": -1 })
```

---

## 🔧 Tecnologías y Herramientas

### **Stack Tecnológico**

#### **Frontend (Unity)**
```
Core Technologies:
├── Unity 2022.3 LTS
├── C# (.NET Standard 2.1)
├── UI Toolkit (Runtime UI)
├── Addressable Assets
├── Unity Netcode for GameObjects
└── DOTween (Animations)

Development Tools:
├── Visual Studio 2022
├── Unity Profiler
├── Unity Test Framework
├── Git LFS (Large Files)
└── Unity Cloud Build
```

#### **Backend (ASP.NET Core)**
```
Core Technologies:
├── ASP.NET Core 8.0
├── C# 12
├── Entity Framework Core
├── SignalR
├── JWT Authentication
└── Swagger/OpenAPI

Development Tools:
├── Visual Studio 2022
├── Postman (API Testing)
├── Docker
├── Azure DevOps
└── SonarQube (Code Quality)
```

#### **Database & Infrastructure**
```
Database:
├── MongoDB 7.0
├── Redis (Caching)
├── MongoDB Compass (GUI)
└── MongoDB Atlas (Cloud)

Infrastructure:
├── Docker & Docker Compose
├── Nginx (Reverse Proxy)
├── Let's Encrypt (SSL)
├── Cloudflare (CDN)
└── GitHub Actions (CI/CD)
```

### **Librerías y Dependencias**

#### **Unity Packages**
```json
{
  "dependencies": {
    "com.unity.addressables": "1.21.19",
    "com.unity.netcode.gameobjects": "1.7.1",
    "com.unity.ui": "1.0.0-preview.18",
    "com.unity.test-framework": "1.1.33",
    "com.unity.analytics": "5.0.0"
  }
}
```

#### **NuGet Packages (Backend)**
```xml
<PackageReference Include="Microsoft.AspNetCore.Authentication.JwtBearer" Version="8.0.0" />
<PackageReference Include="Microsoft.AspNetCore.SignalR" Version="8.0.0" />
<PackageReference Include="MongoDB.Driver" Version="2.22.0" />
<PackageReference Include="StackExchange.Redis" Version="2.7.4" />
<PackageReference Include="Swashbuckle.AspNetCore" Version="6.5.0" />
```

---

## 🔒 Seguridad y Autenticación

### **Autenticación JWT**
```csharp
public class JwtService
{
    public string GenerateToken(User user)
    {
        var claims = new[]
        {
            new Claim(ClaimTypes.NameIdentifier, user.Id),
            new Claim(ClaimTypes.Name, user.Username),
            new Claim(ClaimTypes.Email, user.Email)
        };
        
        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_secretKey));
        var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);
        
        var token = new JwtSecurityToken(
            issuer: _issuer,
            audience: _audience,
            claims: claims,
            expires: DateTime.UtcNow.AddHours(24),
            signingCredentials: credentials
        );
        
        return new JwtSecurityTokenHandler().WriteToken(token);
    }
}
```

### **Validación de Datos**
```csharp
public class CreateWorldRequest
{
    [Required]
    [StringLength(50, MinimumLength = 3)]
    public string WorldName { get; set; }
    
    [Range(10, 100)]
    public int TerrainSize { get; set; }
    
    [Required]
    public TerrainType TerrainType { get; set; }
}
```

### **Rate Limiting**
```csharp
services.AddRateLimiter(options =>
{
    options.AddFixedWindowLimiter("ApiPolicy", limiterOptions =>
    {
        limiterOptions.PermitLimit = 100;
        limiterOptions.Window = TimeSpan.FromMinutes(1);
    });
});
```

---

## 📊 Monitoreo y Analytics

### **Logging**
```csharp
public class GameController : ControllerBase
{
    private readonly ILogger<GameController> _logger;
    
    [HttpPost("save")]
    public async Task<IActionResult> SaveWorld([FromBody] SaveWorldRequest request)
    {
        _logger.LogInformation("Saving world {WorldId} for user {UserId}", 
            request.WorldId, User.Identity.Name);
        
        try
        {
            await _gameService.SaveWorldAsync(request);
            _logger.LogInformation("World saved successfully");
            return Ok();
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Failed to save world");
            return StatusCode(500, "Internal server error");
        }
    }
}
```

### **Métricas de Performance**
```csharp
public class PerformanceMiddleware
{
    public async Task InvokeAsync(HttpContext context, RequestDelegate next)
    {
        var stopwatch = Stopwatch.StartNew();
        
        await next(context);
        
        stopwatch.Stop();
        
        if (stopwatch.ElapsedMilliseconds > 1000)
        {
            _logger.LogWarning("Slow request: {Method} {Path} took {ElapsedMs}ms",
                context.Request.Method,
                context.Request.Path,
                stopwatch.ElapsedMilliseconds);
        }
    }
}
```

### **Analytics Events**
```csharp
public class AnalyticsService
{
    public async Task TrackEventAsync(string userId, string eventName, object properties)
    {
        var analyticsEvent = new AnalyticsEvent
        {
            UserId = userId,
            EventName = eventName,
            Properties = JsonSerializer.Serialize(properties),
            Timestamp = DateTime.UtcNow
        };
        
        await _repository.InsertEventAsync(analyticsEvent);
    }
}
```

---

## 🚀 Deployment y DevOps

### **Docker Configuration**
```dockerfile
# Backend Dockerfile
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["AutomataGame.API/AutomataGame.API.csproj", "AutomataGame.API/"]
RUN dotnet restore "AutomataGame.API/AutomataGame.API.csproj"
COPY . .
WORKDIR "/src/AutomataGame.API"
RUN dotnet build "AutomataGame.API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "AutomataGame.API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "AutomataGame.API.dll"]
```

### **Docker Compose**
```yaml
version: '3.8'
services:
  api:
    build: .
    ports:
      - "5000:80"
    environment:
      - ConnectionStrings__MongoDB=mongodb://mongo:27017/automata
      - ConnectionStrings__Redis=redis:6379
    depends_on:
      - mongo
      - redis
  
  mongo:
    image: mongo:7.0
    ports:
      - "27017:27017"
    volumes:
      - mongo_data:/data/db
  
  redis:
    image: redis:7.2-alpine
    ports:
      - "6379:6379"

volumes:
  mongo_data:
```

### **CI/CD Pipeline (GitHub Actions)**
```yaml
name: Build and Deploy

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup .NET
      uses: actions/setup-dotnet@v3
      with:
        dotnet-version: 8.0.x
    
    - name: Restore dependencies
      run: dotnet restore
    
    - name: Build
      run: dotnet build --no-restore
    
    - name: Test
      run: dotnet test --no-build --verbosity normal
    
    - name: Build Docker image
      run: docker build -t automata-api .
    
    - name: Deploy to production
      if: github.ref == 'refs/heads/main'
      run: |
        # Deploy commands here
```

---

## 📋 Checklist de Arquitectura

### **Desarrollo**
- [ ] Estructura de capas implementada
- [ ] Patrones de diseño aplicados
- [ ] Separación de responsabilidades
- [ ] Código limpio y documentado

### **Seguridad**
- [ ] Autenticación JWT implementada
- [ ] Validación de datos en todas las APIs
- [ ] Rate limiting configurado
- [ ] HTTPS habilitado

### **Performance**
- [ ] Caching implementado
- [ ] Optimización de queries
- [ ] Compresión de respuestas
- [ ] Monitoreo de performance

### **Escalabilidad**
- [ ] Arquitectura modular
- [ ] Base de datos optimizada
- [ ] Load balancing configurado
- [ ] Auto-scaling preparado

---

**Relacionado:** [📋 Fase 1.5](../phases/phase-1-5.md) | [🗓️ Timeline](../roadmap/timeline.md) | **Volver a:** [🏠 README Principal](../../README.md) 