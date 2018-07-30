#escape=`
FROM microsoft/windowsservercore
LABEL maintainer="Brad Christie"
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';$ProgressPreference = 'SilentlyContinue';"]

ADD ./install /install
WORKDIR /install

# Valid, because we're continuing on within the same context.
RUN . .\Util.ps1; Write-Host (Get-Greeting);

# Invalid, because `. .\Util.ps1` is lost between calls.
# Get-Greeting: The term 'Get-Greeting' is not recognized as the name of a cmdlet, function, script file, or operable program.
#RUN . .\util.ps1
#RUN Write-Host (Get-Greeting)