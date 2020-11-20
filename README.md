# Quartus 18.1 Docker image


This folder contains a docker image for Quartus 18.1.

## Usage

1. Copy the Quartus and ModelSim installer and device support packages into the
   the same directory, where the `Dockerfile` is located.
2. Adapt the `build.sh` file and add the correct names for the two added
   installers, as well as the version.
3. Build the docker container by running `./build.sh`.
4. Adapt `PROJECT_PATH` in the `./run.sh` script to mount the project folder
   into the docker container.
5. Run the docker image with `./run.sh`.
6. Start quartus from the terminal with `quartus`.

## Fix Problems with the USB-Blaster

Create a file in `/etc/udev/rules.d/51-usbblaster.rules` and make sure root has
read permissions. Write the following content to the file.

```
# Intel/Altera USB-Blaster
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6001", MODE="0666", NAME="bus/usb/$env{BUSNUM}/$env{DEVNUM}", RUN+="/bin/chmod 0666 %c"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6002", MODE="0666", NAME="bus/usb/$env{BUSNUM}/$env{DEVNUM}", RUN+="/bin/chmod 0666 %c"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6003", MODE="0666", NAME="bus/usb/$env{BUSNUM}/$env{DEVNUM}", RUN+="/bin/chmod 0666 %c"
# Intel/Altera USB-Blaster II
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6010", MODE="0666", NAME="bus/usb/$env{BUSNUM}/$env{DEVNUM}", RUN+="/bin/chmod 0666 %c"
SUBSYSTEM=="usb", ATTR{idVendor}=="09fb", ATTR{idProduct}=="6810", MODE="0666", NAME="bus/usb/$env{BUSNUM}/$env{DEVNUM}", RUN+="/bin/chmod 0666 %c"
```

## Sources

- https://github.com/ittouogami/quartus18.1_docker
- https://github.com/baioc/quartus-linux
