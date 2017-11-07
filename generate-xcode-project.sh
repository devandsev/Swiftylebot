#!/usr/bin/env bash

swift package generate-xcodeproj
ruby setup-xcode-project.rb
