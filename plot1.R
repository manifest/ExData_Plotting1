source("reduced_data.R")

plot1 <- function(width = 480, height = 480) {
	plot1_draw(reduced_data())
	dev.copy(png, file = "plot1.png", width = width, height = height)
	dev.off()
}

plot1_draw <- function(data) {
	hist(
		data$Global_active_power,
		main = "Global Active Power",
		xlab = "Global Active Power (kilowatts)",
		col = "red")
}
