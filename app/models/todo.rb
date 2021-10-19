# == Schema Information
#
# Table name: todos
#
#  id         :bigint           not null, primary key
#  checked    :boolean          not null
#  value      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  task_id    :bigint
#
# Indexes
#
#  index_todos_on_task_id  (task_id)
#
# Foreign Keys
#
#  fk_rails_...  (task_id => tasks.id)
#
class Todo < ApplicationRecord
    belongs_to :task
end
