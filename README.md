# gifify.zsh

## A simple script for convert video to animated GIF using FFmpeg


## Usage
```
[W=] [H=] [crop=[begin][-end]] [fps=] [ffargs=] gifify.zsh input [output.gif]
```

option       | description
-------------|-------------
`W`, `H`     | width and height for scale filter, default width is 540px
`crop`       | start seek (`-ss`) and duration (`-t`), see the [**Time duration**](https://ffmpeg.org/ffmpeg-utils.html#Time-duration) section in the ffmpeg-utils(1) for details
`fps`        | fps filter, defaults to `15`
`ffargs`     | will be passed to `ffmpeg` directly
`input`      | input video file
`output.gif` | defaults to the `input` with the extension replaced with `.gif` 
