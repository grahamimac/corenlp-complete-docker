# CoreNLP Complete Dockerfile

## Overview
Dockerfile for creating the complete, updated version of the Stanford CoreNLP Server. 

Creates the [Stanford CoreNLP Server](http://stanfordnlp.github.io/CoreNLP/corenlp-server.html) and opens port 9000, using the latest zip file. For complete information on using the server, see the documentation in the link above.

## Running the server
To run the server, you need Docker installed. Run the following command (if you don't have superuser priveleges, add `sudo ` to the front of this command):

```
docker run -itd -p 9000:9000 --name corenlp graham3333/corenlp-complete
```

If running in conjunction with other containers, modify as follows:

```
docker run -itPd --name corenlp --link other_container_name:other_container_name graham3333/corenlp-complete
```

## Accessing CoreNLP

The service should now be available at http://0.0.0.0:9000 on your local machine. To test that the site is up, you can run the following (from the [CoreNLP website](https://stanfordnlp.github.io/CoreNLP/corenlp-server.html)):

### Bash 
(command line prompt in windows / terminal in Mac)
If you like `wget`
```
wget --post-data 'The quick brown fox jumped over the lazy dog.' 'localhost:9000/?properties={"annotators":"tokenize,ssplit,pos","outputFormat":"json"}' -O -
```
OR if you like `curl`
```
curl --data 'The quick brown fox jumped over the lazy dog.' 'http://localhost:9000/?properties={%22annotators%22%3A%22tokenize%2Cssplit%2Cpos%22%2C%22outputFormat%22%3A%22json%22}' -o -
```

### Python 
(Make sure you've installed `requests`, on the command line using: `pip install requests`)
```
import requests
import json

params = {'properties':'{"annotators": "tokenize,ssplit,lemma,pos,ner,depparse,openie,sentiment"}'}
url = 'http://localhost:9000/'

# Get information about the sentence from CoreNLP
text = 'The quick brown fox jumped over the lazy dog.'
r = requests.post(url, data=text, params=params, timeout=60)
data = json.loads(r.text)
print(json.dumps(data, sort_keys=True,indent=4, separators=(',', ': ')))
```

### R
(Make sure you've installed `httr` using: `install.packages("httr")`)
```
library(httr)

url = 'localhost:9000/'
query = '{"annotators": "tokenize,ssplit,lemma,pos,ner,depparse,openie,sentiment"}'
text = 'The quick brown fox jumped over the lazy dog.'
r <- POST(url, query = list(properties = query), body = text, encode = "form")
content(r)
```