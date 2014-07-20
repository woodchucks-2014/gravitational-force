require 'spec_helper'
require 'rails_helper'

feature 'ability to choose from drop down menu' do

  before(:each) do
    visit gravitate_path
  end

  scenario 'when user chooses user to rate' do
    expect(page).to have_content("Pick a User")
  end

  scenario 'when user chooses first trait to rate' do
    expect(page).to have_content("Pick a Skill")
  end

  scenario 'when user chooses second trait to rate' do
    expect(page).to have_content("Pick a Second Skill")
  end

end
