require 'spec_helper'
require 'rails_helper'

feature 'ability to view traits' do

  scenario 'when user visits index' do
    FactoryGirl.create :trait
    visit traits_path
    expect(page).to have_content "Trait_name"
  end

end
