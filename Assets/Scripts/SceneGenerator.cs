using UnityEngine;

public class SceneGenerator : MonoBehaviour
{
    [Header("Grid Settings")]
    [SerializeField] private int gridWidth = 20;
    [SerializeField] private int gridHeight = 20;
    [SerializeField] private float tileSize = 1f;
    
    [Header("Factory Foundation Sprites")]
    [SerializeField] private Sprite floorSprite;           // Piso de fábrica
    [SerializeField] private Sprite wallSprite;            // Paredes exteriores
    
    [Header("Tile Properties")]
    [SerializeField] private bool addTileProperties = true; // Agregar componente TileProperties automáticamente
    [SerializeField] private bool enableDebugInfo = false; // Habilitar debug en TileProperties
    
    [Header("Generation Settings")]
    [SerializeField] private bool generateOnStart = true;
    [SerializeField] private bool centerGrid = true;
    
    [Header("Debug")]
    [SerializeField] private bool showGridGizmos = true;
    
    // Grid data - Usando el enum de TileProperties en lugar del local
    private TileType[,] grid;
    private GameObject[,] tileObjects;
    private Transform gridParent;
    
    void Start()
    {
        if (generateOnStart)
        {
            GenerateFactoryFoundation();
        }
    }

    void Update()
    {
        
    }

    [ContextMenu("Generate Factory Foundation")]
    public void GenerateFactoryFoundation()
    {
        ClearExistingGrid();
        InitializeGrid();
        GenerateBasicLayout();
        CreateVisualGrid();
    }
    
    [ContextMenu("Clear Grid")]
    public void ClearExistingGrid()
    {
        // Destruir grid anterior si existe
        if (gridParent != null)
        {
            DestroyImmediate(gridParent.gameObject);
        }
        
        // Crear nuevo parent para organizar los tiles
        GameObject gridParentObj = new GameObject("Factory Foundation");
        gridParentObj.transform.SetParent(transform);
        gridParent = gridParentObj.transform;
    }
    
    // ===== FUNCIONES DE EXPANSIÓN DE TERRENO SIMPLIFICADAS =====
    [ContextMenu("🔧 Add Row (Bottom)")]
    public void AddRowBottom()
    {
        ExpandGrid(0, 1);
        Debug.Log($"Added row at bottom. New grid size: {gridWidth}x{gridHeight}");
    }
    
    [ContextMenu("🔧 Add Column (Right)")]
    public void AddColumnRight()
    {
        ExpandGrid(1, 0);
        Debug.Log($"Added column at right. New grid size: {gridWidth}x{gridHeight}");
    }
    
    [ContextMenu("🔧 Expand Both Directions")]
    public void ExpandBothDirections()
    {
        ExpandGrid(1, 1);
        Debug.Log($"Expanded both directions. New grid size: {gridWidth}x{gridHeight}");
    }
    
    /// <summary>
    /// Expande la grilla hacia la derecha y/o hacia abajo
    /// </summary>
    /// <param name="addColumns">Columnas a agregar a la derecha</param>
    /// <param name="addRows">Filas a agregar abajo</param>
    public void ExpandGrid(int addColumns, int addRows)
    {
        if (grid == null)
        {
            Debug.LogWarning("Grid not initialized. Generate foundation first.");
            return;
        }
        
        if (addColumns <= 0 && addRows <= 0)
        {
            Debug.LogWarning("No expansion specified.");
            return;
        }
        
        // Calcular nuevas dimensiones
        int newWidth = gridWidth + addColumns;
        int newHeight = gridHeight + addRows;
        
        // Crear nueva grilla
        TileType[,] newGrid = new TileType[newWidth, newHeight];
        GameObject[,] newTileObjects = new GameObject[newWidth, newHeight];
        
        // Copiar datos existentes (sin offset, ya que expandimos hacia derecha/abajo)
        for (int x = 0; x < gridWidth; x++)
        {
            for (int y = 0; y < gridHeight; y++)
            {
                newGrid[x, y] = grid[x, y];
                newTileObjects[x, y] = tileObjects[x, y];
            }
        }
        
        // PASO 1: Convertir las paredes del perímetro anterior a piso
        ConvertOldPerimeterWallsToFloor(newGrid, gridWidth, gridHeight);
        
        // PASO 2: Llenar nuevas áreas con piso
        FillNewAreasWithFloor(newGrid, newWidth, newHeight);
        
        // PASO 3: Crear nuevas paredes perimetrales en los límites finales
        UpdatePerimeterWalls(newGrid, newWidth, newHeight);
        
        // Actualizar referencias
        grid = newGrid;
        tileObjects = newTileObjects;
        gridWidth = newWidth;
        gridHeight = newHeight;
        
        // Recrear visual
        CreateVisualGrid();
    }
    
