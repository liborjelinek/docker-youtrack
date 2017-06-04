FROM openjdk:8-jre

ARG YOUTRACK_VER
ENV YOUTRACK_ROOT /youtrack
ENV YOUTRACK_JAVAOPTS -Xmx1g -XX:MaxMetaspaceSize=250M -Djava.awt.headless=true -Djetbrains.youtrack.disableBrowser=true

RUN mkdir -p $YOUTRACK_ROOT/db

# Download YouTrack as youtrack.jar
RUN curl -# -o $YOUTRACK_ROOT/youtrack.jar -L https://download.jetbrains.com/charisma/youtrack-$YOUTRACK_VER.jar

# Run YouTrack
CMD java $YOUTRACK_JAVAOPTS -Ddatabase.location=$YOUTRACK_ROOT/db/ -jar $YOUTRACK_ROOT/youtrack.jar 0.0.0.0:8080

EXPOSE 8080