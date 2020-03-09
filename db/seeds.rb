# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def show_any_errors(object, var_name)
	puts "#{var_name} errors=#{object.errors.full_messages}" unless object.persisted?
end

puts "Creating Fonts..."

['Arial', 
'Roboto', 
'Times New Roman', 
'Verdana', 
'Georgia', 
'Palatino', 
'Garamond'].each do |font|
	new_font = Font.where(name: font).first_or_create
	show_any_errors(new_font, "new_font name:#{font}")
end

puts "Done!"
