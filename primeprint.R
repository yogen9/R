cat("Enter the Number : ")
n=scan(,)
print(n)

for(i in 3:n){	
	isPrime=TRUE
	for(j in 2:(i-1)){
		if(i%%j==0){
			isPrime=FALSE;
		}		
	}
	if(isPrime){
		cat(i," ")
	}
}