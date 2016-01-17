class CreateProjectPreviews < ActiveRecord::Migration[5.0]
  def change
    create_table :project_previews do |t|
      t.attachment :image
      t.text :description
      t.references :project, index: true, foreign_key: true
      t.timestamps
    end
  end
end
