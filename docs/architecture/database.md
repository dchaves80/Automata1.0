# 🗄️ Arquitectura de Base de Datos

**Versión:** 1.0  
**Última Actualización:** Enero 2025  
**Estado:** ✅ Diseñado y Validado

---

## 🎯 Resumen Ejecutivo

La arquitectura de base de datos de **Automata Factory Game** utiliza **MongoDB** como base de datos principal, complementada con **Redis** para cache y **PostgreSQL** para analytics. El diseño prioriza **escalabilidad**, **performance** y **flexibilidad** para soportar un juego multiplayer con economía dinámica.

---

## 🍃 MongoDB - Base de Datos Principal

### **🏗️ Arquitectura General**
```
MongoDB Cluster:
├── 🎯 Primary Replica Set (3 nodos)
├── 📊 Secondary Read Replicas (2 nodos)
├── 🔄 Sharding por región geográfica
├── 📈 Auto-scaling basado en carga
├── 💾 GridFS para archivos grandes
└── 🔐 Autenticación y autorización
```

### **📊 Colecciones Principales**

#### **👥 Users Collection**
```javascript
{
  _id: ObjectId,
  username: String,
  email: String,
  passwordHash: String,
  profile: {
    displayName: String,
    avatar: String,
    level: Number,
    experience: Number,
    joinDate: Date,
    lastLogin: Date,
    preferences: {
      language: String,
      theme: String,
      notifications: Boolean
    }
  },
  stats: {
    totalPlayTime: Number,
    factoriesCreated: Number,
    automataBuilt: Number,
    totalRevenue: Number,
    achievements: [String]
  },
  subscription: {
    type: String, // "free", "premium", "enterprise"
    startDate: Date,
    endDate: Date,
    features: [String]
  },
  createdAt: Date,
  updatedAt: Date
}
```

#### **🏭 Factories Collection**
```javascript
{
  _id: ObjectId,
  userId: ObjectId,
  name: String,
  description: String,
  configuration: {
    gridSize: { width: Number, height: Number },
    terrain: {
      type: String,
      biome: String,
      resources: [{
        type: String,
        position: { x: Number, y: Number },
        quantity: Number
      }]
    },
    buildings: [{
      id: String,
      type: String, // "spawner", "machine", "storage"
      position: { x: Number, y: Number },
      rotation: Number,
      config: Object,
      connections: [String]
    }],
    automata: [{
      id: String,
      type: String,
      position: { x: Number, y: Number },
      program: String,
      inventory: [{
        materialType: String,
        quantity: Number
      }],
      status: String // "idle", "working", "moving"
    }]
  },
  metrics: {
    efficiency: Number,
    throughput: Number,
    uptime: Number,
    profitability: Number,
    lastCalculated: Date
  },
  isPublic: Boolean,
  tags: [String],
  createdAt: Date,
  updatedAt: Date
}
```

#### **🤖 Automata Collection**
```javascript
{
  _id: ObjectId,
  factoryId: ObjectId,
  userId: ObjectId,
  name: String,
  type: String, // "basic", "advanced", "specialized"
  specifications: {
    speed: Number,
    capacity: Number,
    energyConsumption: Number,
    durability: Number,
    specialAbilities: [String]
  },
  currentState: {
    position: { x: Number, y: Number },
    health: Number,
    energy: Number,
    inventory: [{
      materialType: String,
      quantity: Number
    }],
    currentTask: {
      type: String,
      target: Object,
      progress: Number,
      startTime: Date
    }
  },
  program: {
    code: String,
    language: String, // "pseudocode", "visual"
    version: Number,
    lastModified: Date,
    debugInfo: Object
  },
  performance: {
    tasksCompleted: Number,
    averageTaskTime: Number,
    errorRate: Number,
    uptime: Number
  },
  createdAt: Date,
  updatedAt: Date
}
```

#### **📦 Materials Collection**
```javascript
{
  _id: ObjectId,
  userId: ObjectId,
  factoryId: ObjectId,
  inventory: [{
    materialType: String,
    quantity: Number,
    quality: Number,
    location: {
      type: String, // "storage", "automata", "machine"
      id: String,
      position: { x: Number, y: Number }
    },
    metadata: {
      producedAt: Date,
      producedBy: String,
      batchId: String
    }
  }],
  reservations: [{
    materialType: String,
    quantity: Number,
    reservedBy: String,
    reservedAt: Date,
    expiresAt: Date
  }],
  transactions: [{
    type: String, // "produced", "consumed", "transferred"
    materialType: String,
    quantity: Number,
    timestamp: Date,
    source: String,
    destination: String
  }],
  updatedAt: Date
}
```

