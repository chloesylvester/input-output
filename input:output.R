#install plyr
install.packages("plyr")
library(plyr)

#import dataset
file_path <- file.choose("assignment_6_dataset.txt") 
x <- read.table(file_path, header = TRUE, sep=",")

#import data manually
students <- data.frame(
  Name = c("Raul", "Booker", "Lauri", "Leonie", "Sherlyn", "Mikaela", "Raphael", "Aiko", "Tiffaney", "Corina", "Petronila", "Alecia", "Shemika", "Fallon", "Deloris", "Randee", "Eboni", "Delfina", "Ernestina", "Milo"),
  Age = c(25, 18, 21, 21, 22, 20, 23, 24, 21, 23, 23, 20, 23, 22, 21, 23, 20, 19, 19, 19),
  Sex = c("Male", "Male", "Female", "Female", "Female", "Female", "Male", "Female", "Female", "Female", "Female", "Female", "Female", "Female", "Female", "Female", "Female", "Female", "Female", "Male"),
  Grade = c(80, 83, 90, 91, 85, 69, 91, 97, 78, 81, 98, 87, 97, 90, 67, 91, 84, 93, 93, 67)
)

#read the dataset from a file
students_file <- read.table("assignment_6_dataset.txt", header = TRUE, sep = ",")

#calculate mean grade by sex
students_gendered_mean <- ddply(students, "Sex", summarise, Grade.Average = mean(Grade))

#write the result to a file
write.table(students_gendered_mean, "students_gendered_mean.txt", row.names = FALSE)

#filter names containing the letter 'i'
i_students <- subset(students, grepl("i", students$Name, ignore.case = TRUE))

# write the filtered data to a CSV file
write.csv(i_students, "filtered_students.csv", row.names = FALSE)