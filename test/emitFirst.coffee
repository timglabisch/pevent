describe 'emitFirst', ->

  it 'register and emitFirst', ->
    foo = new pevent
    foo.on 'bar', -> return false
    foo.on 'bar', -> return null
    foo.on 'bar', -> return undefined
    foo.on 'bar', -> return 2
    foo.on 'bar', -> return false
    foo.on 'bar', -> return null
    foo.on 'bar', -> return undefined
    expect(foo.emitFirst 'bar').toEqual 2;
