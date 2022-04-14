library(KoNLP)
library(stringr)
library(dplyr)
#아메리칸 캐쥬얼
american_data <- read.csv("american_causal_data.csv",fileEncoding = 'utf-8')

american_data$brand_item <- tolower(american_data$brand_item)
american_item <- tolower(american_item)

ad_padding<-data.frame(padding=american_item[str_detect(american_data$brand_item,c("패딩","padding"))])
ad_jacket<-data.frame(jacket=american_item[str_detect(american_data$brand_item,c("자켓","jacket"))])
ad_jumper<-data.frame(jumper=american_item[str_detect(american_data$brand_item,c("점퍼"))])
ad_gardigan<-data.frame(gardigan=american_item[str_detect(american_data$brand_item,c("가디건"))])
ad_neat<-data.frame(neat=american_item[str_detect(american_data$brand_item,c("니트"))])

ad_coat1<-data.frame(coat=american_item[str_detect(american_data$brand_item,"코트")])
ad_coat2<-data.frame(coat=american_item[str_detect(american_data$brand_item,"coat")])
ad_coat<-rbind(ad_coat1,ad_coat2)

ad_shirt1<-data.frame(shirt=american_item[str_detect(american_data$brand_item,c("셔츠"))])
ad_shirt2<-data.frame(shirt=american_item[str_detect(american_data$brand_item,c("shirt"))])
ad_shirt<-rbind(ad_shirt1,ad_shirt2)

ad_tshirt<-data.frame(tshirt=american_item[str_detect(american_data$brand_item,c("티셔츠"))])

ad_sweatshirt1<-data.frame(sweatshirt=american_item[str_detect(american_data$brand_item,c("스웻셔츠"))])
ad_sweatshirt2<-data.frame(sweatshirt=american_item[str_detect(american_data$brand_item,c("sweatshirt"))])
ad_sweatshirt <- rbind(ad_sweatshirt1,ad_sweatshirt2)

ad_mentomen<-data.frame(mentomen=american_item[str_detect(american_data$brand_item,"맨투맨")])

ad_pants1<-data.frame(pants=american_item[str_detect(american_data$brand_item,c("바지"))])
ad_pants2<-data.frame(pants=american_item[str_detect(american_data$brand_item,c("팬츠"))])
ad_pants3<-data.frame(pants=american_item[str_detect(american_data$brand_item,c("pants"))])
ad_pants<-rbind(ad_pants1,ad_pants2,ad_pants3)

ad_shorts<-data.frame(shorts=american_item[str_detect(american_data$brand_item,c("shorts","반바지"))])
ad_jeans<-data.frame(jean=american_item[str_detect(american_data$brand_item,c("데님"))])


ad_cap1<-data.frame(cap=american_item[str_detect(american_data$brand_item,c("모자","볼캡"))])
ad_cap2<-data.frame(cap=american_item[str_detect(american_data$brand_item,c("cap"))])
ad_cap<-rbind(ad_cap1,ad_cap2)

ad_socks1<-data.frame(socks=american_item[str_detect(american_data$brand_item,c("양말"))])
ad_socks2<-data.frame(socks=american_item[str_detect(american_data$brand_item,c("socks"))])
ad_socks<-rbind(ad_socks1,ad_socks2)

ad_pack<-data.frame(pack=american_item[str_detect(american_data$brand_item,c("팩"))])
ad_shoes<-data.frame(shoes=american_item[str_detect(american_data$brand_item,c("스니커즈"))])
ad_necklace<-data.frame(necklace=american_item[str_detect(american_data$brand_item,c("목걸이"))])

ad_jacket$idx <- 1:nrow(ad_jacket)
ad_padding$idx <- 1:nrow(ad_padding)
ad_coat$idx <- 1:nrow(ad_coat)
ad_shirt$idx <- 1:nrow(ad_shirt)
ad_sweatshirt$idx <- 1:nrow(ad_sweatshirt)
ad_mentomen$idx <- 1:nrow(ad_mentomen)
ad_pants$idx <- 1:nrow(ad_pants)
ad_shorts$idx <- 1:nrow(ad_shorts)
ad_cap$idx <- 1:nrow(ad_cap)
ad_ballcap$idx <- 1:nrow(ad_ballcap)
ad_socks$idx <- 1:nrow(ad_socks)
ad_pack$idx <- 1:nrow(ad_pack)
ad_shoes$idx <- 1:nrow(ad_shoes)
ad_necklace$idx <- 1:nrow(ad_necklace)
ad_jeans$idx <- 1:nrow(ad_jeans)
ad_jumper$idx <- 1:nrow(ad_jumper)
ad_tshirt$idx <- 1:nrow(ad_tshirt)
ad_gardigan$idx <- 1:nrow(ad_gardigan)
ad_neat$idx <- 1:nrow(ad_neat)

ad_res <- full_join(ad_jacket,ad_pants,by='idx')
ad_res <- full_join(ad_res,ad_padding,by='idx')
ad_res <- full_join(ad_res,ad_coat,by='idx')
ad_res <- full_join(ad_res,ad_shirt,by='idx')
ad_res <- full_join(ad_res,ad_sweatshirt,by='idx')
ad_res <- full_join(ad_res,ad_mentomen,by='idx')
ad_res <- full_join(ad_res,ad_pack,by='idx')
ad_res <- full_join(ad_res,ad_shorts,by='idx')
ad_res <- full_join(ad_res,ad_cap,by='idx')
ad_res <- full_join(ad_res,ad_ballcap,by='idx')
ad_res <- full_join(ad_res,ad_socks,by='idx')                    
ad_res <- full_join(ad_res,ad_shoes,by='idx')
ad_res <- full_join(ad_res,ad_necklace,by='idx')
ad_res <- full_join(ad_res,ad_gardigan,by='idx')
ad_res <- full_join(ad_res,ad_jeans,by='idx')
ad_res <- full_join(ad_res,ad_neat,by='idx')
ad_res <- full_join(ad_res,ad_jumper,by='idx')
ad_res <- full_join(ad_res,ad_tshirt,by='idx')
ad_res <- subset(ad_res,select = -idx)

View(ad_res)

write.csv(ad_res,"amerian_item.csv")

#2.캐쥬얼
causal_data <- read.csv("causal_data.csv",fileEncoding = 'utf-8')

causal_data$brand_item <- tolower(causal_data$brand_item)
casual_item <- tolower(causal_data$brand_item)

cs_jacket1<-data.frame(jacket=casual_item[str_detect(causal_data$brand_item,c("자켓"))])
cs_jacket2<-data.frame(jacket=casual_item[str_detect(causal_data$brand_item,c("jacket"))])
cs_jacket<-rbind(cs_jacket1,cs_jacket2)

cs_jumper<-data.frame(jumper=casual_item[str_detect(causal_data$brand_item,c("점퍼"))])
cs_gardigan<-data.frame(gardigan=casual_item[str_detect(causal_data$brand_item,c("가디건"))])
cs_neat<-data.frame(neat=casual_item[str_detect(causal_data$brand_item,c("니트"))])


cs_padding1<-data.frame(padding=casual_item[str_detect(causal_data$brand_item,c("패딩"))])
cs_padding2<-data.frame(padding=casual_item[str_detect(causal_data$brand_item,c("padding"))])
cs_padding<-rbind(cs_padding1,cs_padding2)

cs_coat1<-data.frame(coat=casual_item[str_detect(causal_data$brand_item,"코트")])
cs_coat2<-data.frame(coat=casual_item[str_detect(causal_data$brand_item,"coat")])
cs_coat<-rbind(cs_coat1,cs_coat2)

cs_shirt1<-data.frame(shirt=casual_item[str_detect(causal_data$brand_item,c("셔츠"))])
cs_shirt2<-data.frame(shirt=casual_item[str_detect(causal_data$brand_item,c("shirt"))])
cs_shirt<-rbind(cs_shirt1,cs_shirt2)

cs_tshirt<-data.frame(tshirt=casual_item[str_detect(causal_data$brand_item,c("티셔츠"))])

cs_jeans<-data.frame(jean=casual_item[str_detect(causal_data$brand_item,c("데님"))])

cs_sweatshirt1<-data.frame(sweatshirt=casual_item[str_detect(causal_data$brand_item,c("스웻셔츠"))])
cs_sweatshirt2<-data.frame(sweatshirt=casual_item[str_detect(causal_data$brand_item,c("sweatshirt"))])
cs_sweatshirt <- rbind(cs_sweatshirt1,cs_sweatshirt2)

cs_mentomen<-data.frame(mentomen=casual_item[str_detect(causal_data$brand_item,"맨투맨")])

cs_pants1<-data.frame(pants=casual_item[str_detect(causal_data$brand_item,c("바지"))])
cs_pants2<-data.frame(pants=casual_item[str_detect(causal_data$brand_item,c("팬츠"))])
cs_pants3<-data.frame(pants=casual_item[str_detect(causal_data$brand_item,c("pants"))])
cs_pants<-rbind(cs_pants1,cs_pants2,cs_pants3)

cs_shorts<-data.frame(shorts=casual_item[str_detect(causal_data$brand_item,c("shorts"))])

cs_cap1<-data.frame(cap=casual_item[str_detect(causal_data$brand_item,c("모자"))])
cs_cap2<-data.frame(cap=casual_item[str_detect(causal_data$brand_item,c("cap"))])
cs_cap<-rbind(cs_cap1,cs_cap2)

cs_socks1<-data.frame(socks=casual_item[str_detect(causal_data$brand_item,c("양말"))])
cs_socks2<-data.frame(socks=casual_item[str_detect(causal_data$brand_item,c("socks"))])
cs_socks<-rbind(cs_socks1,cs_socks2)

cs_pack<-data.frame(pack=casual_item[str_detect(causal_data$brand_item,c("팩"))])
cs_shoes<-data.frame(shoes=casual_item[str_detect(causal_data$brand_item,c("스니커즈"))])
cs_necklace<-data.frame(necklace=casual_item[str_detect(causal_data$brand_item,c("목걸이"))])

cs_jacket$idx <- 1:nrow(cs_jacket)
cs_padding$idx <- 1:nrow(cs_padding)
cs_coat$idx <- 1:nrow(cs_coat)
cs_shirt$idx <- 1:nrow(cs_shirt)
cs_sweatshirt$idx <- 1:nrow(cs_sweatshirt)
cs_mentomen$idx <- 1:nrow(cs_mentomen)
cs_pants$idx <- 1:nrow(cs_pants)
cs_shorts$idx <- 1:nrow(cs_shorts)
cs_cap$idx <- 1:nrow(cs_cap)
cs_socks$idx <- 1:nrow(cs_socks)
cs_pack$idx <- 1:nrow(cs_pack)
cs_shoes$idx <- 1:nrow(cs_shoes)
cs_necklace$idx <- 1:nrow(cs_necklace)
cs_jeans$idx <- 1:nrow(cs_jeans)
cs_jumper$idx <- 1:nrow(cs_jumper)
cs_tshirt$idx <- 1:nrow(cs_tshirt)
cs_gardigan$idx <- 1:nrow(cs_gardigan)
cs_neat$idx <- 1:nrow(cs_neat)

cs_res <- full_join(cs_jacket,cs_pants,by='idx')
cs_res <- full_join(cs_res,cs_padding,by='idx')
cs_res <- full_join(cs_res,cs_coat,by='idx')
cs_res <- full_join(cs_res,cs_shirt,by='idx')
cs_res <- full_join(cs_res,cs_sweatshirt,by='idx')
cs_res <- full_join(cs_res,cs_mentomen,by='idx')
cs_res <- full_join(cs_res,cs_pack,by='idx')
cs_res <- full_join(cs_res,cs_shorts,by='idx')
cs_res <- full_join(cs_res,cs_cap,by='idx')
cs_res <- full_join(cs_res,cs_socks,by='idx')                    
cs_res <- full_join(cs_res,cs_shoes,by='idx')
cs_res <- full_join(cs_res,cs_necklace,by='idx')
cs_res <- full_join(cs_res,cs_gardigan,by='idx')
cs_res <- full_join(cs_res,cs_jeans,by='idx')
cs_res <- full_join(cs_res,cs_neat,by='idx')
cs_res <- full_join(cs_res,cs_jumper,by='idx')
cs_res <- full_join(cs_res,cs_tshirt,by='idx')
cs_res <- subset(cs_res,select = -idx)

View(cs_res)

write.csv(cs_res,"casual_item.csv")

#3. 댄디
dandy_data <- read.csv("dandy_data.csv",fileEncoding = 'utf-8')

dandy_data$brand_item <- tolower(dandy_data$brand_item)
dandy_item <- tolower(dandy_data$brand_item)

dd_jacket1<-data.frame(jacket=dandy_item[str_detect(dandy_data$brand_item,c("자켓"))])
dd_jacket2<-data.frame(jacket=dandy_item[str_detect(dandy_data$brand_item,c("jacket"))])
dd_jacket<-rbind(dd_jacket1,dd_jacket2)

dd_jumper<-data.frame(jumper=dandy_item[str_detect(dandy_data$brand_item,c("점퍼"))])
dd_gardigan<-data.frame(gardigan=dandy_item[str_detect(dandy_data$brand_item,c("가디건"))])
dd_neat<-data.frame(neat=dandy_item[str_detect(dandy_data$brand_item,c("니트"))])


dd_padding1<-data.frame(padding=dandy_item[str_detect(dandy_data$brand_item,c("패딩"))])
dd_padding2<-data.frame(padding=dandy_item[str_detect(dandy_data$brand_item,c("padding"))])
dd_padding<-rbind(dd_padding1,dd_padding2)

dd_coat1<-data.frame(coat=dandy_item[str_detect(dandy_data$brand_item,"코트")])
dd_coat2<-data.frame(coat=dandy_item[str_detect(dandy_data$brand_item,"coat")])
dd_coat<-rbind(dd_coat1,dd_coat2)

dd_shirt1<-data.frame(shirt=dandy_item[str_detect(dandy_data$brand_item,c("셔츠"))])
dd_shirt2<-data.frame(shirt=dandy_item[str_detect(dandy_data$brand_item,c("shirt"))])
dd_shirt<-rbind(dd_shirt1,dd_shirt2)

dd_tshirt<-data.frame(tshirt=dandy_item[str_detect(dandy_data$brand_item,c("티셔츠"))])

dd_jeans<-data.frame(jean=dandy_item[str_detect(dandy_data$brand_item,c("데님"))])

