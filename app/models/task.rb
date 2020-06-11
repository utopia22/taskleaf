class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, uniqueness: true

  belongs_to :user

  private

  def set_nameless_name
    self.name = '名前なし' if name.blank?
  end

end
