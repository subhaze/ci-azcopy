FROM microsoft/dotnet:2.1-runtime

RUN apt-get update
RUN apt-get install -y rsync wget
RUN mkdir /tmp/azcopy
RUN wget -O /tmp/azcopy/azcopy.tar.gz https://aka.ms/downloadazcopyprlinux
RUN tar -xf /tmp/azcopy/azcopy.tar.gz -C /tmp/azcopy
RUN /tmp/azcopy/install.sh
RUN rm -rf /tmp/azcopy
