class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable :registerable, and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  # Associations of user to blog posts
  has_many :blogs, dependent: :destroy

  # Role for admins
  enum role: { admin: 0, advisor: 1 }

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :admin
  end
end
