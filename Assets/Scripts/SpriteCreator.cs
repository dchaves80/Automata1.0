using UnityEngine;

public class SpriteCreator : MonoBehaviour
{
    [Header("Sprite Creation")]
    [SerializeField] private int spriteSize = 64;
    
    [Header("Foundation Colors")]
    [SerializeField] private Color floorColor = new Color(0.7f, 0.7f, 0.7f, 1f);     // Gris para piso industrial
    [SerializeField] private Color wallColor = new Color(0.4f, 0.4f, 0.4f, 1f);      // Gris oscuro para paredes
    
    [ContextMenu("Create Foundation Sprites")]
    public void CreateFoundationSprites()
    {
        SceneGenerator sceneGen = GetComponent<SceneGenerator>();
        if (sceneGen == null)
        {
            Debug.LogError("SceneGenerator component not found! Add this script to the same GameObject as SceneGenerator.");
            return;
        }
        
        // Crear sprites básicos para fundaciones
        var floorSprite = CreateIndustrialFloorSprite();
        var wallSprite = CreateConcreteWallSprite();
        
        // Asignar sprites al SceneGenerator usando reflexión
        var sceneGenType = typeof(SceneGenerator);
        var floorField = sceneGenType.GetField("floorSprite", System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
        var wallField = sceneGenType.GetField("wallSprite", System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
        
        if (floorField != null) floorField.SetValue(sceneGen, floorSprite);
        if (wallField != null) wallField.SetValue(sceneGen, wallSprite);
        
        Debug.Log("Foundation sprites created and assigned to SceneGenerator!");
        Debug.Log("Now you can use 'Generate Factory Foundation' on the SceneGenerator.");
    }
    
    [ContextMenu("Create Simple Colored Sprites")]
    public void CreateSimpleColoredSprites()
    {
        SceneGenerator sceneGen = GetComponent<SceneGenerator>();
        if (sceneGen == null)
        {
            Debug.LogError("SceneGenerator component not found!");
            return;
        }
        
        // Crear sprites de colores sólidos simples
        var floorSprite = CreateColoredSprite(floorColor, "Floor_Sprite");
        var wallSprite = CreateColoredSprite(wallColor, "Wall_Sprite");
        
        // Asignar sprites
        var sceneGenType = typeof(SceneGenerator);
        var floorField = sceneGenType.GetField("floorSprite", System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
        var wallField = sceneGenType.GetField("wallSprite", System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);
        
        if (floorField != null) floorField.SetValue(sceneGen, floorSprite);
        if (wallField != null) wallField.SetValue(sceneGen, wallSprite);
        
        Debug.Log("Simple colored sprites created and assigned!");
    }
    
    private Sprite CreateIndustrialFloorSprite()
    {
        Texture2D texture = new Texture2D(spriteSize, spriteSize);
        
        for (int x = 0; x < spriteSize; x++)
        {
            for (int y = 0; y < spriteSize; y++)
            {
                Color baseColor = floorColor;
                
                // Crear patrón de baldosas industriales
                int tileSize = spriteSize / 8;
                bool isGridLine = (x % tileSize == 0 || y % tileSize == 0);
                
                if (isGridLine)
                {
                    // Líneas de separación más oscuras
                    baseColor = new Color(floorColor.r * 0.8f, floorColor.g * 0.8f, floorColor.b * 0.8f, floorColor.a);
                }
                else
                {
                    // Variación sutil en las baldosas
                    int tileX = x / tileSize;
                    int tileY = y / tileSize;
                    if ((tileX + tileY) % 2 == 0)
                    {
                        baseColor = new Color(floorColor.r * 0.95f, floorColor.g * 0.95f, floorColor.b * 0.95f, floorColor.a);
                    }
                }
                
                texture.SetPixel(x, y, baseColor);
            }
        }
        
        texture.Apply();
        
        return Sprite.Create(
            texture,
            new Rect(0, 0, spriteSize, spriteSize),
            new Vector2(0.5f, 0.5f),
            spriteSize
        );
    }
    
    private Sprite CreateConcreteWallSprite()
    {
        Texture2D texture = new Texture2D(spriteSize, spriteSize);
        
        for (int x = 0; x < spriteSize; x++)
        {
            for (int y = 0; y < spriteSize; y++)
            {
                Color baseColor = wallColor;
                
                // Crear textura de concreto con variaciones
                float noise = Mathf.PerlinNoise(x * 0.1f, y * 0.1f);
                float variation = 0.9f + (noise * 0.2f); // Variación entre 0.9 y 1.1
                
                baseColor = new Color(
                    wallColor.r * variation,
                    wallColor.g * variation,
                    wallColor.b * variation,
                    wallColor.a
                );
                
                // Agregar algunas líneas horizontales para simular bloques de concreto
                if (y % (spriteSize / 4) == 0)
                {
                    baseColor = new Color(baseColor.r * 0.7f, baseColor.g * 0.7f, baseColor.b * 0.7f, baseColor.a);
                }
                
                texture.SetPixel(x, y, baseColor);
            }
        }
        
        texture.Apply();
        
        return Sprite.Create(
            texture,
            new Rect(0, 0, spriteSize, spriteSize),
            new Vector2(0.5f, 0.5f),
            spriteSize
        );
    }
    
    private Sprite CreateColoredSprite(Color color, string name)
    {
        Texture2D texture = new Texture2D(spriteSize, spriteSize);
        
        Color[] pixels = new Color[spriteSize * spriteSize];
        for (int i = 0; i < pixels.Length; i++)
        {
            pixels[i] = color;
        }
        
        texture.SetPixels(pixels);
        texture.Apply();
        
        Sprite sprite = Sprite.Create(
            texture,
            new Rect(0, 0, spriteSize, spriteSize),
            new Vector2(0.5f, 0.5f),
            spriteSize
        );
        
        sprite.name = name;
        return sprite;
    }
} 