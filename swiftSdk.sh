#!/bin/bash

# Switch directories
cd ../
rm swift-5.8.1-RELEASE-ubuntu20.04

# Download swift SDK
wget https://download.swift.org/swift-5.8.1-release/ubuntu2004/swift-5.8.1-RELEASE/swift-5.8.1-RELEASE-ubuntu20.04.tar.gz

# Unzip swift
tar xzf swift-5.8.1-RELEASE-ubuntu20.04.tar.gz
rm swift-5.8.1-RELEASE-ubuntu20.04.tar.gz

# Set swift environment path
export PATH="$PATH:`pwd`/swift-5.8.1-RELEASE-ubuntu20.04/usr/bin"

# Run swift
swift

# Install ldbdump
cd leveldb-dumper/ldb-dump
./build && ./install
ldbdump