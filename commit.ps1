# Automata Factory - Commit Helper Simple
# Script interactivo para commits siguiendo las convenciones del proyecto

Write-Host "Automata Factory - Commit Helper Simple" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
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

# Definir tipos de commit
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
Write-Host "  17. varios - Cambios mixtos/varios" -ForegroundColor White
Write-Host ""

# Solicitar tipo de commit
do {
    $commitChoice = Read-Host "Ingresa el numero del tipo de commit (1-17)"
    $validChoice = $commitChoice -match '^([1-9]|1[0-7])$'
    if (-not $validChoice) {
        Write-Host "Por favor ingresa un numero entre 1 y 17" -ForegroundColor Red
    }
} while (-not $validChoice)

# Definir codigo y descripcion segun la seleccion
$code = ""
$desc = ""
$emoji = ""

switch ($commitChoice) {
    "1"  { $code = "feat"; $desc = "Nueva funcionalidad"; $emoji = ":sparkles:" }
    "2"  { $code = "fix"; $desc = "Correccion de bugs"; $emoji = ":bug:" }
    "3"  { $code = "docs"; $desc = "Documentacion"; $emoji = ":books:" }
    "4"  { $code = "config"; $desc = "Configuracion"; $emoji = ":wrench:" }
    "5"  { $code = "wip"; $desc = "Work in progress"; $emoji = ":construction:" }
    "6"  { $code = "milestone"; $desc = "Fase completada"; $emoji = ":tada:" }
    "7"  { $code = "db"; $desc = "MongoDB/Base de datos"; $emoji = ":file_cabinet:" }
    "8"  { $code = "unity"; $desc = "Unity/Cliente"; $emoji = ":video_game:" }
    "9"  { $code = "api"; $desc = "API/Backend"; $emoji = ":globe_with_meridians:" }
    "10" { $code = "ui"; $desc = "UI/Interfaz"; $emoji = ":lipstick:" }
    "11" { $code = "refactor"; $desc = "Refactoring"; $emoji = ":hammer:" }
    "12" { $code = "test"; $desc = "Testing"; $emoji = ":rotating_light:" }
    "13" { $code = "security"; $desc = "Seguridad"; $emoji = ":lock:" }
    "14" { $code = "perf"; $desc = "Performance"; $emoji = ":racehorse:" }
    "15" { $code = "hotfix"; $desc = "Hotfix critico"; $emoji = ":ambulance:" }
    "16" { $code = "tool"; $desc = "Herramientas/Scripts"; $emoji = ":hammer_and_wrench:" }
    "17" { $code = "varios"; $desc = "Cambios mixtos/varios"; $emoji = ":package:" }
}

Write-Host "Seleccionado: $desc" -ForegroundColor Green
Write-Host ""

# Solicitar mensaje del commit
Write-Host "Ingresa el mensaje del commit:" -ForegroundColor Yellow
Write-Host "Ejemplo: 'Implementar sistema de autenticacion JWT'" -ForegroundColor Gray
$commitMessage = Read-Host "Mensaje"

if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    Write-Host "Error: El mensaje no puede estar vacio" -ForegroundColor Red
    exit 1
}

# Solicitar número de issue (opcional)
Write-Host ""
Write-Host "¿Quieres vincular este commit a un issue de GitHub? (opcional)" -ForegroundColor Yellow
Write-Host "Esto ayuda a mantener trazabilidad del proyecto" -ForegroundColor Gray
$issueNumber = Read-Host "Numero de issue (presiona Enter para omitir)"

# Validar número de issue si se proporciona
$issueReference = ""
if (-not [string]::IsNullOrWhiteSpace($issueNumber)) {
    if ($issueNumber -match '^\d+$') {
        $issueReference = " (closes #$issueNumber)"
        Write-Host "Issue #$issueNumber sera vinculado al commit" -ForegroundColor Green
    } else {
        Write-Host "Numero de issue invalido, continuando sin vincular" -ForegroundColor Yellow
        $issueReference = ""
    }
}

# Construir mensaje completo del commit
$fullCommitMessage = "$emoji $code`: $commitMessage$issueReference"

