FROM odoo:17

USER root

RUN apt -y update;
RUN apt install -y python3-dev build-essential;
RUN pip install opentelemetry-distro opentelemetry-exporter-zipkin opentelemetry-exporter-prometheus; \
    opentelemetry-bootstrap -a install

COPY entrypoint.sh /entrypoint.sh

USER odoo
ENTRYPOINT ["/entrypoint.sh"]
CMD []
