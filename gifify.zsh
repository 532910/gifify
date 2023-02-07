#!/bin/zsh -e

video=$1
#video=${1?usage:}
[[ -r $video ]] || { print "usage: [W=] [H=] [crop=[begin][-end]] [fps=] [ffargs=] ${0:t} input [output.gif]"; exit }
gif=${2-${video:r}.gif}
fps=15

W=${W:-${${H:+-1}:-540}}
H=${H:--1}

tmp=("${(@s.-.)crop}")
C=(${tmp[1]:+-ss $tmp[1]} ${tmp[2]:+-t $tmp[2]})

palette=$(mktemp --dry-run /tmp/${0:t:r}-palette-XXXXXX.png)

ffmpeg ${=ffargs} ${=C} -i $video -vf fps=$fps,scale=${W}:${H}:flags=lanczos,palettegen $palette
ffmpeg ${=ffargs} ${=C} -i $video -i $palette -filter_complex "fps=$fps,scale=${W}:${H}:flags=lanczos[x];[x][1:v]paletteuse" $gif
rm $palette
