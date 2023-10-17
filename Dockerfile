FROM debian:buster-slim

ENV LDAP_ORGANISATION="Example Inc." \
    LDAP_DOMAIN="example.com" \
    LDAP_ROOTPASS="secret" \
    LDAP_BASE_DN="" \
    LDAP_BACKEND="MDB" \
    LDAP_TLS="false"

ENV DEBIAN_FRONTEND=noninteractive

RUN echo "slapd slapd/internal/generated_adminpw password ${LDAP_ROOTPASS}" | debconf-set-selections \
    && echo "slapd slapd/internal/adminpw password ${LDAP_ROOTPASS}" | debconf-set-selections \
    && echo "slapd slapd/password2 password ${LDAP_ROOTPASS}" | debconf-set-selections \
    && echo "slapd slapd/password1 password ${LDAP_ROOTPASS}" | debconf-set-selections

RUN apt-get update && apt-get install -y \
    slapd \
    ldap-utils \
    procps \
    && rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 389 636

ENTRYPOINT ["docker-entrypoint.sh"]
