FROM eclipse-temurin:21-jdk-alpine as mc-build

ARG FILENAME
ARG MC_VERSION

ENV FILENAME=$FILENAME

RUN apk update && apk upgrade && apk add wget git

WORKDIR /build
RUN wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar \
    && java -jar BuildTools.jar --rev ${MC_VERSION} --final-name ${FILENAME} && echo "done"


FROM eclipse-temurin:21-jre-alpine as mc-run

WORKDIR /minecraft

EXPOSE 25565

ARG FILENAME
ARG MIN_RAM
ARG MAX_RAM

ENV MIN_RAM=$MIN_RAM
ENV MAX_RAM=$MAX_RAM
ENV FILENAME=$FILENAME

VOLUME /world
VOLUME /plugins

COPY --from=mc-build /build/${FILENAME} .

COPY start.sh .
RUN apk update && apk upgrade && echo "eula=true" > eula.txt && chmod +x ./start.sh

ENTRYPOINT ["sh", "start.sh"]