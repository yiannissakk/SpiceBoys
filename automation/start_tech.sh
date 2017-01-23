#!/usr/bin/env bash

CLUSTER_NAME=$1

peg service ${CLUSTER_NAME} zookeeper start
peg service ${CLUSTER_NAME} hadoop start