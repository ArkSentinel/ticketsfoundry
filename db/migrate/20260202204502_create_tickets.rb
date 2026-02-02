class CreateTickets < ActiveRecord::Migration[8.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.integer :status
      t.integer :priority
      t.references :user, null: false, foreign_key: true
      t.integer :assignee_id
      t.references :category, null: false, foreign_key: true
      t.text :resolution_note

      t.timestamps
    end
    add_index :tickets, :assignee_id
  end
end
