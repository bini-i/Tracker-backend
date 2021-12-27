# frozen_string_literal: true

class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :value, null: false
      t.boolean :checked, null: false
      t.references :task, foreign_key: true
      t.timestamps
    end
  end
end
