# Beuni Gifts Management System

**Documentação técnica para desenvolvimento e manutenção do sistema**

##  Quick Start

### ⚡ Setup Inicial (Primeira execução)
```bash
# 1. Serviços base
docker-compose up -d db redis

# 2. Build da aplicação
docker-compose build app

# 3. Database setup
docker-compose run --rm app rails db:create
docker-compose run --rm app rails db:migrate
docker-compose run --rm app rails db:seed

# 4. Start da aplicação
docker-compose up app
```

###  Uso Diário
```bash
# Iniciar ambiente completo
docker-compose up -d

# Parar ambiente
docker-compose down

# Restart apenas app (após mudanças)
docker-compose restart app

# Ver logs em tempo real
docker-compose logs -f app

# Acessar console Rails
docker-compose run --rm app rails console

# Shell no container
docker-compose exec app bash
```

##  Comandos de Desenvolvimento

### 💎 Rails Commands
```bash
# Executar dentro do container
docker-compose run --rm app rails console
docker-compose run --rm app rails generate model Example
docker-compose run --rm app rails routes
docker-compose run --rm app rails runner "puts 'Hello'"

# Bundle management
docker-compose run --rm app bundle install
docker-compose run --rm app bundle update
```

###  Database Management
```bash
# Setup completo
docker-compose run --rm app rails db:setup

# Reset total (cuidado!)
docker-compose run --rm app rails db:reset

# Migrations
docker-compose run --rm app rails db:migrate
docker-compose run --rm app rails db:migrate:status
docker-compose run --rm app rails db:rollback

# Seeds
docker-compose run --rm app rails db:seed

# Drop & recreate (desenvolvimento)
docker-compose run --rm app rails db:drop db:create db:migrate db:seed
```

###  Testing & Quality
```bash
# RSpec
docker-compose run --rm app rspec
docker-compose run --rm app rspec spec/models
docker-compose run --rm app rspec spec/controllers
docker-compose run --rm app bundle exec rspec

# Linting (quando configurado)
docker-compose run --rm app rubocop
docker-compose run --rm app rubocop -a
```

###  Frontend & Assets
```bash
# Tailwind CSS
docker-compose run --rm app rails tailwindcss:build
docker-compose run --rm app rails tailwindcss:watch

# Assets precompile (produção)
docker-compose run --rm app rails assets:precompile
docker-compose run --rm app rails assets:clean
```

###  Background Jobs
```bash
# Sidekiq
docker-compose up sidekiq
docker-compose logs sidekiq

# Sidekiq Web (admin)
# Acesse: http://localhost:3000/sidekiq (apenas admins)
```

###  Debugging & Monitoring
```bash
# Status dos containers
docker-compose ps

# Logs específicos
docker-compose logs app
docker-compose logs db
docker-compose logs redis
docker-compose logs sidekiq

# Logs em tempo real
docker-compose logs -f app

# Acessar PostgreSQL diretamente
docker-compose exec db psql -U postgres -d beuni_gifts_development

# Redis CLI
docker-compose exec redis redis-cli

# Recursos do sistema
docker stats
```

##  Stack Tecnológica

### Backend
- **Ruby**: 3.4.6
- **Rails**: 7.1.3.2
- **Database**: PostgreSQL 16
- **Cache/Jobs**: Redis 7.0.15
- **Background Jobs**: Sidekiq
- **Authentication**: Devise
- **Testing**: RSpec + Factory Bot + Capybara

### Frontend
- **Framework**: Hotwire (Turbo + Stimulus)
- **CSS**: Tailwind CSS 3.x
- **Build**: Asset Pipeline + Importmaps
- **Fonts**: Lexend + Gantari (oficial Beuni)

### DevOps
- **Container**: Docker + Docker Compose
- **Services**: App + DB + Redis + Sidekiq
- **Environment**: Development ready


##  Arquitetura do Projeto

