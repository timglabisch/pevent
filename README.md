````
                                      m
 mmmm    mmm   m   m   mmm   m mm   mm#mm
 #" "#  #"  #  "m m"  #"  #  #"  #    #
 #   #  #""""   #m#   #""""  #   #    #
 ##m#"  "#mm"    #    "#mm"  #   #    "mm
 #
 "
````

- - - - -- - - - - - - - - - - - - - - - - - -

pevent is a minimalistic *eventEmitter* library for javascript written in coffeescript.

pevent supports *priorities*.

# install
just grab the pevent.js.

# use
## create an instance

the easiest solution is just to create a new instance of pevent
````javascript
someInstance = new pevent();
````

you also can extend from pevent (example in coffeescript):
````coffeescript
class a extends pevent
````

you can also use pevent as a mixin / trait
````javascript
pevent.addPeventMixinTo(someInstance)
````

## register and emit events
````javascript
foo = new pevent;
foo.on('bar', function() {
  return i++;
});
foo.emit('bar');

````

## unregister events
````javascript
foo = new pevent;
foo.on('bar', function() {
  return i++;
});
foo.off('bar');

````

## priorities

````javascript
foo.on('[KEY]', someCallback, priority);

// or

foo.on({
    name: '[KEY]',
    priority: priority,
    callback: someCallback
});
````

## emitFirst
runs until the first event returns something positive (not false, null, undefined) and returns the value.

````javascript
foo = new pevent;
foo.on('bar', function() {
  return false;
});
foo.on('bar', function() {
  return null;
});
foo.on('bar', function() {

});
foo.on('bar', function() {
  return 2;
});
foo.on('bar', function() {
  return false;
});


expect(foo.emitFirst('bar')).toEqual(2);

````