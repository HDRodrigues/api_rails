namespace :dev do
	desc "Setup Development"
	task setup: :environment do
		puts "Apagando BD...#{%x(rake db:drop)}"
		puts "Criando BD...#{%x(rake db:create)}"
		puts %x(rake db:migrate)
		puts %x(rake db:seed)

		puts "Setup executado com sucesso!"
	end

end