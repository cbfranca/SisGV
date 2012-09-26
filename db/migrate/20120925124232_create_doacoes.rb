class CreateDoacoes < ActiveRecord::Migration
  def change
    create_table :doacoes do |t|
      t.integer :benfeitor_id
      t.decimal :valor, :precision => 18, :scale => 2
      t.date :data
      t.timestamps
    end
     add_index(:doacoes, :benfeitor_id)
  end
end
