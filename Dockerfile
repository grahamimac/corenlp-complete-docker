FROM ubuntu:latest

RUN apt-get update -y && \
	apt-get install -y apt-utils \
		default-jre \
		default-jdk \
		ant \
		unzip \
		wget \
		git

RUN git clone https://github.com/stanfordnlp/CoreNLP.git

RUN cd /CoreNLP; ant

RUN cd /CoreNLP/classes; jar -cf ../stanford-corenlp.jar edu; cd /CoreNLP

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-models-current.jar -O /CoreNLP/stanford-corenlp-models-current.jar && \
	wget http://nlp.stanford.edu/software/stanford-english-corenlp-models-current.jar -O /CoreNLP/stanford-english-corenlp-models-current.jar && \
	wget http://nlp.stanford.edu/software/stanford-english-kbp-corenlp-models-current.jar -O /CoreNLP/stanford-english-kbp-corenlp-models-current.jar

WORKDIR CoreNLP

RUN export CLASSPATH=""; for file in `find /CoreNLP -name "*.jar"`; do export CLASSPATH="$CLASSPATH:`realpath $file`"; done

ENV PORT 9000

EXPOSE 9000

CMD java -cp '*' -mx4g edu.stanford.nlp.pipeline.StanfordCoreNLPServer