class Table < ApplicationRecord
  belongs_to :user

  validates :table, :seats, :user_id, presence: true
end
