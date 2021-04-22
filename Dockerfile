FROM alpine:3.7

ENV TELEGRAF_VERSION 1.18.1

WORKDIR /scripts

ADD https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz ./

COPY ./scripts/start.sh start.sh
COPY ./configs/telegraf.conf telegraf.conf

# Installing packages
RUN tar -C . -xzf telegraf-${TELEGRAF_VERSION}_static_linux_amd64.tar.gz
RUN chmod +x telegraf-${TELEGRAF_VERSION}/usr/bin/telegraf
RUN chmod +x start.sh
RUN cp telegraf-${TELEGRAF_VERSION}/usr/bin/telegraf /usr/bin/
RUN rm -rf *.tar.gz* telegraf-${TELEGRAF_VERSION}/

ENTRYPOINT [ "./start.sh" ]