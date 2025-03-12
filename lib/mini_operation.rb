# frozen_string_literal: true

require_relative "mini_operation/version"

# The module used for steps, data collections and perform
module MiniOperation
  class Error < StandardError; end

  def self.included(base)
    base.class_variable_set(:@@__mini_operation_steps, [])
    base.send(:include, InstanceMethods)
    base.extend(ClassMethods)
  end

  # Contains the instance method helpers like: perform, previous_step, next_step and others
  module InstanceMethods
    def perform
      default_data = { results: {}, errors: {}, steps_map: {}, current_step: -1, execution_path: [] }
      instance_variable_set(:@__mini_operation_data, default_data)

      steps = self.class.class_variable_get(:@@__mini_operation_steps)
      steps.each_with_index do |step, index|
        @__mini_operation_data[:current_step] = index
        @__mini_operation_data[:results][step] = method(step).call
        @__mini_operation_data[:execution_path] << step
      rescue StandardError => e
        @__mini_operation_data[:errors][step] = e
      end
    end
  end

  # Contains the class methods helpers like: step
  module ClassMethods
    def step(method_name)
      steps = class_variable_get(:@@__mini_operation_steps)
      steps << method_name
      class_variable_set(:@@__mini_operation_steps, steps)
    end
  end
end
