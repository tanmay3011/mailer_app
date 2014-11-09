class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :description
      t.belongs_to :log
      t.timestamps
    end
  end
end
