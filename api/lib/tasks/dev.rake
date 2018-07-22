namespace :dev do
	desc "Setup Development"
	task setup: :environment do
		puts "Apagando BD...#{%x(rake db:drop)}"
		puts "Criando BD...#{%x(rake db:create)}"
		puts %x(rake db:migrate)
		puts %x(rake db:seed)

		puts "Setup executado com sucesso!"
	end


	desc "Cria Membros Fake"
  	task generate_users: :environment do 
      puts "Cadastrando Usuarios ..."
      100.times do
        User.create!(
          email: Faker::Internet.email,
          password: "123456",
          password_confirmation: "123456"
        )
      end
      puts "Usuarios Cadastrados com sucesso..."
  end

end