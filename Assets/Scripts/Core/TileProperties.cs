using UnityEngine;

[System.Serializable]
public enum TileType
{
    Floor,
    Wall,
    Machine,
    Spawner,
    Storage
}

[System.Serializable]
public enum TileStatus
{
    Empty,
    Occupied,
    Reserved,
    Blocked
}

/// <summary>
/// Componente base para propiedades extendidas de tiles del terreno.
/// Permite configurar características específicas de cada tile de la fábrica.
/// </summary>
public class TileProperties : MonoBehaviour
{
    [Header("🏗️ Información Básica del Tile")]
    [SerializeField] private TileType tileType = TileType.Floor;
    [SerializeField] private TileStatus currentStatus = TileStatus.Empty;
    [SerializeField] private Vector2Int gridPosition;
    
    [Header("⚡ Características de Producción")]
    [SerializeField] private bool canPlaceMachinery = true;
    [SerializeField] private bool hasElectricity = false;
    [SerializeField] private bool hasWaterAccess = false;
    [SerializeField] private int maxWeight = 100; // Peso máximo que puede soportar
    
    [Header("🚛 Características de Transporte")]
    [SerializeField] private bool allowsAutomataMovement = true;
    [SerializeField] private float movementSpeedModifier = 1.0f; // Multiplicador de velocidad
    [SerializeField] private bool isConveyorBelt = false;
    [SerializeField] private Vector2 conveyorDirection = Vector2.right;
    
    [Header("💰 Características Económicas")]
    [SerializeField] private int constructionCost = 10;
    [SerializeField] private int maintenanceCost = 1;
    [SerializeField] private int demolitionValue = 5;
    
    [Header("🔧 Características Técnicas")]
    [SerializeField] private bool requiresFoundation = false;
    [SerializeField] private int durability = 100;
    [SerializeField] private int maxDurability = 100;
    [SerializeField] private float temperatureResistance = 25.0f; // Grados Celsius
    
    [Header("📊 Información de Debug")]
    [SerializeField] private bool showDebugInfo = false;
    [SerializeField] private string lastModified = "";
    [SerializeField] private int timesModified = 0;
    
    // Propiedades públicas para acceso desde otros scripts
    public TileType Type 
    { 
        get => tileType; 
        set 
        { 
            tileType = value; 
            OnTileModified();
        } 
    }
    
    public TileStatus Status 
    { 
        get => currentStatus; 
        set 
        { 
            currentStatus = value; 
            OnTileModified();
        } 
    }
    
    public Vector2Int GridPosition 
    { 
        get => gridPosition; 
        set => gridPosition = value; 
    }
    
    public bool CanPlaceMachinery => canPlaceMachinery && currentStatus == TileStatus.Empty;
    public bool AllowsMovement => allowsAutomataMovement && currentStatus != TileStatus.Blocked;
    public float SpeedModifier => movementSpeedModifier;
    public int ConstructionCost => constructionCost;
    public int MaintenanceCost => maintenanceCost;
    public int DemolitionValue => demolitionValue;
    public bool HasElectricity => hasElectricity;
    public bool HasWaterAccess => hasWaterAccess;
    public int MaxWeight => maxWeight;
    public int CurrentDurability => durability;
    public float TemperatureResistance => temperatureResistance;
    
    private void Awake()
    {
        // Inicializar posición en la grilla basada en la posición del transform
        UpdateGridPositionFromTransform();
        lastModified = System.DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
    }
    
    private void Start()
    {
        // Configurar propiedades específicas según el tipo de tile
        ConfigureTileByType();
    }
    
    /// <summary>
    /// Configura las propiedades por defecto según el tipo de tile
    /// </summary>
    private void ConfigureTileByType()
    {
        switch (tileType)
        {
            case TileType.Floor:
                canPlaceMachinery = true;
                allowsAutomataMovement = true;
                constructionCost = 5;
                maintenanceCost = 0;
                break;
                
            case TileType.Wall:
                canPlaceMachinery = false;
                allowsAutomataMovement = false;
                currentStatus = TileStatus.Blocked;
                constructionCost = 15;
                maintenanceCost = 1;
                durability = 200;
                maxDurability = 200;
                break;
                
            case TileType.Machine:
                canPlaceMachinery = false;
                allowsAutomataMovement = false;
                currentStatus = TileStatus.Occupied;
                hasElectricity = true;
                constructionCost = 100;
                maintenanceCost = 5;
                break;
                
            case TileType.Spawner:
                canPlaceMachinery = false;
                allowsAutomataMovement = true;
                hasElectricity = true;
                constructionCost = 50;
                maintenanceCost = 2;
                break;
                
            case TileType.Storage:
                canPlaceMachinery = false;
                allowsAutomataMovement = true;
                maxWeight = 500;
                constructionCost = 30;
                maintenanceCost = 1;
                break;
        }
    }
    
