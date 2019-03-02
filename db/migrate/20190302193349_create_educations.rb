class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
    	t.string :school
    	t.string :year
    	t.string :degree
    	t.string :major

      t.timestamps
    end
  end
end
