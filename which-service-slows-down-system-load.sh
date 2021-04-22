#!/bin/env sh

[[ -d ../../Temp ]] || mkdir ../../Temp

systemd-analyze plot > ../../Temp/systemd-plot.svg
xdg-open ../../Temp/systemd-plot.svg
