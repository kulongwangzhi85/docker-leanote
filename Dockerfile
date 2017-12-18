FROM  guocl85/xenial

ENV LEANOTE_VERSION=2.6

# version v0.1

RUN wget --no-check-certificate https://raw.githubusercontent.com/kulongwangzhi85/docker-leanote/master/app.conf \
&& wget --no-check-certificate https://iweb.dl.sourceforge.net/project/leanote-bin/${LEANOTE_VERSION}/leanote-linux-amd64-v${LEANOTE_VERSION}.bin.tar.gz \
&& tar -zxf leanote-linux-amd64-v${LEANOTE_VERSION}.bin.tar.gz -C /opt/ \
&& rm -f leanote-linux-amd64-v${LEANOTE_VERSION}.bin.tar.gz \
&& rm -f /opt/leanote/conf/app.conf \
&& ln -s /app.conf /opt/leanote/conf/app.conf \
&& chmod a+x /opt/leanote/bin/run.sh \
&& chown 0.0 -R /opt/leanote \
&& sed -i '/chmod/a sleep 1' /opt/leanote/bin/run.sh

EXPOSE 80

CMD ["sh", "/opt/leanote/bin/run.sh"]
