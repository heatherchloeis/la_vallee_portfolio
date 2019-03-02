class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :company
      t.string :location
      t.string :title
      t.string :year
      t.text :desc

      t.timestamps
    end
  end
end