# 🌐 Arquitectura de API

**Versión:** 1.0  
**Última Actualización:** Enero 2025  
**Estado:** ✅ Diseñado y Validado

---

## 🎯 Resumen Ejecutivo

La API de **Automata Factory Game** está diseñada como una **arquitectura RESTful** con **GraphQL** para consultas complejas, **SignalR** para tiempo real, y **gRPC** para comunicación interna. Prioriza **escalabilidad**, **seguridad** y **performance** para soportar un ecosistema de juego multiplayer robusto.

---

## 🏗️ Arquitectura General

### **🌟 Visión de Alto Nivel**
```
API Architecture:
├── 🌐 API Gateway (Azure API Management)
├── 🔐 Authentication Service (JWT + OAuth2)
├── 🎮 Game API (ASP.NET Core)
├── 💰 Market API (ASP.NET Core)
├── 🤖 AI API (FastAPI + Python)
├── 📊 Analytics API (ASP.NET Core)
├── 🔄 Real-time Hub (SignalR)
├── 📡 Internal Services (gRPC)
└── 📝 Documentation (OpenAPI/Swagger)
```

### **🔄 Flujo de Datos**
```
Client Request Flow:
1. 📱 Client → API Gateway
2. 🔐 Gateway → Auth Service
3. 🎯 Gateway → Specific API
4. 💾 API → Database
5. 📊 API → Analytics
6. 🔄 Response → Client
```

---

## 🔐 Autenticación y Autorización

### **🛡️ JWT Authentication**
```csharp
// JWT Configuration
public class JwtSettings
{
    public string SecretKey { get; set; }
    public string Issuer { get; set; }
    public string Audience { get; set; }
    public int ExpirationMinutes { get; set; } = 60;
    public int RefreshTokenExpirationDays { get; set; } = 7;
}

// Token Generation
public class TokenService
{
    public async Task<TokenResponse> GenerateTokenAsync(User user)
    {
        var claims = new[]
        {
            new Claim(ClaimTypes.NameIdentifier, user.Id),
            new Claim(ClaimTypes.Name, user.Username),
            new Claim(ClaimTypes.Email, user.Email),
            new Claim("subscription", user.SubscriptionType),
            new Claim("permissions", JsonSerializer.Serialize(user.Permissions))
        };

        var token = new JwtSecurityToken(
            issuer: _jwtSettings.Issuer,
            audience: _jwtSettings.Audience,
            claims: claims,
            expires: DateTime.UtcNow.AddMinutes(_jwtSettings.ExpirationMinutes),
            signingCredentials: new SigningCredentials(key, SecurityAlgorithms.HmacSha256)
        );

        return new TokenResponse
        {
            AccessToken = new JwtSecurityTokenHandler().WriteToken(token),
            RefreshToken = await GenerateRefreshTokenAsync(user.Id),
            ExpiresIn = _jwtSettings.ExpirationMinutes * 60
        };
    }
}
```

### **🔑 OAuth2 Integration**
```csharp
// OAuth2 Configuration
services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(options =>
{
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = jwtSettings.Issuer,
        ValidAudience = jwtSettings.Audience,
        IssuerSigningKey = new SymmetricSecurityKey(key)
    };
})
.AddGoogle(options =>
{
    options.ClientId = configuration["Authentication:Google:ClientId"];
    options.ClientSecret = configuration["Authentication:Google:ClientSecret"];
})
.AddMicrosoftAccount(options =>
{
    options.ClientId = configuration["Authentication:Microsoft:ClientId"];
    options.ClientSecret = configuration["Authentication:Microsoft:ClientSecret"];
});
```

---

## 🎮 Game API

