class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :body
      t.string :phone_number
      t.boolean :responded, null: false, default: false

      t.timestamps
    end
  end
end
