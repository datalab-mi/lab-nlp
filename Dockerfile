FROM ovhcom/ai-training-pytorch:1.6.0
LABEL maintainer="datalab-mi"

RUN apt-get install build-essential
RUN apt-get install g++
RUN wget https://github.com/facebookresearch/fastText/archive/v0.9.2.zip
RUN unzip v0.9.2.zip
WORKDIR fastText-0.9.2
RUN make

WORKDIR /workspace
COPY requirements.txt requirements.txt
COPY workspace/* ./
RUN pip install --no-cache-dir -r requirements.txt