dd_sweatshirt1<-data.frame(sweatshirt=dandy_item[str_detect(dandy_data$brand_item,c("스웻셔츠"))])
dd_sweatshirt2<-data.frame(sweatshirt=dandy_item[str_detect(dandy_data$brand_item,c("sweatshirt"))])
dd_sweatshirt <- rbind(dd_sweatshirt1,dd_sweatshirt2)

dd_mentomen<-data.frame(mentomen=dandy_item[str_detect(dandy_data$brand_item,"맨투맨")])

dd_pants1<-data.frame(pants=dandy_item[str_detect(dandy_data$brand_item,c("바지"))])
dd_pants2<-data.frame(pants=dandy_item[str_detect(dandy_data$brand_item,c("팬츠"))])
dd_pants3<-data.frame(pants=dandy_item[str_detect(dandy_data$brand_item,c("pants"))])
dd_pants<-rbind(dd_pants1,dd_pants2,dd_pants3)

dd_shorts<-data.frame(shorts=dandy_item[str_detect(dandy_data$brand_item,c("shorts"))])

dd_cap1<-data.frame(cap=dandy_item[str_detect(dandy_data$brand_item,c("모자"))])
dd_cap2<-data.frame(cap=dandy_item[str_detect(dandy_data$brand_item,c("cap"))])
dd_cap<-rbind(dd_cap1,dd_cap2)

dd_socks1<-data.frame(socks=dandy_item[str_detect(dandy_data$brand_item,c("양말"))])
dd_socks2<-data.frame(socks=dandy_item[str_detect(dandy_data$brand_item,c("socks"))])
dd_socks<-rbind(dd_socks1,dd_socks2)

dd_pack<-data.frame(pack=dandy_item[str_detect(dandy_data$brand_item,c("팩"))])
dd_shoes<-data.frame(shoes=dandy_item[str_detect(dandy_data$brand_item,c("스니커즈"))])
dd_necklace<-data.frame(necklace=dandy_item[str_detect(dandy_data$brand_item,c("목걸이"))])

dd_jacket$idx <- 1:nrow(dd_jacket)
dd_padding$idx <- 1:nrow(dd_padding)
dd_coat$idx <- 1:nrow(dd_coat)
dd_shirt$idx <- 1:nrow(dd_shirt)
dd_sweatshirt$idx <- 1:nrow(dd_sweatshirt)
dd_mentomen$idx <- 1:nrow(dd_mentomen)
dd_pants$idx <- 1:nrow(dd_pants)
dd_shorts$idx <- 1:nrow(dd_shorts)
dd_cap$idx <- 1:nrow(dd_cap)
dd_socks$idx <- 1:nrow(dd_socks)
dd_pack$idx <- 1:nrow(dd_pack)
dd_shoes$idx <- 1:nrow(dd_shoes)
dd_necklace$idx <- 1:nrow(dd_necklace)
dd_jeans$idx <- 1:nrow(dd_jeans)
dd_jumper$idx <- 1:nrow(dd_jumper)
dd_tshirt$idx <- 1:nrow(dd_tshirt)
dd_gardigan$idx <- 1:nrow(dd_gardigan)
dd_neat$idx <- 1:nrow(dd_neat)

dd_res <- full_join(cs_jacket,dd_pants,by='idx')
dd_res <- full_join(dd_res,dd_padding,by='idx')
dd_res <- full_join(dd_res,dd_coat,by='idx')
dd_res <- full_join(dd_res,dd_shirt,by='idx')
dd_res <- full_join(dd_res,dd_sweatshirt,by='idx')
dd_res <- full_join(dd_res,dd_mentomen,by='idx')
dd_res <- full_join(dd_res,dd_pack,by='idx')
dd_res <- full_join(dd_res,dd_shorts,by='idx')
dd_res <- full_join(dd_res,dd_cap,by='idx')
dd_res <- full_join(dd_res,dd_socks,by='idx')                    
dd_res <- full_join(dd_res,dd_shoes,by='idx')
dd_res <- full_join(dd_res,dd_necklace,by='idx')
dd_res <- full_join(dd_res,dd_gardigan,by='idx')
dd_res <- full_join(dd_res,dd_jeans,by='idx')
dd_res <- full_join(dd_res,dd_neat,by='idx')
dd_res <- full_join(dd_res,dd_jumper,by='idx')
dd_res <- full_join(dd_res,dd_tshirt,by='idx')
dd_res <- subset(dd_res,select = -idx)

View(dd_res)

write.csv(dd_res,"dandy_item.csv")

#4. 아메카제 색
american_data <- read.csv("american_causal_data.csv",fileEncoding = 'utf-8')

american_data$brand_item <- tolower(american_data$brand_item)
american_item <- tolower(american_item)

ad_black<-data.frame(black=american_item[str_detect(american_data$brand_item,c("블랙","black"))])

ad_khaki<-data.frame(khaki=american_item[str_detect(american_data$brand_item,c("카키","khaki"))])

ad_green<-data.frame(green=american_item[str_detect(american_data$brand_item,c("그린","green"))])

ad_beige<-data.frame(beige=american_item[str_detect(american_data$brand_item,c("베이지","beige"))])

ad_blue<-data.frame(blue=american_item[str_detect(american_data$brand_item,c("블루","blue"))])

ad_ivory<-data.frame(ivory=american_item[str_detect(american_data$brand_item,c("아이보리","ivory"))])

ad_grey<-data.frame(grey=american_item[str_detect(american_data$brand_item,c("회색","grey"))])

ad_white<-data.frame(white=american_item[str_detect(american_data$brand_item,c("white"))])

ad_navy<-data.frame(navy=american_item[str_detect(american_data$brand_item,c("네이비","navy"))])

ad_brown<-data.frame(brown=american_item[str_detect(american_data$brand_item,c("브라운","brown"))])

ad_orange<-data.frame(orange=american_item[str_detect(american_data$brand_item,c("오렌지","orange"))])

#ad_purple<-data.frame(coat=american_item[str_detect(american_data$brand_item,c("보라색","purple"))])

ad_red<-data.frame(red=american_item[str_detect(american_data$brand_item,c("레드","red"))])

ad_oatmeal<-data.frame(oatmeal=american_item[str_detect(american_data$brand_item,c("오트밀","oatmeal"))])

ad_olive<-data.frame(olive=american_item[str_detect(american_data$brand_item,c("올리브","olive"))])

ad_mustard<-data.frame(mustard=american_item[str_detect(american_data$brand_item,c("머스타드","mustard"))])

ad_ashgrey<-data.frame(ashgrey=american_item[str_detect(american_data$brand_item,c("에쉬그레이"))])

ad_yellow<-data.frame(yellow=american_item[str_detect(american_data$brand_item,c("옐로우","yellow"))])

ad_charcoal<-data.frame(charcoal=american_item[str_detect(american_data$brand_item,c("차콜","charcoal"))])

