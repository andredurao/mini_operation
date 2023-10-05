# frozen_string_literal: true

require "test_helper"

class Foo
  include MiniOperation

  step :load
  step :calculate
  step :save
end

class TestMiniOperation < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::MiniOperation::VERSION
  end

  def test_it_should_initialize_a_class_variable
    steps = Foo.class_variable_get(:@@__mini_operation_steps)
    assert_equal([:load, :calculate, :save], steps)
  end
end
