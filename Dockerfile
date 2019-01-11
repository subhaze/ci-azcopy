FROM microsoft/dotnet:2.1-runtime

RUN apt-get update \
	&& apt-get install -y --no-install-recommends jq rsync wget libunwind8 gnupg2 && rm -rf /var/lib/apt/lists/* \
	&& curl -sL https://deb.nodesource.com/setup_10.x | bash - \
	&& apt-get install -y nodejs \
	&& mkdir /tmp/azcopy \
	&& wget -O /tmp/azcopy/azcopy.tar.gz https://aka.ms/downloadazcopylinux64 \
	&& tar -xf /tmp/azcopy/azcopy.tar.gz -C /tmp/azcopy \
	&& /tmp/azcopy/install.sh \
	&& rm -rf /tmp/azcopy

# add content types to azcopy
ARG MIME_TYPES_CONFIG=/usr/lib/azcopy/AzCopyConfig.json
RUN tmp=$(mktemp) && jq '.MIMETypeMapping[".svg"]="image/svg+xml"' ${MIME_TYPES_CONFIG} > "$tmp" && mv "$tmp" ${MIME_TYPES_CONFIG}
RUN cat ${MIME_TYPES_CONFIG}
