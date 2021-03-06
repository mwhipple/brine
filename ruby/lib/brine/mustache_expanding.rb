##
# @file mustache_expanding.rb
# Support expanding Mustache templates with a provided binding.
##
module Brine

  ##
  # Provide a binding environment and template expansion that can use such an environment.
  ##
  module MustacheExpanding
    require 'mustache'

    ##
    # Furnish a mutable hash to serve as a binding environment.
    #
    # @return [Hash<String, Object>] Return the active binding environment.
    ##
    def binding
      @binding ||= env_brine_vars
    end

    ##
    # Assign `value' to `key' within binding,
    #
    # @param key [String] Specify the key in the binding to which `value` will be assigned.
    # @param value [Object] Specify the value to assign to ``key` within the binding.
    ##
    def bind(key, value)
      STDERR.puts "Assigning #{value} to #{key}" if ENV['BRINE_LOG_BINDING']
      binding[key] = value
    end

    ##
    # Provide an expandable Mustache template using binding environment.
    #
    # This exists to support latent expansion and template retrieval.
    ##
    class BrineTemplate < Mustache

      ##
      # Instantiate a BrineTemplate.
      #
      # @param tmpl [String] Define the string content of the template.
      ##
      def initialize(tmpl)
        @template = tmpl
      end

      ##
      # Expand the template using the provided bindings.
      #
      # @param binding [Hash] Provide bound values to use within the template.
      # @return [String] Return the contents of this template applied against `binding`.
      ##
      def expand(binding)
        begin
          context.push(binding)
          render
        ensure
          context.pop
        end
      end

      ##
      # Stringify as template contents.
      #
      # This supports cases such as dynamic steps where a string is expected
      # but the template should not yet be expanded.
      ##
      def to_s
        @template
      end
    end

    ##
    # Allow retrieval of BrineTemplates for provided template content.
    #
    # @param str [String] Define the string contents for the returned template.
    # @return [BrineTemplate] Return a BrineTemplate with the provided content.
    ##
    def as_template(str)
      BrineTemplate.new(str)
    end

    private

    ##
    # Build a hash of environment values with a (stripped) BRINE_VAR_ prefix.
    ##
    def env_brine_vars
      ENV.select{|k, v| k.start_with? 'BRINE_VAR_'}
        .transform_keys{|k| k.delete_prefix 'BRINE_VAR_' }
    end
  end

  ##
  # Mix the MustacheExpanding module functionality into the main Brine module.
  ##
  include MustacheExpanding
end
