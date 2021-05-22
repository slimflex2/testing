FROM centos:7

LABEL Fuchi Corp <fuchicorpsolution@gmail.com>

## Version of the Docker
ENV DOCKER_VERSION=18.03.1-ce
ENV TERRAFORM_VERSION=0.11.15
ENV HELM_VERSION=v2.14.0
ENV KUBECTL_VERSION=v1.13.0

## Installing wget, vim,telnet, git 
RUN yum install wget vim telnet git -y && yum clean all

##Installing helm 
RUN curl "https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz" > ./helm.tar.gz \
    && tar -xvf ./helm.tar.gz \
    && mv ./linux-amd64/*  /usr/local/bin \
    && rm helm.tar.gz

## Installing terraform
RUN wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" \
    && yum install unzip -y \
    && unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" \
    && rm -rf  "terraform_${TERRAFORM_VERSION}_linux_amd64.zip" \
    && mv terraform /bin

## Download docker cli
RUN curl -fsSLO "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" \
  && tar xzvf "docker-${DOCKER_VERSION}.tgz" --strip 1 -C /usr/local/bin docker/docker \
  && rm "docker-${DOCKER_VERSION}.tgz"

# Downloading gcloud package
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh \
  && rm /tmp/google-cloud-sdk.tar.gz
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

## Install kubectl
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl \
    && mkdir ~/.kube

## Coping the script to set kube config
COPY . /scripts/Dockerfile/

## Running the script to set ~/.kube/config file
CMD su - root -c "sh /scripts/Dockerfile/set-config.sh"
