# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Cadastrando as CATEGORIAS..."
categories = ["Animais e acessórios",
							"Esportes",
							"Para a sua casa",
							"Eletrônicos e celulares",
							"Música e hobbies",
							"Bebês e crianças",
							"Moda e beleza",
							"Veículos e barcos",
							"Imóveis",
							"Empregos e negócios" ]

categories.each do |category| 
	Category.find_or_create_by(name: category)
end

puts "CATEGORIAS cadastradas com sucesso!"


puts "Cadastrando Produtos"
	categories = Category.all
10.times do
	Product.create!(
		name: Faker::Lorem.words(1),
		price: "#{Random.rand(500)}",
		category: Category.all.sample
		)
end

puts "Produtos cadastrados com sucesso!"


puts "Cadastrando o USUARIO PADRÃO..."

	User.create!(
		email: "admin@admin.com",
		name: "Administrador", 
		password: "12345678", 
		password_confirmation: "12345678"
	)

puts "USUARIO PADRÃO cadastrado com sucesso!"