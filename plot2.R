source("reduced_data.R")

plot2 <- function(width = 480, height = 480) {
	plot2_draw(reduced_data())
	dev.copy(png, file = "plot2.png", width = width, height = height)
	dev.off()
}

plot2_draw <- function(data, xlab = "", ylab = "Global Active Power (kilowatts)") {
	plot(
		data$DateTime,
		data$Global_active_power,
		col = "black",
		xlab = xlab,
		ylab = ylab,
		type = "l")
}
