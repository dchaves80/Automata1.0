#!/bin/bash

# Automata Factory - Commit Helper Simple
# Script interactivo para commits siguiendo las convenciones del proyecto

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color

echo -e "${CYAN}Automata Factory - Commit Helper Simple${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""

# Verificar si estamos en un repositorio Git
if [ ! -d ".git" ]; then
    echo -e "${RED}Error: No estas en un repositorio Git${NC}"
    exit 1
fi

# Verificar si hay cambios para commitear
status=$(git status --porcelain)
if [ -z "$status" ]; then
    echo -e "${YELLOW}No hay cambios para commitear${NC}"
    echo -e "${YELLOW}Ejecuta 'git add .' primero si tienes cambios pendientes${NC}"
    exit 0
fi

echo -e "${GREEN}Cambios detectados:${NC}"
git status --short
echo ""

# Definir tipos de commit
echo -e "${YELLOW}Selecciona el tipo de commit:${NC}"
echo ""
echo -e "${WHITE}  1. feat - Nueva funcionalidad${NC}"
echo -e "${WHITE}  2. fix - Correccion de bugs${NC}"
echo -e "${WHITE}  3. docs - Documentacion${NC}"
echo -e "${WHITE}  4. config - Configuracion${NC}"
echo -e "${WHITE}  5. wip - Work in progress${NC}"
echo -e "${WHITE}  6. milestone - Fase completada${NC}"
echo -e "${WHITE}  7. db - MongoDB/Base de datos${NC}"
echo -e "${WHITE}  8. unity - Unity/Cliente${NC}"
echo -e "${WHITE}  9. api - API/Backend${NC}"
echo -e "${WHITE}  10. ui - UI/Interfaz${NC}"
echo -e "${WHITE}  11. refactor - Refactoring${NC}"
echo -e "${WHITE}  12. test - Testing${NC}"
echo -e "${WHITE}  13. security - Seguridad${NC}"
echo -e "${WHITE}  14. perf - Performance${NC}"
echo -e "${WHITE}  15. hotfix - Hotfix critico${NC}"
echo -e "${WHITE}  16. tool - Herramientas/Scripts${NC}"
echo -e "${WHITE}  17. varios - Cambios mixtos/varios${NC}"
echo ""

# Solicitar tipo de commit
while true; do
    read -p "Ingresa el numero del tipo de commit (1-17): " commitChoice
    if [[ "$commitChoice" =~ ^([1-9]|1[0-7])$ ]]; then
        break
    else
        echo -e "${RED}Por favor ingresa un numero entre 1 y 17${NC}"
    fi
done

# Definir codigo y descripcion segun la seleccion
case $commitChoice in
    1)  code="feat"; desc="Nueva funcionalidad"; emoji=":sparkles:" ;;
    2)  code="fix"; desc="Correccion de bugs"; emoji=":bug:" ;;
    3)  code="docs"; desc="Documentacion"; emoji=":books:" ;;
    4)  code="config"; desc="Configuracion"; emoji=":wrench:" ;;
    5)  code="wip"; desc="Work in progress"; emoji=":construction:" ;;
    6)  code="milestone"; desc="Fase completada"; emoji=":tada:" ;;
    7)  code="db"; desc="MongoDB/Base de datos"; emoji=":file_cabinet:" ;;
    8)  code="unity"; desc="Unity/Cliente"; emoji=":video_game:" ;;
    9)  code="api"; desc="API/Backend"; emoji=":globe_with_meridians:" ;;
    10) code="ui"; desc="UI/Interfaz"; emoji=":lipstick:" ;;
    11) code="refactor"; desc="Refactoring"; emoji=":hammer:" ;;
    12) code="test"; desc="Testing"; emoji=":rotating_light:" ;;
    13) code="security"; desc="Seguridad"; emoji=":lock:" ;;
    14) code="perf"; desc="Performance"; emoji=":racehorse:" ;;
    15) code="hotfix"; desc="Hotfix critico"; emoji=":ambulance:" ;;
    16) code="tool"; desc="Herramientas/Scripts"; emoji=":hammer_and_wrench:" ;;
    17) code="varios"; desc="Cambios mixtos/varios"; emoji=":package:" ;;
