import tweepy
import pandas as pd
import datetime
import time
 
consumer_key = "consumer_key"
consumer_secret = "consumer_secret"
access_token = "access_token"
access_token_secret = "access_token_secret"


auth = tweepy.OAuthHandler(consumer_key, 
    consumer_secret)
auth.set_access_token(access_token, 
 access_token_secret)

api = tweepy.API(auth)

try:
    api.verify_credentials()
    print("Connected to API")
    
except:
    print("Error during authentication")

#Connected to API
#print("username Twitter:")
#userID = [input()]
userID=['StatsMalaysia','Dr_Uzir']


from datetime import datetime, timedelta
i=0
while 1:
    print ('Bot is Running ..')
    print("\n")
    
    for user in userID:
            print(userID[i])
            tweets = api.user_timeline(screen_name=userID[i], 
                           # 200 is the maximum allowed count
                           count=1,
                           include_rts = True,
                          
                           tweet_mode = 'extended'
                           )
            for info in tweets[:1]:
                id=info.id
                print("ID: {}".format(id))
                print(info.created_at)
                print(info.full_text)
                
                 
                
                status = api.get_status(id)
                retweeted = status.retweeted 

                if retweeted == True:
                    print("The authenticated user has retweeted the tweet.")
                else:
                    print("The authenticated user has not retweeted the tweet.") 
                    tweet = api.get_status(id) 
                    tweet.favorite()  
                    tweet.retweet()
                    print("it is now retweeted")
            print("\n")        
            i=+1        
    dt = datetime.now()+ timedelta(minutes=60)  
    print(dt)
    while datetime.now() < dt:
        time.sleep(1)  
