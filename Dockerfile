FROM fedora:27

ARG uid=1000
ARG usr

#COPY fedora.repo /etc/yum.repos.d/
#COPY fedora-updates.repo /etc/yum.repos.d/
#COPY fedora-updates-testing.repo /etc/yum.repos.d/

RUN yum update -y && \
    yum install -y \
      bash-completion \
      gcc \
      gcc-c++ \
      git \
      redhat-rpm-config \
      ruby-devel \
      rubygem-bundler \
      rubygem-json \
      sudo \
      zlib-devel && \
    yum clean all

COPY sudo.wheel /etc/sudoers.d/wheel
COPY start.sh /start.sh
RUN chmod 0755 /start.sh
CMD /start.sh

RUN adduser --home /home/$usr --uid $uid --groups wheel --shell /bin/bash $usr
USER $usr
WORKDIR /home/$usr
