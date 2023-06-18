class CreateMedicos < ActiveRecord::Migration[7.0]
  def change
    create_table :medicos do |t|
      t.string :nome_completo
      t.string :CPF
      t.string :email
      t.string :especialidade
      t.string :CRM

      t.timestamps
    end
  end
end