Write-Host ""
Write-Host "Mensaje del commit:" -ForegroundColor Cyan
Write-Host "   $fullCommitMessage" -ForegroundColor White
if (-not [string]::IsNullOrWhiteSpace($issueReference)) {
    Write-Host "   (Este commit cerrara automaticamente el issue #$issueNumber)" -ForegroundColor Gray
}
Write-Host ""

# Mostrar rama actual
$currentBranch = git branch --show-current
Write-Host "Rama actual: $currentBranch" -ForegroundColor Green
Write-Host ""

# Gestión de ramas mejorada
Write-Host "Gestion de ramas:" -ForegroundColor Yellow
Write-Host "  1. Usar rama actual ($currentBranch)" -ForegroundColor White
Write-Host "  2. Cambiar a otra rama existente" -ForegroundColor White
Write-Host "  3. Crear nueva rama" -ForegroundColor White
Write-Host "  4. Actualizar ramas desde remoto y seleccionar" -ForegroundColor White
Write-Host ""

do {
    $branchChoice = Read-Host "Selecciona una opcion (1-4)"
    $validBranchChoice = $branchChoice -match '^[1-4]$'
    if (-not $validBranchChoice) {
        Write-Host "Por favor ingresa un numero entre 1 y 4" -ForegroundColor Red
    }
} while (-not $validBranchChoice)

$targetBranch = $currentBranch

switch ($branchChoice) {
    "1" {
        # Usar rama actual
        $targetBranch = $currentBranch
        Write-Host "Usando rama actual: $currentBranch" -ForegroundColor Green
    }
    
    "2" {
        # Cambiar a rama existente
        Write-Host ""
        Write-Host "Ramas locales disponibles:" -ForegroundColor Cyan
        
        # Obtener ramas locales de manera más simple
        $branchOutput = git branch
        $localBranches = @()
        
        foreach ($line in $branchOutput) {
            $cleanBranch = $line.Trim() -replace '^\*\s*', ''
            if ($cleanBranch -ne $currentBranch -and $cleanBranch -ne '') {
                $localBranches += $cleanBranch
            }
        }
        
        if ($localBranches.Count -eq 0) {
            Write-Host "No hay otras ramas locales disponibles" -ForegroundColor Yellow
            $targetBranch = $currentBranch
        } else {
            for ($i = 0; $i -lt $localBranches.Count; $i++) {
                Write-Host "  $($i + 1). $($localBranches[$i])" -ForegroundColor White
            }
            Write-Host ""
            
            do {
                $branchIndex = Read-Host "Selecciona el numero de rama (1-$($localBranches.Count))"
                $validIndex = $branchIndex -match "^[1-$($localBranches.Count)]$"
                if (-not $validIndex) {
                    Write-Host "Por favor ingresa un numero entre 1 y $($localBranches.Count)" -ForegroundColor Red
                }
            } while (-not $validIndex)
            
            $targetBranch = $localBranches[$branchIndex - 1]
            Write-Host "Seleccionada: $targetBranch" -ForegroundColor Green
        }
    }
    
    "3" {
        # Crear nueva rama
        Write-Host ""
        $newBranchName = Read-Host "Nombre de la nueva rama"
        if ([string]::IsNullOrWhiteSpace($newBranchName)) {
            Write-Host "Error: El nombre de la rama no puede estar vacio" -ForegroundColor Red
            exit 1
        }
        $targetBranch = $newBranchName
        Write-Host "Nueva rama: $targetBranch" -ForegroundColor Green
    }
    
    "4" {
        # Actualizar desde remoto y seleccionar
        Write-Host ""
        Write-Host "Actualizando ramas desde remoto..." -ForegroundColor Cyan
        git fetch origin
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Ramas actualizadas exitosamente!" -ForegroundColor Green
        } else {
            Write-Host "Advertencia: No se pudieron actualizar las ramas remotas" -ForegroundColor Yellow
        }
        
        Write-Host ""
        Write-Host "Ramas locales:" -ForegroundColor Cyan
        
        # Mostrar ramas locales
        $branchOutput = git branch
        $localBranches = @()
        
        foreach ($line in $branchOutput) {
            $cleanBranch = $line.Trim() -replace '^\*\s*', ''
            if ($cleanBranch -ne $currentBranch -and $cleanBranch -ne '') {
                $localBranches += $cleanBranch
                Write-Host "  $($localBranches.Count). $cleanBranch (local)" -ForegroundColor White
            }
        }
        
        Write-Host ""
        Write-Host "Ramas remotas:" -ForegroundColor Cyan
        
        # Mostrar ramas remotas
        $remoteBranchOutput = git branch -r
        $remoteBranches = @()
        $allBranches = $localBranches.Clone()
        
        foreach ($line in $remoteBranchOutput) {
            $cleanBranch = $line.Trim() -replace '^origin/', ''
            if ($cleanBranch -notlike '*HEAD*' -and $cleanBranch -ne $currentBranch -and $localBranches -notcontains $cleanBranch) {
                $remoteBranches += $cleanBranch
                $allBranches += $cleanBranch
                Write-Host "  $($allBranches.Count). $cleanBranch (remoto)" -ForegroundColor White
            }
        }
        
        if ($allBranches.Count -eq 0) {
            Write-Host "No hay otras ramas disponibles" -ForegroundColor Yellow
            $targetBranch = $currentBranch
        } else {
            Write-Host ""
            do {
                $branchIndex = Read-Host "Selecciona el numero de rama (1-$($allBranches.Count))"
                $validIndex = $branchIndex -match "^[1-$($allBranches.Count)]$"
                if (-not $validIndex) {
                    Write-Host "Por favor ingresa un numero entre 1 y $($allBranches.Count)" -ForegroundColor Red
                }
            } while (-not $validIndex)
            
            $targetBranch = $allBranches[$branchIndex - 1]
            $isRemote = $remoteBranches -contains $targetBranch
            $branchType = if ($isRemote) { "remoto" } else { "local" }
            Write-Host "Seleccionada: $targetBranch ($branchType)" -ForegroundColor Green
        }
    }
}

