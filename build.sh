#!/bin/bash
QUARTUS=QuartusSetup-18.1.0.625-linux.run
MODELSIM=ModelSimSetup-18.1.0.625-linux.run
ALTERA_VER=18.1
docker image build \
    --rm \
    --build-arg QUARTUS \
    --build-arg MODELSIM \
    --build-arg ALTERA_VER \
    --no-cache \
    -t quartus${ALTERA_VER} .
