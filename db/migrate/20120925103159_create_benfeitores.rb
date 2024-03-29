class CreateBenfeitores < ActiveRecord::Migration
  def change
    create_table :benfeitores do |t|
      t.string :nome
      t.date :nascimento      
      t.string :endereco
      t.string :bairro
      t.string :cep
      t.string :complemento_endereco
      t.integer :cod_estado
      t.string :cidade_id
      t.string :telefone_residencial
      t.string :celular
      t.string :email
      t.date :primeiro_contato
      t.boolean :ativo

      t.timestamps
    end
  end
end
