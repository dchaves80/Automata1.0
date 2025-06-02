using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(SceneGenerator))]
public class SceneGeneratorEditor : Editor
{
    private bool showTilePropertiesInfo = false;
    private bool showDebugTools = false;
    private Vector2Int selectedTile = Vector2Int.zero;
    
    public override void OnInspectorGUI()
    {
        // Dibujar el inspector por defecto
        DrawDefaultInspector();
        
        SceneGenerator sceneGenerator = (SceneGenerator)target;
        
        // Agregar espacio
        EditorGUILayout.Space(10);
        
        // ===== SECCIÓN DE EXPANSIÓN DE TERRENO =====
        EditorGUILayout.LabelField("🏗️ Grid Expansion Testing", EditorStyles.boldLabel);
        
        EditorGUILayout.BeginHorizontal();
        
        // Botón para agregar fila abajo
        if (GUILayout.Button("🔧 Add Row (Bottom)", GUILayout.Height(30)))
        {
            sceneGenerator.AddRowBottom();
        }
        
        // Botón para agregar columna derecha
        if (GUILayout.Button("🔧 Add Column (Right)", GUILayout.Height(30)))
        {
            sceneGenerator.AddColumnRight();
        }
        
        EditorGUILayout.EndHorizontal();
        
        // Botón para expandir en ambas direcciones
        if (GUILayout.Button("🔧 Expand Both Directions", GUILayout.Height(30)))
        {
            sceneGenerator.ExpandBothDirections();
        }
        
        // Información actual de la grilla
        EditorGUILayout.Space(5);
        Vector2Int currentSize = sceneGenerator.GetGridSize();
        EditorGUILayout.LabelField($"Current Grid Size: {currentSize.x} x {currentSize.y}", EditorStyles.helpBox);
        
        // Información de costos
        EditorGUILayout.Space(5);
        EditorGUILayout.LabelField("💰 Expansion Costs:", EditorStyles.boldLabel);
        int costRight = sceneGenerator.GetExpansionCost(0, 1);
        int costBottom = sceneGenerator.GetExpansionCost(1, 1);
        int costBoth = sceneGenerator.GetExpansionCost(2, 1);
        EditorGUILayout.LabelField($"• Add Column (Right): {costRight} coins");
        EditorGUILayout.LabelField($"• Add Row (Bottom): {costBottom} coins");
        EditorGUILayout.LabelField($"• Expand Both: {costBoth} coins");
        
        // ===== SECCIÓN DE PROPIEDADES DE TILES =====
        EditorGUILayout.Space(15);
        showTilePropertiesInfo = EditorGUILayout.Foldout(showTilePropertiesInfo, "🔍 Tile Properties Inspector", true);
        
        if (showTilePropertiesInfo)
        {
            EditorGUI.indentLevel++;
            
            // Selector de tile
            EditorGUILayout.LabelField("Select Tile to Inspect:", EditorStyles.boldLabel);
            selectedTile = EditorGUILayout.Vector2IntField("Grid Position (X, Y):", selectedTile);
            
            // Validar posición
            if (sceneGenerator.IsValidPosition(selectedTile.x, selectedTile.y))
            {
                TileProperties tileProps = sceneGenerator.GetTileProperties(selectedTile.x, selectedTile.y);
                
                if (tileProps != null)
                {
                    EditorGUILayout.Space(5);
                    EditorGUILayout.LabelField("📊 Tile Information:", EditorStyles.boldLabel);
                    
                    // Mostrar información básica
                    EditorGUILayout.LabelField($"Type: {tileProps.Type}");
                    EditorGUILayout.LabelField($"Status: {tileProps.Status}");
                    EditorGUILayout.LabelField($"Position: ({tileProps.GridPosition.x}, {tileProps.GridPosition.y})");
                    
                    EditorGUILayout.Space(3);
                    EditorGUILayout.LabelField("⚡ Production Capabilities:", EditorStyles.boldLabel);
                    EditorGUILayout.LabelField($"Can Place Machinery: {tileProps.CanPlaceMachinery}");
                    EditorGUILayout.LabelField($"Has Electricity: {tileProps.HasElectricity}");
                    EditorGUILayout.LabelField($"Has Water Access: {tileProps.HasWaterAccess}");
                    EditorGUILayout.LabelField($"Max Weight: {tileProps.MaxWeight} kg");
                    
                    EditorGUILayout.Space(3);
                    EditorGUILayout.LabelField("🚛 Movement Properties:", EditorStyles.boldLabel);
                    EditorGUILayout.LabelField($"Allows Movement: {tileProps.AllowsMovement}");
                    EditorGUILayout.LabelField($"Speed Modifier: {tileProps.SpeedModifier}x");
                    
                    EditorGUILayout.Space(3);
                    EditorGUILayout.LabelField("💰 Economic Properties:", EditorStyles.boldLabel);
                    EditorGUILayout.LabelField($"Construction Cost: {tileProps.ConstructionCost}");
                    EditorGUILayout.LabelField($"Maintenance Cost: {tileProps.MaintenanceCost}");
                    EditorGUILayout.LabelField($"Demolition Value: {tileProps.DemolitionValue}");
                    
                    EditorGUILayout.Space(3);
                    EditorGUILayout.LabelField("🔧 Technical Properties:", EditorStyles.boldLabel);
                    EditorGUILayout.LabelField($"Durability: {tileProps.CurrentDurability}");
                    EditorGUILayout.LabelField($"Temperature Resistance: {tileProps.TemperatureResistance}°C");
                    
                    // Botón para mostrar información completa
                    EditorGUILayout.Space(5);
                    if (GUILayout.Button("📋 Show Complete Info in Console"))
                    {
                        Debug.Log(tileProps.GetTileInfo());
                    }
                }
                else
                {
                    EditorGUILayout.HelpBox("No TileProperties component found on this tile.", MessageType.Warning);
                }
            }
            else
            {
                EditorGUILayout.HelpBox($"Invalid position. Grid size is {currentSize.x} x {currentSize.y}", MessageType.Error);
            }
            
            EditorGUI.indentLevel--;
        }
        
        // ===== SECCIÓN DE HERRAMIENTAS DE DEBUG =====
        EditorGUILayout.Space(15);
        showDebugTools = EditorGUILayout.Foldout(showDebugTools, "🛠️ Debug Tools", true);
        
        if (showDebugTools)
        {
            EditorGUI.indentLevel++;
            
            // Estadísticas generales
            EditorGUILayout.LabelField("📈 Grid Statistics:", EditorStyles.boldLabel);
            
            // Contar tipos de tiles
            int floorCount = 0;
            int wallCount = 0;
            int machineCount = 0;
            int spawnerCount = 0;
            int storageCount = 0;
            
            for (int x = 0; x < currentSize.x; x++)
            {
                for (int y = 0; y < currentSize.y; y++)
                {
                    TileProperties props = sceneGenerator.GetTileProperties(x, y);
                    if (props != null)
                    {
                        switch (props.Type)
                        {
                            case TileType.Floor: floorCount++; break;
                            case TileType.Wall: wallCount++; break;
                            case TileType.Machine: machineCount++; break;
                            case TileType.Spawner: spawnerCount++; break;
                            case TileType.Storage: storageCount++; break;
                        }
                    }
                }
            }
            
            EditorGUILayout.LabelField($"Floor Tiles: {floorCount}");
            EditorGUILayout.LabelField($"Wall Tiles: {wallCount}");
            EditorGUILayout.LabelField($"Machine Tiles: {machineCount}");
            EditorGUILayout.LabelField($"Spawner Tiles: {spawnerCount}");
            EditorGUILayout.LabelField($"Storage Tiles: {storageCount}");
            EditorGUILayout.LabelField($"Total Tiles: {floorCount + wallCount + machineCount + spawnerCount + storageCount}");
            
            EditorGUILayout.Space(5);
            EditorGUILayout.LabelField("🔧 Debug Actions:", EditorStyles.boldLabel);
            
            EditorGUILayout.BeginHorizontal();
            
            // Botón para encontrar tiles que pueden colocar maquinaria
            if (GUILayout.Button("Find Machinery Spots"))
            {
                TileProperties[] machinerySpots = sceneGenerator.GetTilesWithProperties(tile => tile.CanPlaceMachinery);
                Debug.Log($"Found {machinerySpots.Length} tiles where machinery can be placed:");
                foreach (var tile in machinerySpots)
                {
                    Debug.Log($"  - Position: ({tile.GridPosition.x}, {tile.GridPosition.y})");
                }
            }
            
            // Botón para encontrar tiles con electricidad
            if (GUILayout.Button("Find Electric Tiles"))
            {
                TileProperties[] electricTiles = sceneGenerator.GetTilesWithProperties(tile => tile.HasElectricity);
                Debug.Log($"Found {electricTiles.Length} tiles with electricity:");
                foreach (var tile in electricTiles)
                {
                    Debug.Log($"  - Position: ({tile.GridPosition.x}, {tile.GridPosition.y}), Type: {tile.Type}");
                }
            }
            
            EditorGUILayout.EndHorizontal();
            
            EditorGUILayout.BeginHorizontal();
            
            // Botón para encontrar tiles bloqueados
            if (GUILayout.Button("Find Blocked Tiles"))
            {
                TileProperties[] blockedTiles = sceneGenerator.GetTilesWithProperties(tile => tile.Status == TileStatus.Blocked);
                Debug.Log($"Found {blockedTiles.Length} blocked tiles:");
                foreach (var tile in blockedTiles)
                {
                    Debug.Log($"  - Position: ({tile.GridPosition.x}, {tile.GridPosition.y}), Type: {tile.Type}");
                }
            }
            
            // Botón para calcular costo total de construcción
            if (GUILayout.Button("Calculate Total Cost"))
            {
                int totalCost = 0;
                for (int x = 0; x < currentSize.x; x++)
                {
                    for (int y = 0; y < currentSize.y; y++)
                    {
                        TileProperties props = sceneGenerator.GetTileProperties(x, y);
                        if (props != null)
                        {
                            totalCost += props.ConstructionCost;
                        }
                    }
                }
                Debug.Log($"Total construction cost of current grid: {totalCost} coins");
            }
            
            EditorGUILayout.EndHorizontal();
            
            EditorGUI.indentLevel--;
        }
        
        // Marcar como dirty si hay cambios
        if (GUI.changed)
        {
            EditorUtility.SetDirty(target);
        }
    }
} 