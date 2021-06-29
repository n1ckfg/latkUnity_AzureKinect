@echo off

git submodule init
git submodule update --init --recursive
git submodule sync
git submodule foreach git checkout master
git submodule foreach git reset --hard
git submodule foreach git pull origin master

set BASE_URL="https://fox-gieg.com/patches/github/n1ckfg/latkUnity_AzureKinect"
cd %~dp0
powershell -Command "Invoke-WebRequest %BASE_URL%/dnn_model.onnx -OutFile dnn_model.onnx"

@pause