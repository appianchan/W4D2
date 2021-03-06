class Cat < ApplicationRecord
  COLORS = %w(orange black yellow calico)

  validates :birth_date, :name, presence: true
  validates :sex, inclusion: { in: %w(M F), message: "%{value} is not a valid sex"}, length: { is: 1 }, presence: true
  validates :color, presence: true, inclusion: { in: COLORS }

  has_many :rent_requests, foreign_key: :cat_id, class_name: :CatRentalRequest, dependent: :destroy
  # dependent: :destroy goes in an association

  # private 
  def age 
    # time_ago_in_words(self.birth_date)
    Time.now.year - self.birth_date.year
  end

end
