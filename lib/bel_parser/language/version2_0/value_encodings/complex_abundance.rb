require_relative '../../version2_0'
require_relative 'abundance'

module BELParser
  module Language
    module Version2_0
      module ValueEncodings
        # ComplexAbundance value encoding.
        class ComplexAbundance < Abundance
          # Return the {Symbol} value.
          #
          # @note This method should be overridden in subclasses.
          def self.to_sym
            raise_not_implemented(__method__) if self != ComplexAbundance
            :C
          end
        end
      end
    end
  end
end
