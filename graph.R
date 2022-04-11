#1.아메리칸 캐주얼 
american_data <- read.csv("american_causal_data.csv",fileEncoding = 'utf-8')

american_data <- sort(table(american_data$brand_name))
american_data <- data.frame(tail(american_data,n = 25))
colnames(american_data) <- c('brand_name','count')

ggplot(data = american_data,aes(x = brand_name, y = count, fill = brand_name)) + labs(x="브랜드명", y="브랜드 빈도수", title="아메리칸 캐쥬얼 룩") + geom_bar(stat='identity') + coord_flip() + theme(legend.position = "none") + geom_label(aes(label=count))

                                                                                                                         
#2.캐쥬얼 
casual_data <- read.csv("causal_data.csv",fileEncoding = 'utf-8')

casual_data <- sort(table(casual_data$brand_name))
casual_data <- data.frame(tail(casual_data,n = 25))
colnames(casual_data) <- c('brand_name','count')

ggplot(data = casual_data,aes(x = brand_name, y = count, fill = brand_name)) + labs(x="브랜드명", y="브랜드 빈도수", title="캐쥬얼 룩") + geom_bar(stat='identity') + coord_flip() + theme(legend.position = "none") +  geom_label(aes(label=count))


#3. 댄디
dandy_data <- read.csv("dandy_data.csv",fileEncoding = 'utf-8')
View(dandy_data)
dandy_data <- sort(table(dandy_data$brand_name))
dandy_data <- data.frame(tail(dandy_data,n = 25))
colnames(dandy_data) <- c('brand_name','count')

ggplot(data = dandy_data,aes(x = brand_name, y = count, fill = brand_name)) + labs(x="브랜드명", y="브랜드 빈도수", title="댄디룩") + geom_bar(stat='identity') + coord_flip() + theme(legend.position = "none") + geom_label(aes(label=count))


#4.
library(wordcloud2)
american_tag_data <- read.csv("american_casual_tag_data.csv",fileEncoding = 'utf-8')
df <- data.frame(table(american_tag_data$brand_tag))

wordcloud2(df, fontFamily = "맑은고딕", size=1,col="random-light",backgroundColor = "white")

#5
dandy_tag_data <- read.csv("dandy_tag_data.csv",fileEncoding = 'utf-8')
df <- data.frame(table(dandy_tag_data$brand_tag))

wordcloud2(df, fontFamily = "맑은고딕", size=1,col="random-light",backgroundColor = "white")

#6
casual_tag_data <- read.csv("casual_tag_data.csv",fileEncoding = 'utf-8')
df <- data.frame(table(casual_tag_data$brand_tag))

wordcloud2(df, fontFamily = "맑은고딕", size=1,col="random-light",backgroundColor = "white")

#7
formal_tag_data <- read.csv("formal_tag_data.csv",fileEncoding = 'utf-8')
df <- data.frame(table(formal_tag_data$brand_tag))

wordcloud2(df, fontFamily = "맑은고딕", size=1,col="random-light",backgroundColor = "white")

#8
golf_tag_data <- read.csv("golf_tag_data.csv",fileEncoding = 'utf-8')
df <- data.frame(table(golf_tag_data$brand_tag))

wordcloud2(df, fontFamily = "맑은고딕", size=1,col="random-light",backgroundColor = "white")

#9
sport_tag_data <- read.csv("sport_tag_data.csv",fileEncoding = 'utf-8')
df <- data.frame(table(sport_tag_data$brand_tag))

wordcloud2(df, fontFamily = "맑은고딕", size=1,col="random-light",backgroundColor = "white")

#10
street_tag_data <- read.csv("street_tag_data.csv",fileEncoding = 'utf-8')
df <- data.frame(table(street_tag_data$brand_tag))

wordcloud2(df, fontFamily = "맑은고딕", size=1,col="random-light",backgroundColor = "white")

#11
cafe_data <- read.table("cafe_brand_data.csv",fileEncoding='utf-8')

cafe_data <- read.table("cafe_brand_data.csv", sep=",", nrows=5970,fileEncoding = "utf-8")




