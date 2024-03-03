#!/usr/bin/python
#
# This skript takes a few images from a large image collection to create
# a new, timelapsed, image collection. This is used to create a directory
# containing only those images, which should go into a video, which is 
# then sped up against reality.
#
# The sccript has two modes, controlled by morph_count an skip_count:
#   * morph_count = 0: Every skip_count image is taken for output
#   * morph_count > 0: Every skip_count image is taken but morph_count
#                      images are inserted by using "convert -morph [..]"
#                      This mode allows for smoother videos.
#
# (C) by Tilmann Bubeck, tilmann@bubecks.de, 2016-01-29
#
# GPLv2 licensed.

import glob
import os
import shutil
import subprocess
import re

dirname = "skip-and-morph"
if os.path.exists(dirname):
    shutil.rmtree(dirname)
os.mkdir(dirname)

# How many images should be morphed between the real photos?
morph_count = 5
# take only every "skip" image
skip_count = 30 * morph_count

# How many images should be morphed between the real photos?
morph_count = 0
# take only every "skip" image
skip_count = 18

files = glob.glob('garten/*/*/day/*.jpg')
files.sort()
n = 0
target_n = 1
previous_file = ""
for file in files:

    n = n + 1

    # Take only every skip_count image:
    if n % skip_count != 0:
        continue

    print file
    
    source_name = "../%s" % (file)
    target_name = "%s/image-%06d.jpg" % (dirname, target_n) 
    target_tmp_name = "/tmp/image-%06d.jpg" % (target_n)
    target_morph_name = "%s/morph-%%03d.jpg" % (dirname)
    target_morph_glob = "%s/morph*.jpg" % (dirname)
    
    basename = os.path.basename(file)
    m = re.search("(....\-..\-..)", basename)
    annotation = m.group(0)

    #os.symlink(source_name, target_name)
    command = [ "convert", file, "-fill", "#0008", "-draw", "rectangle 10,7,114,20", "-fill", "white", "-annotate", "+15+18", annotation, target_name ]
    #shutil.copyfile(file, target_name)
    #print "%s -> %s" % (file, target_name)
    subprocess.call(command)
    
    if previous_file != "" and morph_count > 0:
        # morph (no idea, why we need -1)
        command = [ "convert", previous_target_name, target_name, "-morph", str(morph_count - 1), target_morph_name ]
        subprocess.call(command)

        morph_files = glob.glob(target_morph_glob)
        morph_files.sort()

        i = 1
        for morph_file in morph_files:
            morph_target_name = "%s/image-%06d.jpg" % (dirname , previous_target_n + i)
            os.rename(morph_file, morph_target_name)
            #print "%s -> %s" % (morph_file, morph_target_name)
            i = i + 1
        
#    shutil.copyfile(target_tmp_name, target_name)
    
    previous_file = file
    previous_source_name = source_name
    previous_target_name = target_name
    previous_target_n = target_n
    
    if morph_count > 0:
        target_n = target_n + morph_count + 1 + 1
    else:
        target_n = target_n + 1
