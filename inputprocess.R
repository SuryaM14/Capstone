data4f <- readRDS(file="./data/data4f.rds")
data3f <- readRDS(file="./data/data3f.rds")
data2f <- readRDS(file="./data/data2f.rds")

dataCleaner<-function(text){
  cleanText <- tolower(text)
  cleanText <- removePunctuation(cleanText)
  cleanText <- removeNumbers(cleanText)
  cleanText <- str_replace_all(cleanText, "[^[:alnum:]]", " ")
  cleanText <- stripWhitespace(cleanText)
  return(cleanText)
}

cleanInput <- function(text){
  textInput <- dataCleaner(text)
  textInput <- txt.to.words.ext(textInput, 
                                language="English.all", 
                                preserve.case = TRUE)
  return(textInput)
}

nextWordPrediction <- function(wordCount,textInput){
  if (wordCount>=3) {
    textInput <- textInput[(wordCount-2):wordCount] 
  }
  else if(wordCount==2) {
    textInput <- c(NA,textInput)   
  }
  else {
    textInput <- c(NA,NA,textInput)
  }
  
  wordPrediction <- as.character(data4f[data4f$n1==textInput[1] & 
                                          data4f$n2==textInput[2] & 
                                          data4f$n3==textInput[3],][1,]$n4)
  
  if(is.na(wordPrediction)) {
    wordPrediction1 <- as.character(data3f[data3f$n1==textInput[2] & 
                                             data3f$n2==textInput[3],][1,]$n3)
    
    if(is.na(wordPrediction)) {
      wordPrediction <- as.character(data2f[data2f$n1==textInput[3],][1,]$n2)
    }
  }
  print(wordPrediction)
}

