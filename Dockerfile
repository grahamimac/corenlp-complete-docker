FROM ubuntu:latest

RUN apt-get update -y && \
	apt-get install -y apt-utils \
		default-jre \
		default-jdk \
		ant \
		unzip \
		wget \
		git

RUN export REL_DATE="2018-10-05"; \
	wget http://nlp.stanford.edu/software/stanford-corenlp-full-${REL_DATE}.zip; \
	unzip stanford-corenlp-full-${REL_DATE}.zip; \
	mv stanford-corenlp-full-${REL_DATE} CoreNLP; \
	cd CoreNLP; \
	export CLASSPATH=""; for file in `find . -name "*.jar"`; do export CLASSPATH="$CLASSPATH:`realpath $file`"; done

ENV PORT 9000

EXPOSE 9000

WORKDIR CoreNLP

CMD java -cp '*' -mx4g edu.stanford.nlp.pipeline.StanfordCoreNLPServer