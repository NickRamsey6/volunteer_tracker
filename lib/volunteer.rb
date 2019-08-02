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
end
