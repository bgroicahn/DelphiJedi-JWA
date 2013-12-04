{******************************************************************************}
{                                                                              }
{ Shell32 API Interface Unit for Object Pascal                     		       }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2005 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The initial developer of the original translation is Rudy Velthuis		   }
{                                                                              }
{ Portions created by Rudy Velthuis are Copyright (C) 2005-2008                }
{ All Rights Reserved.                                      				   }
{                                                                              }
{ Adapted for JEDI API Library by Christian Wimmer                             }
{                                                                              }
{ Obtained through: Joint Endeavour of Delphi Innovators (Project JEDI)        }
{ The original code is: shellapi.h, released 2005.                			   }
{                                                                              }
{ You may retrieve the latest version of this file at the Project JEDI         }
{ APILIB home page, located at http://jedi-apilib.sourceforge.net              }
{                                                                              }
{ The contents of this file are used with permission, subject to the Mozilla   }
{ Public License Version 1.1 (the "License"); you may not use this file except }
{ in compliance with the License. You may obtain a copy of the License at      }
{ http://www.mozilla.org/MPL/MPL-1.1.html                                      }
{                                                                              }
{ Software distributed under the License is distributed on an "AS IS" basis,   }
{ WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for }
{ the specific language governing rights and limitations under the License.    }
{                                                                              }
{ Alternatively, the contents of this file may be used under the terms of the  }
{ GNU Lesser General Public License (the  "LGPL License"), in which case the   }
{ provisions of the LGPL License are applicable instead of those above.        }
{ If you wish to allow use of your version of this file only under the terms   }
{ of the LGPL License and not to allow others to use your version of this file }
{ under the MPL, indicate your decision by deleting  the provisions above and  }
{ replace  them with the notice and other provisions required by the LGPL      }
{ License.  If you do not delete the provisions above, a recipient may use     }
{ your version of this file under either the MPL or the LGPL License.          }
{                                                                              }
{ For more information about the LGPL: http://www.gnu.org/copyleft/lesser.html }
{                                                                              }
{                                                                              }
{******************************************************************************}
{$IFNDEF JWA_OMIT_SECTIONS}
unit JwaShellAPI;
{$I ..\Includes\JediAPILib.inc}

interface

uses
  JwaWinBase, JwaWinUser, JwaWinType;

{
Delphi7 does not contain:
PStartupInfoW

}

{$HPPEMIT '#include <shellapi.h>'}
{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_IMPLEMENTATIONSECTION}

type
  {$EXTERNALSYM HDROP}
  HDROP = THandle;

{$IFNDEF JWA_INCLUDEMODE}
  PPWideChar = ^PWideChar;
{$ENDIF JWA_INCLUDEMODE}  

{$EXTERNALSYM DragQueryFileA}
function DragQueryFileA(hDrop: HDROP; iFile: UINT; lpszFile: PAnsiChar; cch: UINT): UINT; stdcall;
{$EXTERNALSYM DragQueryFileW}
function DragQueryFileW(hDrop: HDROP; iFile: UINT; lpszFile: PWideChar; cch: UINT): UINT; stdcall;
{$EXTERNALSYM DragQueryFile}
function DragQueryFile(hDrop: HDROP; iFile: UINT; lpszFile: PTSTR; cch: UINT): UINT; stdcall;
{$EXTERNALSYM DragQueryPoint}
function DragQueryPoint(hDrop: HDROP; var lppt: TPOINT): BOOL; stdcall;
{$EXTERNALSYM DragFinish}
procedure DragFinish(hDrop: HDROP); stdcall;
{$EXTERNALSYM DragAcceptFiles}
procedure DragAcceptFiles(HWnd: HWND; fAccept: BOOL); stdcall;

{$EXTERNALSYM ShellExecuteA}
function ShellExecuteA(hwnd: HWND; lpOperation, lpFile, lpParameters, lpDirectory: PAnsiChar; nShowCmd: Integer): THandle; stdcall;
{$EXTERNALSYM ShellExecuteW}
function ShellExecuteW(hwnd: HWND; lpOperation, lpFile, lpParameters, lpDirectory: PWideChar; nShowCmd: Integer): THandle; stdcall;
{$EXTERNALSYM ShellExecute}
function ShellExecute(hwnd: HWND; lpOperation, lpFile, lpParameters, lpDirectory: PTSTR; nShowCmd: Integer): THandle; stdcall;
{$EXTERNALSYM FindExecutableA}
function FindExecutableA(lpFile, lpDirectory, lpResult: PAnsiChar): THandle; stdcall;
{$EXTERNALSYM FindExecutableW}
function FindExecutableW(lpFile, lpDirectory, lpResult: PWideChar): THandle; stdcall;
{$EXTERNALSYM FindExecutable}
function FindExecutable(lpFile, lpDirectory, lpResult: PTSTR): THandle; stdcall;
{$EXTERNALSYM CommandLineToArgvW}
function CommandLineToArgvW(lpCmdLine: PWideChar; var pNumArgs: Integer): PPWideChar; stdcall;
{$EXTERNALSYM ShellAboutA}
function ShellAboutA(hWnd: HWND; szApp, szOtherStuff: PAnsiChar; hIcon: HICON): Integer; stdcall;
{$EXTERNALSYM ShellAboutW}
function ShellAboutW(hWnd: HWND; szApp, szOtherStuff: PWideChar; hIcon: HICON): Integer; stdcall;
{$EXTERNALSYM ShellAbout}
function ShellAbout(hWnd: HWND; szApp, szOtherStuff: PTSTR; hIcon: HICON): Integer; stdcall;
{$EXTERNALSYM DuplicateIcon}
function DuplicateIcon(hInst: THandle; hIcon: HICON): HICON; stdcall;
{$EXTERNALSYM ExtractAssociatedIconA}
function ExtractAssociatedIconA(hInst: THandle; lpIconPath: PAnsiChar; var lpiIcon: Word): HICON; stdcall;
{$EXTERNALSYM ExtractAssociatedIconW}
function ExtractAssociatedIconW(hInst: THandle; lpIconPath: PWideChar; var lpiIcon: Word): HICON; stdcall;
{$EXTERNALSYM ExtractAssociatedIcon}
function ExtractAssociatedIcon(hInst: THandle; lpIconPath: PTSTR; var lpiIcon: Word): HICON; stdcall;
{$EXTERNALSYM ExtractAssociatedIconExA}
function ExtractAssociatedIconExA(hInst: THandle; lpIconPath: PAnsiChar; var lpiIconIndex, lpiIconId: Word): HICON; stdcall;
{$EXTERNALSYM ExtractAssociatedIconExW}
function ExtractAssociatedIconExW(hInst: THandle; lpIconPath: PWideChar; var lpiIconIndex, lpiIconId: Word): HICON; stdcall;
{$EXTERNALSYM ExtractAssociatedIconEx}
function ExtractAssociatedIconEx(hInst: THandle; lpIconPath: PTSTR; var lpiIconIndex, lpiIconId: Word): HICON; stdcall;
{$EXTERNALSYM ExtractIconA}
function ExtractIconA(hInst: THandle; lpszExeFileName: PAnsiChar; nIconIndex: UINT): HICON; stdcall;
{$EXTERNALSYM ExtractIconW}
function ExtractIconW(hInst: THandle; lpszExeFileName: PWideChar; nIconIndex: UINT): HICON; stdcall;
{$EXTERNALSYM ExtractIcon}
function ExtractIcon(hInst: THandle; lpszExeFileName: PTSTR; nIconIndex: UINT): HICON; stdcall;

type
  PDragInfoA = ^TDragInfoA;
  {$EXTERNALSYM _DRAGINFOA}
  _DRAGINFOA = packed record
    uSize: UINT;                 { init with sizeof(DRAGINFO) }
    pt: TPoint;
    fNC: BOOL;
    lpFileList: PAnsiChar;
    grfKeyState: DWORD;
  end;
  {$EXTERNALSYM DRAGINFOA}
  DRAGINFOA = _DRAGINFOA;
  TDragInfoA = DRAGINFOA;

  PDragInfoW = ^TDragInfoW;
  {$EXTERNALSYM _DRAGINFOW}
  _DRAGINFOW = packed record
    uSize: UINT;                 { init with sizeof(DRAGINFO) }
    pt: TPoint;
    fNC: BOOL;
    lpFileList: PWideChar;
    grfKeyState: DWORD;
  end;
  {$EXTERNALSYM DRAGINFOW}
  DRAGINFOW = _DRAGINFOW;
  TDragInfoW = DRAGINFOW;



{$IFDEF UNICODE}
  {$EXTERNALSYM DRAGINFO}
  DRAGINFO = DRAGINFOW;
  TDragInfo = TDragInfoW;
  PDragInfo = PDragInfoW;
{$ELSE}
  {$EXTERNALSYM DRAGINFO}
  DRAGINFO = DRAGINFOA;
  TDragInfo = TDragInfoA;
  PDragInfo = PDragInfoA;
{$ENDIF}


////
//// AppBar stuff
////
const
  {$EXTERNALSYM ABM_NEW}
  ABM_NEW              = $00000000;
  {$EXTERNALSYM ABM_REMOVE}
  ABM_REMOVE           = $00000001;
  {$EXTERNALSYM ABM_QUERYPOS}
  ABM_QUERYPOS         = $00000002;
  {$EXTERNALSYM ABM_SETPOS}
  ABM_SETPOS           = $00000003;
  {$EXTERNALSYM ABM_GETSTATE}
  ABM_GETSTATE         = $00000004;
  {$EXTERNALSYM ABM_GETTASKBARPOS}
  ABM_GETTASKBARPOS    = $00000005;
  {$EXTERNALSYM ABM_ACTIVATE}
  ABM_ACTIVATE         = $00000006;  // lParam == TRUE/FALSE means activate/deactivate
  {$EXTERNALSYM ABM_GETAUTOHIDEBAR}
  ABM_GETAUTOHIDEBAR   = $00000007;
  {$EXTERNALSYM ABM_SETAUTOHIDEBAR}
  ABM_SETAUTOHIDEBAR   = $00000008;  // this can fail at any time.  MUST check the result
                                     // lParam = TRUE/FALSE  Set/Unset
                                     // uEdge = what edge
  {$EXTERNALSYM ABM_WINDOWPOSCHANGED}
  ABM_WINDOWPOSCHANGED = $00000009;
  {$EXTERNALSYM ABM_SETSTATE}
  ABM_SETSTATE         = $0000000A;

// these are put in the wparam of callback messages
  {$EXTERNALSYM ABN_STATECHANGE}
  ABN_STATECHANGE      = $00000000;
  {$EXTERNALSYM ABN_POSCHANGED}
  ABN_POSCHANGED       = $00000001;
  {$EXTERNALSYM ABN_FULLSCREENAPP}
  ABN_FULLSCREENAPP    = $00000002;
  {$EXTERNALSYM ABN_WINDOWARRANGE}
  ABN_WINDOWARRANGE    = $00000003;  // lParam == TRUE means hide

// flags for get state
  {$EXTERNALSYM ABS_AUTOHIDE}
  ABS_AUTOHIDE    = $00000001;
  {$EXTERNALSYM ABS_ALWAYSONTOP}
  ABS_ALWAYSONTOP = $00000002;

  {$EXTERNALSYM ABE_LEFT}
  ABE_LEFT        = 0;
  {$EXTERNALSYM ABE_TOP}
  ABE_TOP         = 1;
  {$EXTERNALSYM ABE_RIGHT}
  ABE_RIGHT       = 2;
  {$EXTERNALSYM ABE_BOTTOM}
  ABE_BOTTOM      = 3;

type
  PAppBarData = ^TAppBarData;
  {$EXTERNALSYM _AppBarData}
  _AppBarData = packed record
    cbSize: DWORD;
    hWnd: HWND;
    uCallbackMessage: UINT;
    uEdge: UINT;
    rc: TRect;
    lParam: LPARAM; // message specific
  end;
  {$EXTERNALSYM APPBARDATA}
  APPBARDATA = _AppBarData;
  TAppBarData = APPBARDATA;



{$EXTERNALSYM SHAppBarMessage}
function SHAppBarMessage(dwMessage: DWORD; var Data: TAppBarData): UINT; stdcall;

////
////  EndAppBar
////

{$EXTERNALSYM DoEnvironmentSubstA}
function DoEnvironmentSubstA(szString: PAnsiChar; cchString: UINT): DWORD; stdcall;
{$EXTERNALSYM DoEnvironmentSubstW}
function DoEnvironmentSubstW(szString: PWideChar; cchString: UINT): DWORD; stdcall;
{$EXTERNALSYM DoEnvironmentSubst}
function DoEnvironmentSubst(szString: PTSTR; cchString: UINT): DWORD; stdcall;

{$EXTERNALSYM EIRESID}
function EIRESID(x: Integer): Integer;

type
  PHICON = ^HICON;

{$EXTERNALSYM ExtractIconExA}
function ExtractIconExA(lpszFile: PAnsiChar; nIconIndex: Integer; phiconLarge, phiconSmall: PHICON; nIcons: UINT): UINT; stdcall;
{$EXTERNALSYM ExtractIconExW}
function ExtractIconExW(lpszFile: PWideChar; nIconIndex: Integer; phiconLarge, phiconSmall: PHICON; nIcons: UINT): UINT; stdcall;
{$EXTERNALSYM ExtractIconEx}
function ExtractIconEx(lpszFile: PTSTR; nIconIndex: Integer; phiconLarge, phiconSmall: PHICON; nIcons: UINT): UINT; stdcall;


////
//// Shell File Operations
////

const
  {$EXTERNALSYM FO_MOVE}
  FO_MOVE           = $0001;
  {$EXTERNALSYM FO_COPY}
  FO_COPY           = $0002;
  {$EXTERNALSYM FO_DELETE}
  FO_DELETE         = $0003;
  {$EXTERNALSYM FO_RENAME}
  FO_RENAME         = $0004;

  {$EXTERNALSYM FOF_MULTIDESTFILES}
  FOF_MULTIDESTFILES         = $0001;
  {$EXTERNALSYM FOF_CONFIRMMOUSE}
  FOF_CONFIRMMOUSE           = $0002;
  {$EXTERNALSYM FOF_SILENT}
  FOF_SILENT                 = $0004;  // don't create progress/report
  {$EXTERNALSYM FOF_RENAMEONCOLLISION}
  FOF_RENAMEONCOLLISION      = $0008;
  {$EXTERNALSYM FOF_NOCONFIRMATION}
  FOF_NOCONFIRMATION         = $0010;  // Don't prompt the user.
  {$EXTERNALSYM FOF_WANTMAPPINGHANDLE}
  FOF_WANTMAPPINGHANDLE      = $0020;  // Fill in SHFILEOPSTRUCT.hNameMappings
                                       // Must be freed using SHFreeNameMappings
  {$EXTERNALSYM FOF_ALLOWUNDO}
  FOF_ALLOWUNDO              = $0040;
  {$EXTERNALSYM FOF_FILESONLY}
  FOF_FILESONLY              = $0080;  // on *.*, do only files
  {$EXTERNALSYM FOF_SIMPLEPROGRESS}
  FOF_SIMPLEPROGRESS         = $0100;  // means don't show names of files
  {$EXTERNALSYM FOF_NOCONFIRMMKDIR}
  FOF_NOCONFIRMMKDIR         = $0200;  // don't confirm making any needed dirs
  {$EXTERNALSYM FOF_NOERRORUI}
  FOF_NOERRORUI              = $0400;  // don't put up error UI
  {$EXTERNALSYM FOF_NOCOPYSECURITYATTRIBS}
  FOF_NOCOPYSECURITYATTRIBS  = $0800;  // dont copy NT file Security Attributes
  {$EXTERNALSYM FOF_NORECURSION}
  FOF_NORECURSION            = $1000;  // don't recurse into directories.
  {$EXTERNALSYM FOF_NO_CONNECTED_ELEMENTS}
  FOF_NO_CONNECTED_ELEMENTS  = $2000;  // don't operate on connected elements.
  {$EXTERNALSYM FOF_WANTNUKEWARNING}
  FOF_WANTNUKEWARNING        = $4000;  // during delete operation, warn if nuking instead of recycling (partially overrides FOF_NOCONFIRMATION)
  {$EXTERNALSYM FOF_NORECURSEREPARSE}
  FOF_NORECURSEREPARSE       = $8000;  // treat reparse points as objects, not containers

type
  {$EXTERNALSYM FILEOP_FLAGS}
  FILEOP_FLAGS = Word;

const
  {$EXTERNALSYM PO_DELETE}
  PO_DELETE       = $0013;  // printer is being deleted
  {$EXTERNALSYM PO_RENAME}
  PO_RENAME       = $0014;  // printer is being renamed
  {$EXTERNALSYM PO_PORTCHANGE}
  PO_PORTCHANGE   = $0020;  // port this printer connected to is being changed
                            // if this id is set, the strings received by
                            // the copyhook are a doubly-null terminated
                            // list of strings.  The first is the printer
                            // name and the second is the printer port.
  {$EXTERNALSYM PO_REN_PORT}
  PO_REN_PORT     = $0034;  // PO_RENAME and PO_PORTCHANGE at same time.

// no POF_ flags currently defined

type
  {$EXTERNALSYM PRINTEROP_FLAGS}
  PRINTEROP_FLAGS = Word;

// implicit parameters are:
//      if pFrom or pTo are unqualified names the current directories are
//      taken from the global current drive/directory settings managed
//      by Get/SetCurrentDrive/Directory
//
//      the global confirmation settings

type
  PSHFileOpStructA = ^TSHFileOpStructA;
  {$EXTERNALSYM _SHFILEOPSTRUCTA}
  _SHFILEOPSTRUCTA = packed record
    hwnd: HWND;
    wFunc: UINT;
    pFrom: PAnsiChar;
    pTo: PAnsiChar;
    fFlags: FILEOP_FLAGS;
    fAnyOperationsAborted: BOOL;
    hNameMappings: Pointer;
    lpszProgressTitle: PAnsiChar; // only used if FOF_SIMPLEPROGRESS
  end;
  {$EXTERNALSYM SHFILEOPSTRUCTA}
  SHFILEOPSTRUCTA = _SHFILEOPSTRUCTA;
  TSHFileOpStructA = SHFILEOPSTRUCTA;

  PSHFileOpStructW = ^TSHFileOpStructW;
  {$EXTERNALSYM _SHFILEOPSTRUCTW}
  _SHFILEOPSTRUCTW = packed record
    hwnd: HWND;
    wFunc: UINT;
    pFrom: PWideChar;
    pTo: PWideChar;
    fFlags: FILEOP_FLAGS;
    fAnyOperationsAborted: BOOL;
    hNameMappings: Pointer;
    lpszProgressTitle: PWideChar; // only used if FOF_SIMPLEPROGRESS
  end;
  {$EXTERNALSYM SHFILEOPSTRUCTW}
  SHFILEOPSTRUCTW = _SHFILEOPSTRUCTW;
  TSHFileOpStructW = SHFILEOPSTRUCTW;

{$IFDEF UNICODE}
  {$EXTERNALSYM SHFILEOPSTRUCT}
  SHFILEOPSTRUCT = SHFILEOPSTRUCTW;
  TSHFileOpStruct = TSHFileOpStructW;
  PSHFileOpStruct = PSHFileOpStructW;
{$ELSE}                                             {$EXTERNALSYM SHFILEOPSTRUCT}
  SHFILEOPSTRUCT = SHFILEOPSTRUCTA;
  TSHFileOpStruct = TSHFileOpStructA;
  PSHFileOpStruct = PSHFileOpStructA;
{$ENDIF}

{$EXTERNALSYM SHFileOperationA}
function SHFileOperationA(var lpFileOp: TSHFileOpStructA): Integer; stdcall;
{$EXTERNALSYM SHFileOperationW}
function SHFileOperationW(var lpFileOp: TSHFileOpStructW): Integer; stdcall;
{$EXTERNALSYM SHFileOperation}
function SHFileOperation(var lpFileOp: TSHFileOpStruct): Integer; stdcall;
{$EXTERNALSYM SHFreeNameMappings}
procedure SHFreeNameMappings(hNameMappings: THandle); stdcall;

type
  PSHNameMappingA = ^TSHNameMappingA;
  {$EXTERNALSYM _SHNAMEMAPPINGA}
  _SHNAMEMAPPINGA = packed record
    pszOldPath: PAnsiChar;
    pszNewPath: PAnsiChar;
    cchOldPath: Integer;
    cchNewPath: Integer;
  end;
  {$EXTERNALSYM SHNAMEMAPPINGA}
  SHNAMEMAPPINGA = _SHNAMEMAPPINGA;
  TSHNameMappingA = SHNAMEMAPPINGA;

  PSHNameMappingW = ^TSHNameMappingW;
  {$EXTERNALSYM _SHNAMEMAPPINGW}
  _SHNAMEMAPPINGW = packed record
    pszOldPath: PWideChar;
    pszNewPath: PWideChar;
    cchOldPath: Integer;
    cchNewPath: Integer;
  end;
  {$EXTERNALSYM SHNAMEMAPPINGW}
  SHNAMEMAPPINGW = _SHNAMEMAPPINGW;
  TSHNameMappingW = SHNAMEMAPPINGW;



{$IFDEF UNICODE}
  {$EXTERNALSYM SHNAMEMAPPING}
  SHNAMEMAPPING = SHNAMEMAPPINGW;
  PSHNameMapping = PSHNameMappingW;
  TSHNameMapping = TSHNameMappingW;
{$ELSE}
  {$EXTERNALSYM SHNAMEMAPPING}
  SHNAMEMAPPING = SHNAMEMAPPINGA;
  PSHNameMapping = PSHNameMappingA;
  TSHNameMapping = TSHNameMappingA;
{$ENDIF}

////
//// End Shell File Operations
////

////
////  Begin ShellExecuteEx and family
////

{ ShellExecute() and ShellExecuteEx() error codes }

{ regular WinExec() codes }
const
  {$EXTERNALSYM SE_ERR_FNF}
  SE_ERR_FNF              = 2;       // file not found
  {$EXTERNALSYM SE_ERR_PNF}
  SE_ERR_PNF              = 3;       // path not found
  {$EXTERNALSYM SE_ERR_ACCESSDENIED}
  SE_ERR_ACCESSDENIED     = 5;       // access denied
  {$EXTERNALSYM SE_ERR_OOM}
  SE_ERR_OOM              = 8;       // out of memory
  {$EXTERNALSYM SE_ERR_DLLNOTFOUND}
  SE_ERR_DLLNOTFOUND      = 32;

{ error values for ShellExecute() beyond the regular WinExec() codes }
  {$EXTERNALSYM SE_ERR_SHARE}
  SE_ERR_SHARE            = 26;
  {$EXTERNALSYM SE_ERR_ASSOCINCOMPLETE}
  SE_ERR_ASSOCINCOMPLETE  = 27;
  {$EXTERNALSYM SE_ERR_DDETIMEOUT}
  SE_ERR_DDETIMEOUT       = 28;
  {$EXTERNALSYM SE_ERR_DDEFAIL}
  SE_ERR_DDEFAIL          = 29;
  {$EXTERNALSYM SE_ERR_DDEBUSY}
  SE_ERR_DDEBUSY          = 30;
  {$EXTERNALSYM SE_ERR_NOASSOC}
  SE_ERR_NOASSOC          = 31;

// Note CLASSKEY overrides CLASSNAME
  {$EXTERNALSYM SEE_MASK_CLASSNAME}
  SEE_MASK_CLASSNAME         = $00000001;
  {$EXTERNALSYM SEE_MASK_CLASSKEY}
  SEE_MASK_CLASSKEY          = $00000003;
// Note INVOKEIDLIST overrides IDLIST
  {$EXTERNALSYM SEE_MASK_IDLIST}
  SEE_MASK_IDLIST            = $00000004;
  {$EXTERNALSYM SEE_MASK_INVOKEIDLIST}
  SEE_MASK_INVOKEIDLIST      = $0000000C;
  {$EXTERNALSYM SEE_MASK_ICON}
  SEE_MASK_ICON              = $00000010;
  {$EXTERNALSYM SEE_MASK_HOTKEY}
  SEE_MASK_HOTKEY            = $00000020;
  {$EXTERNALSYM SEE_MASK_NOCLOSEPROCESS}
  SEE_MASK_NOCLOSEPROCESS    = $00000040;
  {$EXTERNALSYM SEE_MASK_CONNECTNETDRV}
  SEE_MASK_CONNECTNETDRV     = $00000080;
  {$EXTERNALSYM SEE_MASK_NOASYNC}
  SEE_MASK_NOASYNC           = $00000100;
  {$EXTERNALSYM SEE_MASK_FLAG_DDEWAIT}
  SEE_MASK_FLAG_DDEWAIT      = SEE_MASK_NOASYNC;
  {$EXTERNALSYM SEE_MASK_DOENVSUBST}
  SEE_MASK_DOENVSUBST        = $00000200;
  {$EXTERNALSYM SEE_MASK_FLAG_NO_UI}
  SEE_MASK_FLAG_NO_UI        = $00000400;
  {$EXTERNALSYM SEE_MASK_UNICODE}
  SEE_MASK_UNICODE           = $00004000;
  {$EXTERNALSYM SEE_MASK_NO_CONSOLE}
  SEE_MASK_NO_CONSOLE        = $00008000;
  {$EXTERNALSYM SEE_MASK_ASYNCOK}
  SEE_MASK_ASYNCOK           = $00100000;
  {$EXTERNALSYM SEE_MASK_HMONITOR}
  SEE_MASK_HMONITOR          = $00200000;
  {$EXTERNALSYM SEE_MASK_NOZONECHECKS}
  SEE_MASK_NOZONECHECKS      = $00800000;
  {$EXTERNALSYM SEE_MASK_NOQUERYCLASSSTORE}
  SEE_MASK_NOQUERYCLASSSTORE = $01000000;
  {$EXTERNALSYM SEE_MASK_WAITFORINPUTIDLE}
  SEE_MASK_WAITFORINPUTIDLE  = $02000000;
  {$EXTERNALSYM SEE_MASK_FLAG_LOG_USAGE}
  SEE_MASK_FLAG_LOG_USAGE    = $04000000;


type
  PShellExecuteInfoA = ^TShellExecuteInfoA;
  {$EXTERNALSYM _SHELLEXECUTEINFOA}
  _SHELLEXECUTEINFOA = packed record
    cbSize: DWORD;
    fMask: ULONG;
    hwnd: HWND;
    lpVerb: PAnsiChar;
    lpFile: PAnsiChar;
    lpParameters: PAnsiChar;
    lpDirectory: PAnsiChar;
    nShow: Integer;
    hInstApp: THandle;
    // Optional fields
    lpIDList: Pointer;
    lpClass: PAnsiChar;
    hkeyClass: HKEY;
    dwHotKey: DWORD;
    u: packed record
      case Byte of
        0: (hIcon: THandle);
        1: (hMonitor: THandle);
    end;
    hProcess: THandle;
  end;
  {$EXTERNALSYM SHELLEXECUTEINFOA}
  SHELLEXECUTEINFOA = _SHELLEXECUTEINFOA;
  TShellExecuteInfoA = SHELLEXECUTEINFOA;

  PShellExecuteInfoW = ^TShellExecuteInfoW;
  {$EXTERNALSYM _SHELLEXECUTEINFOW}
  _SHELLEXECUTEINFOW = packed record
    cbSize: DWORD;
    fMask: ULONG;
    hwnd: HWND;
    lpVerb: PWideChar;
    lpFile: PWideChar;
    lpParameters: PWideChar;
    lpDirectory: PWideChar;
    nShow: Integer;
    hInstApp: THandle;
    // Optional fields
    lpIDList: Pointer;
    lpClass: PWideChar;
    hkeyClass: HKEY;
    dwHotKey: DWORD;
    u: packed record
      case Byte of
        0: (hIcon: THandle);
        1: (hMonitor: THandle);
    end;
    hProcess: THandle;
  end;
  {$EXTERNALSYM SHELLEXECUTEINFOA}
  SHELLEXECUTEINFOW = _SHELLEXECUTEINFOW;
  TShellExecuteInfoW = SHELLEXECUTEINFOW;


{$IFDEF UNICODE}
  {$EXTERNALSYM SHELLEXECUTEINFO}
  SHELLEXECUTEINFO = SHELLEXECUTEINFOW;

  PShellExecuteInfo = PShellExecuteInfoW;
  TShellExecuteInfo = TShellExecuteInfoW;
{$ELSE}
  {$EXTERNALSYM SHELLEXECUTEINFO}
  SHELLEXECUTEINFO = SHELLEXECUTEINFOA;

  PShellExecuteInfo = PShellExecuteInfoA;
  TShellExecuteInfo = TShellExecuteInfoA;
{$ENDIF}



{$EXTERNALSYM ShellExecuteExA}
function ShellExecuteExA(var lpExecInfo: TShellExecuteInfoA): BOOL; stdcall;
{$EXTERNALSYM ShellExecuteExW}
function ShellExecuteExW(var lpExecInfo: TShellExecuteInfoW): BOOL; stdcall;
{$EXTERNALSYM ShellExecuteEx}
function ShellExecuteEx(var lpExecInfo: TShellExecuteInfo): BOOL; stdcall;

var
  {$EXTERNALSYM WinExecErrorA}
  WinExecErrorA: procedure(hwnd: HWND; error: Integer; lpstrFileName, lpstrTitle: PAnsiChar); stdcall;
  {$EXTERNALSYM WinExecErrorW}
  WinExecErrorW: procedure(hwnd: HWND; error: Integer; lpstrFileName, lpstrTitle: PWideChar); stdcall;
  {$EXTERNALSYM WinExecError}
  WinExecError: procedure(hwnd: HWND; error: Integer; lpstrFileName, lpstrTitle: PTSTR); stdcall;

//
//  SHCreateProcessAsUser()
type
  PSHCreateProcessInfoW = ^TSHCreateProcessInfoW;
  {$EXTERNALSYM _SHCREATEPROCESSINFOW}
  _SHCREATEPROCESSINFOW = packed record
    cbSize: DWORD;
    fMask: ULONG;
    hwnd: HWND;
    pszFile: PWideChar;
    pszParameters: PWideChar;
    pszCurrentDirectory: PWideChar;
    hUserToken: THandle;
    lpProcessAttributes: PSecurityAttributes;
    lpThreadAttributes: PSecurityAttributes;
    bInheritHandles: BOOL;
    dwCreationFlags: DWORD;
    lpStartupInfo: PStartupInfoW;
    lpProcessInformation: PProcessInformation;
  end;
  {$EXTERNALSYM SHCREATEPROCESSINFOW}
  SHCREATEPROCESSINFOW = _SHCREATEPROCESSINFOW;
  TSHCreateProcessInfoW = SHCREATEPROCESSINFOW;

{$EXTERNALSYM SHCreateProcessAsUserW}
function SHCreateProcessAsUserW(var pscpi: TSHCreateProcessInfoW): BOOL; stdcall;

////
////  End ShellExecuteEx and family
////

//
// RecycleBin
//



// struct for query recycle bin info
type
  PSHQueryRBInfo = ^TSHQueryRBInfo;
  {$EXTERNALSYM _SHQUERYRBINFO}
  _SHQUERYRBINFO = packed record
    cbSize: DWORD;
    i64Size: Int64;
    i64NumItems: Int64;
  end;
  {$EXTERNALSYM SHQUERYRBINFO}
  SHQUERYRBINFO = _SHQUERYRBINFO;
  TSHQueryRBInfo = SHQUERYRBINFO;


// flags for SHEmptyRecycleBin
const
  {$EXTERNALSYM SHERB_NOCONFIRMATION}
  SHERB_NOCONFIRMATION    = $00000001;
  {$EXTERNALSYM SHERB_NOPROGRESSUI}
  SHERB_NOPROGRESSUI      = $00000002;
  {$EXTERNALSYM SHERB_NOSOUND}
  SHERB_NOSOUND           = $00000004;


{$EXTERNALSYM SHQueryRecycleBinA}
function SHQueryRecycleBinA(pszRootPath: PAnsiChar; var pSHQueryRBInfo: TSHQueryRBInfo): HRESULT; stdcall;
{$EXTERNALSYM SHQueryRecycleBinW}
function SHQueryRecycleBinW(pszRootPath: PWideChar; var pSHQueryRBInfo: TSHQueryRBInfo): HRESULT; stdcall;
{$EXTERNALSYM SHQueryRecycleBin}
function SHQueryRecycleBin(pszRootPath: PTSTR; var pSHQueryRBInfo: TSHQueryRBInfo): HRESULT; stdcall;
{$EXTERNALSYM SHEmptyRecycleBinA}
function SHEmptyRecycleBinA(hwnd: HWND; pszRootPath: PAnsiChar; dwFlags: DWORD): HRESULT; stdcall;
{$EXTERNALSYM SHEmptyRecycleBinW}
function SHEmptyRecycleBinW(hwnd: HWND; pszRootPath: PWideChar; dwFlags: DWORD): HRESULT; stdcall;
{$EXTERNALSYM SHEmptyRecycleBin}
function SHEmptyRecycleBin(hwnd: HWND; pszRootPath: PTSTR; dwFlags: DWORD): HRESULT; stdcall;

////
//// end of RecycleBin


////
//// Tray notification definitions
////

type
  PNotifyIconDataA = ^TNotifyIconDataA;
  {$EXTERNALSYM _NOTIFYICONDATAA}
  _NOTIFYICONDATAA = packed record
    cbSize: DWORD;
    hWnd: HWND;
    uID: UINT;
    uFlags: UINT;
    uCallbackMessage: UINT;
    hIcon: HICON;
    szTip: array[0..127] of AnsiChar;
    dwState: DWORD;
    dwStateMask: DWORD;
    szInfo: array[0..255] of AnsiChar;
    u: packed record
      case Byte of
        0: (uTimeout: UINT);
        1: (uVersion: UINT);
    end;
    szInfoTitle: array[0..63] of AnsiChar;
    dwInfoFlags: DWORD;
    guidItem: TGUID;
  end;
  {$EXTERNALSYM NOTIFYICONDATAA}
  NOTIFYICONDATAA = _NOTIFYICONDATAA;
  TNotifyIconDataA = NOTIFYICONDATAA;

  PNotifyIcondataW = ^TNotifyIconDataW;
  {$EXTERNALSYM _NOTIFYICONDATAW}
  _NOTIFYICONDATAW = packed record
    cbSize: DWORD;
    hWnd: HWND;
    uID: UINT;
    uFlags: UINT;
    uCallbackMessage: UINT;
    hIcon: HICON;
    szTip: array[0..127] of WideChar;
    dwState: DWORD;
    dwStateMask: DWORD;
    szInfo: array[0..255] of WideChar;
    u: packed record
      case Byte of
        0: (uTimeout: UINT);
        1: (uVersion: UINT);
    end;
    szInfoTitle: array[0..63] of WideChar;
    dwInfoFlags: DWORD;
    guidItem: TGUID;
  end;
  {$EXTERNALSYM NOTIFYICONDATAW}
  NOTIFYICONDATAW = _NOTIFYICONDATAW;
  TNotifyIconDataW = NOTIFYICONDATAW;

  {$EXTERNALSYM NOTIFYICONDATA}
  NOTIFYICONDATA = NOTIFYICONDATAA;
  PNotifyIconData = PNotifyiconDataA;
  TNotifyIconData = TNotifyIcondataA;

const
  {$EXTERNALSYM NIN_SELECT}
  NIN_SELECT           = WM_USER + 0;
  {$EXTERNALSYM NINF_KEY}
  NINF_KEY             = $1;
  {$EXTERNALSYM NIN_KEYSELECT}
  NIN_KEYSELECT        = NIN_SELECT or NINF_KEY;

  {$EXTERNALSYM NIN_BALLOONSHOW}
  NIN_BALLOONSHOW      = WM_USER + 2;
  {$EXTERNALSYM NIN_BALLOONHIDE}
  NIN_BALLOONHIDE      = WM_USER + 3;
  {$EXTERNALSYM NIN_BALLOONTIMEOUT}
  NIN_BALLOONTIMEOUT   = WM_USER + 4;
  {$EXTERNALSYM NIN_BALLOONUSERCLICK}
  NIN_BALLOONUSERCLICK = WM_USER + 5;

  {$EXTERNALSYM NIM_ADD}
  NIM_ADD         = $00000000;
  {$EXTERNALSYM NIM_MODIFY}
  NIM_MODIFY      = $00000001;
  {$EXTERNALSYM NIM_DELETE}
  NIM_DELETE      = $00000002;
  {$EXTERNALSYM NIM_SETFOCUS}
  NIM_SETFOCUS    = $00000003;
  {$EXTERNALSYM NIM_SETVERSION}
  NIM_SETVERSION  = $00000004;

  {$EXTERNALSYM NOTIFYICON_VERSION}
  NOTIFYICON_VERSION = 3;

  {$EXTERNALSYM NIF_MESSAGE}
  NIF_MESSAGE     = $00000001;
  {$EXTERNALSYM NIF_ICON}
  NIF_ICON        = $00000002;
  {$EXTERNALSYM NIF_TIP}
  NIF_TIP         = $00000004;
  {$EXTERNALSYM NIF_STATE}
  NIF_STATE       = $00000008;
  {$EXTERNALSYM NIF_INFO}
  NIF_INFO        = $00000010;
  {$EXTERNALSYM NIF_GUID}
  NIF_GUID        = $00000020;

  {$EXTERNALSYM NIS_HIDDEN}
  NIS_HIDDEN      = $00000001;
  {$EXTERNALSYM NIS_SHAREDICON}
  NIS_SHAREDICON  = $00000002;

// says this is the source of a shared icon

// Notify Icon Infotip flags
  {$EXTERNALSYM NIIF_NONE}
  NIIF_NONE       = $00000000;
// icon flags are mutually exclusive
// and take only the lowest 2 bits
  {$EXTERNALSYM NIIF_INFO}
  NIIF_INFO       = $00000001;
  {$EXTERNALSYM NIIF_WARNING}
  NIIF_WARNING    = $00000002;
  {$EXTERNALSYM NIIF_ERROR}
  NIIF_ERROR      = $00000003;
  {$EXTERNALSYM NIIF_USER}
  NIIF_USER       = $00000004;
  {$EXTERNALSYM NIIF_ICON_MASK}
  NIIF_ICON_MASK  = $0000000F;
  {$EXTERNALSYM NIIF_NOSOUND}
  NIIF_NOSOUND    = $00000010;

{$EXTERNALSYM Shell_NotifyIconA}
function Shell_NotifyIconA(dwMessage: DWORD; lpData: PNOTIFYICONDATAA): BOOL; stdcall;
{$EXTERNALSYM Shell_NotifyIconW}
function Shell_NotifyIconW(dwMessage: DWORD; lpData: PNOTIFYICONDATAW): BOOL; stdcall;
{$EXTERNALSYM Shell_NotifyIcon}
function Shell_NotifyIcon(dwMessage: DWORD; lpData: PNOTIFYICONDATA): BOOL; stdcall;

////
//// End Tray Notification Icons
////


////
//// Begin SHGetFileInfo
////

{
 * The SHGetFileInfo API provides an easy way to get attributes
 * for a file given a pathname.
 *
 *   PARAMETERS
 *
 *     pszPath              file name to get info about
 *     dwFileAttributes     file attribs, only used with SHGFI_USEFILEATTRIBUTES
 *     psfi                 place to return file info
 *     cbFileInfo           size of structure
 *     uFlags               flags
 *
 *   RETURN
 *     TRUE if things worked
 }

type
  PSHFileInfoA = ^TSHFileInfoA;
  {$EXTERNALSYM _SHFILEINFOA}
  _SHFILEINFOA = packed record
    hIcon: HICON;                                      // out: icon
    iIcon: Integer;                                    // out: icon index
    dwAttributes: DWORD;                               // out: SFGAO_ flags
    szDisplayName: array[0..MAX_PATH - 1] of AnsiChar; // out: display name (or path)
    szTypeName: array[0..79] of AnsiChar;              // out: type name
  end;
  {$EXTERNALSYM SHFILEINFOA}
  SHFILEINFOA = _SHFILEINFOA;
  TSHFileInfoA = _SHFILEINFOA;

  PSHFileInfoW = ^TSHFileInfoW;
  {$EXTERNALSYM _SHFILEINFOW}
  _SHFILEINFOW = packed record
    hIcon: HICON;                                      // out: icon
    iIcon: Integer;                                    // out: icon index
    dwAttributes: DWORD;                               // out: SFGAO_ flags
    szDisplayName: array[0..MAX_PATH - 1] of WideChar; // out: display name (or path)
    szTypeName: array[0..79] of WideChar;              // out: type name
  end;
  {$EXTERNALSYM SHFILEINFOW}
  SHFILEINFOW = _SHFILEINFOW;
  TSHFileInfoW = _SHFILEINFOW;

  {$EXTERNALSYM SHFILEINFO}
  SHFILEINFO = SHFILEINFOA;
  TSHFileInfo = TSHFileInfoA;
  PSHFIleInfo = PSHFileInfoA;

const
  {$EXTERNALSYM SHGFI_ICON}
  SHGFI_ICON              = $000000100;     // get icon
  {$EXTERNALSYM SHGFI_DISPLAYNAME}
  SHGFI_DISPLAYNAME       = $000000200;     // get display name
  {$EXTERNALSYM SHGFI_TYPENAME}
  SHGFI_TYPENAME          = $000000400;     // get type name
  {$EXTERNALSYM SHGFI_ATTRIBUTES}
  SHGFI_ATTRIBUTES        = $000000800;     // get attributes
  {$EXTERNALSYM SHGFI_ICONLOCATION}
  SHGFI_ICONLOCATION      = $000001000;     // get icon location
  {$EXTERNALSYM SHGFI_EXETYPE}
  SHGFI_EXETYPE           = $000002000;     // return exe type
  {$EXTERNALSYM SHGFI_SYSICONINDEX}
  SHGFI_SYSICONINDEX      = $000004000;     // get system icon index
  {$EXTERNALSYM SHGFI_LINKOVERLAY}
  SHGFI_LINKOVERLAY       = $000008000;     // put a link overlay on icon
  {$EXTERNALSYM SHGFI_SELECTED}
  SHGFI_SELECTED          = $000010000;     // show icon in selected state
  {$EXTERNALSYM SHGFI_ATTR_SPECIFIED}
  SHGFI_ATTR_SPECIFIED    = $000020000;     // get only specified attributes
  {$EXTERNALSYM SHGFI_LARGEICON}
  SHGFI_LARGEICON         = $000000000;     // get large icon
  {$EXTERNALSYM SHGFI_SMALLICON}
  SHGFI_SMALLICON         = $000000001;     // get small icon
  {$EXTERNALSYM SHGFI_OPENICON}
  SHGFI_OPENICON          = $000000002;     // get open icon
  {$EXTERNALSYM SHGFI_SHELLICONSIZE}
  SHGFI_SHELLICONSIZE     = $000000004;     // get shell size icon
  {$EXTERNALSYM SHGFI_PIDL}
  SHGFI_PIDL              = $000000008;     // pszPath is a pidl
  {$EXTERNALSYM SHGFI_USEFILEATTRIBUTES}
  SHGFI_USEFILEATTRIBUTES = $000000010;     // use passed dwFileAttribute

  {$EXTERNALSYM SHGFI_ADDOVERLAYS}
  SHGFI_ADDOVERLAYS       = $000000020;     // apply the appropriate overlays
  {$EXTERNALSYM SHGFI_OVERLAYINDEX}
  SHGFI_OVERLAYINDEX      = $000000040;     // Get the index of the overlay
                                            // in the upper 8 bits of the iIcon

{$EXTERNALSYM SHGetFileInfoA}
function SHGetFileInfoA(pszPath: PAnsiChar; dwFileAttributes: DWORD; var psfi: TSHFileInfoA; cbFileInfo, uFlags: UINT): DWORD; stdcall;
{$EXTERNALSYM SHGetFileInfoW}
function SHGetFileInfoW(pszPath: PWideChar; dwFileAttributes: DWORD; var psfi: TSHFileInfoW; cbFileInfo, uFlags: UINT): DWORD; stdcall;
{$EXTERNALSYM SHGetFileInfo}
function SHGetFileInfo(pszPath: PTSTR; dwFileAttributes: DWORD; var psfi: TSHFileInfo; cbFileInfo, uFlags: UINT): DWORD; stdcall;


{$EXTERNALSYM SHGetDiskFreeSpaceExA}
function SHGetDiskFreeSpaceExA(pszDirectoryName: PAnsiChar; var pulFreeBytesAvailableToCaller, pulTotalNumberOfBytes, pulTotalNumberOfFreeBytes: ULARGE_INTEGER): BOOL; stdcall;
{$EXTERNALSYM SHGetDiskFreeSpaceExW}
function SHGetDiskFreeSpaceExW(pszDirectoryName: PWideChar; var pulFreeBytesAvailableToCaller, pulTotalNumberOfBytes, pulTotalNumberOfFreeBytes: ULARGE_INTEGER): BOOL; stdcall;
{$EXTERNALSYM SHGetDiskFreeSpaceEx}
function SHGetDiskFreeSpaceEx(pszDirectoryName: PTSTR; var pulFreeBytesAvailableToCaller, pulTotalNumberOfBytes, pulTotalNumberOfFreeBytes: ULARGE_INTEGER): BOOL; stdcall;
{$EXTERNALSYM SHGetDiskFreeSpaceA}
function SHGetDiskFreeSpaceA(pszDirectoryName: PAnsiChar; var pulFreeBytesAvailableToCaller, pulTotalNumberOfBytes, pulTotalNumberOfFreeBytes: ULARGE_INTEGER): BOOL; stdcall;
{$EXTERNALSYM SHGetDiskFreeSpaceW}
function SHGetDiskFreeSpaceW(pszDirectoryName: PWideChar; var pulFreeBytesAvailableToCaller, pulTotalNumberOfBytes, pulTotalNumberOfFreeBytes: ULARGE_INTEGER): BOOL; stdcall;
{$EXTERNALSYM SHGetDiskFreeSpace}
function SHGetDiskFreeSpace(pszDirectoryName: PTSTR; var pulFreeBytesAvailableToCaller, pulTotalNumberOfBytes, pulTotalNumberOfFreeBytes: ULARGE_INTEGER): BOOL; stdcall;
{$EXTERNALSYM SHGetNewLinkInfoA}
function SHGetNewLinkInfoA(pszLinkTo, pszDir, pszName: PAnsiChar; var pfMustCopy: BOOL; uFlags: UINT): BOOL; stdcall;
{$EXTERNALSYM SHGetNewLinkInfoW}
function SHGetNewLinkInfoW(pszLinkTo, pszDir, pszName: PWideChar; var pfMustCopy: BOOL; uFlags: UINT): BOOL; stdcall;
{$EXTERNALSYM SHGetNewLinkInfo}
function SHGetNewLinkInfo(pszLinkTo, pszDir, pszName: PTSTR; var pfMustCopy: BOOL; uFlags: UINT): BOOL; stdcall;

const
  {$EXTERNALSYM SHGNLI_PIDL}
  SHGNLI_PIDL             = $000000001;     // pszLinkTo is a pidl
  {$EXTERNALSYM SHGNLI_PREFIXNAME}
  SHGNLI_PREFIXNAME       = $000000002;     // Make name "Shortcut to xxx"
  {$EXTERNALSYM SHGNLI_NOUNIQUE}
  SHGNLI_NOUNIQUE         = $000000004;     // don't do the unique name generation
  {$EXTERNALSYM SHGNLI_NOLNK}
  SHGNLI_NOLNK            = $000000008;     // don't add ".lnk" extension

////
//// End SHGetFileInfo
////

// Printer stuff
const
  {$EXTERNALSYM PRINTACTION_OPEN}
  PRINTACTION_OPEN             = 0;
  {$EXTERNALSYM PRINTACTION_PROPERTIES}
  PRINTACTION_PROPERTIES       = 1;
  {$EXTERNALSYM PRINTACTION_NETINSTALL}
  PRINTACTION_NETINSTALL       = 2;
  {$EXTERNALSYM PRINTACTION_NETINSTALLLINK}
  PRINTACTION_NETINSTALLLINK   = 3;
  {$EXTERNALSYM PRINTACTION_TESTPAGE}
  PRINTACTION_TESTPAGE         = 4;
  {$EXTERNALSYM PRINTACTION_OPENNETPRN}
  PRINTACTION_OPENNETPRN       = 5;
  {$EXTERNALSYM PRINTACTION_DOCUMENTDEFAULTS}
  PRINTACTION_DOCUMENTDEFAULTS = 6;
  {$EXTERNALSYM PRINTACTION_SERVERPROPERTIES}
  PRINTACTION_SERVERPROPERTIES = 7;

{$EXTERNALSYM SHInvokePrinterCommandA}
function SHInvokePrinterCommandA(hwnd: HWND; uAction: UINT; lpBuf1, lpBuf2: PAnsiChar; fModal: BOOL): BOOL; stdcall;
{$EXTERNALSYM SHInvokePrinterCommandW}
function SHInvokePrinterCommandW(hwnd: HWND; uAction: UINT; lpBuf1, lpBuf2: PWideChar; fModal: BOOL): BOOL; stdcall;
{$EXTERNALSYM SHInvokePrinterCommand}
function SHInvokePrinterCommand(hwnd: HWND; uAction: UINT; lpBuf1, lpBuf2: PTSTR; fModal: BOOL): BOOL; stdcall;

//
// The SHLoadNonloadedIconOverlayIdentifiers API causes the shell's
// icon overlay manager to load any registered icon overlay
// identifers that are not currently loaded.  This is useful if an
// overlay identifier did not load at shell startup but is needed
// and can be loaded at a later time.  Identifiers already loaded
// are not affected.  Overlay identifiers implement the 
// IShellIconOverlayIdentifier interface.
//
// Returns:
//      S_OK
// 
{$EXTERNALSYM SHLoadNonloadedIconOverlayIdentifiers}
function SHLoadNonloadedIconOverlayIdentifiers: HRESULT; stdcall;

//
// The SHIsFileAvailableOffline API determines whether a file
// or folder is available for offline use.
//
// Parameters:
//     pwszPath             file name to get info about
//     pdwStatus            (optional) OFFLINE_STATUS_* flags returned here
//
// Returns:
//     S_OK                 File/directory is available offline, unless
//                            OFFLINE_STATUS_INCOMPLETE is returned.
//     E_INVALIDARG         Path is invalid, or not a net path
//     E_FAIL               File/directory is not available offline
//
// Notes:
//     OFFLINE_STATUS_INCOMPLETE is never returned for directories.
//     Both OFFLINE_STATUS_LOCAL and OFFLINE_STATUS_REMOTE may be returned,
//     indicating "open in both places." This is common when the server is online.
//
{$EXTERNALSYM SHIsFileAvailableOffline}
function SHIsFileAvailableOffline(pwszPath: PWideChar; var pdwStatus: DWORD): HRESULT; stdcall;

const
  {$EXTERNALSYM OFFLINE_STATUS_LOCAL}
  OFFLINE_STATUS_LOCAL        = $0001;  // If open, it's open locally
  {$EXTERNALSYM OFFLINE_STATUS_REMOTE}
  OFFLINE_STATUS_REMOTE       = $0002;  // If open, it's open remotely
  {$EXTERNALSYM OFFLINE_STATUS_INCOMPLETE}
  OFFLINE_STATUS_INCOMPLETE   = $0004;  // The local copy is currently imcomplete.
                                        // The file will not be available offline
                                        // until it has been synchronized.

//  sets the specified path to use the string resource
//  as the UI instead of the file system name
{$EXTERNALSYM SHSetLocalizedName}
function SHSetLocalizedName(pszPath, pszResModule: PWideChar; idsRes: Integer): HRESULT; stdcall;




//====== ShellMessageBox ================================================

// If lpcTitle is NULL, the title is taken from hWnd
// If lpcText is NULL, this is assumed to be an Out Of Memory message
// If the selector of lpcTitle or lpcText is NULL, the offset should be a
//     string resource ID
// The variable arguments must all be 32-bit values (even if fewer bits
//     are actually used)
// lpcText (or whatever string resource it causes to be loaded) should
//     be a formatting string similar to wsprintf except that only the
//     following formats are available:
//         %%              formats to a single '%'
//         %nn%s           the nn-th arg is a string which is inserted
//         %nn%ld          the nn-th arg is a DWORD, and formatted decimal
//         %nn%lx          the nn-th arg is a DWORD, and formatted hex
//     note that lengths are allowed on the %s, %ld, and %lx, just
//                         like wsprintf
//

{$IFDEF DELPHI6_UP}
//variable arguments are not supported in delphi 5
//maybe this also applies to d6
{$EXTERNALSYM ShellMessageBoxA}
function ShellMessageBoxA(hAppInst: THandle; hWnd: HWND; lpcText, lpcTitle: PAnsiChar; fuStyle: UINT): Integer; cdecl; varargs;
{$EXTERNALSYM ShellMessageBoxW}
function ShellMessageBoxW(hAppInst: THandle; hWnd: HWND; lpcText, lpcTitle: PWideChar; fuStyle: UINT): Integer; cdecl; varargs;
{$EXTERNALSYM ShellMessageBox}
function ShellMessageBox(hAppInst: THandle; hWnd: HWND; lpcText, lpcTitle: PTSTR; fuStyle: UINT): Integer; cdecl; varargs;
{$ENDIF DELPHI6_UP}

{$EXTERNALSYM IsLFNDriveA}
function IsLFNDriveA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM IsLFNDriveW}
function IsLFNDriveW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM IsLFNDrive}
function IsLFNDrive(pszPath: PTSTR): BOOL; stdcall;

{The following 3 functions are only available as unicode version.
MSDN states this correctly, however all SDK's define also an ansicode version.
We just define W variant!
}

function SHGetUnreadMailCountW(hKeyUser: Thandle; pszMailAddress: PWideChar; out pdwCount: DWORD; var pFileTime: TFileTime; pszShellExecuteCommand: PWideChar;
            cchShellExecuteCommand: Integer): HRESULT; stdcall;
function SHEnumerateUnreadMailAccountsW(hKeyUser: THandle; dwIndex: DWORD; pszMailAddress: PWideChar; cchMailAddress: Integer): HRESULT; stdcall;
function SHSetUnreadMailCountW(pszMailAddress: PWideChar; dwCount: DWORD; pszShellExecuteCommand: PWideChar): HRESULT; stdcall;

{$EXTERNALSYM SHTestTokenMembership}
function SHTestTokenMembership(hToken: THandle; ulRID: ULONG): BOOL; stdcall;

{$EXTERNALSYM SHGetImageList}
function SHGetImageList(iImageList: Integer; riid: TGUID; out ppvObj: Pointer): HRESULT; stdcall;

const
  {$EXTERNALSYM SHIL_LARGE}
  SHIL_LARGE          = 0;   // normally 32x32
  {$EXTERNALSYM SHIL_SMALL}
  SHIL_SMALL          = 1;   // normally 16x16
  {$EXTERNALSYM SHIL_EXTRALARGE}
  SHIL_EXTRALARGE     = 2;
  {$EXTERNALSYM SHIL_SYSSMALL}
  SHIL_SYSSMALL       = 3;   // like SHIL_SMALL, but tracks system small icon metric correctly

  {$EXTERNALSYM SHIL_LAST}
  SHIL_LAST           = SHIL_SYSSMALL;


// Function call types for ntshrui folder sharing helpers
type
  {$EXTERNALSYM PFNCANSHAREFOLDERW}
  PFNCANSHAREFOLDERW = function(pszPath: PWideChar): HRESULT stdcall;
  TFnCanShareFolderW = PFNCANSHAREFOLDERW;

  {$EXTERNALSYM PFNSHOWSHAREFOLDERUIW}
  PFNSHOWSHAREFOLDERUIW = function(hwndParent: HWND; pszPath: PWideChar): HRESULT stdcall;
  TFnShowShareFolderUIW = PFNSHOWSHAREFOLDERUIW;

{$ENDIF JWA_IMPLEMENTATIONSECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
implementation
uses JwaWinDLLNames;
{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_INCLUDEMODE}
const
  {$IFDEF UNICODE}
  AWSuffix = 'W';
  {$ELSE}
  AWSuffix = 'A';
  {$ENDIF UNICODE}
{$ENDIF JWA_INCLUDEMODE}

{$IFNDEF JWA_INTERFACESECTION}

// Macro function

function EIRESID(x: Integer): Integer;
begin
  Result := -x;
end;

{$IFDEF DELPHI6_UP}
//cannot be dynamical because of varargs
function ShellMessageBoxA; external Shell32 name 'ShellMessageBoxA' delayed;
function ShellMessageBoxW; external Shell32 name 'ShellMessageBoxW' delayed;
function ShellMessageBox; external Shell32 name 'ShellMessageBox'+ AWSuffix delayed;
{$ENDIF}

function DragQueryFileA; external Shell32 name 'DragQueryFileA' delayed;
function DragQueryFileW; external Shell32 name 'DragQueryFileW' delayed;
function DragQueryFile; external Shell32 name 'DragQueryFile' + AWSuffix delayed;
function DragQueryPoint; external Shell32 name 'DragQueryPoint' delayed;
procedure DragFinish; external Shell32 name 'DragFinish' delayed;
procedure DragAcceptFiles; external Shell32 name 'DragAcceptFiles' delayed;
function ShellExecuteA; external Shell32 name 'ShellExecuteA' delayed;
function ShellExecuteW; external Shell32 name 'ShellExecuteW' delayed;
function ShellExecute; external Shell32 name 'ShellExecute' + AWSuffix delayed;
function FindExecutableA; external Shell32 name 'FindExecutableA' delayed;
function FindExecutableW; external Shell32 name 'FindExecutableW' delayed;
function FindExecutable; external Shell32 name 'FindExecutable' + AWSuffix delayed;
function CommandLineToArgvW; external Shell32 name 'CommandLineToArgvW' delayed;
function ShellAboutA; external Shell32 name 'ShellAboutA' delayed;
function ShellAboutW; external Shell32 name 'ShellAboutW' delayed;
function ShellAbout; external Shell32 name 'ShellAbout' + AWSuffix delayed;
function DuplicateIcon; external Shell32 name 'DuplicateIcon' delayed;
function ExtractAssociatedIconA; external Shell32 name 'ExtractAssociatedIconA' delayed;
function ExtractAssociatedIconW; external Shell32 name 'ExtractAssociatedIconW' delayed;
function ExtractAssociatedIcon; external Shell32 name 'ExtractAssociatedIcon' + AWSuffix delayed;
function ExtractAssociatedIconExA; external Shell32 name 'ExtractAssociatedIconExA' delayed;
function ExtractAssociatedIconExW; external Shell32 name 'ExtractAssociatedIconExW' delayed;
function ExtractAssociatedIconEx; external Shell32 name 'ExtractAssociatedIconEx' + AWSuffix delayed;
function ExtractIconA; external Shell32 name 'ExtractIconA' delayed;
function ExtractIconW; external Shell32 name 'ExtractIconW' delayed;
function ExtractIcon; external Shell32 name 'ExtractIcon' + AWSuffix delayed;
function SHAppBarMessage; external Shell32 name 'SHAppBarMessage' delayed;
function DoEnvironmentSubstA; external Shell32 name 'DoEnvironmentSubstA' delayed;
function DoEnvironmentSubstW; external Shell32 name 'DoEnvironmentSubstW' delayed;
function DoEnvironmentSubst; external Shell32 name 'DoEnvironmentSubst' + AWSuffix delayed;
function ExtractIconExA; external Shell32 name 'ExtractIconExA' delayed;
function ExtractIconExW; external Shell32 name 'ExtractIconExW' delayed;
function ExtractIconEx; external Shell32 name 'ExtractIconEx' + AWSuffix delayed;
function SHFileOperationA; external Shell32 name 'SHFileOperationA' delayed;
function SHFileOperationW; external Shell32 name 'SHFileOperationW' delayed;
function SHFileOperation; external Shell32 name 'SHFileOperation' + AWSuffix delayed;
procedure SHFreeNameMappings; external Shell32 name 'SHFreeNameMappings' delayed;
function ShellExecuteExA; external Shell32 name 'ShellExecuteExA' delayed;
function ShellExecuteExW; external Shell32 name 'ShellExecuteExW' delayed;
function ShellExecuteEx; external Shell32 name 'ShellExecuteEx' + AWSuffix delayed;
function SHCreateProcessAsUserW; external Shell32 name 'SHCreateProcessAsUserW' delayed;
function SHQueryRecycleBinA; external Shell32 name 'SHQueryRecycleBinA' delayed;
function SHQueryRecycleBinW; external Shell32 name 'SHQueryRecycleBinW' delayed;
function SHQueryRecycleBin; external Shell32 name 'SHQueryRecycleBin' + AWSuffix delayed;
function SHEmptyRecycleBinA; external Shell32 name 'SHEmptyRecycleBinA' delayed;
function SHEmptyRecycleBinW; external Shell32 name 'SHEmptyRecycleBinW' delayed;
function SHEmptyRecycleBin; external Shell32 name 'SHEmptyRecycleBin'+ AWSuffix delayed;
function Shell_NotifyIconA; external Shell32 name 'Shell_NotifyIconA' delayed;
function Shell_NotifyIconW; external Shell32 name 'Shell_NotifyIconW' delayed;
function Shell_NotifyIcon; external Shell32 name 'Shell_NotifyIcon'+ AWSuffix delayed;
function SHGetFileInfoA; external Shell32 name 'SHGetFileInfoA' delayed;
function SHGetFileInfoW; external Shell32 name 'SHGetFileInfoW' delayed;
function SHGetFileInfo; external Shell32 name 'SHGetFileInfo'+ AWSuffix delayed;
function SHGetDiskFreeSpaceExA; external Shell32 name 'SHGetDiskFreeSpaceExA' delayed;
function SHGetDiskFreeSpaceExW; external Shell32 name 'SHGetDiskFreeSpaceExW' delayed;
function SHGetDiskFreeSpaceEx; external Shell32 name 'SHGetDiskFreeSpaceEx'+ AWSuffix delayed;
function SHGetDiskFreeSpaceA; external Shell32 name 'SHGetDiskFreeSpaceExA' delayed;
function SHGetDiskFreeSpaceW; external Shell32 name 'SHGetDiskFreeSpaceExW' delayed;
function SHGetDiskFreeSpace; external Shell32 name 'SHGetDiskFreeSpaceEx'+ AWSuffix delayed;
function SHGetNewLinkInfoA; external Shell32 name 'SHGetNewLinkInfoA' delayed;
function SHGetNewLinkInfoW; external Shell32 name 'SHGetNewLinkInfoW' delayed;
function SHGetNewLinkInfo; external Shell32 name 'SHGetNewLinkInfo'+ AWSuffix delayed;
function SHInvokePrinterCommandA; external Shell32 name 'SHInvokePrinterCommandA' delayed;
function SHInvokePrinterCommandW; external Shell32 name 'SHInvokePrinterCommandW' delayed;
function SHInvokePrinterCommand; external Shell32 name 'SHInvokePrinterCommand'+ AWSuffix delayed;
function SHLoadNonloadedIconOverlayIdentifiers; external Shell32 name 'SHLoadNonloadedIconOverlayIdentifiers' delayed;
function SHIsFileAvailableOffline; external Shell32 name 'SHIsFileAvailableOffline' delayed;
function SHSetLocalizedName; external Shell32 name 'SHSetLocalizedName' delayed;
function IsLFNDriveA; external Shell32 name 'IsLFNDriveA' delayed;
function IsLFNDriveW; external Shell32 name 'IsLFNDriveW' delayed;
function IsLFNDrive; external Shell32 name 'IsLFNDrive'+ AWSuffix delayed;
function SHTestTokenMembership; external Shell32 name 'SHTestTokenMembership' delayed;
function SHGetImageList; external Shell32 name 'SHGetImageList' delayed;
function SHGetUnreadMailCountW; external Shell32 name 'SHGetUnreadMailCountW' delayed;
function SHEnumerateUnreadMailAccountsW; external Shell32 name 'SHEnumerateUnreadMailAccountsW' delayed;
function SHSetUnreadMailCountW; external Shell32 name 'SHSetUnreadMailCountW' delayed;

{$ENDIF JWA_INTERFACESECTION}

{$IFNDEF JWA_OMIT_SECTIONS}


end.
{$ENDIF JWA_OMIT_SECTIONS}
