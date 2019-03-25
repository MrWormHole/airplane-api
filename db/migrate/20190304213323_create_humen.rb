class CreateHumen < ActiveRecord::Migration[5.2]
  def change
    create_table :humen do |t|
      t.string :name
      t.string :job
      t.references :airplane, foreign_key: true

      t.timestamps
    end
  end
end
