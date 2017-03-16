class Interest < ApplicationRecord
  belongs_to :user

  validates :interest_type, inclusion: { in: ['health', 'hobby', 'work'] }

  def interest_type_enum
    [['health'], ['hobby'], ['work']]
  end
end
