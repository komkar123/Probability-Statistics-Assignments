install.packages("prob")

library(prob)

s1 <- rolldie(times=3,nsides=6,makespace="TRUE")
s1

su1 <- subset(s1,(X1==X2) & (X1==X3) & (X2==X3))
su1

Prob(su1)#1 a answer 

su3 <- subset(s1, (X1+X2+X3) >6) 
Prob(su3)#1,b question

su4 <- subset(s1, (X1==2)&(X2==2))
Prob(su4) #1,c question


#2nd question


t1 <- tosscoin(times=3,makespace="TRUE")

a1 <- subset(t1, toss1=="H")

Prob(a1) #2 a answer

a2 <- subset(t1, toss3=="T")

Prob(a2) #2 b answer

a3 <- subset(t1, toss1=="H" & toss2=="H" & toss3=="H")

Prob(a3) #2 c answer

a4 <- subset(t1, toss1=="T" | toss2=="T" | toss3=="T")

Prob(a4)   #2 d answer



#3rd question


b <- c("red", "blue", "green")

b1 <- urnsamples(b, size=2,  replace= TRUE, ordered=TRUE)

b2 <- subset(b1, X1==X2) #3 a answer

b3 <- subset(b1, X1=="red" | X2=="red") #3 b answer



#4th question

c <- cards(makespace=TRUE)

c1 <- subset(c, suit=="Diamond")

Prob(c1) #4 a answer

c2 <- subset(c, suit=="Heart" & rank=="K")

Prob(c2) #4 b answer

c3 <- subset(c, rank=="K" | rank=="A" | rank=="J" | rank=="Q")

Prob(c3) #4 c answer

c4 <- subset(c, rank=="A")

c5 <- subset(c, suit=="Club")

c6 <- Prob(c4, given=c5) #4 D answer






