### **🏭 Factory Management**
```csharp
[ApiController]
[Route("api/[controller]")]
[Authorize]
public class FactoriesController : ControllerBase
{
    // GET: api/factories
    [HttpGet]
    [ProducesResponseType(typeof(PagedResult<FactoryDto>), 200)]
    public async Task<IActionResult> GetFactories(
        [FromQuery] FactoryQueryParameters parameters)
    {
        var factories = await _factoryService.GetFactoriesAsync(
            User.GetUserId(), parameters);
        return Ok(factories);
    }

    // GET: api/factories/{id}
    [HttpGet("{id}")]
    [ProducesResponseType(typeof(FactoryDetailDto), 200)]
    [ProducesResponseType(404)]
    public async Task<IActionResult> GetFactory(string id)
    {
        var factory = await _factoryService.GetFactoryAsync(id, User.GetUserId());
        if (factory == null)
            return NotFound();
        
        return Ok(factory);
    }

    // POST: api/factories
    [HttpPost]
    [ProducesResponseType(typeof(FactoryDto), 201)]
    [ProducesResponseType(typeof(ValidationProblemDetails), 400)]
    public async Task<IActionResult> CreateFactory(
        [FromBody] CreateFactoryRequest request)
    {
        var factory = await _factoryService.CreateFactoryAsync(
            User.GetUserId(), request);
        
        return CreatedAtAction(nameof(GetFactory), 
            new { id = factory.Id }, factory);
    }

    // PUT: api/factories/{id}
    [HttpPut("{id}")]
    [ProducesResponseType(typeof(FactoryDto), 200)]
    [ProducesResponseType(404)]
    public async Task<IActionResult> UpdateFactory(
        string id, [FromBody] UpdateFactoryRequest request)
    {
        var factory = await _factoryService.UpdateFactoryAsync(
            id, User.GetUserId(), request);
        
        if (factory == null)
            return NotFound();
            
        return Ok(factory);
    }

    // DELETE: api/factories/{id}
    [HttpDelete("{id}")]
    [ProducesResponseType(204)]
    [ProducesResponseType(404)]
    public async Task<IActionResult> DeleteFactory(string id)
    {
        var success = await _factoryService.DeleteFactoryAsync(
            id, User.GetUserId());
        
        if (!success)
            return NotFound();
            
        return NoContent();
    }
}
```

### **🤖 Automata Management**
```csharp
[ApiController]
[Route("api/factories/{factoryId}/automata")]
[Authorize]
public class AutomataController : ControllerBase
{
    // GET: api/factories/{factoryId}/automata
    [HttpGet]
    [ProducesResponseType(typeof(List<AutomataDto>), 200)]
    public async Task<IActionResult> GetAutomata(string factoryId)
    {
        var automata = await _automataService.GetAutomataAsync(
            factoryId, User.GetUserId());
        return Ok(automata);
    }

    // POST: api/factories/{factoryId}/automata
    [HttpPost]
    [ProducesResponseType(typeof(AutomataDto), 201)]
    public async Task<IActionResult> CreateAutomata(
        string factoryId, [FromBody] CreateAutomataRequest request)
    {
        var automata = await _automataService.CreateAutomataAsync(
            factoryId, User.GetUserId(), request);
        
        return CreatedAtAction(nameof(GetAutomata), 
            new { factoryId, id = automata.Id }, automata);
    }

    // PUT: api/factories/{factoryId}/automata/{id}/program
    [HttpPut("{id}/program")]
    [ProducesResponseType(typeof(AutomataDto), 200)]
    public async Task<IActionResult> UpdateProgram(
        string factoryId, string id, [FromBody] UpdateProgramRequest request)
    {
        var automata = await _automataService.UpdateProgramAsync(
            factoryId, id, User.GetUserId(), request);
        
        return Ok(automata);
    }

    // POST: api/factories/{factoryId}/automata/{id}/execute
    [HttpPost("{id}/execute")]
    [ProducesResponseType(typeof(ExecutionResultDto), 200)]
    public async Task<IActionResult> ExecuteProgram(
        string factoryId, string id)
    {
        var result = await _automataService.ExecuteProgramAsync(
            factoryId, id, User.GetUserId());
        
        return Ok(result);
    }
}
```

---

## 💰 Market API

