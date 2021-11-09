library(ggplot2)
library(tidyverse)
library(gganimate)
library(readxl)
library(gifski)

Female <- read_xlsx("Female.xlsx")

names(Female)

Female$Year <- as.integer(Female$Year)

glimpse(Female)

p1 <- Female %>% ggplot(aes(x = Country, y = Smoking_prevalence,fill=Country)) +
  geom_col()+
  labs(title = "Year: {frame_time}", x = "Country", y = "% of smoking prevalence")+
  transition_time(Year)+
  ease_aes('linear')

animate(p1)

test <- ggplot(Female, aes(y= Smoking_prevalence, x = "")) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  facet_wrap(~Country)+
  labs(title = "Year: {frame_time}")+
  transition_time(Year)+
  ease_aes('linear')

animate(test)
anim_save(test, 'plot_gdpPercap_lifeExp.gif')




library(gapminder)
gapminder
p1 <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  facet_wrap(~continent) +
  # Animating the plot
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'Life expectancy') +
  transition_time(year) +
  ease_aes('linear')

animate(p1)
anim_save('plot_gdpPercap_lifeExp.gif')




data(gapminder)
p <- ggplot(
  gapminder,
  aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)
) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita", y = "Life expectancy")
p + transition_time(year)

