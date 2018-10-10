FROM fedora

USER root

RUN dnf -y install buildah
COPY buildah /

COPY storage.conf /etc/containers/storage.conf
COPY create-dockerfile.sh /
COPY build-image.sh /
COPY knative-build-s2i.sh /

ENV BUILDAH_ISOLATION chroot
#ENV STORAGE_DRIVER vfs

ENTRYPOINT [ "/knative-build-s2i.sh" ]
#CMD "/bin/bash"