### **📊 Market Data**
```csharp
[ApiController]
[Route("api/market")]
[Authorize]
public class MarketController : ControllerBase
{
    // GET: api/market/prices
    [HttpGet("prices")]
    [ProducesResponseType(typeof(List<MaterialPriceDto>), 200)]
    public async Task<IActionResult> GetPrices(
        [FromQuery] string[] materials = null)
    {
        var prices = await _marketService.GetCurrentPricesAsync(materials);
        return Ok(prices);
    }

    // GET: api/market/prices/{material}/history
    [HttpGet("prices/{material}/history")]
    [ProducesResponseType(typeof(List<PriceHistoryDto>), 200)]
    public async Task<IActionResult> GetPriceHistory(
        string material, [FromQuery] TimeRange timeRange)
    {
        var history = await _marketService.GetPriceHistoryAsync(
            material, timeRange);
        return Ok(history);
    }

    // GET: api/market/orders
    [HttpGet("orders")]
    [ProducesResponseType(typeof(PagedResult<MarketOrderDto>), 200)]
    public async Task<IActionResult> GetOrders(
        [FromQuery] MarketOrderQueryParameters parameters)
    {
        var orders = await _marketService.GetOrdersAsync(
            User.GetUserId(), parameters);
        return Ok(orders);
    }

    // POST: api/market/orders
    [HttpPost("orders")]
    [ProducesResponseType(typeof(MarketOrderDto), 201)]
    public async Task<IActionResult> CreateOrder(
        [FromBody] CreateOrderRequest request)
    {
        var order = await _marketService.CreateOrderAsync(
            User.GetUserId(), request);
        
        return CreatedAtAction(nameof(GetOrders), 
            new { id = order.Id }, order);
    }

    // DELETE: api/market/orders/{id}
    [HttpDelete("orders/{id}")]
    [ProducesResponseType(204)]
    public async Task<IActionResult> CancelOrder(string id)
    {
        await _marketService.CancelOrderAsync(id, User.GetUserId());
        return NoContent();
    }
}
```

### **💸 Trading Operations**
```csharp
[ApiController]
[Route("api/trading")]
[Authorize]
public class TradingController : ControllerBase
{
    // GET: api/trading/portfolio
    [HttpGet("portfolio")]
    [ProducesResponseType(typeof(PortfolioDto), 200)]
    public async Task<IActionResult> GetPortfolio()
    {
        var portfolio = await _tradingService.GetPortfolioAsync(
            User.GetUserId());
        return Ok(portfolio);
    }

    // GET: api/trading/transactions
    [HttpGet("transactions")]
    [ProducesResponseType(typeof(PagedResult<TransactionDto>), 200)]
    public async Task<IActionResult> GetTransactions(
        [FromQuery] TransactionQueryParameters parameters)
    {
        var transactions = await _tradingService.GetTransactionsAsync(
            User.GetUserId(), parameters);
        return Ok(transactions);
    }

    // POST: api/trading/quick-buy
    [HttpPost("quick-buy")]
    [ProducesResponseType(typeof(TransactionDto), 200)]
    public async Task<IActionResult> QuickBuy(
        [FromBody] QuickTradeRequest request)
    {
        var transaction = await _tradingService.ExecuteQuickBuyAsync(
            User.GetUserId(), request);
        
        return Ok(transaction);
    }

    // POST: api/trading/quick-sell
    [HttpPost("quick-sell")]
    [ProducesResponseType(typeof(TransactionDto), 200)]
    public async Task<IActionResult> QuickSell(
        [FromBody] QuickTradeRequest request)
    {
        var transaction = await _tradingService.ExecuteQuickSellAsync(
            User.GetUserId(), request);
        
        return Ok(transaction);
    }
}
```

---

## 🤖 AI API (Python/FastAPI)

