require 'spec_helper'
require 'rails_helper'

feature 'ability to access home page' do

  scenario 'user visits root path' do
  	visit root_path
  end

end

feature 'ability to sign up as a user' do

  scenario 'user fills out sign up form without errors' do
    pending
  end

  scenario 'user fills out sign up form with errors' do
    pending
  end

end

feature 'ability to sign in as an existing user' do

  scenario 'user fills out sign in form without errors' do
    pending
  end

  scenario 'user fills out sign in form with errors' do
    pending
  end

end


