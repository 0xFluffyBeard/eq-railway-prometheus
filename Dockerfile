FROM prom/prometheus

# copy gomplate
COPY --from=hairyhenderson/gomplate:stable /gomplate /bin/gomplate

# copy the Prometheus configuration
COPY templates /etc/prometheus/templates

# expose the Prometheus server port
EXPOSE 9090

# set the entrypoint command
USER root
ADD entrypoint.sh /
RUN chmod 755 /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
CMD        [ "--config.file=/etc/prometheus/prometheus.yml", \
             "--web.config.file=/etc/prometheus/web.yml", \
             "--storage.tsdb.path=/prometheus", \
             "--storage.tsdb.retention=365d", \
             "--web.console.libraries=/usr/share/prometheus/console_libraries", \
             "--web.console.templates=/usr/share/prometheus/consoles", \
             "--web.external-url=http://localhost:9090", \
             "--log.level=info"]
 
