class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, uniqueness: true

  belongs_to :user
  scope :recent, -> { order(created_at: :desc)}

  private

  def set_nameless_name
    self.name = '名前なし' if name.blank?
  end

end