#### **💰 MarketOrders Collection**
```javascript
{
  _id: ObjectId,
  userId: ObjectId,
  type: String, // "buy", "sell"
  orderType: String, // "market", "limit", "stop"
  materialType: String,
  quantity: Number,
  price: Number,
  totalValue: Number,
  status: String, // "pending", "partial", "filled", "cancelled"
  filled: {
    quantity: Number,
    averagePrice: Number,
    fees: Number
  },
  conditions: {
    stopPrice: Number,
    timeInForce: String, // "GTC", "IOC", "FOK"
    expiresAt: Date
  },
  metadata: {
    source: String, // "manual", "bot", "ai"
    strategy: String,
    notes: String
  },
  createdAt: Date,
  updatedAt: Date,
  filledAt: Date
}
```

#### **💸 Transactions Collection**
```javascript
{
  _id: ObjectId,
  buyOrderId: ObjectId,
  sellOrderId: ObjectId,
  buyerId: ObjectId,
  sellerId: ObjectId,
  materialType: String,
  quantity: Number,
  price: Number,
  totalValue: Number,
  fees: {
    buyerFee: Number,
    sellerFee: Number,
    platformFee: Number
  },
  marketData: {
    marketPrice: Number,
    volume24h: Number,
    priceChange24h: Number
  },
  executedAt: Date,
  settledAt: Date
}
```

#### **🎮 GameSessions Collection**
```javascript
{
  _id: ObjectId,
  userId: ObjectId,
  sessionType: String, // "single", "multiplayer", "tutorial"
  startTime: Date,
  endTime: Date,
  duration: Number,
  activities: [{
    type: String,
    timestamp: Date,
    data: Object,
    location: { x: Number, y: Number }
  }],
  metrics: {
    actionsPerMinute: Number,
    efficiencyScore: Number,
    objectivesCompleted: Number,
    errorsCount: Number
  },
  achievements: [{
    id: String,
    unlockedAt: Date,
    progress: Number
  }],
  deviceInfo: {
    platform: String,
    version: String,
    resolution: String,
    performance: Object
  }
}
```

---

## 🔄 Redis - Cache y Tiempo Real

### **🚀 Estructura de Cache**
```
Redis Data Structures:
├── 🔑 Sessions: user:{userId}:session
├── 📊 Leaderboards: leaderboard:{type}:{period}
├── 💰 Market Prices: market:prices:{material}
├── 🎯 Active Orders: orders:active:{userId}
├── 🔔 Notifications: notifications:{userId}
├── 📈 Real-time Metrics: metrics:{factoryId}
├── 🎮 Game State: gamestate:{sessionId}
└── 🤖 AI Predictions: predictions:{type}:{timestamp}
```

### **📊 Patrones de Cache**
```javascript
// User Session Cache
{
  key: "user:12345:session",
  value: {
    userId: "12345",
    username: "player1",
    currentFactory: "factory_abc",
    permissions: ["read", "write"],
    lastActivity: "2025-01-15T10:30:00Z",
    preferences: { theme: "dark", language: "es" }
  },
  ttl: 3600 // 1 hour
}

// Market Price Cache
{
  key: "market:prices:copper",
  value: {
    current: 15.50,
    change24h: 2.3,
    volume24h: 125000,
    high24h: 16.20,
    low24h: 14.80,
    lastUpdate: "2025-01-15T10:29:45Z"
  },
  ttl: 60 // 1 minute
}

// Leaderboard Cache
{
  key: "leaderboard:wealth:weekly",
  value: [
    { userId: "user1", score: 1000000, rank: 1 },
    { userId: "user2", score: 850000, rank: 2 },
    { userId: "user3", score: 720000, rank: 3 }
  ],
  ttl: 300 // 5 minutes
}
```

---

## 📊 PostgreSQL - Analytics

