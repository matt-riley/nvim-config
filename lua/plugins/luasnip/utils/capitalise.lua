local caps = function(str)
  return string.gsub(str, "(%a)([%w_']*)", function(first, rest)
    return first:upper() .. rest:lower()
  end)
end

return caps
