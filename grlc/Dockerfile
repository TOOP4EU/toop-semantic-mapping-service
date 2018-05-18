FROM clariah/grlc:latest

COPY ./src/templates/* /home/grlc/grlc/src/templates/

############################## CONFD ##############################
# START
#
# Add confd
ARG CONFD_VERSION=0.11.0
RUN wget -O /usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64
RUN chmod +x /usr/local/bin/confd

# Copy Configuration Files
COPY ./confd /etc/confd

COPY confd_init.sh /
RUN chmod +x /confd_init.sh

ENTRYPOINT ["/confd_init.sh"]
#
#
# END
############################## CONFD ##############################

CMD ["/sbin/entrypoint.sh", "app:start"]
