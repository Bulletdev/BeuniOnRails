puts "Creating seed data..."

org = Organization.create!(
  name: "Beuni Tecnologia",
  cnpj: "12345678000190",
  email: "contato@beuni.com.br",
  phone: "11999999999",
  address: "Rua das Empresas, 123 - São Paulo, SP"
)

puts "Organization created: #{org.name}"

admin_user = User.create!(
  name: "Admin Beuni",
  email: "admin@beuni.com.br",
  password: "123456",
  password_confirmation: "123456",
  role: "admin",
  organization: org
)

puts "Admin user created: #{admin_user.email}"

member_user = User.create!(
  name: "Usuário Teste",
  email: "usuario@beuni.com.br",
  password: "123456",
  password_confirmation: "123456",
  role: "member",
  organization: org
)

puts "Member user created: #{member_user.email}"

campaign = GiftCampaign.create!(
  organization: org,
  name: "Campanha Aniversários 2024",
  description: "Presentes de aniversário para todos os funcionários",
  default_gift_type: "Cesta de presente personalizada",
  budget_per_gift: 150.00
)

puts "Gift campaign created: #{campaign.name}"

employees_data = [
  {
    name: "João Silva",
    birth_date: Date.new(1985, 3, 15),
    cpf: "12345678901",
    email: "joao.silva@empresa.com",
    phone: "11987654321",
    position: "Desenvolvedor",
    department: "TI",
    admission_date: Date.new(2020, 1, 15),
    street: "Rua das Flores, 123",
    number: "123",
    neighborhood: "Centro",
    city: "São Paulo",
    state: "SP",
    zip_code: "01234567"
  },
  {
    name: "Maria Santos",
    birth_date: Date.current + 5.days,
    cpf: "23456789012",
    email: "maria.santos@empresa.com",
    phone: "11876543210",
    position: "Designer",
    department: "Marketing",
    admission_date: Date.new(2019, 6, 10),
    street: "Avenida Paulista, 456",
    number: "456",
    neighborhood: "Bela Vista",
    city: "São Paulo",
    state: "SP",
    zip_code: "01310100"
  },
  {
    name: "Pedro Costa",
    birth_date: Date.current + 10.days,
    cpf: "34567890123",
    email: "pedro.costa@empresa.com",
    phone: "11765432109",
    position: "Gerente",
    department: "Vendas",
    admission_date: Date.new(2018, 3, 20),
    street: "Rua Augusta, 789",
    number: "789",
    neighborhood: "Consolação",
    city: "São Paulo",
    state: "SP",
    zip_code: "01305000"
  },
  {
    name: "Ana Oliveira",
    birth_date: Date.current - 2.days,
    cpf: "45678901234",
    email: "ana.oliveira@empresa.com",
    phone: "11654321098",
    position: "Analista",
    department: "RH",
    admission_date: Date.new(2021, 8, 5),
    street: "Rua da Consolação, 321",
    number: "321",
    neighborhood: "Centro",
    city: "São Paulo",
    state: "SP",
    zip_code: "01302000"
  },
  {
    name: "Carlos Mendes",
    birth_date: Date.current + 20.days,
    cpf: "56789012345",
    email: "carlos.mendes@empresa.com",
    phone: "11543210987",
    position: "Coordenador",
    department: "TI",
    admission_date: Date.new(2017, 11, 12),
    street: "Alameda Santos, 654",
    number: "654",
    neighborhood: "Jardins",
    city: "São Paulo",
    state: "SP",
    zip_code: "01419000"
  }
]

employees_data.each do |employee_data|
  employee = Employee.create!(employee_data.merge(organization: org))
  puts "Employee created: #{employee.name} (Birthday: #{employee.birth_date.strftime('%d/%m')})"

  if employee.birth_date.month == Date.current.month
    shipment = GiftShipment.create!(
      organization: org,
      employee: employee,
      gift_campaign: campaign,
      scheduled_date: employee.birth_date - 7.days,
      status: 'scheduled'
    )
    puts "  -> Gift shipment scheduled for #{shipment.scheduled_date.strftime('%d/%m/%Y')}"
  end
end

puts "\nSeeds completed successfully!"
puts "\nLogin credentials:"
puts "Admin: admin@beuni.com.br / 123456"
puts "User:  usuario@beuni.com.br / 123456"