# Automata Factory - Commit Helper v3
# Script interactivo para commits siguiendo las convenciones del proyecto

Write-Host "Automata Factory - Commit Helper v3" -ForegroundColor Cyan
Write-Host "====================================" -ForegroundColor Cyan
Write-Host ""

# Verificar si estamos en un repositorio Git
if (-not (Test-Path ".git")) {
    Write-Host "Error: No estas en un repositorio Git" -ForegroundColor Red
    exit 1
}

# Verificar si hay cambios para commitear
$status = git status --porcelain
if (-not $status) {
    Write-Host "No hay cambios para commitear" -ForegroundColor Yellow
    Write-Host "Ejecuta 'git add .' primero si tienes cambios pendientes" -ForegroundColor Yellow
    exit 0
}

Write-Host "Cambios detectados:" -ForegroundColor Green
git status --short
Write-Host ""

# Definir tipos de commit de forma simple
Write-Host "Selecciona el tipo de commit:" -ForegroundColor Yellow
Write-Host ""
Write-Host "  1. feat - Nueva funcionalidad" -ForegroundColor White
Write-Host "  2. fix - Correccion de bugs" -ForegroundColor White
Write-Host "  3. docs - Documentacion" -ForegroundColor White
Write-Host "  4. config - Configuracion" -ForegroundColor White
Write-Host "  5. wip - Work in progress" -ForegroundColor White
Write-Host "  6. milestone - Fase completada" -ForegroundColor White
Write-Host "  7. db - MongoDB/Base de datos" -ForegroundColor White
Write-Host "  8. unity - Unity/Cliente" -ForegroundColor White
Write-Host "  9. api - API/Backend" -ForegroundColor White
Write-Host "  10. ui - UI/Interfaz" -ForegroundColor White
Write-Host "  11. refactor - Refactoring" -ForegroundColor White
Write-Host "  12. test - Testing" -ForegroundColor White
Write-Host "  13. security - Seguridad" -ForegroundColor White
Write-Host "  14. perf - Performance" -ForegroundColor White
Write-Host "  15. hotfix - Hotfix critico" -ForegroundColor White
Write-Host "  16. tool - Herramientas/Scripts" -ForegroundColor White
Write-Host ""

# Solicitar tipo de commit
do {
    $commitChoice = Read-Host "Ingresa el numero del tipo de commit (1-16)"
    $validChoice = $commitChoice -match '^([1-9]|1[0-6])$'
    if (-not $validChoice) {
        Write-Host "Por favor ingresa un numero entre 1 y 16" -ForegroundColor Red
    }
} while (-not $validChoice)

# Definir emoji y codigo segun la seleccion
$emoji = ""
$code = ""
$desc = ""

switch ($commitChoice) {
    "1"  { $emoji = "✨"; $code = "feat"; $desc = "Nueva funcionalidad" }
    "2"  { $emoji = "🐛"; $code = "fix"; $desc = "Correccion de bugs" }
    "3"  { $emoji = "📚"; $code = "docs"; $desc = "Documentacion" }
    "4"  { $emoji = "🔧"; $code = "config"; $desc = "Configuracion" }
    "5"  { $emoji = "🚧"; $code = "wip"; $desc = "Work in progress" }
    "6"  { $emoji = "🎉"; $code = "milestone"; $desc = "Fase completada" }
    "7"  { $emoji = "🗄️"; $code = "db"; $desc = "MongoDB/Base de datos" }
    "8"  { $emoji = "🎮"; $code = "unity"; $desc = "Unity/Cliente" }
    "9"  { $emoji = "🌐"; $code = "api"; $desc = "API/Backend" }
    "10" { $emoji = "💄"; $code = "ui"; $desc = "UI/Interfaz" }
    "11" { $emoji = "🔨"; $code = "refactor"; $desc = "Refactoring" }
    "12" { $emoji = "🚨"; $code = "test"; $desc = "Testing" }
    "13" { $emoji = "🔒"; $code = "security"; $desc = "Seguridad" }
    "14" { $emoji = "🐎"; $code = "perf"; $desc = "Performance" }
    "15" { $emoji = "🚑"; $code = "hotfix"; $desc = "Hotfix critico" }
    "16" { $emoji = "🛠️"; $code = "tool"; $desc = "Herramientas/Scripts" }
}

