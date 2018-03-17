n= as.character(readline(prompt= "Enter the number : "))
sum=0
for(i in n)
{	
	j=as.integer(i)
	print(j)
    	sum=sum+(j*j*j)
	print(sum)
}
m=as.integer(n)

if(sum==m){
	print("This is armstrong")
}else{
	print("Not")
}
