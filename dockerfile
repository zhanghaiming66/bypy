FROM alpine:latest
RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.5/main" > /etc/apk/repositories
RUN echo "http://mirrors.ustc.edu.cn/alpine/v3.5/community" >> /etc/apk/repositories
RUN apk update
RUN apk --no-cache add tzdata  && \
   ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
   echo "Asia/Shanghai" > /etc/timezone
RUN apk add python3
RUN pip3 install --upgrade pip
RUN pip3 install requests
RUN pip3 install bypy
CMD ["bypy","info"]
