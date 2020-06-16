class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, uniqueness: true

  belongs_to :user
  scope :recent, -> { order(created_at: :desc)}

  private

  def set_nameless_name
    self.name = '名前なし' if name.blank?
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end
