class CreateCicadas < ActiveRecord::Migration
  def change
    create_table :cicadas do |t|
      t.string :title
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :description

      t.timestamps null: false
    end
  end
end
