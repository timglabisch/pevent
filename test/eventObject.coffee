describe 'Event Objec', ->

  it 'basic', ->
    i = 0
    foo = new pevent
    foo.on
      name: 'bar',
      callback: -> i++
    foo.emit 'bar'
    expect(i).toEqual 1;