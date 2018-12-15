# CoreNLP Complete Dockerfile

## Overview
Dockerfile for creating the complete, updated version of the Stanford CoreNLP Server. 

Creates the [Stanford CoreNLP Server](http://stanfordnlp.github.io/CoreNLP/corenlp-server.html) and opens port 9000. Includes the latest github build and all updated models, which is more recent than the installable zip downloadable [on the Stanford site](http://stanfordnlp.github.io/CoreNLP/corenlp-server.html). This enables, among other things, the sentiment model. See issues with using the older zip file [here](https://github.com/stanfordnlp/CoreNLP/issues/170). For complete information on using the server, see the documentation in the first link.

## Running the server
To run the server, you need Docker installed. Run the following command (if you don't have superuser priveleges, add `sudo ` to the front of this command):

```
docker run -itd -p 9000:9000 --name corenlp graham3333/corenlp-complete
```

If running in a conjunction with other containers, modify as follows:

```
docker run -itPd --name corenlp --link other_container_name:other_container_name graham3333/corenlp-complete
```