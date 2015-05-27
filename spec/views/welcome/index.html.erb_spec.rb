require 'rails_helper'

describe 'welcome/index.html.erb' do
  it 'display opinions' do
    assign(:opinions, [
      double(Opinion, body: 'My opinion', created_at: Time.now),
      double(Opinion, body: 'It\'s now!', created_at: Time.now)
    ])

    render

    expect(rendered).to have_content 'My opinion'
    expect(rendered).to have_content 'It\'s now!'
  end
end
