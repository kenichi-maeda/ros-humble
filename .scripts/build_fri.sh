#!/usr/bin/env bash
set -euo pipefail

recipes=(
  ros-humble-fri-client-sdk
  ros-humble-lbr-fri-idl
  ros-humble-lbr-fri-ros2
  ros-humble-lbr-ros2-control
  ros-humble-lbr-fri-ros2-stack
  ros-humble-lbr-demos-cpp
  ros-humble-lbr-demos-advanced-cpp
  ros-humble-lbr-demos-advanced-py
  ros-humble-lbr-demos-py
  ros-humble-lbr-bringup
)

for recipe in "${recipes[@]}"; do
  rattler-build build \
    --recipe "./recipes/${recipe}/recipe.yaml" \
    -m ./conda_build_config.yaml \
    -c https://repo.prefix.dev/conda-forge \
    -c robostack-staging \
    --skip-existing
done
