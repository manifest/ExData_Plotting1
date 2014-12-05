source("reduced_data.R")
source("plot2.R")
source("plot3.R")

plot4 <- function(width = 480, height = 480) {
	plot4_draw(reduced_data())
	dev.copy(png, file = "plot4.png", width = width, height = height)
	dev.off()
}

plot4_draw <- function(data) {
	old_mfrow <- par()$mfrow
	old_mar <- par()$mar
	par(mfrow = c(2, 2), mar = c(5, 4, 4, 1))

	plot2_draw(data, ylab = "Global Active Power")
	plot42_draw(data)
	plot3_draw(data, plot43_legend_draw)
	plot44_draw(data)

	par(mfrow = old_mfrow, mar = old_mar)
}

plot42_draw <- function(data) {
	plot(
		data$DateTime,
		data$Voltage,
		xlab = "datetime",
		ylab = "Voltage",
		type = "l")
}

plot43_legend_draw <- function() {
	legend(
		"topright", 
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		col = c("black", "red", "blue"),
		bty = "n",
		lty = 1,
		cex = 0.75)	
}

plot44_draw <- function(data) {
	plot(
		data$DateTime,
		data$Global_reactive_power,
		xlab = "datetime",
		ylab = "Global_reactive_power",
		type = "l")
}
