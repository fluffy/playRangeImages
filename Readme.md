## Building

A docker image can be created with

```sh
docker build -t opencv .
```

To get X11, run  XQuartz, and forward the ports with 
``` sh
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
 XDISP=` ifconfig en0 | grep "inet " | awk ' { print $2 } ' ` 
```

Another usefull command to get a shell in in the docker image is
```sh
 docker run -it -e DISPLAY="$XDISP":0 -v `pwd`:/data opencv /usr/bin/tcsh 
```

To just compute the files 
```
docker run -it -v `pwd`:/data opencv
```
