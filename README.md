# Beuni Gifts Management System

🎁 **Sistema de gestão de brindes personalizados para empresas**

Plataforma web moderna que replica a experiência da Beuni (beuni.com.br) permitindo o gerenciamento completo de campanhas de brindes corporativos, com foco na automatização de presentes para aniversariantes.

##  Visão Geral

Este projeto demonstra uma implementação completa de um sistema empresarial usando Ruby on Rails, replicando a landing page oficial da Beuni e implementando funcionalidades de gestão de brindes corporativos.

##  Stack 

### Backend
- **Ruby**: 3.4.6
- **Rails**: 7.1.3.2 (MVC Architecture)
- **Database**: PostgreSQL 16
- **Cache/Jobs**: Redis 7.0.15
- **Background Jobs**: Sidekiq
- **Authentication**: Devise

### Frontend
- **Framework**: Hotwire (Turbo + Stimulus)
- **CSS**: Tailwind CSS 3.x
- **Fonts**: Lexend & Gantari (oficial Beuni)
- **Design**: Responsive + Modern UI
- **SEO**: Meta tags otimizadas

### DevOps
- **Containerização**: Docker + Docker Compose
- **Environment**: Development/Production ready
- **Testing**: RSpec + Capybara
- **Linting**: Rubocop ready

##  Funcionalidades

###  Interface & Landing Page
- ✅ **Landing page profissional**: Hero section, serviços, formulários
- ✅ **Design system completo**: Cores, tipografia e componentes Beuni
- ✅ **Responsivo**: Mobile, tablet e desktop otimizados
- ✅ **SEO otimizado**: Meta tags, OpenGraph, Twitter Cards

###  Core Features
- ✅ **Sistema Multi-tenant**: Múltiplas organizações isoladas
- ✅ **Autenticação robusta**: Admin/Member roles (Devise)
- ✅ **Dashboard intuitivo**: Estatísticas e métricas em tempo real
- ✅ **Gestão de funcionários**: CRUD completo de aniversariantes
- ✅ **Campanhas de brindes**: Sistema completo de gift management
- ✅ **Automação de envios**: Programação inteligente de presentes

### Arquitetura de Dados
- **Organization**: Empresas clientes (multi-tenancy)
- **User**: Usuários do sistema com roles (admin/member)
- **Employee**: Funcionários e dados de aniversário
- **GiftCampaign**: Campanhas personalizadas de brindes
- **GiftShipment**: Controle de envios e logística

## Setup Local

### Pré-requisitos
- Docker e Docker Compose
- Git

### Instalação

1. Clone o repositório:
```bash
git clone <repository-url>
cd BeuniOnRails
```

2. Configure o ambiente:
```bash
# Primeira execução - Setup completo
docker-compose up -d db redis
docker-compose build app
docker-compose run --rm app rails db:create
docker-compose run --rm app rails db:migrate
docker-compose run --rm app rails db:seed
docker-compose up app
```

3. Uso diário:
```bash
# Iniciar tudo
docker-compose up -d

# Parar tudo
docker-compose down
```

4. Acesse a aplicação:
```
http://localhost:3000
```

### Credenciais de Teste
- **Admin**: admin@beuni.com.br / 123456
- **Usuário**: usuario@beuni.com.br / 123456

## 📋 Comandos Úteis

> 💡 **Dica**: Consulte o arquivo `CLAUDE.md` para a lista completa de comandos de desenvolvimento e troubleshooting.

### Docker
```bash
# Iniciar containers
docker-compose up -d

# Parar containers
docker-compose down

# Acessar console da aplicação
docker-compose exec app rails console

# Executar testes
docker-compose exec app rspec
```

### Database
```bash
# Reset completo do banco
docker-compose exec app rails db:reset

# Verificar status das migrations
docker-compose exec app rails db:migrate:status
```

## Estrutura do Projeto
<details> 

