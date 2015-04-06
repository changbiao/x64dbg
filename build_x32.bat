@echo off
echo Building DBG...
devenv /Rebuild "Release|Win32" x64_dbg.sln

echo GUI prebuildStep
cd x64_dbg_gui\Project
cmd /k "prebuildStep.bat x32"
cd ..
cd ..

echo Building GUI...
rmdir /S /Q build
mkdir build
cd build
qmake ..\x64_dbg_gui\Project\x64_dbg.pro CONFIG+=release
jom
cd ..

echo GUI afterbuildStep
cd x64_dbg_gui\Project
call afterbuildStep.bat x32 ..\..\build\release
cd ..
cd ..