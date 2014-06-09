require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end


  test "product price must be positive" do
    product = Product.new(title: "My book",
                          description: "yyy",
                          image_url: "zzz.jpg")
    product.price = -1
    assert product.invalid?
    product.price = 1
    assert product.valid?

  end

  def new_product(image_url)
    Product.new(title:'my title',
                description: 'definitions',
                price: 1.00,
                image_url: image_url)
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg FRED.JPG FRED.Jpg http://a.b.c/fred.gif }
    bad = %w{ fred.doc fred.gif.more}

    ok.each do |name|
      assert new_product(name).valid?
    end

    bad.each do |name|
      assert new_product(name).invalid?
    end
  end



end