Write-Host "Seleccionado: $emoji $desc" -ForegroundColor Green
Write-Host ""

# Solicitar mensaje del commit
Write-Host "Ingresa el mensaje del commit:" -ForegroundColor Yellow
Write-Host "Ejemplo: 'Implementar sistema de autenticacion JWT'" -ForegroundColor Gray
$commitMessage = Read-Host "Mensaje"

if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    Write-Host "Error: El mensaje no puede estar vacio" -ForegroundColor Red
    exit 1
}

# Construir mensaje completo del commit
$fullCommitMessage = "$emoji $code`: $commitMessage"

Write-Host ""
Write-Host "Mensaje del commit:" -ForegroundColor Cyan
Write-Host "   $fullCommitMessage" -ForegroundColor White
Write-Host ""

# Mostrar rama actual
$currentBranch = git branch --show-current
Write-Host "Rama actual: $currentBranch" -ForegroundColor Green
Write-Host ""

# Solicitar rama destino
Write-Host "A que rama quieres hacer commit?" -ForegroundColor Yellow
Write-Host "Presiona Enter para usar la rama actual ($currentBranch)" -ForegroundColor Gray
$targetBranch = Read-Host "Rama destino"

if ([string]::IsNullOrWhiteSpace($targetBranch)) {
    $targetBranch = $currentBranch
}

# Cambiar de rama si es necesario
if ($targetBranch -ne $currentBranch) {
    $branchExists = git branch --list $targetBranch
    if (-not $branchExists) {
        Write-Host "La rama '$targetBranch' no existe localmente" -ForegroundColor Yellow
        $createBranch = Read-Host "Quieres crearla? (y/N)"
        if ($createBranch -eq "y" -or $createBranch -eq "Y") {
            Write-Host "Creando rama '$targetBranch'..." -ForegroundColor Cyan
            git checkout -b $targetBranch
            if ($LASTEXITCODE -ne 0) {
                Write-Host "Error al crear la rama" -ForegroundColor Red
                exit 1
            }
        } else {
            Write-Host "Operacion cancelada" -ForegroundColor Red
            exit 1
        }
    } else {
        Write-Host "Cambiando a rama '$targetBranch'..." -ForegroundColor Cyan
        git checkout $targetBranch
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Error al cambiar de rama" -ForegroundColor Red
            exit 1
        }
    }
}

Write-Host ""
Write-Host "Resumen del commit:" -ForegroundColor Cyan
Write-Host "   Tipo: $emoji $desc" -ForegroundColor White
Write-Host "   Mensaje: $fullCommitMessage" -ForegroundColor White
Write-Host "   Rama: $targetBranch" -ForegroundColor White
Write-Host ""

# Confirmacion final
$confirm = Read-Host "Confirmas el commit? (Y/n)"
if ($confirm -eq "n" -or $confirm -eq "N") {
    Write-Host "Commit cancelado" -ForegroundColor Red
    exit 0
}

# Realizar el commit
Write-Host "Realizando commit..." -ForegroundColor Cyan
git add .
git commit -m $fullCommitMessage

if ($LASTEXITCODE -eq 0) {
    Write-Host "Commit realizado exitosamente!" -ForegroundColor Green
    Write-Host ""
    
    # Preguntar si quiere hacer push
    $pushConfirm = Read-Host "Quieres hacer push a origin/$targetBranch? (Y/n)"
    if ($pushConfirm -ne "n" -and $pushConfirm -ne "N") {
        Write-Host "Haciendo push..." -ForegroundColor Cyan
        git push origin $targetBranch
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Push realizado exitosamente!" -ForegroundColor Green
        } else {
            Write-Host "Error en el push, pero el commit local fue exitoso" -ForegroundColor Yellow
        }
    }
    
    Write-Host ""
    Write-Host "Proximos pasos sugeridos:" -ForegroundColor Cyan
    Write-Host "   1. Actualizar documentacion de progreso si corresponde" -ForegroundColor White
    Write-Host "   2. Verificar que el commit sigue las convenciones del proyecto" -ForegroundColor White
    Write-Host "   3. Continuar con el siguiente task de la fase" -ForegroundColor White
} else {
    Write-Host "Error al realizar el commit" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Gracias por contribuir a Automata Factory!" -ForegroundColor Cyan 