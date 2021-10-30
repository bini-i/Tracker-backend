# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  progress    :integer          not null
#  task_name   :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_tasks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Task < ApplicationRecord
  validates :task_name, presence: true
  validates :description, presence: true
  validates :progress, presence: true
  validates :task_name, length: { maximum: 25 }
  validates :description, length: { maximum: 100 }
  validates :progress, numericality: { less_than_or_equal_to: 100, greater_than_or_equal_to: 0 }

  has_many :todos, dependent: :destroy
  belongs_to :user
end
