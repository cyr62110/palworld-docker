FROM cyr62110/steamcmd:latest

# Install Palworld server
RUN ./steamcmd.sh +login anonymous +app_update 2394010 validate +quit

COPY --chmod=0777 StartPalworldServer.sh /home/steam

ENTRYPOINT ["./StartPalworldServer.sh"]
VOLUME /home/steam/Steam/steamapps/common/PalServer/Pal/Saved
EXPOSE 8211/udp
