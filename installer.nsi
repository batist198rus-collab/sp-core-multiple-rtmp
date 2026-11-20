OutFile "sp-core-multiple-rtmp-setup.exe"

!ifndef PLUGIN_SOURCE_DIR
    !define PLUGIN_SOURCE_DIR "release\Release\sp-core-multiple-rtmp"
!endif

Unicode true
RequestExecutionLevel user

SetDatablockOptimize on
SetCompress auto
SetCompressor /SOLID lzma

Name "SP-CORE Multiple RTMP"
Caption "SP-CORE Multiple RTMP for OBS Studio"
Icon "${NSISDIR}\Contrib\Graphics\Icons\win-install.ico"

Var /Global DefInstDir
Function .onInit
    ReadEnvStr $0 "ALLUSERSPROFILE"
    StrCpy $DefInstDir "$0\obs-studio\plugins"
    StrCpy $INSTDIR "$DefInstDir"

    IfFileExists "$DefInstDir\sp-core-multiple-rtmp\*.*" AskUninst DontAskUninst
    AskUninst:
        MessageBox MB_YESNO|MB_ICONQUESTION "Install or remove SP-CORE Multiple RTMP?$\r$\nYes = Install, No = Remove$\r$\n$\r$\nУстановить или удалить SP-CORE Multiple RTMP?$\r$\nДа = Установить, Нет = Удалить" IDYES NotDoUninst IDNO DoUninst
    DoUninst:
        RMDir /r "$DefInstDir\sp-core-multiple-rtmp"
        MessageBox MB_OK|MB_ICONINFORMATION "Done / Готово"
        Quit
    NotDoUninst:
    DontAskUninst:
FunctionEnd

Function onDirPageLeave
StrCmp "$INSTDIR" "$DefInstDir" DirNotModified DirModified
DirModified:
MessageBox MB_OK|MB_ICONSTOP "Please don't change the install directory. / Не меняйте папку установки."
Abort
DirNotModified:
FunctionEnd

Page directory "" "" onDirPageLeave
Page instfiles

Section
SetOutPath "$INSTDIR"
File /r "${PLUGIN_SOURCE_DIR}"
SectionEnd
