##
# @file assertions.rb
# Define assertion steps to be used with a Selector
##

require 'brine/transforming'

##
# Indicate whether the assertion should be expected to fail.
##
ParameterType(
  name: 'maybe_not',
  regexp: /( not)?/,
  transformer: -> (input) { !input.nil? }
)

##
# Assert that the selected value is equal to the parameter.
#
# @param value [Object] Specify the value which the selection should equal.
# @param negated [boolean] Indicate whether the assertion should be negated.
##
Then('it is{maybe_not} equal to {grave_param}') do |negated, value|
  perform { selector.assert_that(value, binding, negated) {|v| eq v} }
end

##
# Assert that the selected value is equal to the docstring.
#
# @param multi [String] Specify the value which the selection should equal.
# @param negated [boolean] Indicate whether the assertion should be negated.
##
Then('it is{maybe_not} equal to:') do |negated, value|
  perform { selector.assert_that(transformed_parameter(value), binding, negated) {|v| eq v} }
end

##
# Assert that the selected value matches the parameter.
#
# @param value [Object] Specify the pattern which the selection should match.
# @param negated [boolean] Indicate whether the assertion should be negated.
##
Then('it is{maybe_not} matching {grave_param}') do |negated, value|
  perform { selector.assert_that(value, binding, negated) {|v| match v} }
end

##
# Assert that the selected value matches the docstring.
#
# @param value [String] Specify the pattern which the selection should match.
##
Then('it is matching:') do |value|
  perform { selector.assert_that(transformed_parameter(value), binding) {|v| match v} }
end

##
# Assert that the selected value is greater than the parameter.
#
# @param value [Object] Specify the value which the selection should be greater than.
##
Then('it is greater than {grave_param}') do |value|
  perform { selector.assert_that(value, binding) {|v| be > v} }
end

##
# Assert that the selected value is greater than or equal to the parameter.
#
# @param value [Object] Specify the value which the selection should be greater than or equal to.
##
Then('it is greater than or equal to {grave_param}') do |value|
  perform { selector.assert_that(value, binding) {|v| be >= v} }
end

##
# Assert that the selected value is less than the parameter.
#
# @param value [Object] Specify the value which the selection should be less than.
##
Then('it is less than {grave_param}') do |value|
  perform { selector.assert_that(value, binding) {|v| be < v} }
end

##
# Assert that the selected value is less than or equal to the parameter.
#
# @param value [Object] Specify the value which the selection should be less than or equal to.
##
Then('it is less than or equal to {grave_param}') do |value|
  perform { selector.assert_that(value, binding) {|v| be <= v} }
end

##
# Assert that the selected value is empty.
#
# This will be satisfied by nil or any object which returns a truthy #empty?
#
# @param negated [boolean] Indicate whether the assertion should be negated.
##
Then('it is{maybe_not} empty') do |negated|
  perform { selector.assert_that(nil, binding, negated) do
    satisfy{|i| i.nil? || (i.respond_to?(:empty?) && i.empty?) }
  end }
end

##
# Assert that the selected value includes the parameter.
#
# @param value [Object] Specify content which should be within the selection.
# @param negated [boolean] Indicate whether the assertion should be negated.
##
Then('it is{maybe_not} including {grave_param}') do |negated, value|
  perform { selector.assert_that(value, binding, negated) {|v| include v } }
end

##
# Assert that the selected value includes the docstring.
#
# @param value [String] Specify content which should be within the selection.
# @param negated [boolean] Indicate whether the assertion should be negated.
##
Then('it is{maybe_not} including:') do |negated, value|
  perform { selector.assert_that(transformed_parameter(value), binding, negated) {|v| include v } }
end

##
# Asserted that the selected value has a length equal to the parameter.
#
# TODO: It may be better to support selection of the length attribute, maybe
# chain to another dynamic step such as `is of lenth that is ...`
#
# @param length [Object] Specify the length which the selection should have.
# @param negated [boolean] Indicate whether the assertion should be negated.
##
Then('it is{maybe_not} of length {grave_param}') do |negated, length|
  perform do
    selector.assert_that(length, binding, negated) do |l|
      satisfy{|i| i.respond_to?(:length) && i.length == l}
    end
  end
end
