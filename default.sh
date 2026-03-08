#!/bin/bash

source /venv/main/bin/activate
COMFYUI_DIR=${WORKSPACE}/ComfyUI

# Packages are installed after nodes so we can fix them...

APT_PACKAGES=(
    #"package-1"
    #"package-2"
)

PIP_PACKAGES=(
    #"package-1"
    #"package-2"
)

NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack"
    "https://github.com/ltdrdata/ComfyUI-Impact-Subpack"
    "https://github.com/ltdrdata/ComfyUI-Inspire-Pack"
    "https://github.com/Koishi-Star/Euler-Smea-Dyn-Sampler"
    "https://github.com/jags111/efficiency-nodes-comfyui"
    "https://github.com/LEv145/images-grid-comfy-plugin"
    "https://github.com/pythongosssss/ComfyUI-Custom-Scripts"
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale"
    "https://github.com/JPS-GER/ComfyUI_JPS-Nodes"
    "https://github.com/ltdrdata/comfyui-unsafe-torch"
    "https://github.com/rgthree/rgthree-comfy"
    "https://github.com/kijai/ComfyUI-KJNodes"
    "https://github.com/misov1/ComfyUI-image-size-templet"
    "https://github.com/PozzettiAndrea/ComfyUI-SAM3"
    "https://github.com/newtextdoc1111/ComfyUI-Autocomplete-Plus"
    "https://github.com/ltdrdata/was-node-suite-comfyui"
    "https://github.com/bedovyy/ComfyUI_NAIDGenerator"
    "https://github.com/NyaamZ/efficiency-nodes-ED"
    # Smooth Mix Wan 2.2 node
    "https://github.com/melMass/comfy_mtb"
    "https://github.com/Fannovel16/ComfyUI-Frame-Interpolation"
    "https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite"
    "https://github.com/city96/ComfyUI-GGUF"
    "https://github.com/kijai/ComfyUI-Florence2"
    "https://github.com/yolain/ComfyUI-Easy-Use"
    "https://github.com/Smirnov75/ComfyUI-mxToolkit"
    "https://github.com/KLL535/ComfyUI_PNGInfo_Sidebar"
    "https://github.com/AlekPet/ComfyUI_Custom_Nodes_AlekPet"
    "https://github.com/chrisgoringe/cg-use-everywhere"
    "https://github.com/stavsap/comfyui-ollama"
    "https://github.com/pollockjj/ComfyUI-MultiGPU"
    "https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes"
    "https://github.com/jamesWalker55/comfyui-various"
    "https://github.com/orssorbit/ComfyUI-wanBlockswap"
    "https://github.com/royceschultz/ComfyUI-Notifications"
    "https://github.com/chflame163/ComfyUI_LayerStyle"
)

WORKFLOWS=(
)

CHECKPOINT_MODELS=(
#    "https://huggingface.co/baqu2213/PoemForSmallFThings/resolve/main/NAI-XL_vpred1.0_2dac_colorized.safetensors" # NoobAI-XL custom merge model
#    "https://huggingface.co/ChenkinNoob/ChenkinNoob-XL-V0.2/resolve/main/ChenkinNoob-XL-V0.2.safetensors" # ChenkinNoob-XL V0.2
#    "https://huggingface.co/IbarakiDouji/WAI-NSFW-illustrious-SDXL/resolve/main/waiIllustriousSDXL_v160.safetensors" # WAI-NSFW-ilXL v16
#    "https://civitai.com/api/download/models/2620839?type=Model&format=SafeTensor&size=full&fp=bf16" # dXjmX-illus x8
    "https://huggingface.co/baqu2213/PoemForSmallFThings/resolve/main/NAI-XL_vpred1.0_2dac_colorized_style2.safetensors" # NoobAI-XL custom merge model+ color 2D Str
)