ad_black$idx <- 1:nrow(ad_black)
ad_khaki$idx <- 1:nrow(ad_khaki)
ad_green$idx <- 1:nrow(ad_green)
ad_beige$idx <- 1:nrow(ad_beige)
ad_blue$idx <- 1:nrow(ad_blue)
ad_ivory$idx <- 1:nrow(ad_ivory)
ad_grey$idx <- 1:nrow(ad_grey)
ad_white$idx <- 1:nrow(ad_white)
ad_navy$idx <- 1:nrow(ad_navy)
ad_orange$idx <- 1:nrow(ad_orange)
#ad_purple$idx <- 1:nrow(ad_purple)
ad_red$idx <- 1:nrow(ad_red)
ad_oatmeal$idx <- 1:nrow(ad_oatmeal)
ad_olive$idx <- 1:nrow(ad_olive)
ad_mustard$idx <- 1:nrow(ad_mustard)
ad_ashgrey$idx <- 1:nrow(ad_ashgrey)
ad_yellow$idx <- 1:nrow(ad_yellow)
ad_charcoal$idx <- 1:nrow(ad_charcoal)

ad_res <- full_join(ad_black,ad_khaki,by='idx')
ad_res <- full_join(ad_res,ad_green,by='idx')
ad_res <- full_join(ad_res,ad_beige,by='idx')
ad_res <- full_join(ad_res,ad_blue,by='idx')
ad_res <- full_join(ad_res,ad_ivory,by='idx')
ad_res <- full_join(ad_res,ad_grey,by='idx')
ad_res <- full_join(ad_res,ad_navy,by='idx')
ad_res <- full_join(ad_res,ad_white,by='idx')
ad_res <- full_join(ad_res,ad_orange,by='idx')
ad_res <- full_join(ad_res,ad_red,by='idx')                    
ad_res <- full_join(ad_res,ad_oatmeal,by='idx')
ad_res <- full_join(ad_res,ad_olive,by='idx')
ad_res <- full_join(ad_res,ad_mustard,by='idx')
ad_res <- full_join(ad_res,ad_ashgrey,by='idx')
ad_res <- full_join(ad_res,ad_yellow,by='idx')
ad_res <- full_join(ad_res,ad_charcoal,by='idx')
ad_res <- subset(ad_res,select = -idx)

View(ad_res)

write.csv(ad_res,"amerian_color.csv")

#5. 캐쥬얼 색
casual_data <- read.csv("causal_data.csv",fileEncoding = 'utf-8')

casual_data$brand_item <- tolower(casual_data$brand_item)
casual_item <- tolower(casual_data$brand_item)

cs_black1<-data.frame(black=casual_item[str_detect(casual_data$brand_item,c("블랙"))])
cs_black2<-data.frame(black=casual_item[str_detect(casual_data$brand_item,c("black"))])
cs_black<-rbind(cs_black1,cs_black2)

cs_khaki1<-data.frame(khaki=casual_item[str_detect(casual_data$brand_item,c("카키"))])
cs_khaki2<-data.frame(khaki=casual_item[str_detect(casual_data$brand_item,c("khaki"))])
cs_khaki<-rbind(cs_khaki1,cs_khaki2)

cs_green1<-data.frame(green=casual_item[str_detect(casual_data$brand_item,c("그린"))])
cs_green2<-data.frame(green=casual_item[str_detect(casual_data$brand_item,c("green"))])
cs_green<-rbind(cs_green1,cs_green2)

cs_beige1<-data.frame(beige=casual_item[str_detect(casual_data$brand_item,c("베이지"))])
cs_beige2<-data.frame(beige=casual_item[str_detect(casual_data$brand_item,c("beige"))])
cs_beige<-rbind(cs_beige1,cs_beige2)

cs_blue1<-data.frame(blue=casual_item[str_detect(casual_data$brand_item,c("블루"))])
cs_blue2<-data.frame(blue=casual_item[str_detect(casual_data$brand_item,c("blue"))])
cs_blue<-rbind(cs_blue1,cs_blue2)

cs_ivory1<-data.frame(ivory=casual_item[str_detect(casual_data$brand_item,c("아이보리"))])
cs_ivory2<-data.frame(ivory=casual_item[str_detect(casual_data$brand_item,c("ivory"))])
cs_ivory<-rbind(cs_ivory1,cs_ivory2)

cs_grey1<-data.frame(grey=casual_item[str_detect(casual_data$brand_item,c("회색"))])
cs_grey2<-data.frame(grey=casual_item[str_detect(casual_data$brand_item,c("grey"))])
cs_grey<-rbind(cs_grey1,cs_grey2)

cs_white<-data.frame(white=casual_item[str_detect(casual_data$brand_item,c("white"))])

cs_navy1<-data.frame(navy=casual_item[str_detect(casual_data$brand_item,c("네이비"))])
cs_navy2<-data.frame(navy=casual_item[str_detect(casual_data$brand_item,c("navy"))])
cs_navy<-rbind(cs_navy1,cs_navy2)

cs_brown1<-data.frame(brown=casual_item[str_detect(casual_data$brand_item,c("브라운"))])
cs_brown2<-data.frame(brown=casual_item[str_detect(casual_data$brand_item,c("brown"))])
cs_brown<-rbind(cs_brown1,cs_brown2)

cs_orange1<-data.frame(orange=casual_item[str_detect(casual_data$brand_item,c("오렌지"))])
cs_orange2<-data.frame(orange=casual_item[str_detect(casual_data$brand_item,c("orange"))])
cs_orange<-rbind(cs_orange1,cs_orange2)

cs_purple1<-data.frame(coat=casual_item[str_detect(casual_data$brand_item,c("보라색"))])
cs_purple2<-data.frame(coat=casual_item[str_detect(casual_data$brand_item,c("purple"))])
cs_purple<-rbind(cs_purple1,cs_purple2)

cs_red1<-data.frame(red=casual_item[str_detect(casual_data$brand_item,c("레드"))])
cs_red2<-data.frame(red=casual_item[str_detect(casual_data$brand_item,c("red"))])
cs_red<-rbind(cs_red1,cs_red2)

cs_oatmeal1<-data.frame(oatmeal=casual_item[str_detect(casual_data$brand_item,c("오트밀"))])
cs_oatmeal2<-data.frame(oatmeal=casual_item[str_detect(casual_data$brand_item,c("oatmeal"))])
cs_oatmeal<-rbind(cs_oatmeal1,cs_oatmeal2)

cs_olive1<-data.frame(olive=casual_item[str_detect(casual_data$brand_item,c("올리브"))])
cs_olive2<-data.frame(olive=casual_item[str_detect(casual_data$brand_item,c("olive"))])
cs_olive<-rbind(cs_olive1,cs_olive2)

cs_mustard1<-data.frame(mustard=casual_item[str_detect(casual_data$brand_item,c("머스타드"))])
cs_mustard2<-data.frame(mustard=casual_item[str_detect(casual_data$brand_item,c("mustard"))])
cs_mustard<-rbind(cs_mustard1,cs_mustard2)

#cs_ashgrey<-data.frame(ashgrey=casual_item[str_detect(casual_data$brand_item,c("에쉬그레이"))])

cs_yellow1<-data.frame(yellow=casual_item[str_detect(casual_data$brand_item,c("옐로우"))])
cs_yellow2<-data.frame(yellow=casual_item[str_detect(casual_data$brand_item,c("yellow"))])
cs_yellow<-rbind(cs_yellow1,cs_yellow2)

cs_charcoal1<-data.frame(charcoal=casual_item[str_detect(casual_data$brand_item,c("차콜"))])
cs_charcoal2<-data.frame(charcoal=casual_item[str_detect(casual_data$brand_item,c("charcoal"))])
cs_charcoal<-rbind(cs_charcoal1,cs_charcoal2)


