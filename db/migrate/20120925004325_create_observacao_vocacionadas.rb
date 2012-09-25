class CreateObservacaoVocacionadas < ActiveRecord::Migration
  def change
    create_table :observacao_vocacionadas do |t|
	  t.integer :vocacionada_id
      t.text :descricao
      t.date :data
      t.timestamps
    end
    add_index(:observacao_vocacionadas, :vocacionada_id)
  end
end