    /// <summary>
    /// Convierte las paredes del perímetro anterior a piso
    /// </summary>
    private void ConvertOldPerimeterWallsToFloor(TileType[,] newGrid, int oldWidth, int oldHeight)
    {
        // Convertir paredes del perímetro anterior a piso
        for (int x = 0; x < oldWidth; x++)
        {
            for (int y = 0; y < oldHeight; y++)
            {
                // Si era una pared del perímetro anterior, convertirla a piso
                bool wasOldPerimeterWall = (x == 0 || x == oldWidth - 1 || y == 0 || y == oldHeight - 1);
                
                if (wasOldPerimeterWall && newGrid[x, y] == TileType.Wall)
                {
                    newGrid[x, y] = TileType.Floor;
                }
            }
        }
    }
    
    private void FillNewAreasWithFloor(TileType[,] newGrid, int newWidth, int newHeight)
    {
        // Llenar nuevas áreas con piso
        for (int x = 0; x < newWidth; x++)
        {
            for (int y = 0; y < newHeight; y++)
            {
                if (newGrid[x, y] == TileType.Floor) // Cambié Empty por Floor ya que no existe Empty en el nuevo enum
                {
                    newGrid[x, y] = TileType.Floor;
                }
            }
        }
    }
    
    private void UpdatePerimeterWalls(TileType[,] newGrid, int newWidth, int newHeight)
    {
        // Crear nuevas paredes perimetrales
        for (int x = 0; x < newWidth; x++)
        {
            for (int y = 0; y < newHeight; y++)
            {
                if (x == 0 || x == newWidth - 1 || y == 0 || y == newHeight - 1)
                {
                    newGrid[x, y] = TileType.Wall;
                }
            }
        }
    }
    
    // ===== FUNCIONES PÚBLICAS PARA MECÁNICA DE COMPRA =====
    
    /// <summary>
    /// Compra terreno en una dirección específica
    /// </summary>
    /// <param name="direction">0=derecha, 1=abajo, 2=ambos</param>
    /// <param name="amount">Cantidad de tiles a agregar</param>
    /// <returns>True si la compra fue exitosa</returns>
    public bool PurchaseLand(int direction, int amount = 1)
    {
        int cost = GetExpansionCost(direction, amount);
        
        // Aquí podrías verificar si el jugador tiene suficiente dinero
        // Por ahora, siempre permitimos la expansión
        
        switch (direction)
        {
            case 0: // Derecha
                ExpandGrid(amount, 0);
                break;
            case 1: // Abajo
                ExpandGrid(0, amount);
                break;
            case 2: // Ambos
                ExpandGrid(amount, amount);
                break;
            default:
                Debug.LogWarning("Invalid direction for land purchase");
                return false;
        }
        
        Debug.Log($"Land purchased! Cost: {cost} credits. New size: {gridWidth}x{gridHeight}");
        return true;
    }
    
    /// <summary>
    /// Calcula el costo de expansión
    /// </summary>
    public int GetExpansionCost(int direction, int amount = 1)
    {
        int baseCost = 50; // Costo base por tile
        int currentArea = gridWidth * gridHeight;
        float scalingFactor = 1 + (currentArea / 1000f); // Costo aumenta con el tamaño
        
        int tilesToAdd = 0;
        switch (direction)
        {
            case 0: // Derecha
                tilesToAdd = gridHeight * amount;
                break;
            case 1: // Abajo
                tilesToAdd = gridWidth * amount;
                break;
            case 2: // Ambos
                tilesToAdd = (gridWidth + amount) * (gridHeight + amount) - currentArea;
                break;
        }
        
        return Mathf.RoundToInt(baseCost * tilesToAdd * scalingFactor);
    }
    
    /// <summary>
    /// Obtiene el tamaño actual de la grilla
    /// </summary>
    public Vector2Int GetGridSize()
    {
        return new Vector2Int(gridWidth, gridHeight);
    }
    
    // ===== FUNCIONES PRIVADAS DE GENERACIÓN =====
    
    private void InitializeGrid()
    {
        grid = new TileType[gridWidth, gridHeight];
        tileObjects = new GameObject[gridWidth, gridHeight];
    }
    
    private void GenerateBasicLayout()
    {
        FillWithFloor();
        CreatePerimeterWalls();
    }
    
    private void FillWithFloor()
    {
        for (int x = 0; x < gridWidth; x++)
        {
            for (int y = 0; y < gridHeight; y++)
            {
                grid[x, y] = TileType.Floor;
            }
        }
    }
    
    private void CreatePerimeterWalls()
    {
        // Crear paredes en el perímetro
        for (int x = 0; x < gridWidth; x++)
        {
            for (int y = 0; y < gridHeight; y++)
            {
                if (x == 0 || x == gridWidth - 1 || y == 0 || y == gridHeight - 1)
                {
                    grid[x, y] = TileType.Wall;
                }
            }
        }
    }
    
    private void CreateVisualGrid()
    {
        Vector3 startPosition = GetStartPosition();
        
        for (int x = 0; x < gridWidth; x++)
        {
            for (int y = 0; y < gridHeight; y++)
            {
                Vector3 position = startPosition + new Vector3(x * tileSize, y * tileSize, 0);
                CreateTile(x, y, position, grid[x, y]);
            }
        }
    }
    
