#!/bin/bash
set -e

FIRST=$1
SECOND=$2
EXPECTED=$3
VERSION=${4:-latest}
SUM=$(docker run hbunn/adder:${VERSION} ${FIRST} ${SECOND})

if [[ ${SUM} == "${EXPECTED}" ]]; then
    echo "Integration test success"
else
    echo "[ERROR] ${FIRST} + ${SECOND} returned ${SUM}, not ${EXPECTED}" >&2
    exit 1
fi

