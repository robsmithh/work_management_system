class Contact < ApplicationRecord
  before_save :email.downcase
  # before_save :first_name.capitalize, :last_name.capitalize

  validates :first_name, presence: true, length: { minimum: 2, maximum: 35 }

  validates :last_name, presence: true, length: { minimum: 2, maximum: 35 }

  validates :phone_number, presence: true, length: { minimum: 5, maximum: 14 }

  validates :job_role, presence: true, length: { minimum: 2, maximum: 35 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                      uniqueness: { case_sensitive: false },
                      length: { maximum: 105 },
                      format: { with: VALID_EMAIL_REGEX }

end
