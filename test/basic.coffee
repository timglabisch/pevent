describe 'Basic', ->

  it 'register and emit', ->
    i = 0;
    foo = new pevent
    foo.on 'bar', -> i++
    foo.emit 'bar'
    expect(i).toEqual 1;

  it 'register and emit multiple times', ->
    i = 0;
    foo = new pevent
    foo.on 'bar', -> i++
    foo.on 'bar', -> i += 2
    foo.emit 'bar'
    expect(i).toEqual 3;

  it 'different events', ->
    i = 0;
    foo = new pevent
    foo.on 'a', -> i++  # called
    foo.on 'b', -> i++  # called
    foo.on 'c', -> i++  # not called
    foo.emit 'a'
    foo.emit 'b'
    expect(i).toEqual 2;