describe 'Basic', ->

  it 'one argument', ->
    args = 0;
    foo = new pevent
    foo.on 'bar', -> args = arguments
    foo.emit 'bar', 1
    expect(args).toEqual {0 : 1};

  it 'two argument', ->
    args = 0;
    foo = new pevent
    foo.on 'bar', -> args = arguments
    foo.emit 'bar', 1, 2
    expect(args).toEqual {0 : 1, 1: 2};

  it 'three argument', ->
    args = 0;
    foo = new pevent
    foo.on 'bar', -> args = arguments
    foo.emit 'bar', 1, 2, 3
    expect(args).toEqual {0 : 1, 1: 2, 2: 3};

  it 'four argument', ->
    args = 0;
    foo = new pevent
    foo.on 'bar', -> args = arguments
    foo.emit 'bar', 1, 2, 3, 4
    expect(args).toEqual {0 : 1, 1: 2, 2: 3, 3: 4};

  it 'a lot of arguments', ->
    args = 0;
    foo = new pevent
    foo.on 'bar', -> args = arguments
    foo.emit 'bar', 1, 2, 3, 4, 5, 6, 7
    expect(args).toEqual {0 : 1, 1: 2, 2: 3, 3: 4, 4: 5, 5: 6, 6: 7};