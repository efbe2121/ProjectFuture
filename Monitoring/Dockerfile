FROM alpine:latest

RUN addgroup \
	    --gid 99 \
	    --system haproxy; \
	adduser \
	    --disabled-password \
	    --home /var/lib/haproxy \
	    --ingroup haproxy \
	    --no-create-home \
	    --system \
	    --uid 99 haproxy; \
    mkdir -p /var/lib/haproxy; \
    touch /var/lib/haproxy/stats

ENV HAPROXY_VERSION=2.4.3
ENV HAPROXY_URL="https://www.haproxy.org/download/2.4/src/haproxy-2.4.3.tar.gz"
ENV HAPROXY_SHA256=ce479380be5464faa881dcd829618931b60130ffeb01c88bc2bf95e230046405

RUN apk add --no-cache --virtual .build-deps \
	    gcc libc-dev linux-headers \
	    lua5.3-dev make \
	    openssl openssl-dev pcre2-dev \
	    readline-dev tar zlib-dev; \
    wget -O haproxy.tar.gz "$HAPROXY_URL"; \
    echo "$HAPROXY_SHA256 *haproxy.tar.gz" | sha256sum -c; \
    mkdir -p /usr/src/haproxy; \
    tar -xzf haproxy.tar.gz -C /usr/src/haproxy --strip-components=1; \
    rm haproxy.tar.gz; \
    makeOpts='\
	    TARGET=linux-musl \
	    USE_GETADDRINFO=1 \
	    USE_LUA=1 \
	    LUA_INC=/usr/include/lua5.3 \
	    LUA_LIB=/usr/lib/lua5.3 \
	    USE_OPENSSL=1 \
	    USE_PCRE2=1 \
	    USE_PCRE2_JIT=1 \
	    USE_PROMEX=1 \
	    EXTRA_OBJS="" '; \
    nproc="$(getconf _NPROCESSORS_ONLN)"; \
    eval "make -C /usr/src/haproxy -j '$nproc' all $makeOpts"; \
    eval "make -C /usr/src/haproxy install-bin $makeOpts"; \
    mkdir -p /usr/local/etc/haproxy; \
    cp -R \
        /usr/src/haproxy/examples/errorfiles \
        /usr/local/etc/haproxy/errors; \
    rm -rf \
        /usr/src/haproxy; \
    haproxy -v

CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
