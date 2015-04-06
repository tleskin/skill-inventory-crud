require 'sequel'

class SkillInventory
  def self.database
    if ENV["TASK_MANAGER_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_inventory_development.sqlite3")
    end
  end

  def self.create(skill)
    data = {"name" => skill[:name], "status" => skill[:status]}
    database.from(:skills).insert(data)
  end

  def self.all
    database.from(:skills).all.map do |raw_skill|
      Skill.new(raw_skill)
    end
  end

  def self.find(id)
    raw_skill = database.from(:skills).where(:id => id).to_a.first
    Skill.new(raw_skill)
  end

  def self.update(id, skill)
    database.from(:skills).where(id: id).update(name: skill[:name], status: skill[:status])
  end

  def self.delete(id)
    database.from(:skills).where(:id => id).delete
  end

  def self.delete_all
    database.from(:skills).delete
  end

end
