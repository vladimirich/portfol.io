class ProjectForm
  include ActiveModel::Model

  attr_accessor :title, :description, :user_id, :pictures
  attr_reader :project

  # TODO: use models validations
  validates :title, :description, :user_id, presence: true

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def persist!
    create_portfolio_item!
    attach_pictures!
  end

  def create_portfolio_item!
    @project = Project.create!(
      title: title,
      description: description,
      user_id: user_id
    )
  end

  # TODO: convert images not in runtime. Use resque or smth like that insead
  def attach_pictures!
    if pictures
      pictures.each do |image|
        @project.project_previews.create!(image: image)
      end
    end
  end
end
