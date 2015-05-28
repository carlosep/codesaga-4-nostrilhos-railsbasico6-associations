require 'rails_helper'

describe Opinion do
  it 'persists a new opinion' do
    body = "Rails is awesome!"
    opinion = Opinion.create(body: body)

    expect(opinion).to be_persisted
    expect(opinion.body).to eq body
  end

  it 'should not allow political words' do
    body = "Petralha Tucanos Dilma"
    opinion = Opinion.new(body: body)

    expect(opinion).to_not be_valid
    expect(opinion.errors[:body]).to include "Contains political words"
  end

  it 'is invalid when has no body' do
    body = ''
    opinion = Opinion.new(body: body)

    expect(opinion).to_not be_valid
    expect(opinion.errors[:body]).to include 'can\'t be blank'
  end

  it 'is invalid when has more than 150 caracters' do
    body = 'a' * 151
    opinion = Opinion.new(body: body)

    expect(opinion).to_not be_valid
    expect(opinion.errors[:body]).to include 'is too long'
  end
end
