library(wordcloud2)

#cafe1

#카페 글 정리
df1 <- read.table('cafe_data_text1.txt',header=T,encoding='UTF-8')
df2 <- read.table('cafe_data_text2.txt',header=T,encoding='UTF-8')

colnames(df1) <- c('brand')
colnames(df2) <- c('brand')

data <- rbind(df1,df2)

data <- gsub("무탠다드|무탠",'무신사스탠다드',data$brand)
data <- gsub("조던",'나이키',data)
data <- gsub("COS|cos|Cos",'코스',data)
data <- gsub("newbalance",'뉴발란스',data)
data <- gsub("mmgl",'엠엠지엘',data)
data <- gsub("etce",'이티시이',data)
data <- gsub("[ㄱ-ㅎ]","",data)
data <- gsub("[ㅏ-ㅣ|a-zA-z]","",data)
data <- gsub("[0-9|,]","",data)
data <- gsub(" ",NA,data)

data <- data.frame(brand_name=data)
data <- data[!(data == ""),] #공백행 제거

View(data)

res_data <- Filter(function(x) {nchar(x) < 10}, data)

wordcloud2(table(res_data),words,size=0.7,rotateRatio = 0)

#브랜드 이름 등록
library(KoNLP)
brand_name <- read.csv("brand_name_final.csv",fileEncoding='UTF-8')

useSejongDic()
buildDictionary(user_dic=data.frame("반스", "ncn"),replace_usr_dic = T)


#cafe2
library("stringr")

#카페 글 정리
df <- read.table('cafe_data_text3.txt',header=T,sep="\n",encoding = 'UTF-8')

colnames(df) <- c("brand")

df_rs1 <- data.frame(brand=df[str_detect(df$brand,c("상의","하의","신발")),])
df_rs2 <- data.frame(brand=df[str_detect(df$brand,c("악세")),])

df_rs <- rbind(df_rs1,df_rs2)

View(df_rs)

df_rs <- gsub("무탠다드|무탠",'무신사스탠다드',df_rs$brand)
df_rs <- gsub("조던",'나이키',df_rs)
df_rs <- gsub("COS|cos|Cos",'코스',df_rs)
df_rs <- gsub("newbalance",'뉴발란스',df_rs)
df_rs <- gsub("mmgl",'엠엠지엘',df_rs)
df_rs <- gsub("etce",'이티시이',df_rs)
df_rs <- gsub("[ㄱ-ㅎ]","",df_rs)
df_rs <- gsub("[[:punct:]]",'',df_rs)
df_rs <- gsub("[ㅏ-ㅣ|a-zA-z]","",df_rs)
df_rs <- gsub("[0-9|,]","",df_rs)
df_rs <- gsub("상의|하의|신발|악세","",df_rs)

df_rs <- data.frame(brand=unlist(strsplit(df_rs," ")))
View(df_rs)
#df_rs <- gsub(" ",NA,df_rs)

df_rs <- df_rs[!(df_rs == ""),] #공백행 제거

wordcloud2(table(df_rs),words,size=0.7,rotateRatio = 0)


#브랜드 이름 등록
library(KoNLP)
brand_name <- read.csv("brand_name_final.csv",fileEncoding='UTF-8',)

useSejongDic()
buildDictionary(user_dic=data.frame("반스", "ncn"),replace_usr_dic = T)


