regx =  /([.\/][^.\/\[\<\s]+|\[[-+]?\d+\]|\[(?:"[^"]+"|'[^']+')\])/

module.exports =

  get: (data, path, valu) ->
    list = walk path
    for prop in list
      return valu unless data? and typeof data is 'object'
      prop = data.length + prop if num(prop) and Array.isArray(data) and +prop < 0
      data = data[prop]
    if data? then data else valu

  set: (data, path, valu) ->
    list = walk path
    last = list.length - 1
    for prop, slot in list
      if slot is last
        next = valu
      else
        prop = data.length + prop if num(prop) and Array.isArray(data) and +prop < 0
        next = data[prop]; next ?= undefined
        next = (if num(list[slot+1]) then [] else {}) if typeof next isnt 'object'
      data = data[prop] = next
    data

num = (val) -> /^-?(\d+)$/.test val

walk = (path) ->
  list = ('.' + path).split regx; list.shift()
  for part in list by 2
    switch chr = part[0]
      when '.', '/' then part.slice 1
      when '['
        if part[1] is '"' or part[1] is "'" then part.slice 2, -2
        else +(part.slice 1, -1)
      else continue
