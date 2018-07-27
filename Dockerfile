#escape=`
FROM microsoft/windowsservercore
LABEL maintainer="Brad Christie"
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';$ProgressPreference = 'SilentlyContinue';"]

ADD ./install /install
WORKDIR /install

RUN . .\Util.ps1; Write-Host (Get-Greeting);