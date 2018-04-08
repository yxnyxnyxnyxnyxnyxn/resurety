library(tools)
#Get user input
cat("Please enter file url: ")
file_url <- readLines(con="stdin",1)


#Check if file start with "DA-OR-OFFERS-"
file_name = basename(file_url)


if (startsWith(file_name,"DA-OR-OFFERS-")){
	cat(file_url,"\n")	
}else {
	print("Please enter a file url start with DA-OR-OFFERS")
	quit()
}


#Read and Parse data 
data <- read.csv(file_url)

#Group by CPTHourEnd and get the mean of the Rrice
result = aggregate(Price ~ CPTHourEnd, data, mean)

#Save new result to same folder
names(result)<-c("CPTHourEnd","Average_Price")
result_file = paste("result",file_name)
write.csv(result,file= result_file)

