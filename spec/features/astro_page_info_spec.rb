require 'rails_helper'

RSpec.describe "user sees astronaut page info", type: :feature do
  context "user sees basic astronaut info"
    it "shows astro name age and job" do
      astro = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")

      visit '/astronauts'

      expect(page).to have_content("Name: #{astro.name}")
      expect(page).to have_content("Age: #{astro.age}")
      expect(page).to have_content("Job: #{astro.job}")
    end

  context "user sees average astronaut age"
    it "calculates and displays average astronaut age" do
      astro1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      astro2 = Astronaut.create(name: "John Glenn", age: 42, job: "Pilot")
      astro3 = Astronaut.create(name: "Sally Ride", age: 41, job: "Specialist")

      visit '/astronauts'

      expect(page).to have_content("Average Age: 40")
    end

  context "user sees alphabetical listing of missions"
    it "show each astronauts missions" do
      astro1 = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      mission1 = astro1.missions.create(name: "Gemini 7")
      mission2 = astro1.missions.create(name: "Capricorn 4")
      mission3 = astro1.missions.create(name: "Apollo 13")

      visit '/astronauts'

      expect(page).to have_content("Apollo 13 Capricorn 4 Gemini 7")
    end
end
