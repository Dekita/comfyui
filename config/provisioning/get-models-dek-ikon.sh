#!/bin/bash

# This file will be sourced in init.sh

# Define arrays of URLs for checkpoints, vaes, loras, and upscales

checkpoints_urls=(
    "https://civitai.com/api/download/models/165039"
)

vaes_urls=(
    "https://huggingface.co/madebyollin/sdxl-vae-fp16-fix/resolve/main/sdxl_vae.safetensors"
)

loras_urls=(
    "https://civitai.com/api/download/models/138250"
    "https://civitai.com/api/download/models/162231"
)

# upscales_urls=(
#     "https://example.com/upscale1"
# )

# customnode_urls=(
#     "https://github.com/ltdrdata/ComfyUI-Manager.git"
# )


# Define destination directories for each type
base_dir="/opt/ComfyUI"
models_dir="${base_dir}/models"
customnode_dir="${base_dir}/custom_nodes"
checkpoints_dir="${models_dir}/checkpoints"
vae_dir="${models_dir}/vae"
loras_dir="${models_dir}/loras"
upscale_dir="${models_dir}/upscale_models"


# Function to download files and place them in the appropriate directories
function download_and_place() {
    url_array_name=$1[@]
    urls=("${!url_array_name}")
    dest_dir=$2

    mkdir -p "$dest_dir"

    for url in "${urls[@]}"; do
        filename=$(basename "$url")
        wget -q --show-progress -P "$dest_dir" "$url"
    done
}

# Download and place files for each type
download_and_place checkpoints_urls checkpoints_dir
download_and_place vaes_urls vae_dir
download_and_place loras_urls loras_dir
# download_and_place upscales_urls upscale_dir
# download_and_place customnode_urls customnode_dir
