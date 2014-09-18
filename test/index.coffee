'use strict'

fs       = require 'fs'
{expect} = require 'chai'
parser   = require '../'

make_parse = (path = 'lexer_fixtures')  ->
    (filename = '') ->
        ctx = fs.readFileSync("#{__dirname}/#{path}/#{filename}", 'utf-8')
        parser.parse ctx

describe 'lexer', ->

    parse = make_parse()
    # https://github.com/hashicorp/hcl/blob/master/hcl/lex_test.go

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

describe 'decoder', ->

    parse = make_parse('decoder_fixture')
    # https://github.com/hashicorp/hcl/blob/master/decoder_test.go

    it 'basic.hcl', ->
        ast = parse('basic.hcl')
        expect(ast).to.be.an('object')
        expect(ast).to.deep.equal {
            foo: 'bar'
            bar: '${file("bing/bong.txt")}'
        }

    it 'basic_squish.hcl', ->
        ast = parse('basic_squish.hcl')
        expect(ast).to.be.an('object')
        expect(ast).to.deep.equal {
            foo: 'bar'
            bar: '${file(\"bing/bong.txt\")}'
            'foo-bar': 'baz'
        }

    it 'empty.hcl', ->
        ast = parse('empty.hcl')
        expect(ast).to.be.an('object')
        expect(ast).to.deep.equal {
            resource: [
                {
                    foo: {}
                }
            ]
        }

    it 'scientific.hcl', ->
        ast = parse('scientific.hcl')
        expect(ast).to.be.an('object')
        expect(ast).to.deep.equal {
            a: 1e-10
            b: 1e+10
            c: 1e10
            d: 1.2e-10
            e: 1.2e+10
            f: 1.2e10
        }

    it 'terraform_heroku.hcl', ->
        ast = parse('terraform_heroku.hcl')
        expect(ast).to.be.an('object')
        expect(ast).to.deep.equal {
            name: 'terraform-test-app'
            config_vars: [
                {FOO: 'bar'}
            ]
        }

    it 'structure_multi.hcl', ->
        ast = parse('structure_multi.hcl')
        expect(ast).to.be.an('object')
        expect(ast).to.deep.equal {
            foo: [
                {
                    baz: [
                        {key: 7}
                    ]
                }
                {
                    bar: [
                        {key: 12}
                    ]
                }
            ]
        }

    it 'structure_list.hcl', ->
        ast = parse('structure_list.hcl')
        expect(ast).to.be.an('object')
        expect(ast).to.deep.equal {
            foo: [
                {key: 7}
                {key: 12}
            ]
        }

    it 'decode_policy.hcl', ->
        ast = parse('decode_policy.hcl')
        expect(ast).to.be.an('object')

    it 'decode_tf_variable.hcl', ->
        ast = parse('decode_tf_variable.hcl')
        expect(ast).to.be.an('object')

    it 'flat.hcl', ->
        ast = parse('flat.hcl')
        expect(ast).to.be.an('object')

    it 'structure.hcl', ->
        ast = parse('structure.hcl')
        expect(ast).to.be.an('object')

    it 'structure2.hcl', ->
        ast = parse('structure2.hcl')
        expect(ast).to.be.an('object')

    it 'structure_flatmap.hcl', ->
        ast = parse('structure_flatmap.hcl')
        expect(ast).to.be.an('object')
