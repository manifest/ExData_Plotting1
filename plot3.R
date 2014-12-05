source("reduced_data.R")

plot3 <- function(width = 480, height = 480) {
	plot3_draw(reduced_data())
	dev.copy(png, file = "plot3.png", width = width, height = height)
	dev.off()
}

plot3_draw <- function(data, legend = plot3_legend_draw) {
	plot(
		data$DateTime,
		data$Sub_metering_1,
		xlab = "",
		ylab = "Energy sub metering",
		type = "n")
	
	points(data$DateTime, data$Sub_metering_1, type = "l", col = "black")
	points(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
	points(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
	
	legend()
}

plot3_legend_draw <- function() {
	legend(
		"topright", 
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		col = c("black", "red", "blue"),
		lty = 1,
		cex = 0.75)	
}
