#!/bin/env sh

[[ -d ${CFG_STORAGE_DATA}/Temp ]] || mkdir ${CFG_STORAGE_DATA}/Temp

systemd-analyze plot > ${CFG_STORAGE_DATA}/Temp/systemd-plot.svg
xdg-open ${CFG_STORAGE_DATA}/Temp/systemd-plot.svg
