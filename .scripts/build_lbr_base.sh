#!/usr/bin/env bash
set -euo pipefail

recipes=(
  ros-humble-kinematics-interface
  ros-humble-kinematics-interface-kdl
  ros-humble-iiwa7-moveit-config
  ros-humble-iiwa14-moveit-config
  ros-humble-med7-moveit-config
  ros-humble-med14-moveit-config
  ros-humble-lbr-moveit
  ros-humble-lbr-moveit-cpp
)

for recipe in "${recipes[@]}"; do
  rattler-build build \
    --recipe "./recipes/${recipe}/recipe.yaml" \
    -m ./conda_build_config_base.yaml \
    -c https://repo.prefix.dev/conda-forge \
    -c robostack-staging \
    --skip-existing
done
