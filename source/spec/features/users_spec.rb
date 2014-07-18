require 'spec_helper'
require 'rails_helper'

feature 'ability to access home page' do 

  scenario 'user visits root path' do
  	visit root_path
  end

end