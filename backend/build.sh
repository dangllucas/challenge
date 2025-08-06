#!/bin/bash

./mvnw package || exit 1

docker build -t "${IMAGE}" .