### **🧠 AI Services**
```python
from fastapi import FastAPI, Depends, HTTPException
from fastapi.security import HTTPBearer
from pydantic import BaseModel
from typing import List, Optional
import asyncio

app = FastAPI(title="Automata AI API", version="1.0.0")
security = HTTPBearer()

class PredictionRequest(BaseModel):
    material_type: str
    time_horizon: int  # hours
    market_data: dict
    
class PredictionResponse(BaseModel):
    material_type: str
    predicted_price: float
    confidence: float
    trend: str
    factors: List[str]

class OptimizationRequest(BaseModel):
    factory_id: str
    current_config: dict
    objectives: List[str]
    constraints: dict

class OptimizationResponse(BaseModel):
    factory_id: str
    optimized_config: dict
    expected_improvement: float
    changes_summary: List[str]

@app.post("/predict/price", response_model=PredictionResponse)
async def predict_price(
    request: PredictionRequest,
    token: str = Depends(security)
):
    """Predict material price using ML models"""
    try:
        # Validate token
        user_id = await validate_token(token.credentials)
        
        # Load prediction model
        model = await load_price_prediction_model(request.material_type)
        
        # Make prediction
        prediction = await model.predict(
            material_type=request.material_type,
            time_horizon=request.time_horizon,
            market_data=request.market_data
        )
        
        return PredictionResponse(
            material_type=request.material_type,
            predicted_price=prediction.price,
            confidence=prediction.confidence,
            trend=prediction.trend,
            factors=prediction.influencing_factors
        )
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/optimize/factory", response_model=OptimizationResponse)
async def optimize_factory(
    request: OptimizationRequest,
    token: str = Depends(security)
):
    """Optimize factory configuration using AI"""
    try:
        user_id = await validate_token(token.credentials)
        
        # Load optimization engine
        optimizer = await load_factory_optimizer()
        
        # Run optimization
        result = await optimizer.optimize(
            factory_id=request.factory_id,
            current_config=request.current_config,
            objectives=request.objectives,
            constraints=request.constraints
        )
        
        return OptimizationResponse(
            factory_id=request.factory_id,
            optimized_config=result.config,
            expected_improvement=result.improvement_percentage,
            changes_summary=result.changes
        )
        
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/models/status")
async def get_models_status():
    """Get status of all AI models"""
    return {
        "price_prediction": {
            "status": "active",
            "accuracy": 0.87,
            "last_trained": "2025-01-10T10:00:00Z"
        },
        "factory_optimization": {
            "status": "active",
            "success_rate": 0.92,
            "last_updated": "2025-01-12T15:30:00Z"
        },
        "anomaly_detection": {
            "status": "active",
            "precision": 0.94,
            "recall": 0.89
        }
    }
```

---

## 🔄 Real-time Communication (SignalR)

### **📡 SignalR Hubs**
```csharp
[Authorize]
public class GameHub : Hub
{
    private readonly IGameStateService _gameStateService;
    private readonly IMarketService _marketService;

    public async Task JoinFactory(string factoryId)
    {
        await Groups.AddToGroupAsync(Context.ConnectionId, $"factory_{factoryId}");
        
        // Send current factory state
        var state = await _gameStateService.GetFactoryStateAsync(factoryId);
        await Clients.Caller.SendAsync("FactoryStateUpdate", state);
    }

    public async Task LeaveFactory(string factoryId)
    {
        await Groups.RemoveFromGroupAsync(Context.ConnectionId, $"factory_{factoryId}");
    }

    public async Task SubscribeToMarket(string[] materials)
    {
        foreach (var material in materials)
        {
            await Groups.AddToGroupAsync(Context.ConnectionId, $"market_{material}");
        }
        
        // Send current prices
        var prices = await _marketService.GetCurrentPricesAsync(materials);
        await Clients.Caller.SendAsync("MarketPricesUpdate", prices);
    }

    public async Task UnsubscribeFromMarket(string[] materials)
    {
        foreach (var material in materials)
        {
            await Groups.RemoveFromGroupAsync(Context.ConnectionId, $"market_{material}");
        }
    }

    public override async Task OnDisconnectedAsync(Exception exception)
    {
        // Clean up user connections
        await _gameStateService.HandleDisconnectionAsync(Context.UserIdentifier);
        await base.OnDisconnectedAsync(exception);
    }
}

// Background service for real-time updates
public class RealTimeUpdateService : BackgroundService
{
    private readonly IHubContext<GameHub> _hubContext;
    private readonly IMarketService _marketService;

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        while (!stoppingToken.IsCancellationRequested)
        {
            // Update market prices every 30 seconds
            await UpdateMarketPrices();
            
            // Update factory states every 5 seconds
            await UpdateFactoryStates();
            
            await Task.Delay(5000, stoppingToken);
        }
    }

    private async Task UpdateMarketPrices()
    {
        var materials = await _marketService.GetActiveMaterialsAsync();
        
        foreach (var material in materials)
        {
            var price = await _marketService.GetCurrentPriceAsync(material);
            await _hubContext.Clients.Group($"market_{material}")
                .SendAsync("PriceUpdate", new { material, price });
        }
    }
}
```

