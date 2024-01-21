#! /bin/bash

# Run this script to build the image locally.

# Build the steamcmd image first.
cd ./steamcmd \
&& docker build -t cyr62110/steamcmd:latest . \
&& cd ..

# Finally build the palworld server image.
cd ./palworld \
&& docker build -t cyr62110/palworld:latest .
