regx =  /([.\/][^.\/\[\<\s]+|\[[-+]?\d+\]|\[(?:"[^"]+"|'[^']+')\])/

module.exports =

  get: (data, path, valu) ->
    list = walk path
    for item in list when data?
      if data.hasOwnProperty item
        data = data[item]
      else if !isNaN(item) and Array.isArray(data) and +item < 0
        data = data[data.length + item]
      else return valu
    data

  set: (data, path, valu) ->
    list = walk path
    last = list.length - 1
    for item, n in list
      done = n is last
      next = if done then valu else { }
      if data.hasOwnProperty item
        data[item] = next if done or typeof data[item] isnt 'object'
      else if !isNaN(item) and Array.isArray(data) and +item < 0
        item = data.length + item
        data[item] = next if done or typeof data[item] isnt 'object'
      else
        data[item] = next
      data = data[item]
    data

walk = (path) ->
  list = ('.' + path).split regx; list.shift()
  for part in list by 2
    switch chr = part[0]
      when '.', '/' then part.slice 1
      when '['
        if part[1] is '"' or part[1] is "'" then part.slice 2, -2
        else +(part.slice 1, -1)
      else continue
