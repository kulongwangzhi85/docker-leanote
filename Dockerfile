FROM  guocl85/leanote-xenial:base
MAINTAINER use auto leanote server docker image

ENV LEANOTE_VERSION=2.6

RUN apt update \
&& apt install -y wget \
&& wget https://iweb.dl.sourceforge.net/project/leanote-bin/${LEANOTE_VERSION}/leanote-linux-amd64-v${LEANOTE_VERSION}.bin.tar.gz \
&& tar -zxvf leanote-linux-amd64-v${LEANOTE_VERSION}.bin.tar.gz -C /opt/ \
&& rm -f leanote-linux-amd64-v${LEANOTE_VERSION}.bin.tar.gz \
&& rm -f /opt/leanote/conf/app.conf \
&& ln -s /app.conf /opt/leanote/conf/app.conf \
&& apt-get clean && rm -rf /var/lib/apt/lists/* \
&& chmod a+x /opt/leanote/bin/run.sh \
&& sed -i '/chmod/a sleep 1' /opt/leanote/bin/run.sh

EXPOSE 8080

CMD ["sh", "/opt/leanote/bin/run.sh"]
