# Prompt
#
# Write an R function called blast off that counts down from 10 to 1 and prints "Blast off!"

blast_off <- function() {
  for (i in 10:1) {
    print(i)
    Sys.sleep(1) # Delay of 1 second between each count
  }
  print("Blast off!")
}

# Run the function
blast_off()
