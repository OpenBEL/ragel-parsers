require_relative '../../../spec_helper'
require 'bel_parser/parsers/ast/node'
require 'bel_parser/parsers/common'
require 'bel_parser/parsers/expression'
require 'bel_parser/parsers/bel_script'
require 'bel_parser/language/quoting'
include AST::Sexp
include BELParser::Quoting

ast = BELParser::Parsers::AST
parsers = BELParser::Parsers

describe 'when parsing set document statements' do
  subject(:parser) { parsers::BELScript::Set }

  context 'that are well-formed with strings' do
    identifier = random_identifier
    value = random_string
    input = "SET #{identifier} = #{value}"
    it "is complete for #{input}" do
      output = parse_ast(parser, input)
      expect(output).to be_a(ast::Set)
      expect(output).to respond_to(:complete)
      expect(output.complete).to be(true)
      expect(output.children?).to be(true)
      expect(output.num_children).to be(2)

      expect(output.first_child).to be_a(ast::Identifier)
      expect(output.first_child.complete).to be(true)
      expect(output.second_child).to be_a(ast::String)
      expect(output.second_child.complete).to be(true)

      expect(output).to eq(
        s(:set,
          s(:identifier, identifier),
          s(:string, unquote(value)))
      )
    end
  end

  context 'that are well-formed with identifiers' do
    identifier = random_identifier
    value = random_identifier
    input = "SET #{identifier} = #{value}"
    it "is complete for #{input}" do
      output = parse_ast(parser, input)
      expect(output).to be_a(ast::Set)
      expect(output).to respond_to(:complete)
      expect(output.complete).to be(true)
      expect(output.children?).to be(true)
      expect(output.num_children).to be(2)

      expect(output.first_child).to be_a(ast::Identifier)
      expect(output.first_child.complete).to be(true)
      expect(output.second_child).to be_a(ast::Identifier)
      expect(output.second_child.complete).to be(true)

      expect(output).to eq(
        s(:set,
          s(:identifier, identifier),
          s(:identifier, value))
      )
    end
  end

  context 'that are well-formed with lists' do
    identifier = random_identifier
    rnd_id1 = random_identifier
    rnd_id2 = random_identifier
    value = "{ #{rnd_id1}, #{rnd_id2} }"
    input = "SET #{identifier} = #{value}"
    it "is complete for #{input}" do
      output = parse_ast(parser, input)
      expect(output).to be_a(ast::Set)
      expect(output).to respond_to(:complete)
      expect(output.complete).to be(true)
      expect(output.children?).to be(true)
      expect(output.num_children).to be(2)

      expect(output.first_child).to be_a(ast::Identifier)
      expect(output.first_child.complete).to be(true)
      expect(output.second_child).to be_a(ast::List)
      expect(output.second_child.complete).to be(true)

      expect(output).to eq(
        s(:set,
          s(:identifier, identifier),
          s(:list,
            s(:list_item,
              s(:identifier, rnd_id1)),
            s(:list_item,
              s(:identifier, rnd_id2))
            )
          )
      )
    end
  end

  context 'with a malformed keyword' do
    identifier = random_identifier
    value = random_string
    input = "SER #{identifier} = #{value}"
    it "is incomplete for #{input}" do
      output = parse_ast(parser, input)
      expect(output).to be_a(ast::Set)
      expect(output).to respond_to(:complete)
      expect(output.complete).to be(false)
      expect(output.children?).to be(true)
      expect(output.num_children).to be(2)

      expect(output.first_child).to be_a(ast::Identifier)
      expect(output.first_child.complete).to be(true)
      expect(output.second_child).to be_a(ast::String)
      expect(output.second_child.complete).to be(true)

      expect(output).to eq(
        s(:set,
          s(:identifier, identifier),
          s(:string, unquote(value)))
      )
    end
  end

  context 'that are malformed with strings' do
    identifier = random_identifier
    value = random_identifier
    # omit trailing '"'
    input = "SET #{identifier} = \"#{value}"
    it "is complete for #{input}" do
      output = parse_ast(parser, input)
      expect(output).to be_a(ast::Set)
      expect(output).to respond_to(:complete)
      expect(output.complete).to be(true)
      expect(output.children?).to be(true)
      expect(output.num_children).to be(2)

      expect(output.first_child).to be_a(ast::Identifier)
      expect(output.first_child.complete).to be(true)
      expect(output.second_child).to be_a(ast::String)
      expect(output.second_child.complete).to be(true)

      expect(output).to eq(
        s(:set,
          s(:identifier, identifier),
          s(:string, unquote(value)))
      )
    end
  end

  context 'that are malformed with lists' do
    identifier = random_identifier
    rnd_id1 = random_identifier
    rnd_id2 = random_identifier
    # omit trailing '}'
    value = "{ #{rnd_id1}, #{rnd_id2}"
    input = "SET #{identifier} = #{value}"
    it "is complete for #{input}" do
      output = parse_ast(parser, input)
      expect(output).to be_a(ast::Set)
      expect(output).to respond_to(:complete)
      expect(output.complete).to be(true)
      expect(output.children?).to be(true)
      expect(output.num_children).to be(2)

      expect(output.first_child).to be_a(ast::Identifier)
      expect(output.first_child.complete).to be(true)
      expect(output.second_child).to be_a(ast::List)
      expect(output.second_child.complete).to be(true)

      expect(output).to eq(
        s(:set,
          s(:identifier, identifier),
          s(:list,
            s(:list_item,
              s(:identifier, rnd_id1)),
            s(:list_item,
              s(:identifier, rnd_id2))
            )
          )
      )
    end
  end

end