class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :likeable,polymorphic: true, index: true

      t.timestamps
    end
    add_index :likes, [:user_id, :likeable_id,:likeable_type], unique: true
  end
end
