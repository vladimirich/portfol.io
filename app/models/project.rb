class Project < ApplicationRecord
  belongs_to :user
  has_many :project_previews, dependent: :destroy

  validates :title, :description, presence: true
end