cs_black$idx <- 1:nrow(cs_black)
cs_khaki$idx <- 1:nrow(cs_khaki)
cs_green$idx <- 1:nrow(cs_green)
cs_beige$idx <- 1:nrow(cs_beige)
cs_blue$idx <- 1:nrow(cs_blue)
cs_ivory$idx <- 1:nrow(cs_ivory)
cs_grey$idx <- 1:nrow(cs_grey)
cs_white$idx <- 1:nrow(cs_white)
cs_navy$idx <- 1:nrow(cs_navy)
cs_orange$idx <- 1:nrow(cs_orange)
cs_purple$idx <- 1:nrow(cs_purple)
cs_red$idx <- 1:nrow(cs_red)
cs_oatmeal$idx <- 1:nrow(cs_oatmeal)
cs_olive$idx <- 1:nrow(cs_olive)
cs_mustard$idx <- 1:nrow(cs_mustard)
cs_ashgrey$idx <- 1:nrow(cs_ashgrey)
cs_yellow$idx <- 1:nrow(cs_yellow)
cs_charcoal$idx <- 1:nrow(cs_charcoal)

cs_res <- full_join(cs_black,cs_khaki,by='idx')
cs_res <- full_join(cs_res,cs_green,by='idx')
cs_res <- full_join(cs_res,cs_beige,by='idx')
cs_res <- full_join(cs_res,cs_blue,by='idx')
cs_res <- full_join(cs_res,cs_ivory,by='idx')
cs_res <- full_join(cs_res,cs_grey,by='idx')
cs_res <- full_join(cs_res,cs_navy,by='idx')
cs_res <- full_join(cs_res,cs_white,by='idx')
cs_res <- full_join(cs_res,cs_orange,by='idx')
cs_res <- full_join(cs_res,cs_purple,by='idx')
cs_res <- full_join(cs_res,cs_red,by='idx')                    
cs_res <- full_join(cs_res,cs_oatmeal,by='idx')
cs_res <- full_join(cs_res,cs_olive,by='idx')
cs_res <- full_join(cs_res,cs_mustard,by='idx')
#cs_res <- full_join(cs_res,cs_ashgrey,by='idx')
cs_res <- full_join(cs_res,cs_yellow,by='idx')
cs_res <- full_join(cs_res,cs_charcoal,by='idx')
cs_res <- subset(cs_res,select = -idx)

View(cs_res)

write.csv(cs_res,"casual_color.csv")

#6.댄디 색
dandy_data <- read.csv("dandy_data.csv",fileEncoding = 'utf-8')

dandy_data$brand_item <- tolower(dandy_data$brand_item)
dandy_item <- tolower(dandy_data$brand_item)

dd_black1<-data.frame(black=dandy_item[str_detect(dandy_data$brand_item,c("블랙"))])
dd_black2<-data.frame(black=dandy_item[str_detect(dandy_data$brand_item,c("black"))])
dd_black<-rbind(dd_black1,dd_black2)

dd_khaki1<-data.frame(khaki=dandy_item[str_detect(dandy_data$brand_item,c("카키"))])
dd_khaki2<-data.frame(khaki=dandy_item[str_detect(dandy_data$brand_item,c("khaki"))])
dd_khaki<-rbind(dd_khaki1,dd_khaki2)

dd_green1<-data.frame(green=dandy_item[str_detect(dandy_data$brand_item,c("그린"))])
dd_green2<-data.frame(green=dandy_item[str_detect(dandy_data$brand_item,c("green"))])
dd_green<-rbind(dd_green1,dd_green2)

dd_beige1<-data.frame(beige=dandy_item[str_detect(dandy_data$brand_item,c("베이지"))])
dd_beige2<-data.frame(beige=dandy_item[str_detect(dandy_data$brand_item,c("beige"))])
dd_beige<-rbind(dd_beige1,dd_beige2)

dd_blue1<-data.frame(blue=dandy_item[str_detect(dandy_data$brand_item,c("블루"))])
dd_blue2<-data.frame(blue=dandy_item[str_detect(dandy_data$brand_item,c("blue"))])
dd_blue<-rbind(dd_blue1,dd_blue2)

dd_ivory1<-data.frame(ivory=dandy_item[str_detect(dandy_data$brand_item,c("아이보리"))])
dd_ivory2<-data.frame(ivory=dandy_item[str_detect(dandy_data$brand_item,c("ivory"))])
dd_ivory<-rbind(dd_ivory1,dd_ivory2)

dd_grey1<-data.frame(grey=dandy_item[str_detect(dandy_data$brand_item,c("회색"))])
dd_grey2<-data.frame(grey=dandy_item[str_detect(dandy_data$brand_item,c("grey"))])
dd_grey<-rbind(dd_grey1,dd_grey2)

dd_white<-data.frame(white=dandy_item[str_detect(dandy_data$brand_item,c("white"))])

dd_navy1<-data.frame(navy=dandy_item[str_detect(dandy_data$brand_item,c("네이비"))])
dd_navy2<-data.frame(navy=dandy_item[str_detect(dandy_data$brand_item,c("navy"))])
dd_navy<-rbind(dd_navy1,dd_navy2)

dd_brown1<-data.frame(brown=dandy_item[str_detect(dandy_data$brand_item,c("브라운"))])
dd_brown2<-data.frame(brown=dandy_item[str_detect(dandy_data$brand_item,c("brown"))])
dd_brown<-rbind(dd_brown1,dd_brown2)

dd_orange1<-data.frame(orange=dandy_item[str_detect(dandy_data$brand_item,c("오렌지"))])
dd_orange2<-data.frame(orange=dandy_item[str_detect(dandy_data$brand_item,c("orange"))])
dd_orange<-rbind(dd_orange1,dd_orange2)

dd_purple1<-data.frame(purple=dandy_item[str_detect(dandy_data$brand_item,c("보라색"))])
dd_purple2<-data.frame(purple=dandy_item[str_detect(dandy_data$brand_item,c("purple"))])
dd_purple<-rbind(dd_purple1,dd_purple2)

dd_red1<-data.frame(red=dandy_item[str_detect(dandy_data$brand_item,c("레드"))])
dd_red2<-data.frame(red=dandy_item[str_detect(dandy_data$brand_item,c("red"))])
dd_red<-rbind(dd_red1,dd_red2)

dd_oatmeal1<-data.frame(oatmeal=dandy_item[str_detect(dandy_data$brand_item,c("오트밀"))])
dd_oatmeal2<-data.frame(oatmeal=dandy_item[str_detect(dandy_data$brand_item,c("oatmeal"))])
dd_oatmeal<-rbind(dd_oatmeal1,dd_oatmeal2)

dd_olive1<-data.frame(olive=dandy_item[str_detect(dandy_data$brand_item,c("올리브"))])
dd_olive2<-data.frame(olive=dandy_item[str_detect(dandy_data$brand_item,c("olive"))])
dd_olive<-rbind(dd_olive1,dd_olive2)

dd_mustard1<-data.frame(mustard=dandy_item[str_detect(dandy_data$brand_item,c("머스타드"))])
dd_mustard2<-data.frame(mustard=dandy_item[str_detect(dandy_data$brand_item,c("mustard"))])
dd_mustard<-rbind(dd_mustard1,dd_mustard2)

