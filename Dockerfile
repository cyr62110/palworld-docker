FROM debian:bookworm

RUN apt update && \
    apt install -y curl lib32gcc-s1

# Create a steam user to avoid running game server on root.
RUN useradd -m steam
WORKDIR /home/steam
USER steam

# Install steamcmd
# & Link steamclient.so in .steam/sdk64 folder (where Palworld expect to find it).
RUN curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - && \ 
    ./steamcmd.sh +quit && \
    mkdir -p .steam/sdk64 && \
    ln -s ~/linux64/steamclient.so .steam/sdk64/steamclient.so

# Install Palworld server
RUN ./steamcmd.sh +login anonymous +app_update 2394010 validate +quit

COPY --chmod=0777 StartPalworldServer.sh /home/steam

ENTRYPOINT ["./StartPalworldServer.sh"]
VOLUME /home/steam/Steam/steamapps/common/PalServer/Pal/Saved