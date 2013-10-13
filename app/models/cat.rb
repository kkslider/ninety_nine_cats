class Cat < ActiveRecord::Base
  COLORS = %w[red orange yellow green blue black]
  
  attr_accessible :age, :birth_date, :color, :name, :sex
  validates :age, :birth_date, :color, :name, :sex, presence: true
  validates :age, numericality: true
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: %w[M F] }
  
  has_many(
  :rental_requests,
  :class_name => "CatRentalRequest",
  :foreign_key => :cat_id,
  :primary_key => :id,
  :order => "start_date ASC",
  :dependent => :destroy
  )

end
