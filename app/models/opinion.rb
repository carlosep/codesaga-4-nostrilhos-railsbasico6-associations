class Opinion < ActiveRecord::Base
  validates :body, presence: true
  validates :body, length: { maximum: 150, message: 'is too long' }
  validates :body, format: {
    without: /Petralha|Dilma|Tucanos/,
    message: 'Contains political words'
  }
end
