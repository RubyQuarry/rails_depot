require 'test_helper'

class ProductTest < ActiveSupport::TestCase


  fixtures :products

  def new_product(args)
    Product.new(title: args.fetch(:title, "Harry Potter"),
                description: args.fetch(:description,'This a fine book'),
                price: args.fetch(:price, 1.00),
                image_url: args.fetch(:image_url,"muffins.png"))
  end


  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = new_product({})
    product.price = -1
    assert product.invalid?
    product.price = 1
    assert product.valid?
  end


  test "image url" do
    ok = %w{ fred.gif fred2.jpg FRED3.JPG FRED4.Jpg http://a.b.c/fred.gif }
    bad = %w{ fred.doc fred.gif.more}

    ok.each do |name|
      assert new_product({image_url: name}).valid? , "#{name} is invalid"
    end

    bad.each do |name|
      assert new_product({image_url: name}).invalid?,"#{name} is valid"
    end
  end


  test "product is not valid without a unique title" do

    product = new_product({title: products(:ruby).title})
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
  end

  test "title must be of length between 10 and 32 inclusive" do
    product = new_product({title: 'hello'})
    assert product.invalid?

    product.title = 'Hello, World'
    assert product.valid?
  end



end
