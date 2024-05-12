#!/bin/bash

echo "============================================================================"
echo "============================================================================"
echo "Current Directory"
pwd
echo "============================================================================"
echo "Directory Contents ./       (/home/runner/work/kaan/kaan)"
ls -la
echo "============================================================================"
echo "============================================================================"
echo "============================================================================"


# 1. Downloading the zip file for Maestro Kaan release
echo "Downloading maestro_kaan.zip"
wget https://github.com/sdfgsdfgd/maestro_kaan/releases/download/maestro_kaan/maestro_kaan.zip

# 2. Downloading the YOLO yaml configuration for Maestro
echo "Downloading yolo.yaml"
wget https://github.com/sdfgsdfgd/maestro_kaan/releases/download/maestro_kaan/yolo.yaml -O yolo1.yaml
cp yolo1.yaml yolo2.yaml
cp yolo1.yaml yolo3.yaml
cp yolo1.yaml yolo4.yaml
cp yolo1.yaml yolo5.yaml

# 3. Unzipping the Maestro Kaan zip file and then removing the zip file
echo "Unzipping maestro_kaan.zip"
unzip maestro_kaan.zip
echo "Removing maestro_kaan.zip"
rm maestro_kaan.zip

# 4. Displaying the contents of the directory again
echo "Directory Contents after unzipping:"
ls -la

# 5. Executing the Maestro executable
echo "Running the Maestro executable:"
bash ./maestro/bin/maestro test ./ -s 4