#!/bin/bash
 
# BuildSuccer example config file

# Manifest configuration
BS_MANIFEST_REPO="https://github.com/LineageOS/android.git"
BS_MANIFEST_BRANCH="cm-14.1"

# Using local manifests from
BS_LOCAL_MANIFEST_USE=true

# Set this to true to get local manifest from Git repo
BS_LOCAL_MANIFEST_GIT=true
BS_LOCAL_MANIFEST_REPO="https://github.com/mattroot/local_manifests.git"
# Local manifest branch
BS_LOCAL_MANIFEST_BRANCH="cm-14.1-sirius"

# Use this to copy over local manifest
BS_LOCAL_MANIFEST_CP=false
BS_LOCAL_MANIFEST_PATH="~/local_manifests/sirius.xml"

# Build configuration
BS_BUILD_TARGET="lineage_sirius-userdebug"
# Make command used for starting build
BS_BUILD_MAKE="bacon"
# Set this to true to use brunch instead - useful for Lineage ROMs
BS_BUILD_BRUNCH=true

# Telegram deploy module configuration
BS_DEPLOY_API_TOKEN=

# Information used in release messages
BS_DEPLOY_DISPLAY_NAME="Lineage"
BS_DEPLOY_DISPLAY_VERSION="14.1"
BS_DEPLOY_DISPLAY_MAINTAINER=$(whoami)
BS_DEPLOY_DISPLAY_DEVICE="Xperia Z2 (sirius)"

# CI channel configuration - broadcasts all messages related to build - job start and end time, etc.
BS_DEPLOY_CI_USE=true
BS_DEPLOY_CI_CHANNEL=

# Releases channel configuration - only broadcasts finished builds 
BS_DEPLOY_RELEASE_USE=true
BS_DEPLOY_RELEASE_CHANNEL=

# PRE DEPLOY TASKS
# Before deploying a build to Telegram, you need some variables.
# These variables are required to push the build to Pixeldrain (defining ex. file name) and fill in the release post.
# This function is called after the build, right before Pixeldrain upload and Telegram deployment.
predeploy() {
    export BS_PACKAGE_NAME="lineage-$LINEAGE_VERSION"
    export BS_PACKAGE_TYPE=$CM_BUILDTYPE
}
