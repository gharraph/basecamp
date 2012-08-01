class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :private, :default => true, :null => false

      t.timestamps
    end
  end
end