---

## 📊 GraphQL API

### **🔍 GraphQL Schema**
```csharp
public class Query
{
    [UseProjection]
    [UseFiltering]
    [UseSorting]
    public IQueryable<Factory> GetFactories(
        [Service] IFactoryRepository repository,
        ClaimsPrincipal claimsPrincipal)
    {
        var userId = claimsPrincipal.GetUserId();
        return repository.GetFactoriesByUser(userId);
    }

    [UseProjection]
    public async Task<User> GetUser(
        string id,
        [Service] IUserRepository repository)
    {
        return await repository.GetByIdAsync(id);
    }

    public async Task<MarketData> GetMarketData(
        string material,
        [Service] IMarketService marketService)
    {
        return await marketService.GetMarketDataAsync(material);
    }
}

public class Mutation
{
    public async Task<Factory> CreateFactory(
        CreateFactoryInput input,
        [Service] IFactoryService factoryService,
        ClaimsPrincipal claimsPrincipal)
    {
        var userId = claimsPrincipal.GetUserId();
        return await factoryService.CreateFactoryAsync(userId, input);
    }

    public async Task<MarketOrder> PlaceOrder(
        PlaceOrderInput input,
        [Service] IMarketService marketService,
        ClaimsPrincipal claimsPrincipal)
    {
        var userId = claimsPrincipal.GetUserId();
        return await marketService.PlaceOrderAsync(userId, input);
    }
}

public class Subscription
{
    [Subscribe]
    public async Task<MarketPrice> OnPriceChanged(
        string material,
        [EventMessage] MarketPrice price)
    {
        return price;
    }

    [Subscribe]
    public async Task<FactoryState> OnFactoryStateChanged(
        string factoryId,
        [EventMessage] FactoryState state)
    {
        return state;
    }
}
```

---

## 🔧 Internal Services (gRPC)

### **⚙️ gRPC Services**
```protobuf
// game_service.proto
syntax = "proto3";

package automata.game;

service GameService {
  rpc GetFactoryState(GetFactoryStateRequest) returns (FactoryState);
  rpc UpdateFactoryState(UpdateFactoryStateRequest) returns (FactoryState);
  rpc ExecuteAutomataProgram(ExecuteProgramRequest) returns (ExecutionResult);
  rpc GetGameMetrics(GetMetricsRequest) returns (GameMetrics);
}

message GetFactoryStateRequest {
  string factory_id = 1;
  string user_id = 2;
}

message FactoryState {
  string factory_id = 1;
  repeated Automata automata = 2;
  repeated Building buildings = 3;
  repeated Material materials = 4;
  int64 last_updated = 5;
}

message ExecuteProgramRequest {
  string automata_id = 1;
  string program_code = 2;
  string language = 3;
}

message ExecutionResult {
  bool success = 1;
  string error_message = 2;
  repeated ExecutionStep steps = 3;
  int32 execution_time_ms = 4;
}
```

