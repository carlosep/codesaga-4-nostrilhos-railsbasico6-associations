require 'rails_helper'

feature 'guest agrees with an opinion' do
  scenario 'successfully' do
    add_new_opinion 'Rails is awesome!'
    add_new_opinion 'Rails is only for blogs'

    visit root_path

    agree_opinion

    within first('div.opinion') do 
      expect(page).to have_content('1 person')
    end

    within('div#opinions div.opinion:last-child') do
      expect(page).to have_content('0 people')
    end

    agree_opinion

    within first('div.opinion') do 
      expect(page).to have_content('2 people')
    end

    within('div#opinions div.opinion:last-child') do
      expect(page).to have_content('0 people')
    end
  end

  def agree_opinion
    within first('div.opinion') do 
      click_on 'I agree!'
    end
  end

  def add_new_opinion(opinion_message)
    visit new_opinion_path
    fill_in 'Body', with: 'Rails is awesome!'
    click_on 'Create an opinion'
  end
end
