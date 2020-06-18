class Task < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, uniqueness: true
  has_one_attached :image

  belongs_to :user
  scope :recent, -> { order(created_at: :desc)}

  def self.csv_attributes
    ["name", "description", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |task|
        csv << csv_attributes.map{|attr| task.send(attr) }
     end
   end

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
end
