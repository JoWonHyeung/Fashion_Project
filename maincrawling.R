library(RSelenium)
library(rvest)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()

remDr$navigate("https://www.musinsa.com/app/codimap/lists?style_type=casual&tag_no=&brand=&display_cnt=60&list_kind=big&sort=date&page=1")

#'남성' 클릭
webElem <- remDr$findElement("css selector","body > div.wrap > div.right_area > div.global-filter > button.global-filter__button.global-filter__button--mensinsa")
webElem$clickElement()

#스타일 개수 추출
webElem <- remDr$findElement("css selector","body > div.wrap > div.right_area > form > div.right_contents.hover_box > div > div.thumbType-box.box > span.counter")
all_count <- gsub('[^0-9]','',unlist(webElem$getElementText()))
list.count <- 1
page <- 1
main_url <- 'https://www.musinsa.com/app/codimap/lists?style_type=casual&tag_no=&brand=&display_cnt=60&list_kind=big&sort=date&page=1'

brand_df <- data.frame()

for(i in 1:all_count){
  #클릭
  click_url <- paste0("body > div.wrap > div.right_area > form > div.right_contents.hover_box > div > ul > li:nth-child(",list.count,") > div.style-list-information > a > strong")
  list.count <- list.count + 1
  
  webElem <- remDr$findElement("css selector",click_url)
  webElem$clickElement()
  Sys.sleep(1)

  #브랜드명 가져오기
  url <- remDr$getCurrentUrl()
  text <- read_html(unlist(url))
  
  nodes <- html_nodes(text, "div.styling_list > div.swiper-slide > a.brand")
  
  brand_name <- c(html_text(nodes))
  brand_name <- data.frame(brand_name)
  brand_df <- rbind(brand_df,brand_name)
  print(nrow(brand_df))
  if(i %% 60 == 0){
    page <- page + 1
    main_url <- paste0("https://www.musinsa.com/app/codimap/lists?style_type=casual&tag_no=&brand=&display_cnt=60&list_kind=big&sort=date&page=",page)
    list.count <- 1
  }
  
  #메인페이지로 돌아가기
  remDr$navigate(main_url)
  Sys.sleep(1)
}
  
#데이터 저장
write.csv(brand_df,"캐주얼_data.csv")


