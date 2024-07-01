# Nested functions
f = function(x) {
  g(x + 2)
}

g = function(x) {
  h(x - 2)
}

h = function(x) {
  val = log(x)
  if(val < 0) {
    return(val^2)
  }
  val
}

# Activate the debugger
# Uncomment to see it without the debugger active

# Top level function
# debugonce(f)

# Last function called
# debugonce(h)

# Run the function
f(-4)

