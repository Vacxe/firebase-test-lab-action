FROM google/cloud-sdk:449.0.0-alpine

RUN apk update && apk add --no-cache jq

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]