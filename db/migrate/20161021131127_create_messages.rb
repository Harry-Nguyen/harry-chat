class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id, index: true
      t.integer :recipient_id, index: true
      t.string :title
      t.text :body
      t.timestamp :read_at

      t.timestamps
    end
  end
end
