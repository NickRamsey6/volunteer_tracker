class Project
  attr_accessor :name
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def title
    result = DB.exec("INSERT INTO projects (name) VALUES ('#{@name}');")
    @name = result.first().fetch("name")
  end

  def self.clear
    DB.exec("DELETE FROM projects *;")
  end
end
