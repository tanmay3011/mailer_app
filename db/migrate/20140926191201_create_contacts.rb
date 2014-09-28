class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :firstname
      t.string :lastname
      t.integer :phone_no
      t.belongs_to :friend 
      t.timestamps
    end
  end
end
