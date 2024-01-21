#! /bin/bash
# Run the palworld server locally.
#
# Environment variables:
# - PALWORD_SAVE_DIR: Directory where the save of the world is stored. Default: ./Pal
# - PALWORD_IMAGE_VERSION: Version of the image. Default: latest.
#

SAVE_DIR=${PALWORD_SAVE_DIR:=$PWD}
ABSOLUTE_SAVE_DIR=$(realpath "$SAVE_DIR")
IMAGE_VERSION=${PALWORD_IMAGE_VERSION:=latest}
CONFIG_PATH=Config/LinuxServer/PalWorldSettings.ini

echo "Starting Palworld server..."

# Check if docker is present.

# Create the image.
# FIXME

# Create the save directory if it is missing.
echo "Save directory: $SAVE_DIR"
if [ ! -d "$SAVE_DIR" ]; then
    mkdir -p "$SAVE_DIR"
fi

# Copy the default 

if [ -e "$SAVE_DIR/$CONFIG_PATH" ]; then
    echo "Configuration found: $SAVE_DIR/$CONFIG_PATH."
else
    echo "Creating configuration from default."
    echo "Configuration created: $SAVE_DIR/$CONFIG_PATH."
    DEFAULT_CONFIG=$(docker run --entrypoint=bash cyr62110/palworld:$IMAGE_VERSION -c "ls ./Steam/steamapps/common/PalServer/DefaultPalWorldSettings.ini")
    mkdir -p "$SAVE_DIR/Config/LinuxServer"
    echo $DEFAULT_CONFIG > "$SAVE_DIR/$CONFIG_PATH"
fi

docker run \
    --volume /home/steam/Steam/steamapps/common/PalServer/Pal/Saved:$ABSOLUTE_SAVE_DIR \
    -p 8211:8211/udp \
    -ti cyr62110/palworld:$IMAGE_VERSION
