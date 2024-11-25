class CreateTrainings < ActiveRecord::Migration[7.1]
  def change
    create_table :trainings do |t|
      t.integer :level
      t.string :name
      t.references :skill, null: false, foreign_key: true
      t.references :training_plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