    /// <summary>
    /// Actualiza la posición en la grilla basada en la posición del transform
    /// </summary>
    public void UpdateGridPositionFromTransform()
    {
        gridPosition = new Vector2Int(
            Mathf.RoundToInt(transform.position.x),
            Mathf.RoundToInt(transform.position.y)
        );
    }
    
    /// <summary>
    /// Método llamado cuando se modifica alguna propiedad del tile
    /// </summary>
    private void OnTileModified()
    {
        timesModified++;
        lastModified = System.DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
        
        if (showDebugInfo)
        {
            Debug.Log($"Tile en {gridPosition} modificado. Tipo: {tileType}, Estado: {currentStatus}");
        }
    }
    
    /// <summary>
    /// Verifica si se puede colocar un objeto con el peso especificado
    /// </summary>
    public bool CanSupportWeight(int weight)
    {
        return weight <= maxWeight && currentStatus != TileStatus.Blocked;
    }
    
    /// <summary>
    /// Aplica daño a la durabilidad del tile
    /// </summary>
    public void ApplyDamage(int damage)
    {
        durability = Mathf.Max(0, durability - damage);
        OnTileModified();
        
        if (durability <= 0)
        {
            OnTileDestroyed();
        }
    }
    
    /// <summary>
    /// Repara el tile restaurando durabilidad
    /// </summary>
    public void Repair(int repairAmount)
    {
        durability = Mathf.Min(maxDurability, durability + repairAmount);
        OnTileModified();
    }
    
    /// <summary>
    /// Método llamado cuando el tile es destruido
    /// </summary>
    private void OnTileDestroyed()
    {
        if (showDebugInfo)
        {
            Debug.Log($"Tile en {gridPosition} destruido por falta de durabilidad");
        }
        
        // Aquí podrías agregar efectos visuales, sonidos, etc.
        currentStatus = TileStatus.Blocked;
    }
    
    /// <summary>
    /// Obtiene información completa del tile para debugging
    /// </summary>
    public string GetTileInfo()
    {
        return $"Tile [{gridPosition.x}, {gridPosition.y}]\n" +
               $"Tipo: {tileType}\n" +
               $"Estado: {currentStatus}\n" +
               $"Puede colocar maquinaria: {CanPlaceMachinery}\n" +
               $"Permite movimiento: {AllowsMovement}\n" +
               $"Modificador velocidad: {movementSpeedModifier}x\n" +
               $"Peso máximo: {maxWeight}kg\n" +
               $"Durabilidad: {durability}/{maxDurability}\n" +
               $"Última modificación: {lastModified}";
    }
    
    // Método para mostrar información en el Inspector (solo en modo debug)
    private void OnDrawGizmosSelected()
    {
        if (showDebugInfo)
        {
            Gizmos.color = GetGizmoColor();
            Gizmos.DrawWireCube(transform.position, Vector3.one * 0.9f);
            
            // Mostrar dirección del conveyor si aplica
            if (isConveyorBelt)
            {
                Gizmos.color = Color.yellow;
                Vector3 direction = new Vector3(conveyorDirection.x, conveyorDirection.y, 0) * 0.5f;
                Gizmos.DrawRay(transform.position, direction);
            }
        }
    }
    
    /// <summary>
    /// Obtiene el color del gizmo según el tipo y estado del tile
    /// </summary>
    private Color GetGizmoColor()
    {
        switch (currentStatus)
        {
            case TileStatus.Empty: return Color.green;
            case TileStatus.Occupied: return Color.red;
            case TileStatus.Reserved: return Color.yellow;
            case TileStatus.Blocked: return Color.black;
            default: return Color.white;
        }
    }
} 