```csharp
// gRPC Service Implementation
public class GameService : GameServiceBase
{
    private readonly IFactoryService _factoryService;
    private readonly IAutomataService _automataService;

    public override async Task<FactoryState> GetFactoryState(
        GetFactoryStateRequest request, 
        ServerCallContext context)
    {
        var factory = await _factoryService.GetFactoryAsync(
            request.FactoryId, request.UserId);
        
        if (factory == null)
        {
            throw new RpcException(new Status(StatusCode.NotFound, 
                "Factory not found"));
        }

        return new FactoryState
        {
            FactoryId = factory.Id,
            Automata = { factory.Automata.Select(MapToGrpc) },
            Buildings = { factory.Buildings.Select(MapToGrpc) },
            Materials = { factory.Materials.Select(MapToGrpc) },
            LastUpdated = factory.UpdatedAt.ToUnixTimeSeconds()
        };
    }

    public override async Task<ExecutionResult> ExecuteAutomataProgram(
        ExecuteProgramRequest request, 
        ServerCallContext context)
    {
        try
        {
            var result = await _automataService.ExecuteProgramAsync(
                request.AutomataId, 
                request.ProgramCode, 
                request.Language);

            return new ExecutionResult
            {
                Success = result.Success,
                ErrorMessage = result.ErrorMessage ?? "",
                Steps = { result.Steps.Select(MapToGrpc) },
                ExecutionTimeMs = result.ExecutionTimeMs
            };
        }
        catch (Exception ex)
        {
            throw new RpcException(new Status(StatusCode.Internal, 
                ex.Message));
        }
    }
}
```

---

## 📊 API Analytics y Monitoreo

### **📈 Métricas de Performance**
```csharp
public class ApiMetricsMiddleware
{
    private readonly RequestDelegate _next;
    private readonly IMetricsCollector _metrics;

    public async Task InvokeAsync(HttpContext context)
    {
        var stopwatch = Stopwatch.StartNew();
        
        try
        {
            await _next(context);
        }
        finally
        {
            stopwatch.Stop();
            
            _metrics.RecordApiCall(new ApiMetric
            {
                Endpoint = context.Request.Path,
                Method = context.Request.Method,
                StatusCode = context.Response.StatusCode,
                Duration = stopwatch.ElapsedMilliseconds,
                UserId = context.User.GetUserId(),
                Timestamp = DateTime.UtcNow
            });
        }
    }
}

// Metrics Collection
public class MetricsCollector : IMetricsCollector
{
    public void RecordApiCall(ApiMetric metric)
    {
        // Record to Application Insights
        _telemetryClient.TrackDependency(
            "API", metric.Endpoint, 
            DateTime.UtcNow.AddMilliseconds(-metric.Duration),
            TimeSpan.FromMilliseconds(metric.Duration),
            metric.StatusCode < 400);

        // Record custom metrics
        _telemetryClient.TrackMetric("api.response_time", metric.Duration);
        _telemetryClient.TrackMetric("api.requests_per_second", 1);
        
        // Update real-time dashboard
        _hubContext.Clients.Group("admin")
            .SendAsync("MetricUpdate", metric);
    }
}
```

---

## 🔒 Seguridad de API

### **🛡️ Rate Limiting**
```csharp
public class RateLimitingMiddleware
{
    private readonly RequestDelegate _next;
    private readonly IRateLimitStore _store;

    public async Task InvokeAsync(HttpContext context)
    {
        var userId = context.User.GetUserId();
        var endpoint = context.Request.Path;
        var key = $"{userId}:{endpoint}";

        var limit = GetRateLimitForEndpoint(endpoint);
        var current = await _store.IncrementAsync(key, TimeSpan.FromMinutes(1));

        if (current > limit)
        {
            context.Response.StatusCode = 429;
            await context.Response.WriteAsync("Rate limit exceeded");
            return;
        }

        context.Response.Headers.Add("X-RateLimit-Limit", limit.ToString());
        context.Response.Headers.Add("X-RateLimit-Remaining", 
            (limit - current).ToString());

        await _next(context);
    }

    private int GetRateLimitForEndpoint(string endpoint)
    {
        return endpoint switch
        {
            "/api/market/orders" => 100,  // 100 requests per minute
            "/api/trading/quick-buy" => 10,  // 10 requests per minute
            "/api/factories" => 60,  // 60 requests per minute
            _ => 120  // Default limit
        };
    }
}
```

