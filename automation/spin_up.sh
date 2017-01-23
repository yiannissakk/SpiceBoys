#!/usr/bin/env bash

CLUSTER_NAME=$1

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$DIR")"
PEG_ROOT=$PROJECT_ROOT/pegasus

peg up ${PEG_ROOT}/master.yml
wait
peg up ${PEG_ROOT}/workers.yml

