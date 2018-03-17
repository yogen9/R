fun = function()
{
	n = as.integer(readline(prompt="Enter the Number : "))
	sum=0;
	for(i in  1:n)
		sum = sum + i 
	print(sum)
}

fun()