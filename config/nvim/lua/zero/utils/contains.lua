return function(haystack, needle)
  for _, v in pairs(haystack) do
    if v == needle then
      return true
    end

    return false
  end
end
