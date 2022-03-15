## check related keywords
https://www.vicinitas.io/

## create new folder to setup all data save in one folder

## scrape twitter post without authentication
1. open cmd
2. pip install snscrape
3. run this command:

snscrape --jsonl --progress --since [date start] twitter-search "[keywords search] until:[date end]" > <filename>.json
eg. snscrape --jsonl --progress --since 2022-01-01 twitter-search "statsmalaysia until:2022-01-20" > stats20.json

## open and save to csv
4. python > run
	import pandas as pd
	df = pd.read_json('<filename>.json', lines=True)
	df.to_csv('<new_csv_file>.csv',index=False)

df.to_csv('stats20.csv',index=False)

5. Done

##########
Reference : https://pypi.org/project/snscrape/
Video : https://photos.google.com/share/AF1QipOQLSEuYR7fQC_MWXEWEmFmSfNecmMsuRP4BISpDBmS2JvF22ouJylTPKHsHCSdtQ/photo/AF1QipMS_URv2Dh6BMMpxg8iW6zDjZiyZ9T-VONVQ-d_?key=Tm1PNEFlUl85SFZSR1F6VTJaTXp5ZnNuXzZnZHF3