### **📈 Esquema de Analytics**
```sql
-- Events Table
CREATE TABLE events (
    id BIGSERIAL PRIMARY KEY,
    user_id VARCHAR(24) NOT NULL,
    session_id VARCHAR(24),
    event_type VARCHAR(50) NOT NULL,
    event_data JSONB,
    timestamp TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    processed BOOLEAN DEFAULT FALSE
);

-- User Metrics Table
CREATE TABLE user_metrics (
    id BIGSERIAL PRIMARY KEY,
    user_id VARCHAR(24) NOT NULL,
    metric_date DATE NOT NULL,
    play_time_minutes INTEGER DEFAULT 0,
    actions_count INTEGER DEFAULT 0,
    revenue_generated DECIMAL(15,2) DEFAULT 0,
    factories_created INTEGER DEFAULT 0,
    automata_built INTEGER DEFAULT 0,
    materials_produced INTEGER DEFAULT 0,
    trades_executed INTEGER DEFAULT 0,
    UNIQUE(user_id, metric_date)
);

-- Market Analytics Table
CREATE TABLE market_analytics (
    id BIGSERIAL PRIMARY KEY,
    material_type VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    price DECIMAL(10,2) NOT NULL,
    volume INTEGER NOT NULL,
    market_cap DECIMAL(15,2),
    volatility DECIMAL(5,4),
    trend_direction VARCHAR(10) -- 'up', 'down', 'stable'
);

-- Performance Metrics Table
CREATE TABLE performance_metrics (
    id BIGSERIAL PRIMARY KEY,
    metric_type VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    value DECIMAL(15,4) NOT NULL,
    metadata JSONB,
    server_instance VARCHAR(50)
);
```

---

## 🔍 Indexación y Optimización

### **📊 Índices MongoDB**
```javascript
// Users Collection Indexes
db.users.createIndex({ "email": 1 }, { unique: true })
db.users.createIndex({ "username": 1 }, { unique: true })
db.users.createIndex({ "profile.level": -1 })
db.users.createIndex({ "stats.totalRevenue": -1 })

// Factories Collection Indexes
db.factories.createIndex({ "userId": 1 })
db.factories.createIndex({ "isPublic": 1, "createdAt": -1 })
db.factories.createIndex({ "metrics.efficiency": -1 })
db.factories.createIndex({ "tags": 1 })

// MarketOrders Collection Indexes
db.marketOrders.createIndex({ "userId": 1, "status": 1 })
db.marketOrders.createIndex({ "materialType": 1, "type": 1, "price": 1 })
db.marketOrders.createIndex({ "status": 1, "createdAt": 1 })
db.marketOrders.createIndex({ "materialType": 1, "status": 1, "price": 1 })

// Transactions Collection Indexes
db.transactions.createIndex({ "buyerId": 1, "executedAt": -1 })
db.transactions.createIndex({ "sellerId": 1, "executedAt": -1 })
db.transactions.createIndex({ "materialType": 1, "executedAt": -1 })
db.transactions.createIndex({ "executedAt": -1 })

// GameSessions Collection Indexes
db.gameSessions.createIndex({ "userId": 1, "startTime": -1 })
db.gameSessions.createIndex({ "sessionType": 1, "startTime": -1 })
db.gameSessions.createIndex({ "startTime": -1 })
```

### **⚡ Optimizaciones de Performance**
```javascript
// Compound Indexes for Complex Queries
db.marketOrders.createIndex({
  "materialType": 1,
  "type": 1,
  "status": 1,
  "price": 1
})

db.transactions.createIndex({
  "materialType": 1,
  "executedAt": -1,
  "price": 1
})

// Partial Indexes for Active Data
db.marketOrders.createIndex(
  { "materialType": 1, "price": 1 },
  { partialFilterExpression: { "status": "pending" } }
)

// TTL Index for Temporary Data
db.gameSessions.createIndex(
  { "endTime": 1 },
  { expireAfterSeconds: 2592000 } // 30 days
)
```

---

## 🔄 Sharding Strategy

### **📊 Sharding Configuration**
```javascript
// Shard Key Strategy
sh.enableSharding("automata_game")

// Users Collection - Shard by user region
sh.shardCollection("automata_game.users", { "profile.region": 1, "_id": 1 })

// Factories Collection - Shard by userId
sh.shardCollection("automata_game.factories", { "userId": 1 })

// Transactions Collection - Shard by date
sh.shardCollection("automata_game.transactions", { "executedAt": 1 })

// GameSessions Collection - Shard by userId and date
sh.shardCollection("automata_game.gameSessions", { "userId": 1, "startTime": 1 })
```

### **🌍 Geographic Distribution**
```
Shard Distribution:
├── 🇺🇸 US-East: Primary shard (40% data)
├── 🇪🇺 EU-West: European users (35% data)
├── 🇯🇵 Asia-Pacific: Asian users (20% data)
└── 🌎 Global: Shared data (5% data)
```

---

## 🔐 Seguridad de Datos