dd_yellow1<-data.frame(yellow=dandy_item[str_detect(dandy_data$brand_item,c("옐로우"))])
dd_yellow2<-data.frame(yellow=dandy_item[str_detect(dandy_data$brand_item,c("yellow"))])
dd_yellow<-rbind(dd_yellow1,dd_yellow2)

dd_charcoal1<-data.frame(charcoal=dandy_item[str_detect(dandy_data$brand_item,c("차콜"))])
dd_charcoal2<-data.frame(charcoal=dandy_item[str_detect(dandy_data$brand_item,c("charcoal"))])
dd_charcoal<-rbind(dd_charcoal1,dd_charcoal2)


dd_black$idx <- 1:nrow(dd_black)
dd_khaki$idx <- 1:nrow(dd_khaki)
dd_green$idx <- 1:nrow(dd_green)
dd_beige$idx <- 1:nrow(dd_beige)
dd_blue$idx <- 1:nrow(dd_blue)
dd_ivory$idx <- 1:nrow(dd_ivory)
dd_grey$idx <- 1:nrow(dd_grey)
dd_white$idx <- 1:nrow(dd_white)
dd_navy$idx <- 1:nrow(dd_navy)
dd_orange$idx <- 1:nrow(dd_orange)
dd_purple$idx <- 1:nrow(dd_purple)
dd_red$idx <- 1:nrow(dd_red)
dd_oatmeal$idx <- 1:nrow(dd_oatmeal)
dd_olive$idx <- 1:nrow(dd_olive)
dd_mustard$idx <- 1:nrow(dd_mustard)
dd_yellow$idx <- 1:nrow(dd_yellow)
dd_charcoal$idx <- 1:nrow(dd_charcoal)

dd_res <- full_join(dd_black,dd_khaki,by='idx')
dd_res <- full_join(dd_res,dd_green,by='idx')
dd_res <- full_join(dd_res,dd_beige,by='idx')
dd_res <- full_join(dd_res,dd_blue,by='idx')
dd_res <- full_join(dd_res,dd_ivory,by='idx')
dd_res <- full_join(dd_res,dd_grey,by='idx')
dd_res <- full_join(dd_res,dd_navy,by='idx')
dd_res <- full_join(dd_res,dd_white,by='idx')
dd_res <- full_join(dd_res,dd_orange,by='idx')
dd_res <- full_join(dd_res,dd_purple,by='idx')
dd_res <- full_join(dd_res,dd_red,by='idx')                    
dd_res <- full_join(dd_res,dd_oatmeal,by='idx')
dd_res <- full_join(dd_res,dd_olive,by='idx')
dd_res <- full_join(dd_res,dd_mustard,by='idx')
dd_res <- full_join(dd_res,dd_yellow,by='idx')
dd_res <- full_join(dd_res,dd_charcoal,by='idx')
dd_res <- subset(dd_res,select = -idx)

View(dd_res)

write.csv(dd_res,"dandy_color.csv")

#아메카지 색 통계 그래프
library(tidyr)
library(ggplot2)

ad_all_cnt <- table(!is.na(ad_res))["TRUE"]

View(ad_res)
ad_res_bool <- !is.na(ad_res)
ad_res_bool <- data.frame(ad_res_bool)

ad_black <- sum(ad_res_bool$black)/ad_all_cnt * 100
ad_khaki <- sum(ad_res_bool$khaki)/ad_all_cnt * 100
ad_green <- sum(ad_res_bool$green)/ad_all_cnt * 100
ad_beige <- sum(ad_res_bool$beige)/ad_all_cnt * 100
ad_blue <- sum(ad_res_bool$blue)/ad_all_cnt * 100
ad_ivory <- sum(ad_res_bool$ivory)/ad_all_cnt * 100
ad_grey <- sum(ad_res_bool$grey)/ad_all_cnt * 100
ad_navy <- sum(ad_res_bool$navy)/ad_all_cnt * 100
ad_white <- sum(ad_res_bool$white)/ad_all_cnt * 100
ad_orange <- sum(ad_res_bool$orange)/ad_all_cnt * 100
ad_red <- sum(ad_res_bool$red)/ad_all_cnt * 100
ad_oatmeal <- sum(ad_res_bool$oatmeal)/ad_all_cnt * 100
ad_olive <- sum(ad_res_bool$olive)/ad_all_cnt * 100
ad_mustard <- sum(ad_res_bool$mustard)/ad_all_cnt * 100
ad_ashgrey <- sum(ad_res_bool$ashgrey)/ad_all_cnt * 100
ad_yellow <- sum(ad_res_bool$yellow)/ad_all_cnt * 100
ad_charcoal <- sum(ad_res_bool$charcoal)/ad_all_cnt * 100

group <- c("black","khaki","green","beige","blue","ivory","grey","navy","white","orange","red","oatmean","olive","mustard","ashgrey","yellow","charcoal")
ratio <- c(ad_black,ad_khaki,ad_green,ad_beige,ad_blue,ad_ivory,ad_grey,ad_navy,ad_white,ad_orange,ad_red,ad_oatmeal,ad_olive,ad_mustard,ad_ashgrey,
           ad_yellow,ad_charcoal)
names(ratio) <- NULL

ad_df <- data.frame(group=group,ratio=round(ratio,))

ad_df <- ad_df[ad_df$ratio != 0,]

ad_df2 <- ad_df %>% 
  mutate(csum = rev(cumsum(rev(ratio))), 
         pos = ratio/2 + lead(csum, 1),
         pos = if_else(is.na(pos), ratio/2, pos))

ad_color <- c("#1B1B1B","#C3B091","green","beige","blue","#FFFFBD","grey","navy","white","orange","red","#E0DCC8","#808000","#FFDB58","yellow")

ggplot(ad_df, aes(x = "" , y = ratio, fill = fct_inorder(group))) +
  geom_col(width = 1, color = 1) +
  coord_polar(theta = "y") +
  scale_fill_manual(values=ad_color) +
  geom_label_repel(data = ad_df2,
                   aes(y = pos, label = paste0(ratio, "%")),
                   size = 4.5, nudge_x = 1, show.legend = FALSE) +
  guides(fill = guide_legend(title = "Color")) +
  theme_void()


#캐쥬얼 색 통계 그래프
library(tidyr)
library(ggplot2)

cs_all_cnt <- table(!is.na(cs_res))["TRUE"]

View(ad_res)
cs_res_bool <- !is.na(cs_res)
cs_res_bool <- data.frame(cs_res_bool)

cs_black <- sum(cs_res_bool$black)/cs_all_cnt * 100
cs_khaki <- sum(cs_res_bool$khaki)/cs_all_cnt * 100
cs_green <- sum(cs_res_bool$green)/cs_all_cnt * 100
cs_beige <- sum(cs_res_bool$beige)/cs_all_cnt * 100
cs_blue <- sum(cs_res_bool$blue)/cs_all_cnt * 100
cs_ivory <- sum(cs_res_bool$ivory)/cs_all_cnt * 100
cs_grey <- sum(cs_res_bool$grey)/cs_all_cnt * 100
cs_navy <- sum(cs_res_bool$navy)/cs_all_cnt * 100
cs_white <- sum(cs_res_bool$white)/cs_all_cnt * 100
cs_orange <- sum(cs_res_bool$orange)/cs_all_cnt * 100
cs_red <- sum(cs_res_bool$red)/cs_all_cnt * 100
cs_oatmeal <- sum(cs_res_bool$oatmeal)/cs_all_cnt * 100
cs_olive <- sum(cs_res_bool$olive)/cs_all_cnt * 100
cs_mustard <- sum(cs_res_bool$mustard)/cs_all_cnt * 100
cs_ashgrey <- sum(cs_res_bool$ashgrey)/cs_all_cnt * 100
cs_yellow <- sum(cs_res_bool$yellow)/cs_all_cnt * 100
cs_charcoal <- sum(cs_res_bool$charcoal)/cs_all_cnt * 100

