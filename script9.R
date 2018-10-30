#Plot Scores as they happedn

scores = read.table("UWvMSU_1-22-13.txt", stringsAsFactors = FALSE)
for (i in 1:length(scores)) {
  
}






#read through the table
#add all numbers with UW in column progressively, same with MSU


readline()
setwd("Biocomp-Fall2018-181026-Exercise8")
setwd('..')



readinteger = function(){
  n = readline(prompt = "guess my number")
  if(!grep("^[0-9]+$", n)){
    return(readinteger())
  }
  return(as.integer(n))
}
num = round(runif(1)*100, digits=0)
guess = -1
print("Guess my number between 0 and 100.\n")
while (guess !=num) {
  guess = readinteger()
  if (guess == num){
    print("Correct!")
  }
  else if (guess < num){
    print("higher")
  }
  else if (guess > num){
    print("lower")
  }
}
