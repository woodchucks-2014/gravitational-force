require 'spec_helper'
require 'rails_helper'

feature 'ability to view attributes' do 

  scenario 'user visits index' do
    visit attributes_path

    expect(page).to have_content "Attribute_name"
  end

end