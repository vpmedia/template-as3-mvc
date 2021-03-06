#!/usr/bin/env bash

ANT_HOME=/usr/local/opt/ant/libexec
export ANT_HOME

GRADLE_HOME=/usr/local/opt/gradle/libexec
export GRADLE_HOME

ANDROID_HOME=/usr/local/opt/android-sdk
export ANDROID_HOME

ANDROID_NDK_HOME=/usr/local/opt/android-ndk
export ANDROID_NDK_HOME

ANDROID_NDK_ROOT=/usr/local/opt/android-ndk
export ANDROID_NDK_ROOT

NDK_HOME=/usr/local/opt/android-ndk
export NDK_HOME

AIR_HOME=/usr/local/opt/adobe-air-sdk/libexec
export AIR_HOME

FLEX_HOME=/Users/dev/work/flex_sdk
export FLEX_HOME

PATH=$AIR_HOME/bin:$GRADLE_HOME/bin:$PATH
export PATH

gradle