# Cambiar de rama si es necesario
if ($targetBranch -ne $currentBranch) {
    $branchExists = git branch --list $targetBranch
    if (-not $branchExists) {
        if ($branchChoice -eq "3") {
            # Crear nueva rama
            Write-Host "Creando rama '$targetBranch'..." -ForegroundColor Cyan
            git checkout -b $targetBranch
        } else {
            # Rama remota - crear tracking branch
            Write-Host "Creando rama local '$targetBranch' desde origin/$targetBranch..." -ForegroundColor Cyan
            git checkout -b $targetBranch origin/$targetBranch
        }
        
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Error al crear/cambiar la rama" -ForegroundColor Red
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
Write-Host "   Tipo: $desc" -ForegroundColor White
Write-Host "   Mensaje: $fullCommitMessage" -ForegroundColor White
Write-Host "   Rama: $targetBranch" -ForegroundColor White
if (-not [string]::IsNullOrWhiteSpace($issueReference)) {
    Write-Host "   Issue: #$issueNumber (se cerrara automaticamente)" -ForegroundColor White
}
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
    if (-not [string]::IsNullOrWhiteSpace($issueReference)) {
        Write-Host "El issue #$issueNumber sera cerrado cuando este commit llegue a la rama principal" -ForegroundColor Green
    }
    Write-Host ""
    
    # Preguntar si quiere hacer push
    $pushConfirm = Read-Host "Quieres hacer push a origin/$targetBranch? (Y/n)"
    if ($pushConfirm -ne "n" -and $pushConfirm -ne "N") {
        Write-Host "Haciendo push..." -ForegroundColor Cyan
        git push origin $targetBranch
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Push realizado exitosamente!" -ForegroundColor Green
            if (-not [string]::IsNullOrWhiteSpace($issueReference)) {
                Write-Host "El commit con referencia al issue #$issueNumber esta ahora en GitHub" -ForegroundColor Green
                
                # Verificar estado del issue después del push
                Write-Host ""
                Write-Host "Verificando estado del issue en GitHub..." -ForegroundColor Cyan
                Write-Host "Esperando 5 segundos para que GitHub procese el commit..." -ForegroundColor Gray
                Start-Sleep -Seconds 5
                
                # Obtener información del repositorio remoto
                $remoteUrl = git config --get remote.origin.url
                Write-Host "URL remota detectada: $remoteUrl" -ForegroundColor Gray
                
                # Mejorar la extracción de owner/repo para manejar diferentes formatos de URL
                $owner = ""
                $repo = ""
                
                # Intentar diferentes patrones de URL de GitHub
                if ($remoteUrl -match "github\.com[:/]([^/]+)/(.+?)(?:\.git)?/?$") {
                    $owner = $matches[1]
                    $repo = $matches[2] -replace "\.git$", ""
                } elseif ($remoteUrl -match "^git@github\.com:([^/]+)/(.+?)(?:\.git)?/?$") {
                    $owner = $matches[1]
                    $repo = $matches[2] -replace "\.git$", ""
                } elseif ($remoteUrl -match "^https://github\.com/([^/]+)/(.+?)(?:\.git)?/?$") {
                    $owner = $matches[1]
                    $repo = $matches[2] -replace "\.git$", ""
                }
                
                if ($owner -and $repo) {
                    Write-Host "Repositorio detectado: $owner/$repo" -ForegroundColor Gray
                    Write-Host "Consultando issue #$issueNumber en $owner/$repo..." -ForegroundColor Cyan
                    
                    try {
                        # Hacer curl a la API de GitHub
                        $apiUrl = "https://api.github.com/repos/$owner/$repo/issues/$issueNumber"
                        $response = Invoke-RestMethod -Uri $apiUrl -Method Get -ErrorAction Stop
                        
                        Write-Host ""
                        Write-Host "=== ESTADO DEL ISSUE #$issueNumber ===" -ForegroundColor Yellow
                        Write-Host "Titulo: $($response.title)" -ForegroundColor White
                        Write-Host "Estado: $($response.state.ToUpper())" -ForegroundColor $(if ($response.state -eq "closed") { "Green" } else { "Yellow" })
                        Write-Host "Creado: $($response.created_at)" -ForegroundColor Gray
                        if ($response.closed_at) {
                            Write-Host "Cerrado: $($response.closed_at)" -ForegroundColor Green
                        }
                        Write-Host "URL: $($response.html_url)" -ForegroundColor Cyan
                        
                        if ($response.state -eq "closed") {
                            Write-Host ""
                            Write-Host "✅ El issue fue cerrado exitosamente!" -ForegroundColor Green
                        } else {
                            Write-Host ""
                            Write-Host "⏳ El issue aun esta abierto. Puede tardar unos minutos en cerrarse automaticamente." -ForegroundColor Yellow
                            Write-Host "   Esto es normal si el commit no esta en la rama principal aun." -ForegroundColor Gray
                        }
                        
                    } catch {
                        Write-Host ""
                        Write-Host "⚠️  No se pudo verificar el estado del issue:" -ForegroundColor Yellow
                        Write-Host "   $($_.Exception.Message)" -ForegroundColor Gray
                        Write-Host "   Puedes verificar manualmente en: https://github.com/$owner/$repo/issues/$issueNumber" -ForegroundColor Cyan
                    }
                } else {
                    Write-Host "⚠️  No se pudo determinar el repositorio de GitHub desde la URL remota" -ForegroundColor Yellow
                    Write-Host "   URL detectada: $remoteUrl" -ForegroundColor Gray
                    Write-Host "   Formatos soportados:" -ForegroundColor Gray
                    Write-Host "     - https://github.com/usuario/repositorio" -ForegroundColor Gray
                    Write-Host "     - https://github.com/usuario/repositorio.git" -ForegroundColor Gray
                    Write-Host "     - git@github.com:usuario/repositorio.git" -ForegroundColor Gray
                    Write-Host "   Puedes verificar manualmente el issue en GitHub" -ForegroundColor Cyan
                }
            }
        } else {
            Write-Host "Error en el push, pero el commit local fue exitoso" -ForegroundColor Yellow
        }
    }
    
    Write-Host ""
    Write-Host "Proximos pasos sugeridos:" -ForegroundColor Cyan
    Write-Host "   1. Actualizar documentacion de progreso si corresponde" -ForegroundColor White
    Write-Host "   2. Verificar que el commit sigue las convenciones del proyecto" -ForegroundColor White
    Write-Host "   3. Continuar con el siguiente task de la fase" -ForegroundColor White
    if (-not [string]::IsNullOrWhiteSpace($issueReference)) {
        Write-Host "   4. Verificar en GitHub que el issue #$issueNumber fue vinculado" -ForegroundColor White
    }
} else {
    Write-Host "Error al realizar el commit" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Gracias por contribuir a Automata Factory!" -ForegroundColor Cyan 