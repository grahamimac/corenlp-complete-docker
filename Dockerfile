FROM ubuntu:latest

RUN apt-get update -y && \
	apt-get install -y default-jre \
		default-idk \
		ant \
		unzip \
		wget \
		git

RUN git clone https://github.com/stanfordnlp/CoreNLP.git

RUN cd CoreNLP; ant; ant jar; cd classes; jar -cf ../stanford-corenlp.jar edu; cd ../

RUN wget http://nlp.stanford.edu/software/stanford-english-corenlp-models-current.jar

RUN export CLASSPATH="`find . -name '*.jar'`"; cd ../

WORKDIR CoreNLP

ENV PORT 9000

EXPOSE $PORT

CMD java -mx4g -cp "javanlp-core.jar:stanford-english-corenlp-models-current.jar:‌​lib/*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer