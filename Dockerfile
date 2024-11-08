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
RUN huggingface-cli login --token $HF_TOKEN

# Download the model using the Hugging Face CLI to the models directory
RUN mkdir -p $HF_HOME/models/$MODEL_NAME && \
    huggingface-cli download $MODEL_NAME --dir-use $HF_HOME/models/$MODEL_NAME

# Move model files to the expected directory for Text Generation Web UI
RUN mkdir -p /app/models/$MODEL_NAME && \
    cp -r $HF_HOME/models/$MODEL_NAME/* /app/models/$MODEL_NAME/

# Optional: Clean up cache to reduce image size
RUN rm -rf $HF_HOME
