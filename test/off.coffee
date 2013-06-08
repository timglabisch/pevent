describe 'Off', ->

  it 'basic', ->
    i = 0
    foo = new pevent
    foo.on 'bar', -> i++
    foo.emit 'bar'
    expect(i).toEqual 1;
    foo.off 'bar'
    foo.emit 'bar'
    expect(i).toEqual 1;