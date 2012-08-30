class CreateVocacionados < ActiveRecord::Migration
  def change
    create_table :vocacionados do |t|
      t.string :nome
      t.date :nascimento
      t.integer :cod_escolaridade
      t.string :endereco
      t.string :bairro
      t.string :cep
      t.string :complemento_endereco
      t.integer :cod_estado
      t.integer :cidade_id
      t.string :telefone_residencial
      t.string :celular
      t.string :email
      t.date :primeiro_contato
      t.boolean :ativo

      t.timestamps
    end
  end
end
