FROM registry.access.redhat.com/ubi9/python-39:1-172
WORKDIR /app
LABEL maintainer=arthurbsi@gmail.com \
      io.k8s.display-name="chat using Ollama AI" \
      summary="ollama.ai - tool for running LLMs locally"

USER root
RUN dnf -y update \
    && dnf install -y --nodocs pip \
    && dnf clean all && rm -rf /var/cache/*


ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

USER root
RUN pip install openai pip install streamlit
COPY app.py .

EXPOSE 8080
ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8080", "--server.address=0.0.0.0"]
