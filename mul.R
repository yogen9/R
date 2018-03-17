ten=list(1,2,3,4,5,6,7,8,9,10)

table = function(f,l)
{
	range=c(f:l)
	for(i in ten)
	{	
		for(j in range)
			cat(j,"*",i,"=",(j*i),"  ")
		cat("\n")
	}
}

table(1,7)