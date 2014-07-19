class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value
      t.references :rating_user
      t.references :rated_user
      t.references :trait

      t.timestamps
    end
  end
end
