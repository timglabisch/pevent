describe 'addPeventMixingTo', ->

  it 'basic', ->
    f = new (->)
    pevent.addPeventMixinTo(f);
    ok = false
    f.on 'foo', -> ok = true
    f.emit 'foo'
    expect(ok).toEqual true

