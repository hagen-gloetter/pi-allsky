#!/bin/bash

rm -f zeitraffer.mp4

ffmpeg -pattern_type sequence -r 30 -i "skip-and-morph/image-%06d.jpg" -c:v hevc -b:v 768000 -r 30 -s 1024x768 zeitraffer.mp4