esac

echo -e "${GREEN}Seleccionado: $desc${NC}"
echo ""

# Solicitar mensaje del commit
echo -e "${YELLOW}Ingresa el mensaje del commit:${NC}"
echo -e "${GRAY}Ejemplo: 'Implementar sistema de autenticacion JWT'${NC}"
read -p "Mensaje: " commitMessage

if [ -z "$commitMessage" ]; then
    echo -e "${RED}Error: El mensaje no puede estar vacio${NC}"
    exit 1
fi

# Solicitar número de issue (opcional)
echo ""
echo -e "${YELLOW}¿Quieres vincular este commit a un issue de GitHub? (opcional)${NC}"
echo -e "${GRAY}Esto ayuda a mantener trazabilidad del proyecto${NC}"
read -p "Numero de issue (presiona Enter para omitir): " issueNumber

# Validar número de issue si se proporciona
issueReference=""
if [ -n "$issueNumber" ]; then
    if [[ "$issueNumber" =~ ^[0-9]+$ ]]; then
        issueReference=" (closes #$issueNumber)"
        echo -e "${GREEN}Issue #$issueNumber sera vinculado al commit${NC}"
    else
        echo -e "${YELLOW}Numero de issue invalido, continuando sin vincular${NC}"
        issueReference=""
    fi
fi

# Construir mensaje completo del commit
fullCommitMessage="$emoji $code: $commitMessage$issueReference"

echo ""
echo -e "${CYAN}Mensaje del commit:${NC}"
echo -e "${WHITE}   $fullCommitMessage${NC}"
if [ -n "$issueReference" ]; then
    echo -e "${GRAY}   (Este commit cerrara automaticamente el issue #$issueNumber)${NC}"
fi
echo ""

# Mostrar rama actual
currentBranch=$(git branch --show-current)
echo -e "${GREEN}Rama actual: $currentBranch${NC}"
echo ""

# Gestión de ramas mejorada
echo -e "${YELLOW}Gestion de ramas:${NC}"
echo -e "${WHITE}  1. Usar rama actual ($currentBranch)${NC}"
echo -e "${WHITE}  2. Cambiar a otra rama existente${NC}"
echo -e "${WHITE}  3. Crear nueva rama${NC}"
echo -e "${WHITE}  4. Actualizar ramas desde remoto y seleccionar${NC}"
echo ""

while true; do
    read -p "Selecciona una opcion (1-4): " branchChoice
    if [[ "$branchChoice" =~ ^[1-4]$ ]]; then
        break
    else
        echo -e "${RED}Por favor ingresa un numero entre 1 y 4${NC}"
    fi
done

targetBranch="$currentBranch"

