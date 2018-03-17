
n= as.integer(readline(prompt="Enter the Num")) 
i=2
j=0
a[j]=0
while(n>0){
	a=as.integer(n%%i)	
	n =as.integer(n/i)
	cat(a)
}
