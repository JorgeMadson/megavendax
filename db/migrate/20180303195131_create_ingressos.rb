class CreateIngressos < ActiveRecord::Migration[5.1]
  def change
    create_table :ingressos do |t|
      t.float :preco
      t.string :nome
      t.float :tava
      t.datetime :data

      t.timestamps
    end
  end
end
