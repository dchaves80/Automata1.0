# 🎯 Automata Factory - Commit Helper v2
# Script interactivo para commits siguiendo las convenciones del proyecto

Write-Host "🏭 Automata Factory - Commit Helper v2" -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan
Write-Host ""

# Verificar si estamos en un repositorio Git
if (-not (Test-Path ".git")) {
    Write-Host "❌ Error: No estás en un repositorio Git" -ForegroundColor Red
    exit 1
}

# Verificar si hay cambios para commitear
$status = git status --porcelain
if (-not $status) {
    Write-Host "ℹ️  No hay cambios para commitear" -ForegroundColor Yellow
    Write-Host "Ejecuta 'git add .' primero si tienes cambios pendientes" -ForegroundColor Yellow
    exit 0
}

Write-Host "📋 Cambios detectados:" -ForegroundColor Green
git status --short
Write-Host ""

# Definir tipos de commit con emojis usando códigos Unicode válidos
$commitTypes = @{
    "1"  = @{ emoji = [char]0x2728; code = "feat"; desc = "Nueva funcionalidad" }
    "2"  = @{ emoji = [char]0x1F41B; code = "fix"; desc = "Correccion de bugs" }
    "3"  = @{ emoji = [char]0x1F4DA; code = "docs"; desc = "Documentacion" }
    "4"  = @{ emoji = [char]0x1F527; code = "config"; desc = "Configuracion" }
    "5"  = @{ emoji = [char]0x1F6A7; code = "wip"; desc = "Work in progress" }
    "6"  = @{ emoji = [char]0x1F389; code = "milestone"; desc = "Fase completada" }
    "7"  = @{ emoji = [char]0x1F5C4; code = "db"; desc = "MongoDB/Base de datos" }
    "8"  = @{ emoji = [char]0x1F3AE; code = "unity"; desc = "Unity/Cliente" }
    "9"  = @{ emoji = [char]0x1F310; code = "api"; desc = "API/Backend" }
    "10" = @{ emoji = [char]0x1F484; code = "ui"; desc = "UI/Interfaz" }
    "11" = @{ emoji = [char]0x1F528; code = "refactor"; desc = "Refactoring" }
    "12" = @{ emoji = [char]0x1F6A8; code = "test"; desc = "Testing" }
    "13" = @{ emoji = [char]0x1F512; code = "security"; desc = "Seguridad" }
    "14" = @{ emoji = [char]0x1F40E; code = "perf"; desc = "Performance" }
    "15" = @{ emoji = [char]0x1F691; code = "hotfix"; desc = "Hotfix critico" }
    "16" = @{ emoji = [char]0x1F6E0; code = "tool"; desc = "Herramientas/Scripts" }
}

# Mostrar opciones de commit
Write-Host "🎨 Selecciona el tipo de commit:" -ForegroundColor Yellow
Write-Host ""
foreach ($key in ($commitTypes.Keys | Sort-Object {[int]$_})) {
    $type = $commitTypes[$key]
    Write-Host "  $key. $($type.emoji) $($type.desc)" -ForegroundColor White
}
Write-Host ""

# Solicitar tipo de commit
do {
    $commitChoice = Read-Host "Ingresa el numero del tipo de commit (1-16)"
} while (-not $commitTypes.ContainsKey($commitChoice))

$selectedType = $commitTypes[$commitChoice]
Write-Host "✅ Seleccionado: $($selectedType.emoji) $($selectedType.desc)" -ForegroundColor Green
Write-Host ""

# Solicitar mensaje del commit
Write-Host "📝 Ingresa el mensaje del commit:" -ForegroundColor Yellow
Write-Host "   Ejemplo: 'Implementar sistema de autenticacion JWT'" -ForegroundColor Gray
$commitMessage = Read-Host "Mensaje"

if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    Write-Host "❌ Error: El mensaje no puede estar vacio" -ForegroundColor Red
    exit 1
}

# Construir mensaje completo del commit
$fullCommitMessage = "$($selectedType.emoji) $($selectedType.code): $commitMessage"

Write-Host ""
Write-Host "📋 Mensaje del commit:" -ForegroundColor Cyan
Write-Host "   $fullCommitMessage" -ForegroundColor White
Write-Host ""