    private Vector3 GetStartPosition()
    {
        if (centerGrid)
        {
            float offsetX = -(gridWidth * tileSize) / 2f + tileSize / 2f;
            float offsetY = -(gridHeight * tileSize) / 2f + tileSize / 2f;
            return transform.position + new Vector3(offsetX, offsetY, 0);
        }
        return transform.position;
    }
    
    private void CreateTile(int x, int y, Vector3 position, TileType tileType)
    {
        GameObject tileObj = new GameObject($"Tile_{x}_{y}_{tileType}");
        tileObj.transform.position = position;
        tileObj.transform.SetParent(gridParent);
        
        // Agregar SpriteRenderer
        SpriteRenderer spriteRenderer = tileObj.AddComponent<SpriteRenderer>();
        spriteRenderer.sprite = GetSpriteForTileType(tileType);
        spriteRenderer.sortingOrder = GetSortingOrderForTileType(tileType);
        
        // Agregar colliders según el tipo
        AddCollidersForTileType(tileObj, tileType);
        
        // ===== NUEVA FUNCIONALIDAD: Agregar TileProperties =====
        if (addTileProperties)
        {
            TileProperties tileProps = tileObj.AddComponent<TileProperties>();
            
            // Configurar propiedades básicas
            tileProps.Type = tileType;
            tileProps.GridPosition = new Vector2Int(x, y);
            
            // Configurar debug si está habilitado
            if (enableDebugInfo)
            {
                // Usar reflexión para acceder al campo privado showDebugInfo
                var field = typeof(TileProperties).GetField("showDebugInfo", 
                    System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
                if (field != null)
                {
                    field.SetValue(tileProps, true);
                }
            }
        }
        
        tileObjects[x, y] = tileObj;
    }
    
    private void AddCollidersForTileType(GameObject tileObj, TileType tileType)
    {
        switch (tileType)
        {
            case TileType.Wall:
                BoxCollider2D collider = tileObj.AddComponent<BoxCollider2D>();
                collider.size = Vector2.one * tileSize;
                break;
        }
    }
    
    private Sprite GetSpriteForTileType(TileType tileType)
    {
        switch (tileType)
        {
            case TileType.Floor:
                return floorSprite;
            case TileType.Wall:
                return wallSprite;
            default:
                return null;
        }
    }
    
    private int GetSortingOrderForTileType(TileType tileType)
    {
        switch (tileType)
        {
            case TileType.Floor:
                return 0;
            case TileType.Wall:
                return 1;
            default:
                return 0;
        }
    }
    
    // Métodos públicos para modificar el grid
    public void SetTile(int x, int y, TileType tileType)
    {
        if (IsValidPosition(x, y))
        {
            grid[x, y] = tileType;
            
            // Actualizar visual si ya existe
            if (tileObjects[x, y] != null)
            {
                DestroyImmediate(tileObjects[x, y]);
            }
            
            Vector3 position = GetStartPosition() + new Vector3(x * tileSize, y * tileSize, 0);
            CreateTile(x, y, position, tileType);
        }
    }
    
    public TileType GetTile(int x, int y)
    {
        if (IsValidPosition(x, y))
        {
            return grid[x, y];
        }
        return TileType.Floor; // Cambié Empty por Floor
    }
    
    public bool IsValidPosition(int x, int y)
    {
        return x >= 0 && x < gridWidth && y >= 0 && y < gridHeight;
    }
    
    /// <summary>
    /// Obtiene el componente TileProperties de un tile específico
    /// </summary>
    public TileProperties GetTileProperties(int x, int y)
    {
        if (IsValidPosition(x, y) && tileObjects[x, y] != null)
        {
            return tileObjects[x, y].GetComponent<TileProperties>();
        }
        return null;
    }
    
    /// <summary>
    /// Obtiene todos los tiles con propiedades específicas
    /// </summary>
    public TileProperties[] GetTilesWithProperties(System.Func<TileProperties, bool> predicate)
    {
        System.Collections.Generic.List<TileProperties> result = new System.Collections.Generic.List<TileProperties>();
        
        for (int x = 0; x < gridWidth; x++)
        {
            for (int y = 0; y < gridHeight; y++)
            {
                TileProperties props = GetTileProperties(x, y);
                if (props != null && predicate(props))
                {
                    result.Add(props);
                }
            }
        }
        
        return result.ToArray();
    }
    
    // Gizmos para debug
    void OnDrawGizmos()
    {
        if (!showGridGizmos) return;
        
        Vector3 startPos = GetStartPosition();
        Gizmos.color = Color.white;
        
        // Dibujar líneas de la grid
        for (int x = 0; x <= gridWidth; x++)
        {
            Vector3 start = startPos + new Vector3(x * tileSize, 0, 0);
            Vector3 end = startPos + new Vector3(x * tileSize, gridHeight * tileSize, 0);
            Gizmos.DrawLine(start, end);
        }
        
        for (int y = 0; y <= gridHeight; y++)
        {
            Vector3 start = startPos + new Vector3(0, y * tileSize, 0);
            Vector3 end = startPos + new Vector3(gridWidth * tileSize, y * tileSize, 0);
            Gizmos.DrawLine(start, end);
        }
    }
}
