a=as.integer(readline(prompt="Enter No:"))
for(i in 2:500){
if(a%%i==0){
print("This is not prime number")
break } else{
print("This is prime number")
break }
}
