f1=0
f2=1	
f3
n
fibbo <- function(n)
{ 
	while(2<=n)
	{	
		f3=f1+f2
		f1=f2
		f2=f3
		n<-n-1
		print(f3)	
	}
}

print(f1)
print(f2)
fibbo(10)