###  Core Features
- **Multi-tenant**: Isolamento por Organization
- **Authentication**: Devise com roles (Admin/Member)
- **Background Jobs**: Sidekiq para processamento assíncrono
- **Modern Frontend**: Hotwire + Tailwind CSS
- **SEO Ready**: Meta tags + OpenGraph + Schema.org

<details> 

### 📁 Estrutura de Arquivos
```
app/
├── controllers/
│   ├── application_controller.rb
│   ├── home_controller.rb (landing page)
│   └── dashboard_controller.rb
├── models/
│   ├── organization.rb (multi-tenant)
│   ├── user.rb (devise + roles)
│   ├── employee.rb (aniversariantes)
│   ├── gift_campaign.rb
│   └── gift_shipment.rb
├── views/
│   ├── layouts/
│   │   ├── application.html.erb (dashboard)
│   │   └── home.html.erb (landing page)
│   ├── home/
│   │   └── index.html.erb (página principal)
│   └── dashboard/
│       └── index.html.erb
└── assets/
    └── images/
        └── beuni_logo.png
```

</details>

## 🚨 Troubleshooting

### Problemas Comuns

#### 🐳 Docker Issues
```bash
# Container não inicia
docker-compose down
docker-compose up --build

# Porta ocupada
docker-compose down
lsof -ti:3000 | xargs kill -9
docker-compose up -d

# Problema de permissão
sudo chown -R $USER:$USER .
```

#### 🗃 Database Issues
```bash
# Database não existe
docker-compose run --rm app rails db:create

# Migration pendente
docker-compose run --rm app rails db:migrate

# Database corrupto
docker-compose run --rm app rails db:drop db:create db:migrate db:seed
```

####  Asset Issues
```bash
# Tailwind não carrega
docker-compose run --rm app rails tailwindcss:build

# Assets não aparecem
docker-compose restart app
```

###  URLs Importantes
- **Home/Landing**: http://localhost:3000
- **Login**: http://localhost:3000/users/sign_in
- **Dashboard**: http://localhost:3000/dashboard
- **Sidekiq**: http://localhost:3000/sidekiq (admins only)

### 👥 Credenciais de Teste
- **Admin**: admin@beuni.com.br / 123456
- **Member**: usuario@beuni.com.br / 123456

##  Design System

###  Cores Oficiais Beuni
```css
--beuni-cream: #F8F1E0;
--beuni-orange: #FFB990;
--beuni-green: #93C90F;
--beuni-brown: #331B10;
--beuni-orange-border: #FF5600;
--beuni-text: #2D2926;
--beuni-white: #FFFFFF;
```

###  Tipografia
- **Headings**: Lexend (Google Fonts)
- **Body**: Gantari (Google Fonts)

##  Performance & Otimização

### ✅ Otimizações Aplicadas
- [x] **Gemfile limpo**: 9 gems removidas (pundit, ransack, etc.)
- [x] **Layout responsivo**: Mobile-first design
- [x] **SVG otimizados**: Ícones redimensionados
- [x] **Overflow controlado**: CSS overflow-x: hidden
- [x] **Assets otimizados**: Tailwind purging + minification

###  Para Produção
```bash
# Precompile assets
RAILS_ENV=production rails assets:precompile

# Database setup
RAILS_ENV=production rails db:migrate

# Health check
curl http://localhost:3000/up
```

##  Important Instructions for Claude

###  Project Guidelines
- **Scope**: Do what has been asked; nothing more, nothing less
- **File Creation**: NEVER create files unless absolutely necessary
- **File Preference**: ALWAYS prefer editing existing files
- **Documentation**: NEVER proactively create documentation files unless explicitly requested

###  Development Commands (Quick Reference)
```bash
# Start everything
docker-compose up -d

# Stop everything
docker-compose down

# Rebuild after changes
docker-compose build app && docker-compose restart app

# Console access
docker-compose run --rm app rails console

# Database reset
docker-compose run --rm app rails db:reset
```