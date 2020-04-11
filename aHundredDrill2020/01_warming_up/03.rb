s = "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics."
arr = s.delete(",.").split
arr.each{ |v| p v.length }