```
app/
├── controllers/        # Controllers da aplicação
│   ├── application_controller.rb
│   └── dashboard_controller.rb
├── models/            # Models ActiveRecord
│   ├── organization.rb
│   ├── user.rb
│   ├── employee.rb
│   ├── gift_campaign.rb
│   └── gift_shipment.rb
├── views/             # Views ERB
│   ├── layouts/
│   ├── dashboard/
│   └── devise/
├── javascript/        # JavaScript (Stimulus)
└── assets/           # CSS (Tailwind)

config/
├── database.yml      # Configuração do banco
├── routes.rb         # Rotas da aplicação
└── initializers/     # Inicializadores

db/
├── migrate/          # Migrations
└── seeds.rb          # Dados de exemplo
```

</details>

##  Roadmap de Desenvolvimento

### ✅ Fase 1 - Foundation (Concluída)
- [x] Setup completo Rails 7 + Docker
- [x] PostgreSQL + Redis configurados
- [x] Autenticação (Devise) + Multi-tenancy
- [x] Tailwind CSS + Design System Beuni
- [x] Models core (Organization, User, Employee)

### ✅ Fase 2 - Landing Page (Concluída)
- [x] Replica da landing page oficial Beuni
- [x] Design responsivo profissional
- [x] SEO otimizado + Meta tags
- [x] Integração de fontes e cores oficiais
- [x] Performance otimizada (sem overflow, ícones ajustados)

### ✅ Fase 3 - Core Business (Concluída)
- [x] Sistema completo de campanhas de brindes
- [x] Dashboard com métricas em tempo real
- [x] CRUD de funcionários/aniversariantes
- [x] Seeds com dados realistas
- [x] Background jobs (Sidekiq) configurado

### ✅ Fase 4 - Otimização (Concluída)
- [x] Cleanup do Gemfile (9 gems removidas)
- [x] Performance otimizada
- [x] Layout sem problemas de overflow
- [x] Documentação atualizada

##  Próximos Passos

### Fase 5 - Funcionalidades Avançadas
- [ ] **API Integrations**: ViaCEP, correios, pagamentos
- [ ] **Notificações**: Email automático (ActionMailer)
- [ ] **Jobs avançados**: Sidekiq + Cron jobs
- [ ] **Dashboard analytics**: Gráficos e relatórios
- [ ] **Sistema de aprovação**: Workflow de campanhas

### Fase 6 - Scale & Deploy
- [ ] **Testes completos**: RSpec + Capybara + Factory Bot
- [ ] **API REST**: Endpoints para mobile/integração
- [ ] **Deploy produção**: Railway/Heroku + PostgreSQL
- [ ] **CI/CD Pipeline**: GitHub Actions
- [ ] **Monitoring**: Health checks + logs

##  Destaques Técnicos

Este projeto demonstra **expertise avançada em Ruby on Rails** através de:

###  **Arquitetura Enterprise**
- **MVC bem estruturado** seguindo convenções Rails
- **Multi-tenancy robusto** com isolamento de dados
- **Background jobs** configurados (Sidekiq + Redis)
- **Authentication & Authorization** com Devise

###  **Frontend Moderno**
- **Hotwire** (Turbo + Stimulus) para SPA experience
- **Tailwind CSS** com design system personalizado
- **Responsive design** mobile-first
- **Performance otimizada** (sem overflow, assets otimizados)

### 🔧 **DevOps & Quality**
- **Docker** multi-container (app, db, redis, sidekiq)
- **Gemfile otimizado** (remoção de 9 gems desnecessárias)
- **SEO-ready** (meta tags, OpenGraph, structured data)
- **Code quality** seguindo Ruby/Rails best practices

###  **Business Features**
- **Sistema de campanhas** de brindes corporativos
- **Dashboard analytics** com métricas em tempo real
- **Gestão de funcionários** com dados de aniversário
- **Automação de envios** programados

---

##  Licença

**Projeto desenvolvido como demonstração técnica**
Inspired by Beuni.com.br - Todos os direitos de design e marca pertencem à Beuni Tecnologia.

---

⭐ **Se este projeto foi útil, considere dar uma estrela!**