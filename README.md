# Estrutura do Banco de Dados

## Tabelas

### Candidato
- `id` (PK, auto-incremento)
- `first_name`: Primeiro nome
- `last_name`: Sobrenome
- `email`: Email (único)
- `cpf`: CPF (único)
- `cep`: Código postal
- `description`: Descrição
- `password`: Senha

### Empresa
- `id` (PK, auto-incremento)
- `name`: Nome
- `description`: Descrição
- `email`: Email (único)
- `cnpj`: CNPJ
- `cep`: Código postal
- `country`: País
- `password`: Senha

### Vaga
- `id` (PK, auto-incremento)
- `name`: Nome
- `description`: Descrição
- `city`: Cidade
- `state`: Estado (2 letras)
- `empresa_id` (FK para `Empresa.id`)
- `created_at`: Data e hora de criação

### Candidato_Vaga
- `candidato_id` (FK para `Candidato.id`)
- `vaga_id` (FK para `Vaga.id`)

### Vaga_Competencia
- `vaga_id` (FK para `Vaga.id`)
- `competencia_id` (FK para `Competencia.id`)

### Competencia
- `id` (PK, auto-incremento)
- `name`: Nome

### Candidato_Competencia
- `candidato_id` (FK para `Candidato.id`)
- `competencia_id` (FK para `Competencia.id`)

### Match
- `id` (PK, auto-incremento)
- `empresa_id` (FK para `Empresa.id`)
- `candidato_id` (FK para `Candidato.id`)


## Relacionamentos

```mermaid
erDiagram
    Candidato {
        int id PK
        string first_name
        string last_name
        string email
        string cpf
        string cep
        text description
        string password
    }
    
    Empresa {
        int id PK
        string name
        text description
        string email
        string cnpj
        string cep
        string country
        string password
    }
    
    Vaga {
        int id PK
        string name
        text description
        string city
        string state
        int empresa_id FK
        datetime created_at
    }
    
    Candidato_Vaga {
        int candidato_id FK
        int vaga_id FK
    }
    
    Vaga_Competencia {
        int vaga_id FK
        int competencia_id FK
    }
    
    Competencia {
        int id PK
        string name
    }
    
    Candidato_Competencia {
        int candidato_id FK
        int competencia_id FK
    }
    
    Match {
        int id PK
        int empresa_id FK
        int candidato_id FK
    }
    
    Candidato_Vaga }|..|{ Candidato : "candidato_id"
    Candidato_Vaga }|..|{ Vaga : "vaga_id"
    
    Vaga }|..|{ Empresa : "empresa_id"
    
    Vaga_Competencia }|..|{ Vaga : "vaga_id"
    Vaga_Competencia }|..|{ Competencia : "competencia_id"
    
    Candidato_Competencia }|..|{ Candidato : "candidato_id"
    Candidato_Competencia }|..|{ Competencia : "competencia_id"
    
    Match }|..|{ Empresa : "empresa_id"
    Match }|..|{ Candidato : "candidato_id"
