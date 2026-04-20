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
    "https://github.com/1038lab/ComfyUI-RMBG"
    "https://github.com/newtextdoc1111/ComfyUI-Autocomplete-Plus"
    "https://github.com/ltdrdata/was-node-suite-comfyui"
    "https://github.com/bedovyy/ComfyUI_NAIDGenerator"
    "https://github.com/yolain/ComfyUI-Easy-Use"
    "https://github.com/AlekPet/ComfyUI_Custom_Nodes_AlekPet"
    "https://github.com/stavsap/comfyui-ollama"
    "https://github.com/jtydhr88/ComfyUI-Workflow-Encrypt"
    "https://github.com/NyaamZ/efficiency-nodes-ED"
    # Smooth Mix Wan 2.2 node
#    "https://github.com/melMass/comfy_mtb"
#    "https://github.com/Fannovel16/ComfyUI-Frame-Interpolation"
#    "https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite"
#    "https://github.com/city96/ComfyUI-GGUF"
#    "https://github.com/kijai/ComfyUI-Florence2"
#    "https://github.com/yolain/ComfyUI-Easy-Use"
#    "https://github.com/Smirnov75/ComfyUI-mxToolkit"
#    "https://github.com/KLL535/ComfyUI_PNGInfo_Sidebar"
#    "https://github.com/AlekPet/ComfyUI_Custom_Nodes_AlekPet"
#    "https://github.com/chrisgoringe/cg-use-everywhere"
#    "https://github.com/stavsap/comfyui-ollama"
#    "https://github.com/pollockjj/ComfyUI-MultiGPU"
#    "https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes"
#    "https://github.com/jamesWalker55/comfyui-various"
#    "https://github.com/orssorbit/ComfyUI-wanBlockswap"
#    "https://github.com/royceschultz/ComfyUI-Notifications"
#    "https://github.com/chflame163/ComfyUI_LayerStyle"
)

WORKFLOWS=(
)

CHECKPOINT_MODELS=(
#    "https://huggingface.co/baqu2213/PoemForSmallFThings/resolve/main/NAI-XL_vpred1.0_2dac_colorized.safetensors" # NoobAI-XL custom merge model
#    "https://huggingface.co/ChenkinNoob/ChenkinNoob-XL-V0.2/resolve/main/ChenkinNoob-XL-V0.2.safetensors" # ChenkinNoob-XL V0.2
#    "https://huggingface.co/IbarakiDouji/WAI-NSFW-illustrious-SDXL/resolve/main/waiIllustriousSDXL_v160.safetensors" # WAI-NSFW-ilXL v16
#    "https://civitai.com/api/download/models/2620839?type=Model&format=SafeTensor&size=full&fp=bf16" # dXjmX-illus x8
    "https://huggingface.co/baqu2213/PoemForSmallFThings/resolve/main/NAI-XL_vpred1.0_2dac_colorized_style2.safetensors" # NoobAI-XL custom merge model+ color 2D Str

# Anima model
    "https://huggingface.co/circlestone-labs/Anima/resolve/main/split_files/diffusion_models/anima-preview3-base.safetensors" # Anima Preview
#    "https://huggingface.co/misov/provisioning/resolve/main/animayume_v03.safetensors" # AnimaYume
)

UNET_MODELS=(
# wan 2.2 models
#    "https://civitai.com/api/download/models/2555640?type=Model&format=SafeTensor&size=full&fp=fp8" #dasiwa v9 High
#    "https://civitai.com/api/download/models/2555652?type=Model&format=SafeTensor&size=full&fp=fp8" #dasiwa v9 Low
#    "https://civitai.com/api/download/models/2513182?type=Model&format=SafeTensor&size=pruned&fp=fp8" #smooth v2.0 High
#    "https://civitai.com/api/download/models/2513186?type=Model&format=SafeTensor&size=pruned&fp=fp8" #smooth v2.0 Low

)

TEXT_ENCODERS=(
#    "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/umt5-xxl-enc-bf16.safetensors" # Wan 2.2 text encoder
    "https://huggingface.co/circlestone-labs/Anima/resolve/main/split_files/text_encoders/qwen_3_06b_base.safetensors" # Anima text encoder by qwen
)

CLIP_VISION=(
#    "https://huggingface.co/calcuis/wan-gguf/resolve/f52f5a1f0ba441d50277fb7cdd7c1b36611837f9/clip_vision_h.safetensors"
)

SAMS=(
    "https://huggingface.co/geauxeric/sam/resolve/main/sam_vit_b_01ec64.safetensors"
)

BBOX=(
    "https://huggingface.co/lmz/candle-yolo-v8/resolve/main/yolov8m.safetensors"
)

