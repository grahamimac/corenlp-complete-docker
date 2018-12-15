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

RUN cd /CoreNLP; ant; ant jar

RUN cd /CoreNLP/classes; jar -cf ../stanford-corenlp.jar edu; cd /CoreNLP

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-models-current.jar -O /CoreNLP/stanford-corenlp-models-current.jar

WORKDIR CoreNLP

ENV PORT 9000

EXPOSE 9000

CMD java -cp '/CoreNLP/javanlp-core.jar:/CoreNLP/stanford-corenlp-models-current.jar:/CoreNLP/lib/*:/CoreNLP/liblocal/*:/CoreNLP/gradle/wrapper/*:/CoreNLP/libsrc/*:/CoreNLP/stanford-corenlp.jar' -mx4g edu.stanford.nlp.pipeline.StanfordCoreNLPServer