# frozen_string_literal: true

require "test_helper"

class FirstOp
  include MiniOperation

  step :load
  step :calculate
  step :save

  def load; end
  def calculate; end
  def save; end
end

class SecondOp
  include MiniOperation

  step :collect
  step :format
  step :submit

  def collect; end
  def format; end
  def submit; end
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

  def test_it_should_initialize_data_class_variable_on_perform
    op = FirstOp.new
    op.perform

    data = op.instance_variable_get(:@__mini_operation_data)
    assert_equal(%i[results errors steps_map current_step execution_path], data.keys)
    assert_equal({ load: nil, calculate: nil, save: nil }, data[:results])
    assert_equal({}, data[:errors])
    assert_equal({}, data[:steps_map])
    assert_equal(2, data[:current_step])
  end
end