# Mostrar ramas disponibles
Write-Host "🌿 Ramas disponibles:" -ForegroundColor Yellow
$localBranches = git branch | ForEach-Object { $_.Trim() -replace '^\*\s*', '' }
$currentBranch = git branch --show-current

Write-Host "   Rama actual: $currentBranch" -ForegroundColor Green
Write-Host ""
Write-Host "   Ramas locales:" -ForegroundColor Cyan
foreach ($branch in $localBranches) {
    if ($branch -eq $currentBranch) {
        Write-Host "   → $branch (actual)" -ForegroundColor Green
    } else {
        Write-Host "   → $branch" -ForegroundColor White
    }
}
Write-Host ""

# Solicitar rama destino
Write-Host "🎯 ¿A que rama quieres hacer commit?" -ForegroundColor Yellow
Write-Host "   Presiona Enter para usar la rama actual ($currentBranch)" -ForegroundColor Gray
$targetBranch = Read-Host "Rama destino"

if ([string]::IsNullOrWhiteSpace($targetBranch)) {
    $targetBranch = $currentBranch
}

# Verificar si la rama existe
if ($targetBranch -ne $currentBranch) {
    $branchExists = git branch --list $targetBranch
    if (-not $branchExists) {
        Write-Host "⚠️  La rama '$targetBranch' no existe localmente" -ForegroundColor Yellow
        $createBranch = Read-Host "¿Quieres crearla? (y/N)"
        if ($createBranch -eq "y" -or $createBranch -eq "Y") {
            Write-Host "🌿 Creando rama '$targetBranch'..." -ForegroundColor Cyan
            git checkout -b $targetBranch
            if ($LASTEXITCODE -ne 0) {
                Write-Host "❌ Error al crear la rama" -ForegroundColor Red
                exit 1
            }
        } else {
            Write-Host "❌ Operacion cancelada" -ForegroundColor Red
            exit 1
        }
    } else {
        Write-Host "🔄 Cambiando a rama '$targetBranch'..." -ForegroundColor Cyan
        git checkout $targetBranch
        if ($LASTEXITCODE -ne 0) {
            Write-Host "❌ Error al cambiar de rama" -ForegroundColor Red
            exit 1
        }
    }
}

Write-Host ""
Write-Host "📋 Resumen del commit:" -ForegroundColor Cyan
Write-Host "   Tipo: $($selectedType.emoji) $($selectedType.desc)" -ForegroundColor White
Write-Host "   Mensaje: $fullCommitMessage" -ForegroundColor White
Write-Host "   Rama: $targetBranch" -ForegroundColor White
Write-Host ""

# Confirmación final
$confirm = Read-Host "¿Confirmas el commit? (Y/n)"
if ($confirm -eq "n" -or $confirm -eq "N") {
    Write-Host "❌ Commit cancelado" -ForegroundColor Red
    exit 0
}

# Realizar el commit
Write-Host "🚀 Realizando commit..." -ForegroundColor Cyan
git add .
git commit -m $fullCommitMessage

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Commit realizado exitosamente!" -ForegroundColor Green
    Write-Host ""
    
    # Preguntar si quiere hacer push
    $pushConfirm = Read-Host "¿Quieres hacer push a origin/$targetBranch? (Y/n)"
    if ($pushConfirm -ne "n" -and $pushConfirm -ne "N") {
        Write-Host "📤 Haciendo push..." -ForegroundColor Cyan
        git push origin $targetBranch
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✅ Push realizado exitosamente!" -ForegroundColor Green
        } else {
            Write-Host "⚠️  Error en el push, pero el commit local fue exitoso" -ForegroundColor Yellow
        }
    }
    
    Write-Host ""
    Write-Host "🎯 Proximos pasos sugeridos:" -ForegroundColor Cyan
    Write-Host "   1. Actualizar documentacion de progreso si corresponde" -ForegroundColor White
    Write-Host "   2. Verificar que el commit sigue las convenciones del proyecto" -ForegroundColor White
    Write-Host "   3. Continuar con el siguiente task de la fase" -ForegroundColor White
    
} else {
    Write-Host "❌ Error al realizar el commit" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🏭 ¡Gracias por contribuir a Automata Factory!" -ForegroundColor Cyan 