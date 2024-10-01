# docker image for the kosit validator with xrechnung configuration (for ubl/cii)

this for is based on https://github.com/flexness/xrechnung-validator-docker

it downloads files on build, rather than include them in the repo.  
do not run this in production, do not run this as root. Its a POC only.

## kosit sourcefiles (latest)

- validator: https://github.com/itplr-kosit/validator `1.5.0 (latest)`
- xrechnung configuration: https://github.com/itplr-kosit/validator-configuration-xrechnung `release-2024-06-20`

## notes
- validator running in daemon mode (`-D`, `-H`, `-P`).

## running 

- `git clone https://github.com/zottelbeyer/xrechnung-validator-docker.git`
- `cd xrechnung-validator-docker`
- `docker build -t mydockerimage:latest .`
- `docker run -d -p 8081:8081 --user 1000:1000 --name xrechnung-validator mydockerimage:latest`


