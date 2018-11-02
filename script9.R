#Plot Scores as they happedn

install.packages("tidyverse")
library(tidyverse)
library(dplyr)
#upload data
scores = read.table("UWvMSU_1-22-13.txt", header = TRUE , stringsAsFactors = FALSE)
#make empty dataframes
MSU_final= data.frame(score = as.integer(), time = as.numeric())
WISC_final= data.frame(score = as.integer(), time = as.numeric())
#extract scores for each team
MSU_update= scores[scores$team == "MSU",]
WISC_update = scores[scores$team == "UW",]

#convert to cumulative sum 
MSU_update <- MSU_update %>%
  mutate(cumsum = cumsum(score))
#for loop to get sums over every time 
for (i in 1:length(MSU_update$score)){
  MSU_final[i,1] = MSU_update[i,4]
  MSU_final[i,2] = MSU_update[i,1]
}



WISC_update = WISC_update %>%
  mutate(cumsum = cumsum(score))

for (i in 1:length(WISC_update$score)){
  WISC_final[i,1] = WISC_update[i,4]
  WISC_final[i,2] = WISC_update[i,1]
}

WISC_final$team <- "WISC"
MSU_final$team <- "MSU"

final_cumulative <- rbind(WISC_final, MSU_final)

final_cumulative %>%
  ggplot(mapping = aes(x = time, y = score, color = team)) +
  geom_line()













#number game
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
