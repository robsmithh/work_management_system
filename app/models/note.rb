class Note < ApplicationRecord
  belongs_to :work_request

  validates :note, presence: true

end
