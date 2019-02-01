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
end
