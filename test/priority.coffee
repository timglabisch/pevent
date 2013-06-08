describe 'Priority', ->

  it 'basic', ->
    out = ''
    foo = new pevent

    for el in ["1", "2", "3", "4"]
      ((x) ->
        foo.on
          name: 'bar',
          callback: ->
            out += x

      )(el)
    foo.emit 'bar'
    expect(out).toEqual "1234";

  it 'reverse', ->
    out = ''
    foo = new pevent

    for el in ["4", "3", "2", "1"]
      ((x) ->
        foo.on
          name: 'bar',
          callback: ->
            out += x

      )(el)
    foo.emit 'bar'
    expect(out).toEqual "1234";