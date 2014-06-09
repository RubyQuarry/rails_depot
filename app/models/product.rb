class Product < ActiveRecord::Base

  validates :title,:description,:image_url,presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}



  validates :title, uniqueness: true

  validates :image_url, allow_blank: true, format:{
      with: %r{\.(gif|jpg|png)\Z}i,
      message: 'mush be a URL for gif, jpg or png image.'
  }

  validates :title, length: {minimum: 10, maximum: 32, message: "message must be between 10 and 32 characters"}
end
