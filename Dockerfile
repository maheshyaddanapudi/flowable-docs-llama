# Start from the atinoda/text-generation-webui base image
FROM atinoda/text-generation-webui:default

# Environment variables
ENV MODEL_NAME=zzzmahesh/Flowable-Docs-Llama-3.2-1B
ENV EXTRA_LAUNCH_ARGS="--model $MODEL_NAME"
ENV HF_HOME=/root/.cache/huggingface

# Set working directory
WORKDIR /app

# Download the model from Hugging Face into the models directory
RUN python3 download-model.py $MODEL_NAME
