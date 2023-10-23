# frozen_string_literal: true

require_relative "mini_operation/version"

# The module used for steps, data collections and perform
module MiniOperation
  class Error < StandardError; end

  def self.included(base)
    base.class_variable_set(:@@__mini_operation_steps, [])
    base.class_variable_set(:@@__mini_operation_data, { results: {}, errors: {}, steps_map: {}, current_step: -1 })
    base.extend(ClassMethods)
  end

  # Contains the class methods helpers like: step, previous_step, next_step and others
  module ClassMethods
    def step(method_name)
      steps = class_variable_get(:@@__mini_operation_steps)
      steps << method_name
      class_variable_set(:@@__mini_operation_steps, steps)
    end

    def perform
      @@__mini_operation_steps.each_with_index do |step, index|
        @@__mini_operation_data[:current_step] = index
        @@__mini_operation_data[:results][step] = send(step)
      rescue StandardError => e
        @@__mini_operation_data[:errors][step] = e
      end
    end
  end
end
