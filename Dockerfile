FROM google/cloud-sdk:437.0.1-alpine

RUN apk update && apk add --no-cache jq

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]