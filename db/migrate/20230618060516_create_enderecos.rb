class CreateEnderecos < ActiveRecord::Migration[7.0]
  def change
    create_table :enderecos do |t|
      t.references :paciente, {null: false, foreign_keys: true }
      t.string :CEP
      t.string :cidade
      t.string :bairro
      t.string :logradouro
      t.string :complemento

      t.timestamps
    end
  end
end
