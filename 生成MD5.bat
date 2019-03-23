
# 
set PrjName=Software
# set DirName=�����ļ�
set UserName=scimence
set AttachConfigUrl=https://raw.githubusercontent.com/%UserName%/%PrjName%/master/MD5.txt
#

set MD5="%~dp0tools\getMD5.exe"
set MD5_TXT="%~dp0tools\MD5.txt"
set MD5_updateFiles="%~dp0tools\updateFiles.txt"
set ContentReplace="%~dp0tools\ContentReplace.exe"

# set channelPackages="%~dp0%DirName%"
set channelPackages=%~dp0

set updateFiles="%~dp0MD5.txt"
set APK_Base="%~dp0\"

if exist %updateFiles% del %updateFiles%

%MD5% %channelPackages%
%ContentReplace% %MD5_TXT% "%APK_Base%" ""
%ContentReplace% %MD5_TXT% \ /
%ContentReplace% %MD5_TXT% "[HeadAppend]" "��������ԴĿ¼(https://raw.githubusercontent.com/%UserName%/%PrjName%/master/)\r\n������ԴĿ¼(%APK_Base%)\r\n��������ԴĿ¼(%AttachConfigUrl%)\r\n\r\n�������ļ�(\r\n"
%ContentReplace% %MD5_TXT% "[TailAppend]" "\r\n\r\n)�������ļ�\r\n"
if exist %MD5_updateFiles% del %MD5_updateFiles%

if exist %MD5_TXT% copy %MD5_TXT% %updateFiles%
if exist %MD5_TXT% del %MD5_TXT%

exit