LORA_MODELS=(
# SDXL Lora
    "https://huggingface.co/misov/provisioning/resolve/main/Ebora_Style_Lora_Epoch10.safetensors" # ebora style lora
    "https://huggingface.co/misov/provisioning/resolve/main/qiandaiyiyu_style.safetensors" # qiandaiyiyu style lora
    "https://huggingface.co/misov/provisioning/resolve/main/BlueArchive-000008.safetensors" # BlueArchive Cutscene style
    "https://huggingface.co/misov/provisioning/resolve/main/anime3dv2-000009.safetensors" # 3D Virtual Anime style
    "https://huggingface.co/misov/provisioning/resolve/main/nyaliaXL_NBVP1_lokr_V6311PZ.safetensors" # Nyalia style lora based noobAI

# Anime Lora
    "https://huggingface.co/misov/provisioning/resolve/main/mixed_styles_anima_preview2_v3.safetensors" # Ai style dump
    "https://huggingface.co/misov/provisioning/resolve/main/anima_preview2_nineng8_1536_512_2026_03_14-000001.safetensors"
    "https://huggingface.co/misov/provisioning/resolve/main/QUANTUMAIQUARTET_Anima-preview_adapter_model_epoch12.safetensors"
    "https://huggingface.co/misov/provisioning/resolve/main/anima-highres-aesthetic-boost.safetensors"
    "https://huggingface.co/misov/provisioning/resolve/main/toridamonostyle.safetensors"
    "https://huggingface.co/misov/provisioning/resolve/main/BlueArcStyle.safetensors"

# Wan2.2 Lora
#    "https://huggingface.co/vita-video-gen/svi-model/resolve/main/version-2.0/SVI_Wan2.2-I2V-A14B_high_noise_lora_v2.0_pro.safetensors"
#    "https://huggingface.co/vita-video-gen/svi-model/resolve/main/version-2.0/SVI_Wan2.2-I2V-A14B_low_noise_lora_v2.0_pro.safetensors"
)

VAE_MODELS=(
#    "https://huggingface.co/DeepBeepMeep/Wan2.1/resolve/4da0bbfdad01e159633083e98be7f93d8b8c9562/Wan2.1_VAE_bf16.safetensors" # wan vae
    "https://huggingface.co/misov/vast_used/resolve/main/MS_DPipe_fp32_112k_Anime_VAE_SDXL.safetensors" # SDXL vae from Anzhc DPip
    "https://huggingface.co/circlestone-labs/Anima/resolve/main/split_files/vae/qwen_image_vae.safetensors" # Anime vae by qwen
    "https://huggingface.co/Anzhc/Qwen2D-VAE/resolve/main/Qwen2D_VAE.safetensors" # Anzhc custom Anima vae
)

UPSCALE_MODELS=(
    "https://huggingface.co/Kim2091/2x-AnimeSharpV4/resolve/1a9339b5c308ab3990f6233be2c1169a75772878/2x-AnimeSharpV4_RCAN.safetensors"
#    "https://huggingface.co/Kim2091/UltraSharpV2/resolve/main/4x-UltraSharpV2.safetensors"
)

# [DISABLED] ollama가 qwen35 아키텍처를 지원하면 주석 해제
# LLM_MODELS=(
#     "https://huggingface.co/llmfan46/Qwen3.5-27B-heretic-v2-GGUF/resolve/main/Qwen3.5-27B-heretic-v2-Q6_K.gguf" # Qwen3.5-27B heretic v2 Q6_K
#     "https://huggingface.co/llmfan46/Qwen3.5-27B-heretic-v2-GGUF/resolve/main/Qwen3.5-27B-mmproj-BF16.gguf" # Qwen3.5-27B vision projector (mmproj)
# )

#OLLAMA_MODEL="huihui_ai/qwen3-vl-abliterated:8b-instruct"

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
    # [DISABLED] ollama가 qwen35 아키텍처를 지원하면 주석 해제
    # provisioning_get_files \
    #     "${COMFYUI_DIR}/models/LLM" \
    #     "${LLM_MODELS[@]}"
#    provisioning_setup_ollama
    provisioning_install_sageattention
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

