class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, uniqueness: true

end
