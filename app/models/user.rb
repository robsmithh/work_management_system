class User < ApplicationRecord
  # has_many :contacts

  validates :username, :email, :first_name, :last_name, presence: true

  validates :username, length: { minimum: 5, maximum: 30 }, if: -> { username.present? }
  validates :first_name, length: { maximum: 40 }, if: -> { first_name.present? }
  validates :last_name, length: { maximum: 40 }, if: -> { last_name.present? }

  validates_format_of :first_name, :with => /[a-z]/i, if: -> { first_name.present? }
  validates_format_of :last_name, :with => /[a-z]/i, if: -> { last_name.present? }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }, if: -> { email.present? }

end
