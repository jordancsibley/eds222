# Use palmer penguins to fit a model that has an interaction between a continous and catergorical variable 
library(palmerpenguins)
library(tidyverse)

# continous = body_mass_g 
# catergorical = sex (male or female)

penguins <- palmerpenguins::penguins

# lm with interaction between body_mass_g and sex 
summary(lm(bill_length_mm ~ body_mass_g + sex + body_mass_g : sex, penguins))

# body mass = B0 + B1(body_mass) + B2(sexmale) + B3(body_mass x sexmale)

# If female: bill_length = B0 + B1(body_mass)
# If male: bill_length = B0 + (B1 + B3)body_mass 

body_flipper_sex <- lm(body_mass_g~flipper_length_mm + sex + flipper_length_mm : sex, penguins)

ggplot(penguins, aes(flipper_length_mm, body_mass_g, color = sex))+
  geom_point() +
  geom_abline(intercept =  -5443.9607, slope = 47.1527, color = 'red')+
  geom_abline(intercept =  -5443.9607 + 406.8015,
              slope = 47.1527 + -0.2942,
              color = 'blue')

# lines are almost paralel because our B3 is -0.2942. Makes the diff between male and female not that much 
  
