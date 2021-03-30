FROM ovhcom/ai-training-pytorch:1.6.0
LABEL maintainer="datalab-mi"

COPY requirements.txt ./
RUN pip install -r -y --no-cache-dir requirements.txt


