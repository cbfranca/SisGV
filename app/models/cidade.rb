class Cidade < ActiveRecord::Base
  attr_accessible :estado_id, :nome, :cidade_id

  belongs_to :estado
end