UNET_MODELS=(
# Anima model
    "https://huggingface.co/circlestone-labs/Anima/resolve/main/split_files/diffusion_models/anima-preview.safetensors" # Anima Previeew"

# wan 2.2 models
    "https://civitai.com/api/download/models/2555640?type=Model&format=SafeTensor&size=full&fp=fp8" #dasiwa v9 High
    "https://civitai.com/api/download/models/2555652?type=Model&format=SafeTensor&size=full&fp=fp8" #dasiwa v9 Low
#    "https://civitai.com/api/download/models/2513182?type=Model&format=SafeTensor&size=pruned&fp=fp8" #smooth v2.0 High
#    "https://civitai.com/api/download/models/2513186?type=Model&format=SafeTensor&size=pruned&fp=fp8" #smooth v2.0 Low

# LLM models
    "https://huggingface.co/llmfan46/Qwen3.5-35B-A3B-heretic-v2-GGUF/resolve/main/Qwen3.5-35B-A3B-heretic-v2-Q6_K.gguf" # Qwen3.5-35B-A3B-heretic-v2
)

TEXT_ENCODERS=(
    "https://huggingface.co/chatpig/encoder/resolve/main/umt5_xxl_fp8_e4m3fn_scaled.safetensors" # Wan 2.2 text encoder
    "https://huggingface.co/circlestone-labs/Anima/blob/main/split_files/text_encoders/qwen_3_06b_base.safetensors" # Anime text encoder by qwen
)

CLIP_VISION=(
    "https://huggingface.co/calcuis/wan-gguf/resolve/f52f5a1f0ba441d50277fb7cdd7c1b36611837f9/clip_vision_h.safetensors"
)

SAMS=(
    "https://huggingface.co/geauxeric/sam/resolve/main/sam_vit_b_01ec64.safetensors"
)

BBOX=(
    "https://huggingface.co/lmz/candle-yolo-v8/resolve/main/yolov8m.safetensors"
)

LORA_MODELS=(
# SDXL Lora
    "https://civitai.com/api/download/models/2032913?type=Model&format=SafeTensor" # ebora style lora
    "https://civitai.com/api/download/models/2078007?type=Model&format=SafeTensor" # qiandaiyiyu style lora
    "https://civitai.com/api/download/models/2132494?type=Model&format=SafeTensor" # BlueArchive Cutscene style
    "https://civitai.com/api/download/models/2116446?type=Model&format=SafeTensor" # 3D Virtual Anime style
    "https://civitai.com/api/download/models/1555533?type=Model&format=SafeTensor" # Nyalia style lora based noobAI

# Anime Lora
    "https://civitai.com/api/download/models/2680198?type=Model&format=SafeTensor" # Kieed style
    "https://civitai.com/api/download/models/2663471?type=Model&format=SafeTensor" # Ai style dump
    "https://huggingface.co/vita-video-gen/svi-model/resolve/main/version-2.0/SVI_Wan2.2-I2V-A14B_high_noise_lora_v2.0_pro.safetensors"
    "https://huggingface.co/vita-video-gen/svi-model/resolve/main/version-2.0/SVI_Wan2.2-I2V-A14B_low_noise_lora_v2.0_pro.safetensors"

# Wan2.2 Lora
#    "https://civitai.com/api/download/models/2209354?type=Model&format=SafeTensor" # wan2.2 high bounce lora
#    "https://civitai.com/api/download/models/2209344?type=Model&format=SafeTensor" # wan2.2 low bounce lora
)

VAE_MODELS=(
    "https://huggingface.co/calcuis/wan-gguf/resolve/2f41e77bfc957eab2020821463d0cd7b15804bb9/wan_2.1_vae.safetensors" # wan vae
    "https://huggingface.co/misov/vast_used/resolve/main/MS_DPipe_fp32_112k_Anime_VAE_SDXL.safetensors" # SDLX vae from Anzhc DPip
    "https://huggingface.co/circlestone-labs/Anima/blob/main/split_files/vae/qwen_image_vae.safetensors" # Anime vae by qwen
)

