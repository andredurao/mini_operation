# frozen_string_literal: true

require_relative "mini_operation/version"

module MiniOperation
  class Error < StandardError; end

  def self.included(base)
    base.class_variable_set(:@@__mini_operation_steps, [])
    base.extend(ClassMethods)
  end

  module ClassMethods
    def step(method_name)
      steps = class_variable_get(:@@__mini_operation_steps)
      steps << method_name
      class_variable_set(:@@__mini_operation_steps, steps)
    end
  end
end
