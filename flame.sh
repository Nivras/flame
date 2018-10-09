#!/bin/bash - 
#===============================================================================
#
#          FILE: flame.sh
# 
#         USAGE: ./flame.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 03/25/2018 15:31
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
pid=$1
sudo perf record -F 99 -p $pid -g -- sleep 60
sudo perf script > out.perf
./FlameGraph/stackcollapse-perf.pl out.perf > out.folded
./FlameGraph/flamegraph.pl out.folded > kernel.svg

