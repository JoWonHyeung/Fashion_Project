library(RSelenium)
library(rvest)

url <- 'https://www.musinsa.com/app/contents/brandshop#14'
text <- read_html(url)

brand <- c()

nodes <- html_nodes(text,"div.brand_name_container > div.brand_contents > ul.brand_contents_eng > li.brand_li > dl > dd > a")

brand <- c(brand,html_text(nodes))

res <- data.frame(brand)

t1 <- res[-(12422:12460),] #숫자 없는 브랜드

t2 <- c('0.387에이유', '108서울', '119레오','14스튜디오','145오피스','1754클래식',
        '1993스튜디오','201브리드','202파운드','210에디트','2113스튜디오','23.65',
        '235연구소','23구 골프','247서울' ,'247마스크','261이유아이','2몽키','3130스튜디오',
        '320쇼룸','33뮤즈먼트','33아파트먼트','38컴온커먼','40온즈 엔와이씨','47베이지','47브랜드',
        '4몬스터','5.11택티컬','51퍼센트','5252바이오아이오아이','69슬램','726기어','7321디자인',
        '803스튜디오','82서울','86로드','88리미티드','9.81파크','925데이') #숫자 있는 브랜드

t1 <- gsub('[()0-9]','', t1)


d1 <- data.frame(t1)
d2 <- data.frame(t2)

colnames(d1) <- 'brand'
colnames(d2) <- 'brand'

res <- rbind(d1,d2)

View(res)

write.csv(res, "output/brand.csv")
