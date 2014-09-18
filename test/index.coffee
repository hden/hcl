'use strict'

fs       = require 'fs'
{expect} = require 'chai'
parser   = require '../'

make_parse = (path = 'lexer_fixtures')  ->
    (filename = '') ->
        ctx = fs.readFileSync("#{__dirname}/#{path}/#{filename}", 'utf-8')
        res = parser.parse ctx
        console.log JSON.stringify res
        res

describe 'lexer', ->

    parse = make_parse()

    it 'comment.hcl', ->
        expect(parse('comment.hcl')).to.be.ok

    it 'comment_single.hcl', ->
        expect(parse('comment_single.hcl')).to.be.ok

    it 'multiple.hcl', ->
        expect(parse('multiple.hcl')).to.be.ok

    it 'list.hcl', ->
        expect(parse('list.hcl')).to.be.ok

    it 'old.hcl', ->
        expect(parse('old.hcl')).to.be.ok

    it 'structure_basic.hcl', ->
        expect(parse('structure_basic.hcl')).to.be.ok

    it 'structure.hcl', ->
        expect(parse('structure.hcl')).to.be.ok

    it 'assign_colon.hcl', ->
        expect(parse('assign_colon.hcl')).to.be.ok

    it 'structure_empty.hcl', ->
        expect(parse('structure_empty.hcl')).to.be.ok

    it 'complex.hcl', ->
        expect(parse('complex.hcl')).to.be.ok

    it 'assign_deep.hcl', ->
        expect(parse('assign_deep.hcl')).to.be.ok

    it 'types.hcl', ->
        expect(parse('types.hcl')).to.be.ok

describe 'parser', ->

    parse = make_parse('decoder_fixture')

    it 'basic.hcl', ->
        ast = parse('basic.hcl')
        expect(ast).to.be.an('array')

    it 'basic_squish.hcl', ->
        ast = parse('basic_squish.hcl')
        expect(ast).to.be.an('array')

    it 'decode_policy.hcl', ->
        ast = parse('decode_policy.hcl')
        expect(ast).to.be.an('array')

    it 'decode_tf_variable.hcl', ->
        ast = parse('decode_tf_variable.hcl')
        expect(ast).to.be.an('array')

    it 'empty.hcl', ->
        ast = parse('empty.hcl')
        expect(ast).to.be.an('array')

    it 'flat.hcl', ->
        ast = parse('flat.hcl')
        expect(ast).to.be.an('array')

    it 'scientific.hcl', ->
        ast = parse('scientific.hcl')
        expect(ast).to.be.an('array')

    it 'structure.hcl', ->
        ast = parse('structure.hcl')
        expect(ast).to.be.an('array')

    it 'structure2.hcl', ->
        ast = parse('structure2.hcl')
        expect(ast).to.be.an('array')

    it 'structure_flatmap.hcl', ->
        ast = parse('structure_flatmap.hcl')
        expect(ast).to.be.an('array')

    it 'structure_list.hcl', ->
        ast = parse('structure_list.hcl')
        expect(ast).to.be.an('array')

    it 'structure_multi.hcl', ->
        ast = parse('structure_multi.hcl')
        expect(ast).to.be.an('array')

    it 'terraform_heroku.hcl', ->
        ast = parse('terraform_heroku.hcl')
        expect(ast).to.be.an('array')
