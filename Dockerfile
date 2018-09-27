FROM microsoft/dotnet:2.1-runtime

RUN apt-get update
RUN apt-get install -y --no-install-recommends rsync wget libunwind8 && rm -rf /var/lib/apt/lists/*
RUN mkdir /tmp/azcopy
RUN wget -O /tmp/azcopy/azcopy.tar.gz https://aka.ms/downloadazcopylinux64
RUN tar -xf /tmp/azcopy/azcopy.tar.gz -C /tmp/azcopy
RUN /tmp/azcopy/install.sh
RUN rm -rf /tmp/azcopy
