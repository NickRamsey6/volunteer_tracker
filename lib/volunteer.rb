class Volunteer
  attr_accessor :name, :project_id
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  def ==(volunteer_to_copmare)
    if volunteer_to_copmare != nil
      (self.name() == volunteer_to_copmare.name()) && (self.project_id() == volunteer_to_copmare.project_id())
    else
      false
    end
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * from volunteers;")
    volunteers = []
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{self.name}', #{self.project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end
end
