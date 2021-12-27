# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :task_name, null: false
      t.string :description, null: false
      t.integer :progress, null: false
      t.timestamps
    end
  end
end
