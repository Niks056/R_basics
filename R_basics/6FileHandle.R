#reading tab separated file

df <- read.table('C:\\R prog\\rproj\\FD.txt',sep="\t",header=TRUE)
df

#reading
con <- file('C:\\R prog\\rproj\\file1.txt')
r <- readLines(con)
r[1]
r[2]
close(con)


#writting
con1 <- file('file2.txt')
txt <- c('This is line1','This is line2')
w <- write(txt,con1)
file.show('file2.txt')
close(con1)

#appending
cat(c('This is line1','This is line2'), file='C:\\R_proj\\file2.txt', sep ='\n', 
    append= T)
file.show('C:\\R_proj\\file2.txt') #concate


#con1 <- file('file2.txt ,'a')
#txt <- c('This is line1','This is line2')
#W<- write(txt,con1)
#file.show('file2.txt')
#close(con1)