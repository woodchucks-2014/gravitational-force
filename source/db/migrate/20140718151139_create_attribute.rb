class CreateAttribute < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.string :name
    end
  end
end
