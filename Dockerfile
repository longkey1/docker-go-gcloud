FROM longkey1/gcp:latest

# Executable appcfg.py
ENV PATH /usr/lib/google-cloud-sdk/platform/google_appengine:${PATH}
RUN chmod +x /usr/lib/google-cloud-sdk/platform/google_appengine/appcfg.py

# Set Go Version
ENV GO_VERSION 1.12.17

# Set goroot
ENV GOROOT /opt/go
RUN cd /tmp && wget https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz && tar xzvf go${GO_VERSION}.linux-amd64.tar.gz && mv go ${GOROOT}
ENV PATH ${GOROOT}/bin:${PATH}

# Set gopath
ENV GOPATH /work
RUN mkdir -p ${GOPATH}/bin ${GOPATH}/src ${GOPATH}/pkg
RUN chmod -R 777 ${GOPATH}
ENV PATH ${GOPATH}/bin:${PATH}

# Confirm go version
RUN go version
