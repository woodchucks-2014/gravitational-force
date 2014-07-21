class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :value
      t.integer :rater_id
      t.integer :ratee_id
      t.integer :trait_id

      t.timestamps
    end
  end
end
