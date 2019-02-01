require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Class Methods' do
    it "should calculate average age" do
      astro1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      astro2 = Astronaut.create(name: "John Glenn", age: 42, job: "Pilot")
      astro3 = Astronaut.create(name: "Sally Ride", age: 41, job: "Specialist")

      avg = Astronaut.average(:age)

      expect(avg).to eq(40)
    end
  end
end
