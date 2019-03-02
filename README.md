# getandset

## Summary

`getandset` provides a simple way to safely and conveniently `get` and `set` nested data.

> NOTE: `get` has been added, but still working on `set`

### Install from `github`

```shell
yarn add shreeve/getandset
```

### Example data

```js
let data = {
  a: 1,
  b: [2, 3, 4],
  c: "Okay",
  d: {
    e: new Date(),
    f: function(val) {
      return `You said: ${val}`;
    },
    g: ["take a walk", "go to movie", "eat a sandwich"]
  },
  h: {
    "WW1": 1914,
    "WW2": 1939,
    "WW3": "??"
  },
  i: {
    j: {
      k: {
        l: "Hello"
      }
    }
  }
};
```

### Example 'get'

```js
get(data, 'a') // 1
get(data, 'b') // [ 2, 3, 4 ]
get(data, 'b[-3]') // 2
get(data, 'c')[3] // 'y'
get(data, 'd') // gives back an obj with { e, f, and g keys }
get(data, 'd.e') // 2019-02-05T19:33:46.462Z
get(data, 'd.f') // [Function: f]
get(data, 'd.f')('cool') // 'You said: cool'
get(data, 'd.g') // [ 'take a walk', 'go to movie', 'eat a sandwich' ]
get(data, 'd.g[]') // [ 'take a walk', 'go to movie', 'eat a sandwich' ]
get(data, 'd.g[-3]') // take a walk
get(data, 'h') // { WW1: 1914, WW2: 1939, WW3: '??' }
get(data, 'h["WW1"]') // 1914
get(data, "h['WW1']") // 1914
get(data, 'i.j.k') // { l: 'Hello' }
get(data, 'i.j.k.l') // Hello
get(data, 'i/j/k') // { l: 'Hello' }
get(data, 'i/j/k/l') // Hello
get(data, 'i/j/z') // undefined
get(data, 'i/z/k/l') // undefined
```

### CoffeeScript

Of course, all this becomes much nicer in CoffeeScript.

```coffee
data =
  a: 1
  b: [2, 3, 4]
  c: "Okay"
  d:
    e: new Date()
    f: (val) -> "You said: #{val}"
    g: [
        "take a walk"
        "go to movie"
        "eat a sandwich"
  ]
  h:
    "WW1": 1914
    "WW2": 1939
    "WW3": "??"
  i: j: k: l: "Hello"
```
