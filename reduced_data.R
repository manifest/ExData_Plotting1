reduced_data <- function() {
	filename <- "household_power_consumption"
	input_file <- sprintf("%s.%s", filename, "txt")
	input_arch_file <- sprintf("%s.%s", filename, "zip")
	input_arch_url <- sprintf("http://d396qusza40orc.cloudfront.net/exdata/data/%s", input_arch_file)
	reduced_file <- sprintf("%s_reduced.%s", filename, "csv")

	if(!file.exists(input_file)) {
		download.file(input_arch_url, input_arch_file)
		unzip(input_arch_file)
	}
	
	if(!file.exists(reduced_file)) {
		 write_reduced_data(input_file, reduced_file)
	}

	read_reduced_data(reduced_file)
}

read_reduced_data <- function(file) {
	read.csv(file, colClasses = c(DateTime = "POSIXct"))
}

write_reduced_data <- function(input_file, output_file, from_time = "2007-02-01", to_time = "2007-02-03") {
	input <- read.table(
		input_file,
		header = T,
		sep = ";",
		na.strings = c("?"),
		stringsAsFactors = F, 
		comment.char = "")

	dt <- strptime(paste(input$Date, input$Time), "%d/%m/%Y %H:%M:%S", tz = "UTC")
	dt_rb <- dt >= as.POSIXct(from_time, tz = "UTC") & dt < as.POSIXct(to_time, tz = "UTC")
	output <- cbind(DateTime = dt[dt_rb], input[dt_rb, -c(1,2)])

	write.csv(output, output_file, row.names = F)
}
