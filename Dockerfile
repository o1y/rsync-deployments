FROM drinternet/rsync:v1.4.1

# Install sshpass
RUN apk update && apk add --no-cache sshpass
RUN rm -rf /var/cache/apk/*

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
