class CreateExamples < ActiveRecord::Migration[5.2]
  def change
    create_table :examples do |t|
      t.string :category
      t.string :style

      t.timestamps
    end
  end
end
