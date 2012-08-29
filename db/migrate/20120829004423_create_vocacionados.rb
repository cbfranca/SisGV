class CreateVocacionados < ActiveRecord::Migration
  def change
    create_table :vocacionados do |t|
      t.string :nome
      t.datetime :nascimento
      t.integer :cod_escolaridade
      t.string :endereco
      t.string :bairro
      t.string :cep
      t.string :complemento_endereco
      t.integer :cod_estado
      t.string :cidade
      t.string :telefone_residencial
      t.string :celular
      t.string :email
      t.datetime :primeiro_contato
      t.boolean :ativo

      t.timestamps
    end
  end
end