group <- c("black","khaki","green","beige","blue","ivory","grey","navy","white","orange","red","oatmean","olive","mustard","ashgrey","yellow","charcoal")
ratio <- c(cs_black,cs_khaki,cs_green,cs_beige,cs_blue,cs_ivory,cs_grey,cs_navy,cs_white,cs_orange,cs_red,cs_oatmeal,cs_olive,cs_mustard,cs_ashgrey,
           cs_yellow,cs_charcoal)
names(ratio) <- NULL

cs_df <- data.frame(group=group,ratio=round(ratio,0))

#ggplot(cs_df, aes(x="", y=ratio, fill=group)) +geom_bar(stat="identity", width=1,color="white") + coord_polar("y", start=0) + scale_fill_manual(values=color) + theme_gray() + xlab(NULL) + ylab(NULL)

cs_df <- cs_df[cs_df$ratio != 0,]

cs_df2 <- cs_df %>% 
  mutate(csum = rev(cumsum(rev(ratio))), 
         pos = ratio/2 + lead(csum, 1),
         pos = if_else(is.na(pos), ratio/2, pos))

cs_color <- c("#1B1B1B","#C3B091","green","beige","blue","#FFFFBD","grey","navy","white","orange","red","#E0DCC8","#808000","#FFDB58","yellow")

ggplot(cs_df, aes(x = "" , y = ratio, fill = fct_inorder(group))) +
  geom_col(width = 1, color = 1) +
  coord_polar(theta = "y") +
  scale_fill_manual(values=cs_color) +
  geom_label_repel(data = cs_df2,
                   aes(y = pos, label = paste0(ratio, "%")),
                   size = 4.5, nudge_x = 1, show.legend = FALSE) +
  guides(fill = guide_legend(title = "Color")) +
  theme_void()


#댄디 색 통계 그래프
library(tidyr)
library(ggplot2)
library(plotrix)
library(ggrepel)
library(tidyverse)

install.packages("ggrepel")
install.packages("tidyverse")

dd_all_cnt <- table(!is.na(dd_res))["TRUE"]

dd_res_bool <- !is.na(dd_res)
dd_res_bool <- data.frame(dd_res_bool)

dd_black <- sum(dd_res_bool$black)/dd_all_cnt * 100
dd_khaki <- sum(dd_res_bool$khaki)/dd_all_cnt * 100
dd_green <- sum(dd_res_bool$green)/dd_all_cnt * 100
dd_beige <- sum(dd_res_bool$beige)/dd_all_cnt * 100
dd_blue <- sum(dd_res_bool$blue)/dd_all_cnt * 100
dd_ivory <- sum(dd_res_bool$ivory)/dd_all_cnt * 100
dd_grey <- sum(dd_res_bool$grey)/dd_all_cnt * 100
dd_navy <- sum(dd_res_bool$navy)/dd_all_cnt * 100
dd_white <- sum(dd_res_bool$white)/dd_all_cnt * 100
dd_orange <- sum(dd_res_bool$orange)/dd_all_cnt * 100
dd_red <- sum(dd_res_bool$red)/dd_all_cnt * 100
dd_oatmeal <- sum(dd_res_bool$oatmeal)/dd_all_cnt * 100
dd_olive <- sum(dd_res_bool$olive)/dd_all_cnt * 100
dd_mustard <- sum(dd_res_bool$mustard)/dd_all_cnt * 100
dd_ashgrey <- sum(dd_res_bool$ashgrey)/dd_all_cnt * 100
dd_yellow <- sum(dd_res_bool$yellow)/dd_all_cnt * 100
dd_charcoal <- sum(dd_res_bool$charcoal)/dd_all_cnt * 100

group <- c("black","khaki","green","beige","blue","ivory","grey","navy","white","orange","red","oatmeal","olive","mustard","ashgrey","yellow","charcoal")
ratio <- c(dd_black,dd_khaki,dd_green,dd_beige,dd_blue,dd_ivory,dd_grey,dd_navy,dd_white,dd_orange,dd_red,dd_oatmeal,dd_olive,dd_mustard,dd_ashgrey,
           dd_yellow,dd_charcoal)
names(ratio) <- NULL

dd_df <- data.frame(group=group,ratio=round(ratio,0))

dd_df <- dd_df[dd_df$ratio != 0,]

dd_df2 <- dd_df %>% 
  mutate(csum = rev(cumsum(rev(ratio))), 
         pos = ratio/2 + lead(csum, 1),
         pos = if_else(is.na(pos), ratio/2, pos))

dd_color <- c("#1B1B1B","#C3B091","green","beige","blue","#FFFFCB","grey","navy","white","red","#E0DCC8","#3B3C36","#36454F")

ggplot(dd_df, aes(x = "" , y = ratio, fill = fct_inorder(group))) +
  geom_col(width = 1, color = 1) +
  coord_polar(theta = "y") +
  scale_fill_manual(values=dd_color) +
  geom_label_repel(data = dd_df2,
                   aes(y = pos, label = paste0(ratio, "%")),
                   size = 4.5, nudge_x = 1, show.legend = FALSE) +
  guides(fill = guide_legend(title = "Color")) +
  theme_void()

#아메카제 아이템 그래프
american_item <- read.csv("amerian_item.csv",fileEncoding = 'utf-8')

american_item <- !is.na(american_item)
american_item <- data.frame(american_item)
american_item <- american_item[,c(-1,-7)]

ad_sum <- apply(american_item,2,sum)

ad_graph <- c()
ad_graph[1] <- ad_sum["gardigan"] 
ad_graph[2] <- ad_sum["pack"]
ad_graph[3] <- ad_sum["neat"] 
ad_graph[4] <- ad_sum["jean"]
ad_graph[5] <- ad_sum["cap"] 
ad_graph[6] <- ad_sum["necklace"] 
ad_graph[7] <- ad_sum["pants"] 
ad_graph[8] <- ad_sum["shorts"] 
ad_graph[9] <- ad_sum["shirt"] 
ad_graph[10] <- ad_sum["shoes"] 
ad_graph[11] <- ad_sum["mentomen"] 
ad_graph[12] <- ad_sum["socks"] 
ad_graph[13] <- ad_sum["jacket"] 
ad_graph[14] <- ad_sum["jumper"] 
ad_graph[15] <- ad_sum["tshirt"] 
ad_graph[16] <- ad_sum["padding"] 

names(ad_graph) <- c("가디건","가방","니트","데님","모자","목걸이","바지","반바지","셔츠","스니커즈","스웻셔츠","양말","자켓","점퍼","티셔츠","패딩")

