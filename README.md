# Flowable Docs LLaMA Model - Docker Image

This repository hosts a Docker image that extends the [`atinoda/text-generation-webui`](https://hub.docker.com/r/atinoda/text-generation-webui) base image for deploying the `zzzmahesh/Flowable-Docs-Llama-3.2-1B` model on Hugging Face. This containerized setup allows for easy model deployment with the `text-generation-webui` interface, mapping the web port for accessing the model's web interface.

## Dockerfile Overview

The Dockerfile starts from the `atinoda/text-generation-webui` base image and configures it to:
- Set up environment variables for the model name and Hugging Face cache.
- Download the model from the Hugging Face Hub.
- Make the model available to the `text-generation-webui` so it can be served via a web interface.

## Setup and Usage

### Prerequisites

- Install [Docker](https://docs.docker.com/get-docker/) on your machine.
- Make sure you have network access to the Hugging Face model repository (`zzzmahesh/Flowable-Docs-Llama-3.2-1B`) to download the model.

### Building the Docker Image

Clone this repository and navigate into the project directory:

```bash
git clone https://github.com/your-username/flowable-llama-docker.git
cd flowable-llama-docker
```

To build the Docker image, run:

```bash
docker build -t flowable-llama-webui .
```

This command builds the Docker image and tags it as `flowable-llama-webui`.

### Running the Docker Container

To start a container and map the web interface to a port on your local machine, use the following command:

```bash
docker run -p 7860:7860 flowable-llama-webui
```

In this example, port `7860` on your host will map to the web interface port on the container, allowing you to access the model interface at `http://localhost:7860`.

### Environment Variables

- `MODEL_NAME`: Sets the Hugging Face model path (`zzzmahesh/Flowable-Docs-Llama-3.2-1B`).
- `EXTRA_LAUNCH_ARGS`: Additional launch arguments for the web interface. The `--model` argument is set to the `MODEL_NAME`.
- `HF_HOME`: Sets the cache directory for Hugging Face.

### Example Usage

After running the container, you can access the text generation web UI interface through your browser at `http://localhost:7860`.

## License

This repository is licensed under the MIT License. See the [LICENSE](https://github.com/maheshyaddanapudi/flowable-docs-llama/blob/main/LICENSE) file for details.
