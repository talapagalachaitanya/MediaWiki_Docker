FROM chaitanyatalapagala/oraclelinux-extras
LABEL maintainer "Chaitanya Prabhu"

# Install required system packages and dependencies
RUN install_packages bzip2-libs cyrus-sasl-lib expat freetds freetype glibc gmp gnutls keyutils-libs krb5-libs libcom_err libcurl libffi libgcc libgcrypt libgpg-error libicu libidn libjpeg-turbo libmemcached libnghttp2 libpng libselinux libssh2 libstdc++ libtasn1 libtidy libxml2 libxslt ncurses-libs nettle nspr nss nss-softokn-freebl nss-util openldap openssl-libs p11-kit pcre postgresql-libs readline sqlite xz-libs zlib
RUN bitnami-pkg unpack apache-2.4.39-2 --checksum bd13d67036ecb691256893b0ba4034364b90c05747b2afbaa3c097fb218bc2e1
RUN bitnami-pkg unpack php-7.3.7-0 --checksum 433c0d4c346ba1cc2c3e4a117c28acf418460e777863fb341c9be99a3b6afa87
RUN bitnami-pkg unpack mysql-client-10.3.16-0 --checksum bc7ef5b2abef585c0079a7e4cb2a099c5f40cf39402c52078438a39882953ab4
RUN bitnami-pkg install libphp-7.3.7-0 --checksum 50b7089e4205697afeb659352f272c8027d7505540741a285d4fb140a85d917b
RUN bitnami-pkg unpack mediawiki-1.33.0-0 --checksum 932eebfdef3d0325f11e554c6a47000158c1599015f31c7425bc539bbc03cc80
RUN ln -sf /dev/stdout /opt/bitnami/apache/logs/access_log
RUN ln -sf /dev/stderr /opt/bitnami/apache/logs/error_log

COPY rootfs /
ENV ALLOW_EMPTY_PASSWORD="no" \
    APACHE_HTTPS_PORT_NUMBER="" \
    APACHE_HTTP_PORT_NUMBER="" \
    APACHE_SET_HTTPS_PORT="no" \
    APACHE_SET_HTTP_PORT="no" \
    BITNAMI_APP_NAME="mediawiki" \
    BITNAMI_IMAGE_VERSION="1.33.0-ol-7-r21" \
    MARIADB_HOST="mariadb" \
    MARIADB_PORT_NUMBER="3306" \
    MARIADB_ROOT_PASSWORD="" \
    MARIADB_ROOT_USER="root" \
    MEDIAWIKI_DATABASE_NAME="bitnami_mediawiki" \
    MEDIAWIKI_DATABASE_PASSWORD="" \
    MEDIAWIKI_DATABASE_USER="bn_mediawiki" \
    MEDIAWIKI_EMAIL="user@example.com" \
    MEDIAWIKI_PASSWORD="bitnami123" \
    MEDIAWIKI_USERNAME="user" \
    MEDIAWIKI_WIKI_NAME="Bitnami MediaWiki" \
    MYSQL_CLIENT_CREATE_DATABASE_NAME="" \
    MYSQL_CLIENT_CREATE_DATABASE_PASSWORD="" \
    MYSQL_CLIENT_CREATE_DATABASE_PRIVILEGES="ALL" \
    MYSQL_CLIENT_CREATE_DATABASE_USER="" \
    PATH="/opt/bitnami/apache/bin:/opt/bitnami/php/bin:/opt/bitnami/php/sbin:/opt/bitnami/mysql/bin:$PATH" \
    SMTP_HOST="" \
    SMTP_HOST_ID="" \
    SMTP_PASSWORD="" \
    SMTP_PORT=""

VOLUME [ "/certs" ]

EXPOSE 80 443

ENTRYPOINT [ "/app-entrypoint.sh" ]
CMD [ "httpd", "-f", "/opt/bitnami/apache/conf/httpd.conf", "-DFOREGROUND" ]
