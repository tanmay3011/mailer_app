class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :filename
      t.string :content
      t.string :type
      t.timestamps
    end
  end
end
