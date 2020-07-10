#Q1

#X=Rv number of accidents that occur at certain interesection

# X~P(x,4)

dpois(x=4, lambda=4) 

ppois(q=2, lambda=4)

1-ppois(q=1, lambda=4)

#Q2
 
#X = RV that delelgates travel by bus, air or automobile

#X~M(x;n=9,p=[.4,.2,.3,.1])

dmultinom(x=c(3,3,1,2),size=9,prob=c(.4,.2,.3,.1))

dmultinom(x=c(2,2,1,1),,prob=c(0.4, 0.2, 0.3, 0.1))

#Q3

#X = Rv about life of a mice

#X ~N(x;40,6.3)


1-(pnorm(32,mean=40,sd=6.3))


(pnorm(28,mean=40,sd=6.3))

(pnorm(49,mean=40,sd=6.3)-pnorm(37,mean=40,sd=6.3))

#Q4

#X= Rv that a compressor is faulty

#X~H(x;N=15,n=5,k=2)

dhyper(x=1,m=2,n=13,k=5)

dhyper(x=2,m=2,n=13,k=5)

#Q5

#X = RV of lifecycle of fluroscent light

#X~b(x;20,0.9)

dbinom(18,20,0.9)


1-(pbinom(q=14,size=20,0.9))

(pbinom(18,size=20,0.9))

#Q6

#X = RV of time between two variables

#X~Exp(x;B=8)

pexp(q=5, rate=1/8)

pexp(q=6, rate=1/8) - pexp(q=4, rate=1/8)

#Q7

#X= RV of amount of coffee dispensed

#X~U(x;A=7,B=10)

punif(q=8.8, min=7, max=10)

punif(q=9.5, min=7, max=10) - punif(q=7.4, min=7, max=10)

1-punif(q=8.5, min=7, max=10)


#Q8

#X = RV that a student will pass a pilot test

#X~G(x;p=0.7)

dgeom(2,0.7)
dgeom(0,0.7)

#Q9

#X= RV for power usage of a company

#X~logn(x;4,2)

1-plnorm(270,4,2)












