# CoreNLP Complete Dockerfile

## Overview
Dockerfile for creating the complete, updated version of the Stanford CoreNLP Server. 

Creates the [Stanford CoreNLP Server](http://stanfordnlp.github.io/CoreNLP/corenlp-server.html) and opens port 9000. Includes the latest github build and all updated models, which is more recent than the installable zip downloadable [on the Stanford site](http://stanfordnlp.github.io/CoreNLP/corenlp-server.html). This enables, among other things, the sentiment model. See issues with using the older zip file [here](https://github.com/stanfordnlp/CoreNLP/issues/170). For complete information on using the server, see the documentation in the first link.

#### Do you need the advanced models?
If you do not need the more advanced models, and are fine with the CoreNLP basics, this build may not be for you. If that's the case, I recommend you check out [Motiz88's build](https://github.com/motiz88/corenlp-docker), as this build includes 1.5 GB of extra files and takes additional time to build. If not, read on.

## Running the server
To run the server and connect it to another Docker container, run the following:

```
docker run -itPd --name name_the_container --link other_container_name:other_container_name graham3333/corenlp-complete
```

## Potential Issues
Note that in the Dockerfile, the CLASSPATH environment variable is hardcoded, which may present issues as CoreNLP is updated. To check that the environemnt variable is the latest, in a bash script, use:

```
export CLASSPATH="`find . -name '*.jar'`"
echo $CLASSPATH
```

The output should match the Dockerfile. If it does not, update the Dockerfile with the new CLASSPATH.