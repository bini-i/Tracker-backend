# frozen_string_literal: true

class AddUseridToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :user, index: true
    add_foreign_key :tasks, :users
  end
end
