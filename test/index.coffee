'use strict'

fs       = require 'fs'
{expect} = require 'chai'
parser   = require '../'

parse = (filename = '') ->
    ctx = fs.readFileSync("#{__dirname}/fixtures/#{filename}", 'utf-8')
    res = parser.parse ctx
    console.log JSON.stringify res
    res

describe 'lexer', ->
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
