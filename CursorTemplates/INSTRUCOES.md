# 📚 Instruções de Uso - Template de Projetos

## 🎯 Como Usar Este Template

### Opção 1: Script Automatizado (Recomendado)

1. **Salve o script** `create-project.ps1` em uma pasta de fácil acesso
2. **Execute o PowerShell** como administrador
3. **Navegue até a pasta** onde salvou o script
4. **Execute o comando**:

```powershell
# Projeto básico com Clean Architecture
.\create-project.ps1 -ProjectName "MeuProjeto"

# Projeto com microsserviços
.\create-project.ps1 -ProjectName "MeuProjeto" -ProjectType "Microservices"

# Projeto com Dapper
.\create-project.ps1 -ProjectName "MeuProjeto" -ORM "Dapper"
```

### Opção 2: Cópia Manual

1. **Copie o conteúdo** do `README.md` template
2. **Crie um novo projeto** no seu workspace
3. **Cole o conteúdo** e personalize as seções `[Nome do Projeto]`
4. **Ajuste as configurações** conforme necessário

## 🏗️ Estruturas Disponíveis

### Clean Architecture (Padrão)
```
src/
├── [ProjectName].API/           # Controllers, Middleware
├── [ProjectName].Application/    # Use Cases, DTOs, Interfaces
├── [ProjectName].Domain/         # Entities, Value Objects, Domain Services
├── [ProjectName].Infrastructure/ # Repositories, External Services
└── tests/
    ├── [ProjectName].UnitTests/
    └── [ProjectName].IntegrationTests/
```

### Microservices
```
src/
├── [ProjectName].API/           # API Gateway ou Service API
├── [ProjectName].Domain/        # Domain Logic
├── [ProjectName].Infrastructure/ # Data Access, External APIs
├── docker/                      # Dockerfiles
├── k8s/                         # Kubernetes manifests
└── tests/
    └── [ProjectName].Tests/
```

## 📝 Personalização do README

### Seções Obrigatórias a Preencher
- `[Nome do Projeto]` → Nome real do seu projeto
- `[Descrição breve do projeto]` → O que o projeto faz
- `[Dapper/Entity Framework Core]` → ORM escolhido
- `[Clean Architecture/DDD/CQRS]` → Padrão implementado

### Seções de Aprendizado
- **Objetivos de Aprendizado**: Marque com ✅ conforme implementar
- **Conceitos Aplicados**: Liste o que aprendeu
- **Desafios Enfrentados**: Documente problemas e soluções
- **Melhorias Futuras**: Ideias para evolução

## 🚀 Fluxo de Trabalho Recomendado

### 1. Criação do Projeto
```powershell
.\create-project.ps1 -ProjectName "SistemaVendas" -ProjectType "CleanArchitecture"
```

### 2. Configuração Inicial
- Configure a string de conexão
- Implemente as entidades do domínio
- Configure o Entity Framework/Dapper

### 3. Desenvolvimento
- Implemente os casos de uso
- Crie os repositórios
- Implemente os controllers

### 4. Testes
- Testes unitários para o domínio
- Testes de integração para repositórios
- Testes de API

### 5. Documentação
- Atualize o README com aprendizados
- Documente decisões arquiteturais
- Adicione links úteis

## 📋 Checklist de Qualidade

### Antes de Finalizar um Projeto
- [ ] README completo e atualizado
- [ ] Todos os objetivos de aprendizado marcados
- [ ] Testes implementados e passando
- [ ] Docker configurado (se aplicável)
- [ ] Documentação de decisões arquiteturais
- [ ] Links para recursos de aprendizado
- [ ] Código revisado e limpo

## 🔄 Manutenção do Template

### Atualizações Periódicas
1. **Revisar objetivos de aprendizado** conforme você evolui
2. **Adicionar novos padrões** que descobrir
3. **Atualizar stack tecnológica** conforme suas preferências mudam
4. **Refinar estrutura de pastas** baseado em experiências

### Versionamento
- Mantenha uma versão do template para cada ano
- Documente mudanças significativas
- Teste o script em diferentes cenários

## 🎯 Dicas de Uso

### Para Aprendizado Eficiente
1. **Um objetivo por projeto**: Foque em um padrão por vez
2. **Documente tudo**: Escreva sobre o que aprendeu
3. **Experimente variações**: Teste diferentes abordagens
4. **Compartilhe conhecimento**: Use os projetos como portfólio

### Para Produtividade
1. **Use o script**: Automatize a criação de projetos
2. **Padronize**: Mantenha consistência entre projetos
3. **Reutilize**: Aproveite código de projetos anteriores
4. **Itere**: Melhore continuamente o template

---

*Este template foi criado para maximizar o aprendizado e manter consistência entre projetos de desenvolvimento profissional.* 