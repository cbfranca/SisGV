class CreateObservacaoVocacionados < ActiveRecord::Migration
  def change
    create_table :observacao_vocacionados do |t|
      t.integer :vocacionado_id
      t.text :descricao
      t.date :data
      t.timestamps
    end
    add_index(:observacao_vocacionados, :vocacionado_id)
  end
end
