class pevent

  events: {}
  eventsPrepared: true

  _getEventNode:(key, priority) ->
    @events[key] = { sortCache: [], callbacks: {} } if !@events.hasOwnProperty key
    @events[key]['callbacks'][priority] = [] if !@events[key]['callbacks'].hasOwnProperty priority
    @events[key]['callbacks'][priority]

  _onKeyIsScalar:(key, callback, priority = 0) ->
    @_getEventNode(key, priority).push {name: key, priority: priority, callback: callback}

  _onKeyisObject: (obj) ->
    obj.priority = 0 if !obj.hasOwnProperty('priority')
    throw new {'msg': 'Event must have a "event" name'} if !obj.hasOwnProperty('name')
    throw new {'msg': 'Event must have a "callback"'} if !obj.hasOwnProperty('callback')
    @_getEventNode(obj.name, obj.priority).push obj

  on: ->
    @eventsPrepared = false

    if typeof arguments[0] != "object"
      @_onKeyIsScalar arguments[0], arguments[1], arguments[2]
    else
      @_onKeyisObject(arguments[0])
    @

  _prepareEvents: ->
    for eventName of @events
      @events[eventName]['sortCache'] = Object.keys(@events[eventName]['callbacks']).sort()
    @eventsPrepared = true;

  off: (key) ->
    if typeof cb == "undefined"
      delete @events[key]
      return @

  emit: (key) ->
    @_prepareEvents() if !@eventsPrepared
    return if typeof @events[key] == "undefined"
    for priority in @events[key]['sortCache']
      for event in @events[key]['callbacks'][priority]
        switch arguments.length
          when 1 then event['callback'].call @, arguments[1]
          when 2 then event['callback'].call @, arguments[1], arguments[2]
          when 3 then event['callback'].call @, arguments[1], arguments[2], arguments[3]
          when 4 then event['callback'].call @, arguments[1], arguments[2], arguments[3], arguments[4]
          else
            l = arguments.length
            i = 1;
            args = new Array l - 1
            while i < l
              args[i - 1] = arguments[i]
              i++
            event['callback'].apply @, args