function provisioning_install_sageattention() {
    printf "Checking SageAttention installation...\n"

    # 환경 진단
    python -c "import torch; print(f'torch={torch.__version__}, cuda={torch.version.cuda}, cap={torch.cuda.get_device_capability()}')"

    # SageAttention 2.2의 sm120 FP8 (sv_f8_accum_f16) 심볼 확인
    if python -c "
import sageattention
syms = dir(sageattention)
ok = any('sm120' in s or ('fp8' in s.lower() and 'sm89' not in s) for s in syms)
assert ok, 'no sm120/fp8 kernels found'
print('OK:', [s for s in syms if 'fp8' in s.lower() or 'sm120' in s])
" 2>/dev/null; then
        printf "SageAttention with sm120 kernels already available, skipping...\n"
        return 0
    fi

    printf "Removing any existing SageAttention...\n"
    pip uninstall sageattention -y 2>/dev/null || true

    # 1차: Kijai prebuilt wheel (Linux/cp312/cu128 base, sm120 포함)
    local WHEEL_URL="https://huggingface.co/Kijai/PrecompiledWheels/resolve/main/sageattention-2.2.0-cp312-cp312-linux_x86_64.whl"
    printf "Trying prebuilt wheel from Kijai/PrecompiledWheels...\n"
    if pip install --no-cache-dir "$WHEEL_URL"; then
        printf "Prebuilt wheel installed.\n"
    else
        # 2차: woct0rdho 포크 소스 빌드 fallback
        printf "Prebuilt failed, falling back to source build (woct0rdho fork)...\n"
        TORCH_CUDA_ARCH_LIST="12.0+PTX" \
        FORCE_CUDA=1 \
        MAX_JOBS=4 \
        pip install --no-cache-dir --no-build-isolation -v \
            "git+https://github.com/woct0rdho/SageAttention.git"
    fi

    # 검증: 실제 GPU에서 sm120 경로 호출 통과 확인
    python -c "
import torch, sageattention
print('version:', getattr(sageattention, '__version__', 'unknown'))
print('symbols:', [s for s in dir(sageattention) if 'fp8' in s.lower() or 'sm120' in s])
q = torch.randn(2, 8, 128, 64, dtype=torch.float16, device='cuda')
k = torch.randn(2, 8, 128, 64, dtype=torch.float16, device='cuda')
v = torch.randn(2, 8, 128, 64, dtype=torch.float16, device='cuda')
out = sageattention.sageattn(q, k, v)
print('smoke test OK, out.shape =', tuple(out.shape))
"
    printf "SageAttention installation complete.\n"
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

#function provisioning_setup_ollama() {
#    printf "Setting up Ollama...\n"

    # ollama 설치 (이미 설치되어 있으면 스킵)
#    if ! command -v ollama &> /dev/null; then
#        printf "Installing Ollama...\n"
#        curl -fsSL https://ollama.com/install.sh | sh
#    else
#        printf "Ollama already installed, skipping...\n"
#    fi

    # 프로비저닝 중 임시로 ollama 서버 시작 (CPU only, ComfyUI GPU 충돌 방지)
#    if ! pgrep -x "ollama" > /dev/null; then
#        CUDA_VISIBLE_DEVICES="" ollama serve &
#        local ollama_pid=$!
#        sleep 3
#    fi

    # ollama pull로 모델 다운로드 (CPU 모드라 pull만 수행, 실행은 안 함)
#    if ! ollama list 2>/dev/null | grep -q "${OLLAMA_MODEL%%:*}"; then
#        printf "Pulling Ollama model: %s\n" "${OLLAMA_MODEL}"
#        ollama pull "${OLLAMA_MODEL}"
#        printf "Ollama model pulled successfully.\n"
#    else
#        printf "Ollama model '%s' already exists, skipping...\n" "${OLLAMA_MODEL}"
#    fi

    # 임시 서버 종료 후 GPU 모드로 재시작
#    pkill -x ollama 2>/dev/null
#    sleep 2
#    ollama serve &
#    sleep 3
#    printf "Ollama restarted with GPU mode\n"

    # [DISABLED] ollama가 qwen35 아키텍처를 지원하면 아래 주석 해제하고 위 ollama pull 블록 주석처리
    # local gguf_path="${COMFYUI_DIR}/models/LLM/Qwen3.5-27B-heretic-v2-Q6_K.gguf"
    # local mmproj_path="${COMFYUI_DIR}/models/LLM/Qwen3.5-27B-mmproj-BF16.gguf"
    # if [[ -f "$gguf_path" ]]; then
    #     if ! ollama list 2>/dev/null | grep -q "heretic"; then
    #         printf "Registering GGUF model to Ollama...\n"
    #         local modelfile_content="FROM ${gguf_path}\nPARAMETER temperature 0.7\nPARAMETER num_ctx 8192"
    #         if [[ -f "$mmproj_path" ]]; then
    #             modelfile_content="FROM ${gguf_path}\nADAPTER ${mmproj_path}\nPARAMETER temperature 0.7\nPARAMETER num_ctx 8192"
    #             printf "mmproj found - vision/image recognition enabled!\n"
    #         fi
    #         echo -e "$modelfile_content" > /tmp/Modelfile
    #         ollama create heretic -f /tmp/Modelfile
    #         rm -f /tmp/Modelfile
    #         printf "Ollama model 'heretic' registered.\n"
    #         local blob_size=$(du -sb /root/.ollama/models/blobs/ 2>/dev/null | tail -1 | awk '{print $1}')
    #         local gguf_size=$(stat -c%s "$gguf_path" 2>/dev/null || echo 0)
    #         if [[ $blob_size -ge $gguf_size ]] && [[ $blob_size -gt 0 ]]; then
    #             printf "Blob copy confirmed (%s bytes). Removing original GGUF files...\n" "$blob_size"
    #             rm -f "$gguf_path"
    #             rm -f "$mmproj_path"
    #         else
    #             printf "WARNING: Blob size mismatch. Keeping original GGUF files.\n"
    #         fi
    #     else
    #         printf "Ollama model 'heretic' already exists, skipping...\n"
    #     fi
    # else
    #     if ollama list 2>/dev/null | grep -q "heretic"; then
    #         printf "Ollama model 'heretic' already registered, GGUF already cleaned up.\n"
    #     else
    #         printf "Warning: GGUF file not found at %s, skipping Ollama model registration.\n" "$gguf_path"
    #     fi
    # fi
    #}

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
