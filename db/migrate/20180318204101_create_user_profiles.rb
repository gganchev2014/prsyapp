class CreateUserProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :user_profiles do |t|
      t.belongs_to :owned_by, references: :user, index: true
      t.string :name
      t.belongs_to :gender
      t.date :dob
      t.text :preferences
      t.timestamps
    end
  end
end
