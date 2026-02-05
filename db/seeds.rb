# Limpiar la base de datos antes de empezar (opcional pero recomendado)
puts "Limpiando base de datos..."
User.destroy_all

puts "Creando usuarios de prueba..."

# Crear Admin
User.create!(
  name: "Administrador Sistema",
  email: "admin@test.com",
  password: "password123",
  password_confirmation: "password123",
  role: :admin
)

# Crear Agente
User.create!(
  name: "Agente Soporte",
  email: "agent@test.com",
  password: "password123",
  password_confirmation: "password123",
  role: :agent
)

# Crear Cliente
User.create!(
  name: "Cliente Usuario",
  email: "customer@test.com",
  password: "password123",
  password_confirmation: "password123",
  role: :customer
)

puts "¡Hecho! Se han creado #{User.count} usuarios."