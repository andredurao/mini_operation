# frozen_string_literal: true

require "test_helper"

class FirstOp
  include MiniOperation

  step :load
  step :calculate
  step :save
end

class SecondOp
  include MiniOperation

  step :collect
  step :format
  step :submit
end

class TestMiniOperation < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::MiniOperation::VERSION
  end

  def test_it_should_initialize_steps_class_variable
    steps = FirstOp.class_variable_get(:@@__mini_operation_steps)
    assert_equal(%i[load calculate save], steps)

    steps = SecondOp.class_variable_get(:@@__mini_operation_steps)
    assert_equal(%i[collect format submit], steps)
  end

  def test_it_should_initialize_data_class_variable
    data = FirstOp.class_variable_get(:@@__mini_operation_data)
    assert_equal(%i[results errors], data.keys)
    assert_equal({}, data[:results])
    assert_equal({}, data[:errors])
  end
end
