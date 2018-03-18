class CreateUserProfileItems < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profile_items do |t|
      t.belongs_to :user_profile, index: true
      t.belongs_to :item, index: true
      t.timestamps
    end

    add_index :user_profile_items, [:user_profile_id, :item_id], name: "user_profile_items_through_join"
  end
end
