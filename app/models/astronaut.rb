class Astronaut < ApplicationRecord

  has_many :missions, through: :astronaut_missions

  has_many :astronaut_missions
  validates_presence_of :name, :age, :job

  def self.avg_age
    self.average(:age)
  end

end
