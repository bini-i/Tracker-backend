require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:task_name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:progress) }

    it { should validate_length_of(:task_name).is_at_most(25) }

    it { should validate_length_of(:description).is_at_most(100) }

    it { should validate_numericality_of(:progress).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:progress).is_less_than_or_equal_to(100) }
  end

  describe 'associations' do
    it { should have_many(:todos) }
    it { should belong_to(:user) }
  end
end
