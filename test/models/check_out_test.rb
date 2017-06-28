require 'test_helper'
# before rake test RUN:
# rake db:test:purge
# rake db:migrate RAILS_ENV=test

class CheckOutTest < ActiveSupport::TestCase
  test 'test_case_1' do
    c = CheckOut.new
    assert c.total == 0
  end

  test 'test_case_2' do
    c = CheckOut.new
    c.scan("A")
    c.scan("B")
    assert c.total == 80
  end

  test 'test_case_3' do
    c = CheckOut.new
    c.scan("A")
    c.scan("A")
    assert c.total == 100
  end

  test 'test_case_4' do
    c = CheckOut.new
    c.scan("C")
    c.scan("D")
    c.scan("B")
    c.scan("A")
    assert c.total == 115
  end

  test 'test_case_5' do
    c = CheckOut.new
    c.scan("A")
    c.scan("A")
    c.scan("A")
    assert c.total == 130
  end

  test 'test_case_6' do
    c = CheckOut.new
    c.scan("A")
    c.scan("A")
    c.scan("A")
    c.scan("A")
    assert c.total == 180
  end

  test 'test_case_7' do
    c = CheckOut.new
    c.scan("A")
    c.scan("A")
    c.scan("A")
    c.scan("A")
    c.scan("A")
    assert c.total == 230
  end

  test 'test_case_8' do
    c = CheckOut.new
    c.scan("A")
    c.scan("A")
    c.scan("A")
    c.scan("A")
    c.scan("A")
    c.scan("A")
    assert c.total == 260
  end

  test 'test_case_9' do
    c = CheckOut.new
    c.scan("A")
    c.scan("A")
    c.scan("A")
    c.scan("B")
    assert c.total == 160
  end

  test 'test_case_10' do
    c = CheckOut.new
    c.scan("A")
    c.scan("A")
    c.scan("A")
    c.scan("B")
    c.scan("B")
    assert c.total == 175
  end

  test 'test_case_11' do
    c = CheckOut.new
    c.scan("A")
    c.scan("A")
    c.scan("A")
    c.scan("B")
    c.scan("B")
    c.scan("D")
    assert c.total == 190
  end

  test 'test_case_12' do
    c = CheckOut.new
    c.scan("D")
    c.scan("A")
    c.scan("B")
    c.scan("A")
    c.scan("B")
    c.scan("A")
    assert c.total == 190
  end

end
