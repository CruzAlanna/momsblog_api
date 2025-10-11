class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  
  has_many :posts
  has_many :comments

  validates :role, inclusion: { in: %w[student admin super_admin] }

  # Default role callback
  after_initialize :set_default_role, if: :new_record? #if: :new_record is so that this callback doesn't run everytime a query is made for users

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

  # Set default role if not provided
  def set_default_role
    self.role ||= 'student'
  end
  # reason for adding callback is because when creating a new user and not adding in a role, it wasn't running the default placed in the schema, it has to pass the validations in the model first. So when a new user was made with no role params passed in, it set role: nil. Which caused an error.
end