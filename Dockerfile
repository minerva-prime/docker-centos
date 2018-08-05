FROM centos:5.11

LABEL maintainer="omer@minerva.sh"
LABEL github="https://github.com/minerva-prime/docker-centos"
LABEL dockerhub="https://cloud.docker.com/swarm/minervaprime/repository/registry-1.docker.io/minervaprime/centos/general"

# Clean yum repos due to EOL
WORKDIR /etc/yum.repos.d
RUN for i in `ls  | grep -v Base`; do mv $i /mnt ; done
RUN printf '[base]\nname=CentOS-$releasever - Base\nbaseurl=http://vault.centos.org/5.11/os/$basearch\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5\n' > /etc/yum.repos.d/CentOS-Base.repo

# Install build tools
RUN yum install -y gcc gcc-c++ make

# Make application folder
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Build
#RUN make

CMD [ "/bin/bash" ]
