class CreateTextreads < ActiveRecord::Migration
  def change
    create_table :textreads do |t|
      t.integer :attributeDisplayId
      t.integer :truncation
      t.text :truncation_format
      t.text :transformation

      t.timestamps
    end
  end
end
