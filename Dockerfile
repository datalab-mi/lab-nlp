FROM ovhcom/ai-training-pytorch:1.6.0
LABEL maintainer="datalab-mi"

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt


