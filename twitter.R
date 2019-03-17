library(twitteR)
library(RCurl)
library(tm)
library(wordcloud)
library(data.table)
library(stringr)
#
rm(list=ls())
consumer_kay <- "7X1wE3SrzfEyregXm9v6eMrdO"
consumer_secret <- "9nX1GbUBef1Z8nfpYTwpsHXdF7P1sz19RvP4xSZpJoRZUGfgHW"
access_token <- "1106596852403716096-00rfRhADfZwOgRweOb33iTo0FFHPYD"
access_secret <- "kXf4mW208IK2oZZc17EmBx5kuHPTgqCXfxbDKVDXYSEfK"
#
setup_twitter_oauth(consumer_kay,consumer_secret,access_token,access_secret)
# Search examples from function help file
himearch <- searchTwitter("solar+cme",lang="en",n=500,resultType = "recent")
himearch_text <- sapply(himearch,function(x) x$getText())
str(himearch_text)
head(himearch_text)
#
him_corpus <- Corpus(VectorSource(himearch_text))
him_corpus
inspect(him_corpus)
#
# Lower cases, remove numbers, cut out stop words, 
# remove punctuation, strip whitespace
#
him_clean <- tm_map(him_corpus,removePunctuation)
him_clean <- tm_map(him_clean,content_transformer(tolower))
him_clean <- tm_map(him_clean,removeWords,stopwords("english"))
him_clean <- tm_map(him_clean,removeNumbers)
him_clean <- tm_map(him_clean,stripWhitespace)
him_clean <- tm_map(him_clean,removeWords,c("#","@","[0-9]*","https://[A-Z[a-z]*","@[A-Z][a-z]*"))
str_split(him_clean,pattern="\\s+")
head(inspect(him_corpus))

#
# Remove some words
#
wordcloud(him_clean,col=rainbow(10),min.freq=4,random.order = FALSE)

