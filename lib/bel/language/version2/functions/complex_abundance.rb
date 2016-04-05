require_relative '../../version1'
require_relative '../../function'
require_relative '../../signature'
require_relative '../../semantic_ast'

module BEL
  module Language
    module Version2
      module Functions
        # ComplexAbundance: Denotes the abundance of a molecular complex.
        class ComplexAbundance
          extend Function

          SHORT       = :complex
          LONG        = :complexAbundance
          RETURN_TYPE = BEL::Language::Version2::ReturnTypes::ComplexAbundance
          DESCRIPTION = 'Denotes the abundance of a molecular complex.'.freeze

          def self.short
            SHORT
          end

          def self.long
            LONG
          end

          def self.return_type
            RETURN_TYPE
          end

          def self.description
            DESCRIPTION
          end

          def self.signatures
            SIGNATURES
          end

          module Signatures
  
            class NamedComplexAbundanceSignature
              extend BEL::Language::Signature

              private_class_method :new

              AST = BEL::Language::Semantics::Builder.build do
                term(
                function(
                  identifier(
                    function_of(ComplexAbundance))),
                argument(
                  parameter(
                    prefix(
                      identifier(
                        has_namespace,
                        namespace_of(:*))),
                    value(
                      value_type(
                        has_encoding,
                        encoding_of(:Abundance))))))              
              end
              private_constant :AST

              STRING_FORM = 'complexAbundance(E:abundance)complexAbundance'.freeze
              private_constant :STRING_FORM

              def self.semantic_ast
                AST
              end

              def self.string_form
                STRING_FORM
              end
            end
  
            class NamedComplexAbundanceWithLocationSignature
              extend BEL::Language::Signature

              private_class_method :new

              AST = BEL::Language::Semantics::Builder.build do
                term(
                function(
                  identifier(
                    function_of(ComplexAbundance))),
                argument(
                  parameter(
                    prefix(
                      identifier(
                        has_namespace,
                        namespace_of(:*))),
                    value(
                      value_type(
                        has_encoding,
                        encoding_of(:Abundance))))),
                argument(
                  term(
                    function(
                      identifier(
                        return_type_of(BEL::Language::Version2::ReturnTypes::Location))))))              
              end
              private_constant :AST

              STRING_FORM = 'complexAbundance(E:abundance,F:location)complexAbundance'.freeze
              private_constant :STRING_FORM

              def self.semantic_ast
                AST
              end

              def self.string_form
                STRING_FORM
              end
            end
  
            class ComposedComplexAbundanceSignature
              extend BEL::Language::Signature

              private_class_method :new

              AST = BEL::Language::Semantics::Builder.build do
                term(
                function(
                  identifier(
                    function_of(ComplexAbundance))),
                variadic_arguments(
                  term(
                    function(
                      identifier(
                        return_type_of(BEL::Language::Version2::ReturnTypes::Abundance))))))              
              end
              private_constant :AST

              STRING_FORM = 'complexAbundance(F:abundance...)complexAbundance'.freeze
              private_constant :STRING_FORM

              def self.semantic_ast
                AST
              end

              def self.string_form
                STRING_FORM
              end
            end
  
            class ComposedComplexAbundanceWithLocationSignature
              extend BEL::Language::Signature

              private_class_method :new

              AST = BEL::Language::Semantics::Builder.build do
                term(
                function(
                  identifier(
                    function_of(ComplexAbundance))),
                variadic_arguments(
                  term(
                    function(
                      identifier(
                        return_type_of(BEL::Language::Version2::ReturnTypes::Abundance))))),
                argument(
                  term(
                    function(
                      identifier(
                        return_type_of(BEL::Language::Version2::ReturnTypes::Location))))))              
              end
              private_constant :AST

              STRING_FORM = 'complexAbundance(F:abundance...,F:location)complexAbundance'.freeze
              private_constant :STRING_FORM

              def self.semantic_ast
                AST
              end

              def self.string_form
                STRING_FORM
              end
            end
  
          end

          SIGNATURES = Signatures.constants.map do |const|
            Signatures.const_get(const)
          end.freeze
        end
      end
    end
  end
end
