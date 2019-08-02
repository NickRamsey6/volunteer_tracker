class Project
  attr_accessor :name
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def title
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      name = project.fetch("name")
      projects.push(Project.new({:name => name}))
    end
    name
  end

  def self.clear
    DB.exec("DELETE FROM projects *;")
  end
end
