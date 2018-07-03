FROM alpine:3.7

ENV FRP_VERSION 0.20.0

RUN wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz && \ 
    tar xzf frp_${FRP_VERSION}_linux_amd64.tar.gz && \
    cd frp_${FRP_VERSION}_linux_amd64 && \
    mv frps /frps && \
    mv frpc /frpc && \
    mdkri /etc/frp/ && \
    mv frps.ini /etc/frp/frps.ini && \
    mv frpc.ini /etc/frp/frpc.ini && \
    cd .. && \
    rm -rf *.tar.gz && \
    rm -rf frp_${FRP_VERSION}_linux_amd64

WORKDIR /

CMD ["/frps", "-c /etc/frp/frps.ini"]