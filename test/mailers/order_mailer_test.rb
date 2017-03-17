require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "justEat Order Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["justeat@example.com"], mail.from
    assert_match /1 × Pan Pizza - Margarita/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "justEat order Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["justeat@example.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Pan Pizza - Margarita<\/td>/, mail.body.encoded
  end

end
