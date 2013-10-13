class Cat < ActiveRecord::Base
  COLORS = %w[red orange yellow green blue black]
  
  attr_accessible :age, :birth_date, :color, :name, :sex
  validates :age, :birth_date, :color, :name, :sex, presence: true
  validates :age, numericality: true
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: %w[M F] }

end
