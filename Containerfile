ARG SOURCE_IMAGE="${SOURCE_IMAGE:-silverblue}"
ARG SOURCE_ORG="${SOURCE_ORG:-fedora-ostree-desktops}"
ARG BASE_IMAGE="quay.io/${SOURCE_ORG}/${SOURCE_IMAGE}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-39}"

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION}

ARG IMAGE_NAME="${IMAGE_NAME:-silverblue}"
ARG GPU_VENDOR="${GPU_VENDOR:-nonvidia}"
ARG IMAGE_DE="${IMAGE_DE:-silverblue}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-39}"

COPY files/ /
COPY scripts/ /scripts
COPY environment /etc
ADD certs/public_key.der /etc/pki/akmods/certs/public_key.der
ADD certs/private_key.priv /etc/pki/akmods/private/private_key.priv

RUN chmod +x /scripts/* && \
    SCRIPTS=$(/scripts/scripts.sh ${GPU_VENDOR} ${IMAGE_DE}) && \
    for script in ${SCRIPTS[@]}; do \
        echo "========== Running script: $script ==========" && \
        /scripts/$script.sh || exit 1 && \
        echo "------------ Cleaning up $script ------------" && \
        rm -rf /tmp/* /var/* && ostree container commit; done

RUN rm -rf /tmp/* /var/* /scripts && \
    ostree container commit
