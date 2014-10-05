class CreateMaeils < ActiveRecord::Migration
  def change
    create_table :maeils do |t|
      t.belongs_to :mailbox
      t.belongs_to :maeil
      t.integer :receiver_count
      t.string :type

      t.timestamps
    end
  end
end
