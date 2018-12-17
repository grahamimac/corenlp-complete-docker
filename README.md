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