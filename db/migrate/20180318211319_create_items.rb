class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.belongs_to :brand
      t.belongs_to :category
      t.string :description
    end
  end
end
