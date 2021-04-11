class Contact < ApplicationRecord
  # belongs_to :user

  before_save :email.downcase
  # before_save :first_name.capitalize, :last_name.capitalize

  validates :first_name, :last_name, :phone_number, :job_role, :email, presence: true

  validates :first_name, length: { minimum: 2, maximum: 35 }, if: -> { first_name.present? }
  validates :last_name, length: { minimum: 2, maximum: 35 }, if: -> { last_name.present? }
  validates :phone_number, length: { minimum: 5, maximum: 14 }, if: -> { phone_number.present? }
  validates :job_role, length: { minimum: 2, maximum: 35 }, if: -> { job_role.present? }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }, if: -> { email.present? }

end