### **🔐 Input Validation**
```csharp
public class ValidationFilter : IActionFilter
{
    public void OnActionExecuting(ActionExecutingContext context)
    {
        if (!context.ModelState.IsValid)
        {
            var errors = context.ModelState
                .Where(x => x.Value.Errors.Count > 0)
                .ToDictionary(
                    kvp => kvp.Key,
                    kvp => kvp.Value.Errors.Select(e => e.ErrorMessage).ToArray()
                );

            context.Result = new BadRequestObjectResult(new
            {
                Message = "Validation failed",
                Errors = errors
            });
        }
    }

    public void OnActionExecuted(ActionExecutedContext context) { }
}

// Custom validation attributes
public class ValidMaterialTypeAttribute : ValidationAttribute
{
    private readonly string[] _validTypes = { "copper", "iron", "gold", "silicon" };

    public override bool IsValid(object value)
    {
        if (value is string materialType)
        {
            return _validTypes.Contains(materialType.ToLower());
        }
        return false;
    }
}
```

---

## 📝 Documentación de API

### **📖 OpenAPI/Swagger Configuration**
```csharp
public void ConfigureServices(IServiceCollection services)
{
    services.AddSwaggerGen(c =>
    {
        c.SwaggerDoc("v1", new OpenApiInfo
        {
            Title = "Automata Factory Game API",
            Version = "v1",
            Description = "API for the Automata Factory Game",
            Contact = new OpenApiContact
            {
                Name = "Development Team",
                Email = "dev@automatafactory.com"
            }
        });

        c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
        {
            Description = "JWT Authorization header using the Bearer scheme",
            Name = "Authorization",
            In = ParameterLocation.Header,
            Type = SecuritySchemeType.ApiKey,
            Scheme = "Bearer"
        });

        c.AddSecurityRequirement(new OpenApiSecurityRequirement
        {
            {
                new OpenApiSecurityScheme
                {
                    Reference = new OpenApiReference
                    {
                        Type = ReferenceType.SecurityScheme,
                        Id = "Bearer"
                    }
                },
                Array.Empty<string>()
            }
        });

        // Include XML comments
        var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
        var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
        c.IncludeXmlComments(xmlPath);
    });
}
```

---

## 🚀 Deployment y Escalabilidad

### **☁️ Azure Deployment**
```yaml
# azure-pipelines.yml
trigger:
- main

pool:
  vmImage: 'ubuntu-latest'

variables:
  buildConfiguration: 'Release'

stages:
- stage: Build
  jobs:
  - job: BuildAPI
    steps:
    - task: DotNetCoreCLI@2
      displayName: 'Restore packages'
      inputs:
        command: 'restore'
        projects: '**/*.csproj'

    - task: DotNetCoreCLI@2
      displayName: 'Build application'
      inputs:
        command: 'build'
        projects: '**/*.csproj'
        arguments: '--configuration $(buildConfiguration)'

    - task: DotNetCoreCLI@2
      displayName: 'Run tests'
      inputs:
        command: 'test'
        projects: '**/*Tests.csproj'

    - task: DotNetCoreCLI@2
      displayName: 'Publish application'
      inputs:
        command: 'publish'
        publishWebProjects: true
        arguments: '--configuration $(buildConfiguration) --output $(Build.ArtifactStagingDirectory)'

- stage: Deploy
  jobs:
  - deployment: DeployToAzure
    environment: 'production'
    strategy:
      runOnce:
        deploy:
          steps:
          - task: AzureWebApp@1
            displayName: 'Deploy to Azure Web App'
            inputs:
              azureSubscription: 'Azure-Subscription'
              appType: 'webApp'
              appName: 'automata-factory-api'
              package: '$(Pipeline.Workspace)/**/*.zip'
```

---

**Estado:** ✅ **DISEÑADO Y VALIDADO**  
**Próxima Revisión:** Marzo 2025  
**Owner:** Equipo de Backend

---

**Volver a:** [🏗️ Arquitectura](overview.md) | [🏠 README Principal](../../README.md) 