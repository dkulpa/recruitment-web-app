class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :interests, dependent: :destroy

  validates :gender, :email, :admin, :age, presence: true
  validates :gender, inclusion: { in: ['male', 'female'] }
  validates :email, email: true
  validates :age, inclusion: { in: 8..160, message: 'is a wrong age' }

  def gender_enum
    [['male'], ['female']]
  end
end
