chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'pagerduty', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/scripts/pagerduty')(@robot)

  it 'registers a pager me listener', ->
    expect(@robot.respond).to.have.been.calledWith(/pager( me)?$/i)

  it 'registers a pager me as listener', ->
    expect(@robot.respond).to.have.been.calledWith(/pager(?: me)? as (.*)$/i)

  it 'registers a pager forget me listener', ->
    expect(@robot.respond).to.have.been.calledWith(/pager forget me$/i)

  it 'registers a pager indcident listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(pager|major)( me)? incident (.*)$/i)

  it 'registers a pager sup listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(pager|major)( me)? (inc|incidents|sup|problems)$/i)

  it 'registers a pager trigger listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(pager|major)( me)? (?:trigger|page) ([\w\-]+)$/i)

  it 'registers a pager trigger with message listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(pager|major)( me)? (?:trigger|page) ([\w\-]+) (.+)$/i)

  it 'registers a pager ack listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(?:pager|major)(?: me)? ack(?:nowledge)? (.+)$/i)

  it 'registers a pager ack! listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(pager|major)( me)? ack(nowledge)?(!)?$/i)

  it 'registers a pager resolve listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(?:pager|major)(?: me)? res(?:olve)?(?:d)? (.+)$/i)

  it 'registers a pager resolve! listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(pager|major)( me)? res(olve)?(d)?(!)?$/i)

  it 'registers a pager notes on listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(pager|major)( me)? notes (.+)$/i)

  it 'registers a pager notes add listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(pager|major)( me)? note ([\d\w]+) (.+)$/i)

  it 'registers a pager schedules listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(pager|major)( me)? schedules( (.+))?$/i)

  it 'registers a pager schedule override listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(pager|major)( me)? (schedule|overrides)( ([\w\-]+))?( ([^ ]+))?$/i)

  it 'registers a pager schedule override details listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(pager|major)( me)? (override) ([\w\-]+) ([\w\-:\+]+) - ([\w\-:\+]+)( (.*))?$/i)

  it 'registers a pager override delete listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(pager|major)( me)? (overrides?) ([\w\-]*) (delete) (.*)$/i)

  it 'registers a pager link listener', ->
    expect(@robot.respond).to.have.been.calledWith(/pager( me)? (.+) (\d+)$/i)

  it 'registers a pager on call listener', ->
    expect(@robot.respond).to.have.been.calledWith(/who('s|s| is|se)? (on call|oncall|on-call)( (?:for )?(.+))?/i)

  it 'registers a pager services listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(pager|major)( me)? services$/i)

  it 'registers a pager maintenance listener', ->
    expect(@robot.respond).to.have.been.calledWith(/(pager|major)( me)? maintenance (\d+) (.+)$/i)
