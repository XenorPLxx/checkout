require 'test_helper'

class CustomRulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @custom_rule = custom_rules(:one)
  end

  test "should get index" do
    get custom_rules_url
    assert_response :success
  end

  test "should get new" do
    get new_custom_rule_url
    assert_response :success
  end

  test "should create custom_rule" do
    assert_difference('CustomRule.count') do
      post custom_rules_url, params: { custom_rule: { date_from: @custom_rule.date_from, date_to: @custom_rule.date_to, product_id: @custom_rule.product_id, rule: @custom_rule.rule } }
    end

    assert_redirected_to custom_rule_url(CustomRule.last)
  end

  test "should show custom_rule" do
    get custom_rule_url(@custom_rule)
    assert_response :success
  end

  test "should get edit" do
    get edit_custom_rule_url(@custom_rule)
    assert_response :success
  end

  test "should update custom_rule" do
    patch custom_rule_url(@custom_rule), params: { custom_rule: { date_from: @custom_rule.date_from, date_to: @custom_rule.date_to, product_id: @custom_rule.product_id, rule: @custom_rule.rule } }
    assert_redirected_to custom_rule_url(@custom_rule)
  end

  test "should destroy custom_rule" do
    assert_difference('CustomRule.count', -1) do
      delete custom_rule_url(@custom_rule)
    end

    assert_redirected_to custom_rules_url
  end
end
