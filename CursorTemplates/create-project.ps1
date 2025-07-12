# Script para criar novos projetos com template personalizado
# Marcelo Lima - Desenvolvedor Backend Junior 3

param(
    [Parameter(Mandatory=$true)]
    [string]$ProjectName,
    
    [Parameter(Mandatory=$false)]
    [string]$ProjectType = "CleanArchitecture",
    
    [Parameter(Mandatory=$false)]
    [string]$DatabaseType = "SqlServer",
    
    [Parameter(Mandatory=$false)]
    [string]$ORM = "EntityFramework"
)

Write-Host "🚀 Criando projeto: $ProjectName" -ForegroundColor Green
Write-Host "📋 Tipo: $ProjectType" -ForegroundColor Cyan
Write-Host "🗄️ Banco: $DatabaseType" -ForegroundColor Cyan
Write-Host "🔧 ORM: $ORM" -ForegroundColor Cyan

# Criar diretório do projeto
New-Item -ItemType Directory -Name $ProjectName -Force
Set-Location $ProjectName

# Criar estrutura de pastas baseada no tipo de projeto
switch ($ProjectType) {
    "CleanArchitecture" {
        Write-Host "🏗️ Criando estrutura Clean Architecture..." -ForegroundColor Yellow
        
        # Estrutura de pastas
        $folders = @(
            "src/$ProjectName.API",
            "src/$ProjectName.Application",
            "src/$ProjectName.Domain", 
            "src/$ProjectName.Infrastructure",
            "tests/$ProjectName.UnitTests",
            "tests/$ProjectName.IntegrationTests",
            "docs",
            "scripts"
        )
        
        foreach ($folder in $folders) {
            New-Item -ItemType Directory -Name $folder -Force
            Write-Host "✅ Criado: $folder" -ForegroundColor Green
        }
    }
    
    "Microservices" {
        Write-Host "🏗️ Criando estrutura de Microsserviços..." -ForegroundColor Yellow
        
        $folders = @(
            "src/$ProjectName.API",
            "src/$ProjectName.Domain",
            "src/$ProjectName.Infrastructure",
            "tests/$ProjectName.Tests",
            "docker",
            "k8s",
            "docs"
        )
        
        foreach ($folder in $folders) {
            New-Item -ItemType Directory -Name $folder -Force
            Write-Host "✅ Criado: $folder" -ForegroundColor Green
        }
    }
}

# Criar arquivos de configuração
Write-Host "📝 Criando arquivos de configuração..." -ForegroundColor Yellow

# README.md personalizado
$readmeContent = Get-Content "../README.md" -Raw
$readmeContent = $readmeContent -replace "\[Nome do Projeto\]", $ProjectName
$readmeContent = $readmeContent -replace "\[Dapper/Entity Framework Core\]", $ORM
$readmeContent = $readmeContent -replace "\[Clean Architecture/DDD/CQRS\]", $ProjectType
$readmeContent | Out-File -FilePath "README.md" -Encoding UTF8

# .gitignore para .NET
$gitignoreContent = @"
# .NET
bin/
obj/
*.user
*.suo
*.cache
*.dll
*.exe
*.pdb

# Visual Studio
.vs/
*.sln.docstates

# SQL Server
*.mdf
*.ldf

# Logs
logs/
*.log

# Environment
.env
appsettings.Development.json

# Docker
.dockerignore

# IDE
.vscode/
.idea/
"@
$gitignoreContent | Out-File -FilePath ".gitignore" -Encoding UTF8

# Docker Compose (se aplicável)
if ($ProjectType -eq "Microservices" -or $ProjectType -eq "CleanArchitecture") {
    $dockerComposeContent = @"
version: '3.8'

services:
  $($ProjectName.ToLower())-api:
    build:
      context: .
      dockerfile: src/$ProjectName.API/Dockerfile
    ports:
      - "5000:5000"
    environment:
      - ASPNETCORE_ENVIRONMENT=Development
    depends_on:
      - $($ProjectName.ToLower())-db

  $($ProjectName.ToLower())-db:
    image: mcr.microsoft.com/mssql/server:2022-latest
    environment:
      - ACCEPT_EULA=Y
      - SA_PASSWORD=YourStrong@Passw0rd
    ports:
      - "1433:1433"
    volumes:
      - sqlserver_data:/var/opt/mssql

volumes:
  sqlserver_data:
"@
    $dockerComposeContent | Out-File -FilePath "docker-compose.yml" -Encoding UTF8
}

# Arquivo de configuração do projeto
$projectConfigContent = @"
{
  "ProjectName": "$ProjectName",
  "ProjectType": "$ProjectType",
  "DatabaseType": "$DatabaseType",
  "ORM": "$ORM",
  "CreatedBy": "Marcelo Lima",
  "CreatedDate": "$(Get-Date -Format 'yyyy-MM-dd')",
  "LearningObjectives": [
    "Clean Architecture",
    "Domain-Driven Design (DDD)",
    "CQRS",
    "Entity Framework Core",
    "Integration Tests",
    "Docker",
    "Microservices",
    "Google Cloud Platform",
    "DevOps Pipeline"
  ]
}
"@
$projectConfigContent | Out-File -FilePath "project-config.json" -Encoding UTF8

Write-Host "✅ Projeto $ProjectName criado com sucesso!" -ForegroundColor Green
Write-Host "📁 Localização: $(Get-Location)" -ForegroundColor Cyan
Write-Host "📚 Próximos passos:" -ForegroundColor Yellow
Write-Host "   1. Configure a string de conexão" -ForegroundColor White
Write-Host "   2. Implemente as entidades do domínio" -ForegroundColor White
Write-Host "   3. Configure o Entity Framework (se aplicável)" -ForegroundColor White
Write-Host "   4. Implemente os testes" -ForegroundColor White
Write-Host "   5. Configure o Docker (se aplicável)" -ForegroundColor White

Write-Host "🎯 Boa sorte no seu aprendizado!" -ForegroundColor Green 