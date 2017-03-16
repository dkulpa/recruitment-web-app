class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :interests, dependent: :destroy

  validates :gender, inclusion: { in: ['male', 'female'] }

  def gender_enum
    [['male'], ['female']]
  end
end
