regx =  /([.\/][^.\/\[\<\s]+|\[[-+]?\d+\]|\[(?:"[^"]+"|'[^']+')\])/

module.exports =

  get: (data, path) ->
    list = walk path
    for item in list when data?
      if data.hasOwnProperty item
        data = data[item]
      else if !isNaN(item) and Array.isArray(data) and +item < 0
        data = data[data.length + item]
      else return
    data

  walk: (path) ->
    list = ('.' + path).split regx; list.shift()
    for part in list by 2
      switch chr = part[0]
        when '.', '/' then part.slice 1
        when '['
          if part[1] is '"' or part[1] is "'" then part.slice 2, -2
          else +(part.slice 1, -1)
        else continue
