# Start from the atinoda/text-generation-webui base image
FROM atinoda/text-generation-webui:default-cpu

# Environment variables
ENV MODEL_NAME="zzzmahesh/Flowable-Docs-Llama-3.2-1B"
ENV EXTRA_LAUNCH_ARGS="--model $MODEL_NAME"
ENV HF_HOME=/root/.cache/huggingface

# Set working directory
WORKDIR /app

RUN mkdir -p /app/models

# Set up Hugging Face authentication with HF_TOKEN
ARG HF_TOKEN

RUN python3 download-model.py $MODEL_NAME --output /app/models --auth-token $HF_TOKEN

# Optional: Clean up cache to reduce image size
RUN rm -rf $HF_HOME