case $branchChoice in
    1)
        # Usar rama actual
        targetBranch="$currentBranch"
        echo -e "${GREEN}Usando rama actual: $currentBranch${NC}"
        ;;
    
    2)
        # Cambiar a rama existente
        echo ""
        echo -e "${CYAN}Ramas locales disponibles:${NC}"
        
        # Obtener ramas locales
        localBranches=()
        while IFS= read -r line; do
            cleanBranch=$(echo "$line" | sed 's/^\*\s*//' | sed 's/^[[:space:]]*//')
            if [ "$cleanBranch" != "$currentBranch" ] && [ -n "$cleanBranch" ]; then
                localBranches+=("$cleanBranch")
            fi
        done < <(git branch)
        
        if [ ${#localBranches[@]} -eq 0 ]; then
            echo -e "${YELLOW}No hay otras ramas locales disponibles${NC}"
            targetBranch="$currentBranch"
        else
            for i in "${!localBranches[@]}"; do
                echo -e "${WHITE}  $((i + 1)). ${localBranches[i]}${NC}"
            done
            echo ""
            
            while true; do
                read -p "Selecciona el numero de rama (1-${#localBranches[@]}): " branchIndex
                if [[ "$branchIndex" =~ ^[1-9][0-9]*$ ]] && [ "$branchIndex" -le "${#localBranches[@]}" ]; then
                    break
                else
                    echo -e "${RED}Por favor ingresa un numero entre 1 y ${#localBranches[@]}${NC}"
                fi
            done
            
            targetBranch="${localBranches[$((branchIndex - 1))]}"
            echo -e "${GREEN}Seleccionada: $targetBranch${NC}"
        fi
        ;;
    
    3)
        # Crear nueva rama
        echo ""
        read -p "Nombre de la nueva rama: " newBranchName
        if [ -z "$newBranchName" ]; then
            echo -e "${RED}Error: El nombre de la rama no puede estar vacio${NC}"
            exit 1
        fi
        targetBranch="$newBranchName"
        echo -e "${GREEN}Nueva rama: $targetBranch${NC}"
        ;;
    
    4)
        # Actualizar desde remoto y seleccionar
        echo ""
        echo -e "${CYAN}Actualizando ramas desde remoto...${NC}"
        git fetch origin
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}Ramas actualizadas exitosamente!${NC}"
        else
            echo -e "${YELLOW}Advertencia: No se pudieron actualizar las ramas remotas${NC}"
        fi
        
        echo ""
        echo -e "${CYAN}Ramas locales:${NC}"
        
        # Mostrar ramas locales
        localBranches=()
        allBranches=()
        while IFS= read -r line; do
            cleanBranch=$(echo "$line" | sed 's/^\*\s*//' | sed 's/^[[:space:]]*//')
            if [ "$cleanBranch" != "$currentBranch" ] && [ -n "$cleanBranch" ]; then
                localBranches+=("$cleanBranch")
                allBranches+=("$cleanBranch")
                echo -e "${WHITE}  ${#allBranches[@]}. $cleanBranch (local)${NC}"
            fi
        done < <(git branch)
        
        echo ""
        echo -e "${CYAN}Ramas remotas:${NC}"
        
        # Mostrar ramas remotas
        remoteBranches=()
        while IFS= read -r line; do
            cleanBranch=$(echo "$line" | sed 's/^[[:space:]]*//' | sed 's/^origin\///')
            if [[ ! "$cleanBranch" =~ HEAD ]] && [ "$cleanBranch" != "$currentBranch" ]; then
                # Verificar si ya está en localBranches
                found=false
                for localBranch in "${localBranches[@]}"; do
                    if [ "$localBranch" = "$cleanBranch" ]; then
                        found=true
                        break
                    fi
                done
                if [ "$found" = false ]; then
                    remoteBranches+=("$cleanBranch")
                    allBranches+=("$cleanBranch")
                    echo -e "${WHITE}  ${#allBranches[@]}. $cleanBranch (remoto)${NC}"
                fi
            fi
        done < <(git branch -r)
        
        if [ ${#allBranches[@]} -eq 0 ]; then
            echo -e "${YELLOW}No hay otras ramas disponibles${NC}"
            targetBranch="$currentBranch"
        else
            echo ""
            while true; do
                read -p "Selecciona el numero de rama (1-${#allBranches[@]}): " branchIndex
                if [[ "$branchIndex" =~ ^[1-9][0-9]*$ ]] && [ "$branchIndex" -le "${#allBranches[@]}" ]; then
                    break
                else
                    echo -e "${RED}Por favor ingresa un numero entre 1 y ${#allBranches[@]}${NC}"
                fi
            done
            
            targetBranch="${allBranches[$((branchIndex - 1))]}"
            
            # Determinar si es remoto
            isRemote=false
            for remoteBranch in "${remoteBranches[@]}"; do
                if [ "$remoteBranch" = "$targetBranch" ]; then
                    isRemote=true
                    break
                fi
            done
            
            branchType="local"
            if [ "$isRemote" = true ]; then
                branchType="remoto"
            fi
            echo -e "${GREEN}Seleccionada: $targetBranch ($branchType)${NC}"
        fi
        ;;
esac

# Cambiar de rama si es necesario
if [ "$targetBranch" != "$currentBranch" ]; then
    branchExists=$(git branch --list "$targetBranch")
    if [ -z "$branchExists" ]; then
        if [ "$branchChoice" = "3" ]; then
            # Crear nueva rama
            echo -e "${CYAN}Creando rama '$targetBranch'...${NC}"
            git checkout -b "$targetBranch"
        else
            # Rama remota - crear tracking branch
            echo -e "${CYAN}Creando rama local '$targetBranch' desde origin/$targetBranch...${NC}"
            git checkout -b "$targetBranch" "origin/$targetBranch"
        fi
        
        if [ $? -ne 0 ]; then
            echo -e "${RED}Error al crear/cambiar la rama${NC}"
            exit 1
        fi
    else
        echo -e "${CYAN}Cambiando a rama '$targetBranch'...${NC}"
        git checkout "$targetBranch"
        if [ $? -ne 0 ]; then
            echo -e "${RED}Error al cambiar de rama${NC}"
            exit 1
        fi
    fi
fi

echo ""
echo -e "${CYAN}Resumen del commit:${NC}"
echo -e "${WHITE}   Tipo: $desc${NC}"
echo -e "${WHITE}   Mensaje: $fullCommitMessage${NC}"
echo -e "${WHITE}   Rama: $targetBranch${NC}"
if [ -n "$issueReference" ]; then
    echo -e "${WHITE}   Issue: #$issueNumber (se cerrara automaticamente)${NC}"
fi
echo ""

# Confirmacion final
read -p "Confirmas el commit? (Y/n): " confirm
if [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
    echo -e "${RED}Commit cancelado${NC}"
    exit 0
fi

# Realizar el commit
echo -e "${CYAN}Realizando commit...${NC}"
git add .
git commit -m "$fullCommitMessage"

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Commit realizado exitosamente!${NC}"
    if [ -n "$issueReference" ]; then
        echo -e "${GREEN}El issue #$issueNumber sera cerrado cuando este commit llegue a la rama principal${NC}"
    fi
    echo ""
    
    # Preguntar si quiere hacer push
    read -p "Quieres hacer push a origin/$targetBranch? (Y/n): " pushConfirm
    if [ "$pushConfirm" != "n" ] && [ "$pushConfirm" != "N" ]; then
        echo -e "${CYAN}Haciendo push...${NC}"
        git push origin "$targetBranch"
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}Push realizado exitosamente!${NC}"
            if [ -n "$issueReference" ]; then
                echo -e "${GREEN}El commit con referencia al issue #$issueNumber esta ahora en GitHub${NC}"
            fi
        else
            echo -e "${YELLOW}Error en el push, pero el commit local fue exitoso${NC}"
        fi
    fi
    
    echo ""
    echo -e "${CYAN}Proximos pasos sugeridos:${NC}"
    echo -e "${WHITE}   1. Actualizar documentacion de progreso si corresponde${NC}"
    echo -e "${WHITE}   2. Verificar que el commit sigue las convenciones del proyecto${NC}"
    echo -e "${WHITE}   3. Continuar con el siguiente task de la fase${NC}"
    if [ -n "$issueReference" ]; then
        echo -e "${WHITE}   4. Verificar en GitHub que el issue #$issueNumber fue vinculado${NC}"
    fi
else
    echo -e "${RED}Error al realizar el commit${NC}"
    exit 1
fi

echo ""
echo -e "${CYAN}Gracias por contribuir a Automata Factory!${NC}" 