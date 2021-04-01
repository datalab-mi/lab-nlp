FROM ovhcom/ai-training-pytorch:1.6.0
LABEL maintainer="datalab-mi"
RUN apt-get install g++
COPY requirements.txt requirements.txt
COPY workspace/* ./
RUN pip install --no-cache-dir -r requirements.txt
