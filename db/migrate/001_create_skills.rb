require_relative '../../app/models/skill_inventory'

environments = %w(development test)

environments.each do |env|
  Sequel.sqlite("db/skill_inventory_#{env}.sqlite3").create_table :skills do
    primary_key :id
    String :name
    String :status

    puts "created tasks table in db/skill_inventory_#{env}.sqlite3"
  end
end
