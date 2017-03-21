INTEREST_TYPES = %w(health hobby work)

class Interest < ApplicationRecord
  belongs_to :user

  validates :name, :interest_type, presence: true
  validates :interest_type, inclusion: { in: INTEREST_TYPES }

  scope :stage_6_scope, -> {
    where(" LOWER(name) LIKE 'cosm%' AND
           interest_type = 'health' AND
            user_id IN (
              SELECT user_id
              FROM users
              WHERE gender = 'female' AND (age BETWEEN 20 AND 30))")}

  def interest_type_enum
    INTEREST_TYPES.map{|type| [type]}
  end
end
