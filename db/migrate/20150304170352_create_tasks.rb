class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :team
      t.string :name
      t.text :desc
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
