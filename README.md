## docker-mizupbx

This is a Container for Mizupbx based on [jshridha/docker-blueiris
](https://github.com/jshridha/docker-blueiris) and
[solarkennedy/wine-x11-novnc-docker
](https://github.com/solarkennedy/wine-x11-novnc-docker)

This container runs:

* Xvfb - X11 in a virtual framebuffer
* x11vnc - A VNC server that scrapes the above X11 server
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* Fluxbox - a small window manager
* WINE - to run Windows executables on linux
* mizuPBX.exe - official Windows MizuPbx

clone the repo and use docker-compose to start