UPSCALE_MODELS=(
    "https://huggingface.co/Kim2091/2x-AnimeSharpV4/resolve/1a9339b5c308ab3990f6233be2c1169a75772878/2x-AnimeSharpV4_RCAN.safetensors"
    "https://huggingface.co/Kim2091/UltraSharpV2/resolve/main/4x-UltraSharpV2.safetensors"
)

CONTROLNET_MODELS=(
)

ESRGAN_MODELS=(
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    provisioning_print_header
    provisioning_get_apt_packages
    provisioning_get_nodes
    provisioning_get_pip_packages
    provisioning_get_files \
        "${COMFYUI_DIR}/models/checkpoints" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/unet" \
        "${UNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/loras" \
        "${LORA_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/upscale_models" \
        "${UPSCALE_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/text_encoders" \
        "${TEXT_ENCODERS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/clip_vision" \
        "${CLIP_VISION[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/sams" \
        "${SAMS[@]}"
    provisioning_get_files \
        "${COMFYUI_DIR}/models/ultralytics/bbox" \
        "${BBOX[@]}"
    provisioning_print_end
}

function provisioning_get_apt_packages() {
    if [[ -n $APT_PACKAGES ]]; then
            sudo $APT_INSTALL ${APT_PACKAGES[@]}
    fi
}

function provisioning_get_pip_packages() {
    if [[ -n $PIP_PACKAGES ]]; then
            pip install --no-cache-dir ${PIP_PACKAGES[@]}
    fi
}

function provisioning_get_nodes() {
    for repo in "${NODES[@]}"; do
        dir="${repo##*/}"
        path="${COMFYUI_DIR}/custom_nodes/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating node: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                   pip install --no-cache-dir -r "$requirements"
                fi
            fi
        else
            printf "Downloading node: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                pip install --no-cache-dir -r "${requirements}"
            fi
        fi
    done
}

function provisioning_get_files() {
    if [[ -z $2 ]]; then return 1; fi
    
    dir="$1"
    mkdir -p "$dir"
    shift
    arr=("$@")
    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
    for url in "${arr[@]}"; do
        printf "Downloading: %s\n" "${url}"
        provisioning_download "${url}" "${dir}"
        printf "\n"
    done
}

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Application will start now\n\n"
}

function provisioning_has_valid_hf_token() {
    [[ -n "$HF_TOKEN" ]] || return 1
    url="https://huggingface.co/api/whoami-v2"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $HF_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

function provisioning_has_valid_civitai_token() {
    [[ -n "$CIVITAI_TOKEN" ]] || return 1
    url="https://civitai.com/api/v1/models?hidden=1&limit=1"

    response=$(curl -o /dev/null -s -w "%{http_code}" -X GET "$url" \
        -H "Authorization: Bearer $CIVITAI_TOKEN" \
        -H "Content-Type: application/json")

    # Check if the token is valid
    if [ "$response" -eq 200 ]; then
        return 0
    else
        return 1
    fi
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    local auth_token=""
    local url="$1"

    if [[ -n $HF_TOKEN && $url =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
        auth_token="$HF_TOKEN"
    elif [[ -n $CIVITAI_TOKEN && $url =~ ^https://([a-zA-Z0-9_-]+\.)?civitai\.com(/|$|\?) ]]; then
        auth_token="$CIVITAI_TOKEN"
    fi

    if [[ -n $auth_token ]]; then
        # CivitAI: 리다이렉트 시 헤더가 유실되므로 URL 쿼리 파라미터로 토큰 전달
        if [[ $url =~ civitai\.com ]]; then
            if [[ $url =~ \? ]]; then
                url="${url}&token=${auth_token}"
            else
                url="${url}?token=${auth_token}"
            fi
            wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$url"
        else
            # HuggingFace: Bearer 헤더 방식
            wget --header="Authorization: Bearer $auth_token" -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$url"
        fi
    else
        wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$url"
    fi
}

# Allow user to disable provisioning if they started with a script they didn't want
if [[ ! -f /.noprovisioning ]]; then
    provisioning_start
fi