### **🛡️ Autenticación y Autorización**
```javascript
// MongoDB Users and Roles
use admin
db.createUser({
  user: "gameAppUser",
  pwd: "securePassword",
  roles: [
    { role: "readWrite", db: "automata_game" },
    { role: "read", db: "automata_analytics" }
  ]
})

db.createUser({
  user: "analyticsUser",
  pwd: "analyticsPassword",
  roles: [
    { role: "read", db: "automata_game" },
    { role: "readWrite", db: "automata_analytics" }
  ]
})

// Application-level Security
const connectionString = `mongodb+srv://${username}:${password}@cluster.mongodb.net/automata_game?retryWrites=true&w=majority&ssl=true`
```

### **🔒 Encriptación**
```javascript
// Field-level Encryption for Sensitive Data
const encryptionSchema = {
  "properties": {
    "email": {
      "encrypt": {
        "keyId": [UUID("...")],
        "bsonType": "string",
        "algorithm": "AEAD_AES_256_CBC_HMAC_SHA_512-Deterministic"
      }
    },
    "passwordHash": {
      "encrypt": {
        "keyId": [UUID("...")],
        "bsonType": "string",
        "algorithm": "AEAD_AES_256_CBC_HMAC_SHA_512-Random"
      }
    }
  }
}
```

---

## 📊 Backup y Recuperación

### **💾 Estrategia de Backup**
```
Backup Strategy:
├── 🔄 Continuous Backup: Replica sets
├── 📅 Daily Snapshots: Full database backup
├── 📈 Weekly Archives: Long-term storage
├── 🌍 Cross-region Replication: Disaster recovery
├── ⚡ Point-in-time Recovery: Up to 7 days
└── 🧪 Backup Testing: Monthly validation
```

### **🔄 Recovery Procedures**
```bash
# Point-in-time Recovery
mongorestore --host replica-set/host1:27017,host2:27017,host3:27017 \
  --db automata_game \
  --oplogReplay \
  --oplogLimit 1640995200:1 \
  /backup/path

# Selective Collection Restore
mongorestore --host replica-set/host1:27017 \
  --db automata_game \
  --collection users \
  /backup/path/automata_game/users.bson
```

---

## 📈 Monitoreo y Métricas

### **📊 Métricas Clave**
```javascript
// Database Performance Metrics
{
  "connections": {
    "current": 150,
    "available": 850,
    "totalCreated": 5000
  },
  "operations": {
    "insert": 1200,
    "query": 8500,
    "update": 800,
    "delete": 50
  },
  "memory": {
    "resident": "2.1GB",
    "virtual": "4.8GB",
    "mapped": "3.2GB"
  },
  "replication": {
    "lag": "0.5s",
    "health": "ok"
  }
}
```

### **🚨 Alertas Configuradas**
```
Database Alerts:
├── 🔴 Connection pool > 80%
├── 🟡 Query response time > 100ms
├── 🔴 Replication lag > 5 seconds
├── 🟡 Disk usage > 85%
├── 🔴 Memory usage > 90%
├── 🟡 Failed operations > 1%
└── 🔴 Backup failure
```

---

## 🔮 Escalabilidad Futura

### **📈 Growth Planning**
```
Scalability Roadmap:
├── 📊 Current: 10K concurrent users
├── 🎯 6 months: 50K concurrent users
├── 🚀 1 year: 200K concurrent users
├── 🌍 2 years: 1M concurrent users
└── 🔮 Future: Multi-region deployment
```

### **⚙️ Optimization Strategies**
```
Performance Optimizations:
├── 🔄 Read replicas scaling
├── 📊 Intelligent caching layers
├── 🎯 Query optimization
├── 📈 Automated sharding
├── 🔄 Connection pooling
├── 💾 Data archiving
└── 🤖 AI-driven optimization
```

---

## 📝 Mejores Prácticas

### **✅ Development Guidelines**
```
Database Best Practices:
├── 📊 Always use indexes for queries
├── 🔄 Implement proper error handling
├── 💾 Use connection pooling
├── 🎯 Optimize query patterns
├── 📈 Monitor performance metrics
├── 🔒 Implement data validation
├── 💾 Regular backup testing
└── 📝 Document schema changes
```

### **🚫 Anti-patterns to Avoid**
```
Avoid These Patterns:
├── ❌ Large documents (>16MB)
├── ❌ Unbounded arrays
├── ❌ Missing indexes on queries
├── ❌ Storing files in documents
├── ❌ Complex joins across collections
├── ❌ Hardcoded connection strings
├── ❌ Ignoring write concerns
└── ❌ No data validation
```

---

**Estado:** ✅ **DISEÑADO Y VALIDADO**  
**Próxima Revisión:** Marzo 2025  
**Owner:** Equipo de Backend

---

**Volver a:** [🏗️ Arquitectura](overview.md) | [🏠 README Principal](../../README.md) 