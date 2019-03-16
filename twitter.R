library(twitteR)
library(RCurl)
library(tm)
library(wordcloud)

consumer_kay <- "7X1wE3SrzfEyregXm9v6eMrdO"
consumer_secret <- "9nX1GbUBef1Z8nfpYTwpsHXdF7P1sz19RvP4xSZpJoRZUGfgHW"
access_token <- "1106596852403716096-00rfRhADfZwOgRweOb33iTo0FFHPYD"
access_secret <- "kXf4mW208IK2oZZc17EmBx5kuHPTgqCXfxbDKVDXYSEfK"
#
setup_twitter_oauth(consumer_kay,consumer_secret,access_token,access_secret)
# Search examples from function help file
himearch <- searchTwitter()