barplot(ad_graph,main='아메리칸 캐쥬얼 제품 비율',las=1,horiz=TRUE, 
        col=c('salmon',#아우터_가디건
              'salmon',#악세사리_가방
              'salmon',#상의_니트
              'salmon',#하의_데님
              'salmon',#악세사리_모자
              'salmon',#악세사리_목걸이
              'khaki',#하의_바지
              'khaki',#하의_반바지
              'khaki',#상의_셔츠
              'khaki',#악세사리_스니커즈
              'khaki',#상의_스웻셔츠
              'light blue',#아우터_아노락
              'dark sea green',#아우터_자켓
              'dark sea green',#아우터_점퍼
              'dark sea green',#상의_티셔츠
              'dark sea green'#아우터_패딩
        )
)

#캐쥬얼 아이템 그래프
casual_item <- read.csv("casual_item.csv",fileEncoding = 'utf-8')

casual_item <- !is.na(casual_item)
casual_item <- data.frame(casual_item)
casual_item <- casual_item[,c(-1,-7)]

cs_sum <- apply(casual_item,2,sum)

View(casual_item)

cs_graph <- c()
cs_graph[1] <- cs_sum["gardigan"] 
cs_graph[2] <- cs_sum["pack"]
cs_graph[3] <- cs_sum["neat"] 
cs_graph[4] <- cs_sum["jean"]
cs_graph[5] <- cs_sum["cap"] 
cs_graph[6] <- cs_sum["necklace"] 
cs_graph[7] <- cs_sum["pants"] 
cs_graph[8] <- cs_sum["shorts"] 
cs_graph[9] <- cs_sum["shirt"] 
cs_graph[10] <- cs_sum["shoes"] 
cs_graph[11] <- cs_sum["mentomen"] 
cs_graph[12] <- cs_sum["socks"] 
cs_graph[13] <- cs_sum["jacket"] 
cs_graph[14] <- cs_sum["jumper"] 
cs_graph[15] <- cs_sum["tshirt"] 
cs_graph[16] <- cs_sum["padding"] 

names(cs_graph) <- c("가디건","가방","니트","데님","모자","목걸이","바지","반바지","셔츠","스니커즈","스웻셔츠","양말","자켓","점퍼","티셔츠","패딩")

barplot(cs_graph,main='캐쥬얼 제품 비율',las=1,horiz=TRUE, 
        col=c('salmon',#아우터_가디건
              'salmon',#악세사리_가방
              'salmon',#상의_니트
              'salmon',#하의_데님
              'salmon',#악세사리_모자
              'salmon',#악세사리_목걸이
              'khaki',#하의_바지
              'khaki',#하의_반바지
              'khaki',#상의_셔츠
              'khaki',#악세사리_스니커즈
              'khaki',#상의_스웻셔츠
              'light blue',#아우터_아노락
              'dark sea green',#아우터_자켓
              'dark sea green',#아우터_점퍼
              'dark sea green',#상의_티셔츠
              'dark sea green'#아우터_패딩
        )
)

#캐쥬얼 아이템 그래프
casual_item <- read.csv("casual_item.csv",fileEncoding = 'utf-8')

casual_item <- !is.na(casual_item)
casual_item <- data.frame(casual_item)
casual_item <- casual_item[,c(-1,-7)]

cs_sum <- apply(casual_item,2,sum)

View(casual_item)

cs_graph <- c()
cs_graph[1] <- cs_sum["gardigan"] 
cs_graph[2] <- cs_sum["pack"]
cs_graph[3] <- cs_sum["neat"] 
cs_graph[4] <- cs_sum["jean"]
cs_graph[5] <- cs_sum["cap"] 
cs_graph[6] <- cs_sum["necklace"] 
cs_graph[7] <- cs_sum["pants"] 
cs_graph[8] <- cs_sum["shorts"] 
cs_graph[9] <- cs_sum["shirt"] 
cs_graph[10] <- cs_sum["shoes"] 
cs_graph[11] <- cs_sum["mentomen"] 
cs_graph[12] <- cs_sum["socks"] 
cs_graph[13] <- cs_sum["jacket"] 
cs_graph[14] <- cs_sum["jumper"] 
cs_graph[15] <- cs_sum["tshirt"] 
cs_graph[16] <- cs_sum["padding"] 

names(cs_graph) <- c("가디건","가방","니트","데님","모자","목걸이","바지","반바지","셔츠","스니커즈","스웻셔츠","양말","자켓","점퍼","티셔츠","패딩")

barplot(cs_graph,main='캐쥬얼 제품 비율',las=1,horiz=TRUE, 
        col=c('salmon',#아우터_가디건
              'salmon',#악세사리_가방
              'salmon',#상의_니트
              'salmon',#하의_데님
              'salmon',#악세사리_모자
              'salmon',#악세사리_목걸이
              'khaki',#하의_바지
              'khaki',#하의_반바지
              'khaki',#상의_셔츠
              'khaki',#악세사리_스니커즈
              'khaki',#상의_스웻셔츠
              'light blue',#아우터_아노락
              'dark sea green',#아우터_자켓
              'dark sea green',#아우터_점퍼
              'dark sea green',#상의_티셔츠
              'dark sea green'#아우터_패딩
        )
)

#댄디 아이템 그래프
dandy_item <- read.csv("dandy_item.csv",fileEncoding = 'utf-8')

dandy_item <- !is.na(dandy_item)
dandy_item <- data.frame(dandy_item)
dandy_item <- dandy_item[,c(-1,-7)]

cs_sum <- apply(dandy_item,2,sum)

View(dandy_item)

dd_graph <- c()
dd_graph[1] <- cs_sum["gardigan"] 
dd_graph[2] <- cs_sum["pack"]
dd_graph[3] <- cs_sum["neat"] 
dd_graph[4] <- cs_sum["jean"]
dd_graph[5] <- cs_sum["cap"] 
dd_graph[6] <- cs_sum["necklace"] 
dd_graph[7] <- cs_sum["pants"] 
dd_graph[8] <- cs_sum["shorts"] 
dd_graph[9] <- cs_sum["shirt"] 
dd_graph[10] <- cs_sum["shoes"] 
dd_graph[11] <- cs_sum["mentomen"] 
dd_graph[12] <- cs_sum["socks"] 
dd_graph[13] <- cs_sum["jacket"] 
dd_graph[14] <- cs_sum["jumper"] 
dd_graph[15] <- cs_sum["tshirt"] 
dd_graph[16] <- cs_sum["padding"] 

names(dd_graph) <- c("가디건","가방","니트","데님","모자","목걸이","바지","반바지","셔츠","스니커즈","스웻셔츠","양말","자켓","점퍼","티셔츠","패딩")

barplot(dd_graph,main='댄디 제품 비율',las=1,horiz=TRUE, 
        col=c('salmon',#아우터_가디건
              'salmon',#악세사리_가방
              'salmon',#상의_니트
              'salmon',#하의_데님
              'salmon',#악세사리_모자
              'salmon',#악세사리_목걸이
              'khaki',#하의_바지
              'khaki',#하의_반바지
              'khaki',#상의_셔츠
              'khaki',#악세사리_스니커즈
              'khaki',#상의_스웻셔츠
              'light blue',#아우터_아노락
              'dark sea green',#아우터_자켓
              'dark sea green',#아우터_점퍼
              'dark sea green',#상의_티셔츠
              'dark sea green'#아우터_패딩
        )
)
