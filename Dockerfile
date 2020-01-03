FROM alpine:3.7

ENV FRP_VERSION 0.31.0
ENV ARCH linux_amd64
ENV BUNDLE_TYPE tar.gz
ENV Download_URL https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_${ARCH}.${BUNDLE_TYPE}

WORKDIR /
RUN wget $Download_URL
RUN cd / && \ 
    tar xzf frp_${FRP_VERSION}_${ARCH}.${BUNDLE_TYPE} && \
    cd frp_${FRP_VERSION}_${ARCH} && \
    mv frps /frps && \
    mv frpc /frpc && \
    mkdir -p /etc/frp/ && \
    mv frps.ini /etc/frp/frps.ini && \
    mv frpc.ini /etc/frp/frpc.ini && \
    cd .. && \
    rm -rf frp_${FRP_VERSION}_${ARCH}.${BUNDLE_TYPE} && \
    rm -rf frp_${FRP_VERSION}_${ARCH}


CMD ["/frps", "-c /etc/frp/frps.ini"]