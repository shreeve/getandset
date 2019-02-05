# getandset

## Summary

The `getandset` module provides a simple way to safely and conveniently `get` and `set` nested data.

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
  }
};
```

### Example 'get'

```js
get('a') // 1
get('b') // [ 2, 3, 4 ]
get('b[-3]') // 2
get('c')[3] // 'y'
get('d') // gives back an obj with { e, f, and g keys }
get('d.e') // 2019-02-05T19:33:46.462Z
get('d.f') // [Function: f]
get('d.f')('cool') // 'You said: cool'
get('d.g') // [ 'take a walk', 'go to movie', 'eat a sandwich' ]
get('d.g[]') // [ 'take a walk', 'go to movie', 'eat a sandwich' ]
get('d.g[-3]') // take a walk
get('h') // { WW1: 1914, WW2: 1939, WW3: '??' }
get('h["WW1"]') // 1914
get("h['WW1']") // 1914
```
