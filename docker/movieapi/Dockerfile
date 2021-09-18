# syntax=docker/dockerfile:1
FROM openjdk:11
ARG repodir
ARG artifact
ARG confname
ENV ARTIFACT ${artifact}
RUN echo "Deploy artifact: $repodir/$artifact"
RUN echo "ENV: ARTIFACT=$ARTIFACT"
RUN echo "Conf: application-properties-$confname"
COPY $repodir/$artifact .
COPY ./conf/application.properties-$confname application.properties
EXPOSE 8080
CMD java -jar $ARTIFACT
