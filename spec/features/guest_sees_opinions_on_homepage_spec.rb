require 'rails_helper'

feature 'Guest sees opinions on homepage' do
  scenario 'successfully' do
    opinions = create_new_opinions

    visit root_path

    expect(page).to have_content opinions[0].body
    expect(page).to have_content opinions[1].body
  end

  def create_new_opinions
    opinions = []
    opinions << Opinion.create!(body: 'First op')
    opinions << Opinion.create!(body: 'Second opinion')
  end
end
