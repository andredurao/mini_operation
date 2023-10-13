# frozen_string_literal: true

require_relative "mini_operation/version"

# The module used for steps, data collections and perform
module MiniOperation
  class Error < StandardError; end

  def self.included(base)
    base.class_variable_set(:@@__mini_operation_steps, [])
    base.extend(ClassMethods)
  end

  # Contains the class methods helpers like: step, previous_step, next_step and others
  module ClassMethods
    def step(method_name)
      steps = class_variable_get(:@@__mini_operation_steps)
      steps << method_name
      class_variable_set(:@@__mini_operation_steps, steps)
    end
  end
end
