class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  
  has_many :posts
  has_many :comments

  validates :role, inclusion: { in: %w[student admin super_admin] }

  def super_admin?
    role == 'super_admin'
  end

  def admin?
    role == 'admin'
  end

  def student?
    role == 'student'
  end

  # NOTE: The roles for super_admin and student, don't really have major distinction in the Authorization at the moment but they will when the backend gets more complex in functionality
end
