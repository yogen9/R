a=ts(c(45,57,10,38,19,38,57,89,90,92,18,67,29,40,70,14,38,1),frequency=7,start=c(2017))
print(a)
f=decompose(a)
plot(f)
