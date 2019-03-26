FROM alpine:3.7

ENV FRP_VERSION 0.25.3

COPY frp_${FRP_VERSION}_linux_amd64.tar.gz /frp_${FRP_VERSION}_linux_amd64.tar.gz

WORKDIR /

RUN cd / && \ 
    tar xzf frp_${FRP_VERSION}_linux_amd64.tar.gz && \
    cd frp_${FRP_VERSION}_linux_amd64 && \
    mv frps /frps && \
    mv frpc /frpc && \
    mkdir /etc/frp/ && \
    mv frps.ini /etc/frp/frps.ini && \
    mv frpc.ini /etc/frp/frpc.ini && \
    cd .. && \
    rm -rf *.tar.gz && \
    rm -rf frp_${FRP_VERSION}_linux_amd64


CMD ["/frps", "-c /etc/frp/frps.ini"]