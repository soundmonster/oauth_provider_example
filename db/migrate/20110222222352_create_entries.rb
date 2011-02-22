class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :name
      t.text :content
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
