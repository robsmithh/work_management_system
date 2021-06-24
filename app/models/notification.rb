class Notification < ApplicationRecord
  belongs_to :work_request
  belongs_to :user

end
