# CSI Server

Used for building a Docker image to run Campbell Scientific LoggerNet in a container. LoggerNet is copyrighted and licensed software, hence no LoggerNet binary executables are included. You MUST have a valid license per installation and provide your own binaries via a volume mount.


## Example

```
docker run -d -p 6789:6789 --rm -v $(pwd)/bin:/opt/CampbellSci/LoggerNet -v $(pwd)/config:/etc/opt/CampbellSci -v $(pwd)/work:/var/opt/CampbellSci/LoggerNet dendra:csi-server
```
