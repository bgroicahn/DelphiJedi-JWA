{******************************************************************************}
{                                                                              }
{ Windows Installer API interface Unit for Object Pascal                       }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2001 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The original file is: msi.h, released June 2000. The original Pascal         }
{ code is: Msi.pas, released June 2001. The initial developer of the           }
{ Pascal code is Marcel van Brakel (brakelm att chello dott nl).               }
{                                                                              }
{ Portions created by Marcel van Brakel are Copyright (C) 1999-2001            }
{ Marcel van Brakel. All Rights Reserved.                                      }
{                                                                              }
{ Contributors: Steve Moss (spm att coco dott co dott uk)                      }
{                                                                              }
{ Obtained through: Joint Endeavour of Delphi Innovators (Project JEDI)        }
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
{******************************************************************************}

// $Id: JwaMsi.pas,v 1.17 2007/09/05 11:58:51 dezipaitor Exp $

{$IFNDEF JWA_OMIT_SECTIONS}
unit JwaMsi;

{$WEAKPACKAGEUNIT}

{$I ..\Includes\JediAPILib.inc}

interface

uses
  JwaWinType, JwaWinCrypt { for PCCERT_CONTEXT };
{$ENDIF JWA_OMIT_SECTIONS}

{$HPPEMIT ''}
{$HPPEMIT '#include "msi.h"'}
{$HPPEMIT ''}

{$IFNDEF JWA_IMPLEMENTATIONSECTION}
// (rom) MSI version IFDEFs now declared in jediapilib.inc

(*****************************************************************************\
*                                                                             *
* msi.h - - Interface for external access to Installer Service                *
*                                                                             *
* Version 1.0 - 1.2                                                           *
*                                                                             *
* NOTES:  All buffers sizes are TCHAR count, null included only on input      *
*         Return argument pointers may be null if not interested in value     *
*                                                                             *
* Copyright (c) 1999-2000, Microsoft Corp.      All rights reserved.          *
*                                                                             *
\*****************************************************************************)

// --------------------------------------------------------------------------
// Installer generic handle definitions
// --------------------------------------------------------------------------

type
  MSIHANDLE = DWORD;     // abstract generic handle, 0 == no handle
  {$EXTERNALSYM MSIHANDLE}
  TMsiHandle = MSIHANDLE;

// Close a open handle of any type
// All handles obtained from API calls must be closed when no longer needed
// Normally succeeds, returning TRUE.

function MsiCloseHandle(hAny: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiCloseHandle}

// Close all handles open in the process, a diagnostic call
// This should NOT be used as a cleanup mechanism -- use PMSIHANDLE class
// Can be called at termination to assure that all handles have been closed
// Returns 0 if all handles have been close, else number of open handles

function MsiCloseAllHandles: UINT; stdcall;
{$EXTERNALSYM MsiCloseAllHandles}

// Install message type for callback is a combination of the following:
//  A message box style:      MB_*, where MB_OK is the default
//  A message box icon type:  MB_ICON*, where no icon is the default
//  A default button:         MB_DEFBUTTON?, where MB_DEFBUTTON1 is the default
//  One of the following install message types, no default

const
  INSTALLMESSAGE_FATALEXIT      = $00000000; // premature termination, possibly fatal OOM
  {$EXTERNALSYM INSTALLMESSAGE_FATALEXIT}
  INSTALLMESSAGE_ERROR          = $01000000; // formatted error message
  {$EXTERNALSYM INSTALLMESSAGE_ERROR}
  INSTALLMESSAGE_WARNING        = $02000000; // formatted warning message
  {$EXTERNALSYM INSTALLMESSAGE_WARNING}
  INSTALLMESSAGE_USER           = $03000000; // user request message
  {$EXTERNALSYM INSTALLMESSAGE_USER}
  INSTALLMESSAGE_INFO           = $04000000; // informative message for log
  {$EXTERNALSYM INSTALLMESSAGE_INFO}
  INSTALLMESSAGE_FILESINUSE     = $05000000; // list of files in use that need to be replaced
  {$EXTERNALSYM INSTALLMESSAGE_FILESINUSE}
  INSTALLMESSAGE_RESOLVESOURCE  = $06000000; // request to determine a valid source location
  {$EXTERNALSYM INSTALLMESSAGE_RESOLVESOURCE}
  INSTALLMESSAGE_OUTOFDISKSPACE = $07000000; // insufficient disk space message
  {$EXTERNALSYM INSTALLMESSAGE_OUTOFDISKSPACE}
  INSTALLMESSAGE_ACTIONSTART    = $08000000; // start of action: action name & description
  {$EXTERNALSYM INSTALLMESSAGE_ACTIONSTART}
  INSTALLMESSAGE_ACTIONDATA     = $09000000; // formatted data associated with individual action item
  {$EXTERNALSYM INSTALLMESSAGE_ACTIONDATA}
  INSTALLMESSAGE_PROGRESS       = $0A000000; // progress gauge info: units so far, total
  {$EXTERNALSYM INSTALLMESSAGE_PROGRESS}
  INSTALLMESSAGE_COMMONDATA     = $0B000000; // product info for dialog: language Id, dialog caption
  {$EXTERNALSYM INSTALLMESSAGE_COMMONDATA}
  INSTALLMESSAGE_INITIALIZE     = $0C000000; // sent prior to UI initialization, no string data
  {$EXTERNALSYM INSTALLMESSAGE_INITIALIZE}
  INSTALLMESSAGE_TERMINATE      = $0D000000; // sent after UI termination, no string data
  {$EXTERNALSYM INSTALLMESSAGE_TERMINATE}
  INSTALLMESSAGE_SHOWDIALOG     = $0E000000; // sent prior to display or authored dialog or wizard
  {$EXTERNALSYM INSTALLMESSAGE_SHOWDIALOG}

type
  INSTALLMESSAGE = Longint;
  {$EXTERNALSYM INSTALLMESSAGE}
  TInstallMessage = INSTALLMESSAGE;

// external error handler supplied to installation API functions

type
  INSTALLUI_HANDLERA = function(pvContext: LPVOID; iMessageType: UINT; szMessage: LPCSTR): Integer; stdcall;
  {$EXTERNALSYM INSTALLUI_HANDLERA}
  TInstallUIHandlerA = INSTALLUI_HANDLERA;
  INSTALLUI_HANDLERW = function(pvContext: LPVOID; iMessageType: UINT; szMessage: LPCWSTR): Integer; stdcall;
  {$EXTERNALSYM INSTALLUI_HANDLERW}
  TInstallUIHandlerW = INSTALLUI_HANDLERW;

  {$IFDEF UNICODE}
  INSTALLUI_HANDLER = INSTALLUI_HANDLERW;
  {$EXTERNALSYM INSTALLUI_HANDLER}
  TInstallUIHandler = TInstallUIHandlerW;
  {$ELSE}
  INSTALLUI_HANDLER = INSTALLUI_HANDLERA;
  {$EXTERNALSYM INSTALLUI_HANDLER}
  TInstallUIHandler = TInstallUIHandlerA;
  {$ENDIF UNICODE}

const
  INSTALLUILEVEL_NOCHANGE = 0;    // UI level is unchanged
  {$EXTERNALSYM INSTALLUILEVEL_NOCHANGE}
  INSTALLUILEVEL_DEFAULT  = 1;    // default UI is used
  {$EXTERNALSYM INSTALLUILEVEL_DEFAULT}
  INSTALLUILEVEL_NONE     = 2;    // completely silent installation
  {$EXTERNALSYM INSTALLUILEVEL_NONE}
  INSTALLUILEVEL_BASIC    = 3;    // simple progress and error handling
  {$EXTERNALSYM INSTALLUILEVEL_BASIC}
  INSTALLUILEVEL_REDUCED  = 4;    // authored UI, wizard dialogs suppressed
  {$EXTERNALSYM INSTALLUILEVEL_REDUCED}
  INSTALLUILEVEL_FULL     = 5;    // authored UI with wizards, progress, errors
  {$EXTERNALSYM INSTALLUILEVEL_FULL}
  INSTALLUILEVEL_ENDDIALOG    = $80; // display success/failure dialog at end of install
  {$EXTERNALSYM INSTALLUILEVEL_ENDDIALOG}
  INSTALLUILEVEL_PROGRESSONLY = $40; // display only progress dialog
  {$EXTERNALSYM INSTALLUILEVEL_PROGRESSONLY}
  INSTALLUILEVEL_HIDECANCEL   = $20; // do not display the cancel button in basic UI
  {$EXTERNALSYM INSTALLUILEVEL_HIDECANCEL}
  INSTALLUILEVEL_SOURCERESONLY = $100; // force display of source resolution even if quiet
  {$EXTERNALSYM INSTALLUILEVEL_SOURCERESONLY}

type
  INSTALLUILEVEL = Longint;
  {$EXTERNALSYM INSTALLUILEVEL}
  TInstallUILevel = INSTALLUILEVEL;

const
  INSTALLSTATE_NOTUSED      = -7;  // component disabled
  {$EXTERNALSYM INSTALLSTATE_NOTUSED}
  INSTALLSTATE_BADCONFIG    = -6;  // configuration data corrupt
  {$EXTERNALSYM INSTALLSTATE_BADCONFIG}
  INSTALLSTATE_INCOMPLETE   = -5;  // installation suspended or in progress
  {$EXTERNALSYM INSTALLSTATE_INCOMPLETE}
  INSTALLSTATE_SOURCEABSENT = -4;  // run from source, source is unavailable
  {$EXTERNALSYM INSTALLSTATE_SOURCEABSENT}
  INSTALLSTATE_MOREDATA     = -3;  // return buffer overflow
  {$EXTERNALSYM INSTALLSTATE_MOREDATA}
  INSTALLSTATE_INVALIDARG   = -2;  // invalid function argument
  {$EXTERNALSYM INSTALLSTATE_INVALIDARG}
  INSTALLSTATE_UNKNOWN      = -1;  // unrecognized product or feature
  {$EXTERNALSYM INSTALLSTATE_UNKNOWN}
  INSTALLSTATE_BROKEN       =  0;  // broken
  {$EXTERNALSYM INSTALLSTATE_BROKEN}
  INSTALLSTATE_ADVERTISED   =  1;  // advertised feature
  {$EXTERNALSYM INSTALLSTATE_ADVERTISED}
  INSTALLSTATE_REMOVED      =  1;  // component being removed (action state, not settable)
  {$EXTERNALSYM INSTALLSTATE_REMOVED}
  INSTALLSTATE_ABSENT       =  2;  // uninstalled (or action state absent but clients remain)
  {$EXTERNALSYM INSTALLSTATE_ABSENT}
  INSTALLSTATE_LOCAL        =  3;  // installed on local drive
  {$EXTERNALSYM INSTALLSTATE_LOCAL}
  INSTALLSTATE_SOURCE       =  4;  // run from source, CD or net
  {$EXTERNALSYM INSTALLSTATE_SOURCE}
  INSTALLSTATE_DEFAULT      =  5;  // use default, local or source
  {$EXTERNALSYM INSTALLSTATE_DEFAULT}

type
  INSTALLSTATE = Longint;
  {$EXTERNALSYM INSTALLSTATE}
  TInstallState = INSTALLSTATE;

const
  USERINFOSTATE_MOREDATA   = -3;  // return buffer overflow
  {$EXTERNALSYM USERINFOSTATE_MOREDATA}
  USERINFOSTATE_INVALIDARG = -2;  // invalid function argument
  {$EXTERNALSYM USERINFOSTATE_INVALIDARG}
  USERINFOSTATE_UNKNOWN    = -1;  // unrecognized product
  {$EXTERNALSYM USERINFOSTATE_UNKNOWN}
  USERINFOSTATE_ABSENT     =  0;  // user info and PID not initialized
  {$EXTERNALSYM USERINFOSTATE_ABSENT}
  USERINFOSTATE_PRESENT    =  1;  // user info and PID initialized
  {$EXTERNALSYM USERINFOSTATE_PRESENT}

type
  USERINFOSTATE = DWORD;
  {$EXTERNALSYM USERINFOSTATE}
  TUserInfoState = USERINFOSTATE;

const
  INSTALLLEVEL_DEFAULT = 0;      // install authored default
  {$EXTERNALSYM INSTALLLEVEL_DEFAULT}
  INSTALLLEVEL_MINIMUM = 1;      // install only required features
  {$EXTERNALSYM INSTALLLEVEL_MINIMUM}
  INSTALLLEVEL_MAXIMUM = $FFFF;  // install all features
  {$EXTERNALSYM INSTALLLEVEL_MAXIMUM}

type
  INSTALLLEVEL = DWORD;                   // intermediate levels dependent on authoring
  {$EXTERNALSYM INSTALLLEVEL}
  TInstallLevel = INSTALLLEVEL;

const
  REINSTALLMODE_REPAIR           = $00000001;  // Reserved bit - currently ignored
  {$EXTERNALSYM REINSTALLMODE_REPAIR}
  REINSTALLMODE_FILEMISSING      = $00000002;  // Reinstall only if file is missing
  {$EXTERNALSYM REINSTALLMODE_FILEMISSING}
  REINSTALLMODE_FILEOLDERVERSION = $00000004;  // Reinstall if file is missing, or older version
  {$EXTERNALSYM REINSTALLMODE_FILEOLDERVERSION}
  REINSTALLMODE_FILEEQUALVERSION = $00000008;  // Reinstall if file is missing, or equal or older version
  {$EXTERNALSYM REINSTALLMODE_FILEEQUALVERSION}
  REINSTALLMODE_FILEEXACT        = $00000010;  // Reinstall if file is missing, or not exact version
  {$EXTERNALSYM REINSTALLMODE_FILEEXACT}
  REINSTALLMODE_FILEVERIFY       = $00000020;  // checksum executables, reinstall if missing or corrupt
  {$EXTERNALSYM REINSTALLMODE_FILEVERIFY}
  REINSTALLMODE_FILEREPLACE      = $00000040;  // Reinstall all files, regardless of version
  {$EXTERNALSYM REINSTALLMODE_FILEREPLACE}
  REINSTALLMODE_MACHINEDATA      = $00000080;  // insure required machine reg entries
  {$EXTERNALSYM REINSTALLMODE_MACHINEDATA}
  REINSTALLMODE_USERDATA         = $00000100;  // insure required user reg entries
  {$EXTERNALSYM REINSTALLMODE_USERDATA}
  REINSTALLMODE_SHORTCUT         = $00000200;  // validate shortcuts items
  {$EXTERNALSYM REINSTALLMODE_SHORTCUT}
  REINSTALLMODE_PACKAGE          = $00000400;  // use re-cache source install package
  {$EXTERNALSYM REINSTALLMODE_PACKAGE}

type
  REINSTALLMODE = DWORD;
  {$EXTERNALSYM REINSTALLMODE}
  TReinstallMode = REINSTALLMODE;

// bit flags for use with MsiEnableLog and MsiSetExternalUI

const
  INSTALLLOGMODE_FATALEXIT      = 1 shl (INSTALLMESSAGE_FATALEXIT      shr 24);
  {$EXTERNALSYM INSTALLLOGMODE_FATALEXIT}
  INSTALLLOGMODE_ERROR          = 1 shl (INSTALLMESSAGE_ERROR          shr 24);
  {$EXTERNALSYM INSTALLLOGMODE_ERROR}
  INSTALLLOGMODE_WARNING        = 1 shl (INSTALLMESSAGE_WARNING        shr 24);
  {$EXTERNALSYM INSTALLLOGMODE_WARNING}
  INSTALLLOGMODE_USER           = 1 shl (INSTALLMESSAGE_USER           shr 24);
  {$EXTERNALSYM INSTALLLOGMODE_USER}
  INSTALLLOGMODE_INFO           = 1 shl (INSTALLMESSAGE_INFO           shr 24);
  {$EXTERNALSYM INSTALLLOGMODE_INFO}
  INSTALLLOGMODE_RESOLVESOURCE  = 1 shl (INSTALLMESSAGE_RESOLVESOURCE  shr 24);
  {$EXTERNALSYM INSTALLLOGMODE_RESOLVESOURCE}
  INSTALLLOGMODE_OUTOFDISKSPACE = 1 shl (INSTALLMESSAGE_OUTOFDISKSPACE shr 24);
  {$EXTERNALSYM INSTALLLOGMODE_OUTOFDISKSPACE}
  INSTALLLOGMODE_ACTIONSTART    = 1 shl (INSTALLMESSAGE_ACTIONSTART    shr 24);
  {$EXTERNALSYM INSTALLLOGMODE_ACTIONSTART}
  INSTALLLOGMODE_ACTIONDATA     = 1 shl (INSTALLMESSAGE_ACTIONDATA     shr 24);
  {$EXTERNALSYM INSTALLLOGMODE_ACTIONDATA}
  INSTALLLOGMODE_COMMONDATA     = 1 shl (INSTALLMESSAGE_COMMONDATA     shr 24);
  {$EXTERNALSYM INSTALLLOGMODE_COMMONDATA}
  INSTALLLOGMODE_PROPERTYDUMP   = 1 shl (INSTALLMESSAGE_PROGRESS       shr 24); // log only
  {$EXTERNALSYM INSTALLLOGMODE_PROPERTYDUMP}
  INSTALLLOGMODE_VERBOSE        = 1 shl (INSTALLMESSAGE_INITIALIZE     shr 24); // log only
  {$EXTERNALSYM INSTALLLOGMODE_VERBOSE}
  INSTALLLOGMODE_EXTRADEBUG     = 1 shl (INSTALLMESSAGE_TERMINATE      shr 24); // log only
  {$EXTERNALSYM INSTALLLOGMODE_EXTRADEBUG}
  INSTALLLOGMODE_PROGRESS       = 1 shl (INSTALLMESSAGE_PROGRESS       shr 24); // external handler only
  {$EXTERNALSYM INSTALLLOGMODE_PROGRESS}
  INSTALLLOGMODE_INITIALIZE     = 1 shl (INSTALLMESSAGE_INITIALIZE     shr 24); // external handler only
  {$EXTERNALSYM INSTALLLOGMODE_INITIALIZE}
  INSTALLLOGMODE_TERMINATE      = 1 shl (INSTALLMESSAGE_TERMINATE      shr 24); // external handler only
  {$EXTERNALSYM INSTALLLOGMODE_TERMINATE}
  INSTALLLOGMODE_SHOWDIALOG     = 1 shl (INSTALLMESSAGE_SHOWDIALOG     shr 24); // external handler only
  {$EXTERNALSYM INSTALLLOGMODE_SHOWDIALOG}

type
  INSTALLLOGMODE = DWORD;
  {$EXTERNALSYM INSTALLLOGMODE}
  TInstallLogMode = INSTALLLOGMODE;

const
  INSTALLLOGATTRIBUTES_APPEND            = 1 shl 0;
  {$EXTERNALSYM INSTALLLOGATTRIBUTES_APPEND}
  INSTALLLOGATTRIBUTES_FLUSHEACHLINE     = 1 shl 1;
  {$EXTERNALSYM INSTALLLOGATTRIBUTES_FLUSHEACHLINE}

type
  INSTALLLOGATTRIBUTES = DWORD;
  {$EXTERNALSYM INSTALLLOGATTRIBUTES}
  TInstallLogAttributes = INSTALLLOGATTRIBUTES;

const
  INSTALLFEATUREATTRIBUTE_FAVORLOCAL             = 1 shl 0;
  {$EXTERNALSYM INSTALLFEATUREATTRIBUTE_FAVORLOCAL}
  INSTALLFEATUREATTRIBUTE_FAVORSOURCE            = 1 shl 1;
  {$EXTERNALSYM INSTALLFEATUREATTRIBUTE_FAVORSOURCE}
  INSTALLFEATUREATTRIBUTE_FOLLOWPARENT           = 1 shl 2;
  {$EXTERNALSYM INSTALLFEATUREATTRIBUTE_FOLLOWPARENT}
  INSTALLFEATUREATTRIBUTE_FAVORADVERTISE         = 1 shl 3;
  {$EXTERNALSYM INSTALLFEATUREATTRIBUTE_FAVORADVERTISE}
  INSTALLFEATUREATTRIBUTE_DISALLOWADVERTISE      = 1 shl 4;
  {$EXTERNALSYM INSTALLFEATUREATTRIBUTE_DISALLOWADVERTISE}
  INSTALLFEATUREATTRIBUTE_NOUNSUPPORTEDADVERTISE = 1 shl 5;
  {$EXTERNALSYM INSTALLFEATUREATTRIBUTE_NOUNSUPPORTEDADVERTISE}

type
  INSTALLFEATUREATTRIBUTE = DWORD;
  {$EXTERNALSYM INSTALLFEATUREATTRIBUTE}
  TInstallFeatureAttribute = INSTALLFEATUREATTRIBUTE;

const
  INSTALLMODE_NOSOURCERESOLUTION   = -3;  // skip source resolution
  {$EXTERNALSYM INSTALLMODE_NOSOURCERESOLUTION}
  INSTALLMODE_NODETECTION          = -2;  // skip detection
  {$EXTERNALSYM INSTALLMODE_NODETECTION}
  INSTALLMODE_EXISTING             = -1;  // provide, if available
  {$EXTERNALSYM INSTALLMODE_EXISTING}
  INSTALLMODE_DEFAULT              =  0;  // install, if absent
  {$EXTERNALSYM INSTALLMODE_DEFAULT}

type
  INSTALLMODE = DWORD;
  {$EXTERNALSYM INSTALLMODE}
  TInstallMode = INSTALLMODE;

const
  MAX_FEATURE_CHARS = 38;   // maximum chars in feature name (same as string GUID)
  {$EXTERNALSYM MAX_FEATURE_CHARS}

// Product info attributes: advertised information

  INSTALLPROPERTY_PACKAGENAME    = __TEXT('PackageName');
  {$EXTERNALSYM INSTALLPROPERTY_PACKAGENAME}
  INSTALLPROPERTY_TRANSFORMS     = __TEXT('Transforms');
  {$EXTERNALSYM INSTALLPROPERTY_TRANSFORMS}
  INSTALLPROPERTY_LANGUAGE       = __TEXT('Language');
  {$EXTERNALSYM INSTALLPROPERTY_LANGUAGE}
  INSTALLPROPERTY_PRODUCTNAME    = __TEXT('ProductName');
  {$EXTERNALSYM INSTALLPROPERTY_PRODUCTNAME}
  INSTALLPROPERTY_ASSIGNMENTTYPE = __TEXT('AssignmentType');
  {$EXTERNALSYM INSTALLPROPERTY_ASSIGNMENTTYPE}
//#if (_WIN32_MSI >= 150)
  INSTALLPROPERTY_INSTANCETYPE   = __TEXT('InstanceType');
  {$EXTERNALSYM INSTALLPROPERTY_INSTANCETYPE}
//#endif //(_WIN32_MSI >= 150)

  INSTALLPROPERTY_PACKAGECODE    = __TEXT('PackageCode');
  {$EXTERNALSYM INSTALLPROPERTY_PACKAGECODE}
  INSTALLPROPERTY_VERSION        = __TEXT('Version');
  {$EXTERNALSYM INSTALLPROPERTY_VERSION}
  INSTALLPROPERTY_PRODUCTICON    = __TEXT('ProductIcon');
  {$EXTERNALSYM INSTALLPROPERTY_PRODUCTICON}

// Product info attributes: installed information

  INSTALLPROPERTY_INSTALLEDPRODUCTNAME = __TEXT('InstalledProductName');
  {$EXTERNALSYM INSTALLPROPERTY_INSTALLEDPRODUCTNAME}
  INSTALLPROPERTY_VERSIONSTRING        = __TEXT('VersionString');
  {$EXTERNALSYM INSTALLPROPERTY_VERSIONSTRING}
  INSTALLPROPERTY_HELPLINK             = __TEXT('HelpLink');
  {$EXTERNALSYM INSTALLPROPERTY_HELPLINK}
  INSTALLPROPERTY_HELPTELEPHONE        = __TEXT('HelpTelephone');
  {$EXTERNALSYM INSTALLPROPERTY_HELPTELEPHONE}
  INSTALLPROPERTY_INSTALLLOCATION      = __TEXT('InstallLocation');
  {$EXTERNALSYM INSTALLPROPERTY_INSTALLLOCATION}
  INSTALLPROPERTY_INSTALLSOURCE        = __TEXT('InstallSource');
  {$EXTERNALSYM INSTALLPROPERTY_INSTALLSOURCE}
  INSTALLPROPERTY_INSTALLDATE          = __TEXT('InstallDate');
  {$EXTERNALSYM INSTALLPROPERTY_INSTALLDATE}
  INSTALLPROPERTY_PUBLISHER            = __TEXT('Publisher');
  {$EXTERNALSYM INSTALLPROPERTY_PUBLISHER}
  INSTALLPROPERTY_LOCALPACKAGE         = __TEXT('LocalPackage');
  {$EXTERNALSYM INSTALLPROPERTY_LOCALPACKAGE}
  INSTALLPROPERTY_URLINFOABOUT         = __TEXT('URLInfoAbout');
  {$EXTERNALSYM INSTALLPROPERTY_URLINFOABOUT}
  INSTALLPROPERTY_URLUPDATEINFO        = __TEXT('URLUpdateInfo');
  {$EXTERNALSYM INSTALLPROPERTY_URLUPDATEINFO}
  INSTALLPROPERTY_VERSIONMINOR         = __TEXT('VersionMinor');
  {$EXTERNALSYM INSTALLPROPERTY_VERSIONMINOR}
  INSTALLPROPERTY_VERSIONMAJOR         = __TEXT('VersionMajor');
  {$EXTERNALSYM INSTALLPROPERTY_VERSIONMAJOR}

const
  SCRIPTFLAGS_CACHEINFO                = $00000001;   // set if the icons need to be created/ removed
  {$EXTERNALSYM SCRIPTFLAGS_CACHEINFO}
  SCRIPTFLAGS_SHORTCUTS                = $00000004;   // set if the shortcuts needs to be created/ deleted
  {$EXTERNALSYM SCRIPTFLAGS_SHORTCUTS}
  SCRIPTFLAGS_MACHINEASSIGN            = $00000008;   // set if product to be assigned to machine
  {$EXTERNALSYM SCRIPTFLAGS_MACHINEASSIGN}
  SCRIPTFLAGS_REGDATA_CNFGINFO         = $00000020;   // set if the product cnfg mgmt. registry data needs to be written/ removed
  {$EXTERNALSYM SCRIPTFLAGS_REGDATA_CNFGINFO}
  SCRIPTFLAGS_VALIDATE_TRANSFORMS_LIST = $00000040;
  {$EXTERNALSYM SCRIPTFLAGS_VALIDATE_TRANSFORMS_LIST}
  {$IFDEF MSI200_UP}
  SCRIPTFLAGS_REGDATA_CLASSINFO        = $00000080;   // set if COM classes related app info needs to be  created/ deleted
  {$EXTERNALSYM SCRIPTFLAGS_REGDATA_CLASSINFO}
  SCRIPTFLAGS_REGDATA_EXTENSIONINFO    = $00000100;   // set if extension related app info needs to be  created/ deleted
  {$EXTERNALSYM SCRIPTFLAGS_REGDATA_EXTENSIONINFO}
  SCRIPTFLAGS_REGDATA_APPINFO          = SCRIPTFLAGS_REGDATA_CLASSINFO or SCRIPTFLAGS_REGDATA_EXTENSIONINFO; // for source level backward compatibility
  {$EXTERNALSYM SCRIPTFLAGS_REGDATA_APPINFO}
  {$ELSE} // _WIN32_MSI >= 110
  SCRIPTFLAGS_REGDATA_APPINFO          = $00000010;
  {$EXTERNALSYM SCRIPTFLAGS_REGDATA_APPINFO}
  {$ENDIF MSI200_UP}
  SCRIPTFLAGS_REGDATA                  = SCRIPTFLAGS_REGDATA_APPINFO or SCRIPTFLAGS_REGDATA_CNFGINFO;// for source level backward compatibility
  {$EXTERNALSYM SCRIPTFLAGS_REGDATA}

type
  SCRIPTFLAGS = Longint;
  {$EXTERNALSYM SCRIPTFLAGS}
  TScriptFlags = SCRIPTFLAGS;

const
  ADVERTISEFLAGS_MACHINEASSIGN   = 0;   // set if the product is to be machine assigned
  {$EXTERNALSYM ADVERTISEFLAGS_MACHINEASSIGN}
  ADVERTISEFLAGS_USERASSIGN      = 1;   // set if the product is to be user assigned
  {$EXTERNALSYM ADVERTISEFLAGS_USERASSIGN}

type
  ADVERTISEFLAGS = Longint;
  {$EXTERNALSYM ADVERTISEFLAGS}
  TAdvertiseFlags = ADVERTISEFLAGS;

const
  INSTALLTYPE_DEFAULT            = 0;   // set to indicate default behavior
  {$EXTERNALSYM INSTALLTYPE_DEFAULT}
  INSTALLTYPE_NETWORK_IMAGE      = 1;   // set to indicate network install
  {$EXTERNALSYM INSTALLTYPE_NETWORK_IMAGE}
  INSTALLTYPE_SINGLE_INSTANCE    = 2;   // set to indicate a particular instance
  {$EXTERNALSYM INSTALLTYPE_SINGLE_INSTANCE}

type
  INSTALLTYPE = DWORD;
  {$EXTERNALSYM INSTALLTYPE}
  TInstallType = INSTALLTYPE;

type
  _MSIFILEHASHINFO = record
    dwFileHashInfoSize: ULONG;
    dwData: array [0..3] of ULONG;
  end;
  {$EXTERNALSYM _MSIFILEHASHINFO}
  MSIFILEHASHINFO = _MSIFILEHASHINFO;
  {$EXTERNALSYM MSIFILEHASHINFO}
  PMSIFILEHASHINFO = ^MSIFILEHASHINFO;
  {$EXTERNALSYM PMSIFILEHASHINFO}
  TMsiFileHashInfo = MSIFILEHASHINFO;

const
  MSIARCHITECTUREFLAGS_X86   = $00000001; // set if creating the script for i386 platform
  {$EXTERNALSYM MSIARCHITECTUREFLAGS_X86}
  MSIARCHITECTUREFLAGS_IA64  = $00000002; // set if creating the script for IA64 platform
  {$EXTERNALSYM MSIARCHITECTUREFLAGS_IA64}
  MSIARCHITECTUREFLAGS_AMD64 = $00000004; // set if creating the script for AMD64 platform
  {$EXTERNALSYM MSIARCHITECTUREFLAGS_AMD64}

type
  MSIARCHITECTUREFLAGS = DWORD;
  {$EXTERNALSYM MSIARCHITECTUREFLAGS}
  TMsiArchitectureFlags = MSIARCHITECTUREFLAGS;

const
  MSIOPENPACKAGEFLAGS_IGNOREMACHINESTATE = $00000001; // ignore the machine state when creating the engine
  {$EXTERNALSYM MSIOPENPACKAGEFLAGS_IGNOREMACHINESTATE}

type
  MSIOPENPACKAGEFLAGS = DWORD;
  {$EXTERNALSYM MSIOPENPACKAGEFLAGS}
  TMsiOpenPackageFlags = MSIOPENPACKAGEFLAGS;

const
  MSIADVERTISEOPTIONFLAGS_INSTANCE = $00000001; // set if advertising a new instance
  {$EXTERNALSYM MSIADVERTISEOPTIONFLAGS_INSTANCE}

type
  tagMSIADVERTISEOPTIONFLAGS = DWORD;
  {$EXTERNALSYM tagMSIADVERTISEOPTIONFLAGS}
  MSIADVERTISEOPTIONFLAGS = tagMSIADVERTISEOPTIONFLAGS;
  {$EXTERNALSYM MSIADVERTISEOPTIONFLAGS}
  TMsiAdvertiseOptionFlags = MSIADVERTISEOPTIONFLAGS;

// --------------------------------------------------------------------------
// Functions to set the UI handling and logging. The UI will be used for error,
// progress, and log messages for all subsequent calls to Installer Service
// API functions that require UI.
// --------------------------------------------------------------------------

// Enable internal UI

function MsiSetInternalUI(dwUILevel: INSTALLUILEVEL; phWnd: LPHWND): INSTALLUILEVEL; stdcall;
{$EXTERNALSYM MsiSetInternalUI}

// Enable external UI handling, returns any previous handler or NULL if none.
// Messages are designated with a combination of bits from INSTALLLOGMODE enum.

function MsiSetExternalUIA(puiHandler: INSTALLUI_HANDLERA; dwMessageFilter: DWORD;
  pvContext: LPVOID): INSTALLUI_HANDLERA; stdcall;
{$EXTERNALSYM MsiSetExternalUIA}
function MsiSetExternalUIW(puiHandler: INSTALLUI_HANDLERW; dwMessageFilter: DWORD;
  pvContext: LPVOID): INSTALLUI_HANDLERW; stdcall;
{$EXTERNALSYM MsiSetExternalUIW}
function MsiSetExternalUI(puiHandler: INSTALLUI_HANDLER; dwMessageFilter: DWORD;
  pvContext: LPVOID): INSTALLUI_HANDLER; stdcall;
{$EXTERNALSYM MsiSetExternalUI}

// Enable logging to a file for all install sessions for the client process,
// with control over which log messages are passed to the specified log file.
// Messages are designated with a combination of bits from INSTALLLOGMODE enum.

function MsiEnableLogA(dwLogMode: DWORD; szLogFile: LPCSTR; dwLogAttributes: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiEnableLogA}
function MsiEnableLogW(dwLogMode: DWORD; szLogFile: LPCWSTR; dwLogAttributes: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiEnableLogW}
function MsiEnableLog(dwLogMode: DWORD; szLogFile: LPCTSTR; dwLogAttributes: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiEnableLog}

// --------------------------------------------------------------------------
// Functions to query and configure a product as a whole.
// --------------------------------------------------------------------------

// Return the installed state for a product

function MsiQueryProductStateA(szProduct: LPCSTR): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiQueryProductStateA}
function MsiQueryProductStateW(szProduct: LPCWSTR): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiQueryProductStateW}
function MsiQueryProductState(szProduct: LPCTSTR): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiQueryProductState}

// Return product info

function MsiGetProductInfoA(szProduct: LPCSTR; szAttribute: LPCSTR;
  lpValueBuf: LPSTR; pcchValueBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetProductInfoA}
function MsiGetProductInfoW(szProduct: LPCWSTR; szAttribute: LPCWSTR;
  lpValueBuf: LPWSTR; pcchValueBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetProductInfoW}
function MsiGetProductInfo(szProduct: LPCTSTR; szAttribute: LPCTSTR;
  lpValueBuf: LPTSTR; pcchValueBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetProductInfo}

// Install a new product.
// Either may be NULL, but the DATABASE property must be specfied

function MsiInstallProductA(szPackagePath: LPCSTR; szCommandLine: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiInstallProductA}
function MsiInstallProductW(szPackagePath: LPCWSTR; szCommandLine: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiInstallProductW}
function MsiInstallProduct(szPackagePath: LPCTSTR; szCommandLine: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiInstallProduct}

// Install/uninstall an advertised or installed product
// No action if installed and INSTALLSTATE_DEFAULT specified

function MsiConfigureProductA(szProduct: LPCSTR; iInstallLevel: Integer;
  eInstallState: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiConfigureProductA}
function MsiConfigureProductW(szProduct: LPCWSTR; iInstallLevel: Integer;
  eInstallState: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiConfigureProductW}
function MsiConfigureProduct(szProduct: LPCTSTR; iInstallLevel: Integer;
  eInstallState: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiConfigureProduct}

// Install/uninstall an advertised or installed product
// No action if installed and INSTALLSTATE_DEFAULT specified

function MsiConfigureProductExA(szProduct: LPCSTR; iInstallLevel: Integer;
  eInstallState: INSTALLSTATE; szCommandLine: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiConfigureProductExA}
function MsiConfigureProductExW(szProduct: LPCWSTR; iInstallLevel: Integer;
  eInstallState: INSTALLSTATE; szCommandLine: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiConfigureProductExW}
function MsiConfigureProductEx(szProduct: LPCTSTR; iInstallLevel: Integer;
  eInstallState: INSTALLSTATE; szCommandLine: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiConfigureProductEx}

// Reinstall product, used to validate or correct problems

function MsiReinstallProductA(szProduct: LPCSTR; szReinstallMode: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiReinstallProductA}
function MsiReinstallProductW(szProduct: LPCWSTR; szReinstallMode: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiReinstallProductW}
function MsiReinstallProduct(szProduct: LPCTSTR; szReinstallMode: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiReinstallProduct}

// Output reg and shortcut info to script file for specified architecture for Assign or Publish
// If dwPlatform is 0, then the script is created based on the current platform (behavior of MsiAdvertiseProduct)
// If dwOptions includes MSIADVERTISEOPTIONFLAGS_INSTANCE, then a new instance is advertised. Use of
//    this option requires that szTransforms include the instance transform that changes the product code

function MsiAdvertiseProductExA(szPackagePath, szScriptfilePath, szTransforms: LPCSTR; lgidLanguage: LANGID;
  dwPlatform, dwOptions: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiAdvertiseProductExA}
function MsiAdvertiseProductExW(szPackagePath, szScriptfilePath, szTransforms: LPCWSTR; lgidLanguage: LANGID;
  dwPlatform, dwOptions: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiAdvertiseProductExW}
function MsiAdvertiseProductEx(szPackagePath, szScriptfilePath, szTransforms: LPCTSTR; lgidLanguage: LANGID;
  dwPlatform, dwOptions: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiAdvertiseProductEx}

// Output reg and shortcut info to script file for Assign or Publish

function MsiAdvertiseProductA(szPackagePath, szScriptfilePath, szTransforms: LPCSTR; lgidLanguage: LANGID): UINT; stdcall;
{$EXTERNALSYM MsiAdvertiseProductA}
function MsiAdvertiseProductW(szPackagePath, szScriptfilePath, szTransforms: LPCWSTR; lgidLanguage: LANGID): UINT; stdcall;
{$EXTERNALSYM MsiAdvertiseProductW}
function MsiAdvertiseProduct(szPackagePath, szScriptfilePath, szTransforms: LPCTSTR; lgidLanguage: LANGID): UINT; stdcall;
{$EXTERNALSYM MsiAdvertiseProduct}

// Process advertise script file into supplied locations
// If an icon folder is specified, icon files will be placed there
// If an registry key is specified, registry data will be mapped under it
// If fShortcuts is TRUE, shortcuts will be created. If a special folder is
//    returned by SHGetSpecialFolderLocation(?), it will hold the shortcuts.
// if fRemoveItems is TRUE, items that are present will be removed

function MsiProcessAdvertiseScriptA(szScriptFile, szIconFolder: LPCSTR; hRegData: HKEY; fShortcuts, fRemoveItems: BOOL): UINT; stdcall;
{$EXTERNALSYM MsiProcessAdvertiseScriptA}
function MsiProcessAdvertiseScriptW(szScriptFile, szIconFolder: LPCWSTR; hRegData: HKEY; fShortcuts, fRemoveItems: BOOL): UINT; stdcall;
{$EXTERNALSYM MsiProcessAdvertiseScriptW}
function MsiProcessAdvertiseScript(szScriptFile, szIconFolder: LPCTSTR; hRegData: HKEY; fShortcuts, fRemoveItems: BOOL): UINT; stdcall;
{$EXTERNALSYM MsiProcessAdvertiseScript}

// Process advertise script file using the supplied dwFlags control flags
// if fRemoveItems is TRUE, items that are present will be removed

function MsiAdvertiseScriptA(szScriptFile: LPCSTR; dwFlags: DWORD; phRegData: PHKEY; fRemoveItems: BOOL): UINT; stdcall;
{$EXTERNALSYM MsiAdvertiseScriptA}
function MsiAdvertiseScriptW(szScriptFile: LPCWSTR; dwFlags: DWORD; phRegData: PHKEY; fRemoveItems: BOOL): UINT; stdcall;
{$EXTERNALSYM MsiAdvertiseScriptW}
function MsiAdvertiseScript(szScriptFile: LPCTSTR; dwFlags: DWORD; phRegData: PHKEY; fRemoveItems: BOOL): UINT; stdcall;
{$EXTERNALSYM MsiAdvertiseScript}

// Return product info from an installer script file:
//   product code, language, version, readable name, path to package
// Returns TRUE is success, FALSE if szScriptFile is not a valid script file

function MsiGetProductInfoFromScriptA(szScriptFile: LPCSTR; lpProductBuf39: LPSTR; plgidLanguage: PLANGID; pdwVersion: LPDWORD;
  lpNameBuf: LPSTR; pcchNameBuf: LPDWORD; lpPackageBuf: LPSTR; pcchPackageBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetProductInfoFromScriptA}
function MsiGetProductInfoFromScriptW(szScriptFile: LPCWSTR; lpProductBuf39: LPWSTR; plgidLanguage: PLANGID; pdwVersion: LPDWORD;
  lpNameBuf: LPWSTR; pcchNameBuf: LPDWORD; lpPackageBuf: LPWSTR; pcchPackageBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetProductInfoFromScriptW}
function MsiGetProductInfoFromScript(szScriptFile: LPCTSTR; lpProductBuf39: LPTSTR; plgidLanguage: PLANGID; pdwVersion: LPDWORD;
  lpNameBuf: LPTSTR; pcchNameBuf: LPDWORD; lpPackageBuf: LPTSTR; pcchPackageBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetProductInfoFromScript}

// Return the product code for a registered component, called once by apps

function MsiGetProductCodeA(szComponent: LPCSTR; lpBuf39: LPSTR): UINT; stdcall;
{$EXTERNALSYM MsiGetProductCodeA}
function MsiGetProductCodeW(szComponent: LPCWSTR; lpBuf39: LPWSTR): UINT; stdcall;
{$EXTERNALSYM MsiGetProductCodeW}
function MsiGetProductCode(szComponent: LPCTSTR; lpBuf39: LPTSTR): UINT; stdcall;
{$EXTERNALSYM MsiGetProductCode}

// Return the registered user information for an installed product

function MsiGetUserInfoA(szProduct: LPCSTR; lpUserNameBuf: LPSTR;
  var pcchUserNameBuf: DWORD; lpOrgNameBuf: LPSTR; var pcchOrgNameBuf: DWORD;
  lpSerialBuf: LPSTR; var pcchSerialBuf: DWORD): USERINFOSTATE; stdcall;
{$EXTERNALSYM MsiGetUserInfoA}
function MsiGetUserInfoW(szProduct: LPCWSTR; lpUserNameBuf: LPWSTR;
  var pcchUserNameBuf: DWORD; lpOrgNameBuf: LPWSTR; var pcchOrgNameBuf: DWORD;
  lpSerialBuf: LPWSTR; var pcchSerialBuf: DWORD): USERINFOSTATE; stdcall;
{$EXTERNALSYM MsiGetUserInfoW}
function MsiGetUserInfo(szProduct: LPCTSTR; lpUserNameBuf: LPTSTR;
  var pcchUserNameBuf: DWORD; lpOrgNameBuf: LPTSTR; var pcchOrgNameBuf: DWORD;
  lpSerialBuf: LPTSTR; var pcchSerialBuf: DWORD): USERINFOSTATE; stdcall;
{$EXTERNALSYM MsiGetUserInfo}

// Obtain and store user info and PID from installation wizard (first run)

function MsiCollectUserInfoA(szProduct: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiCollectUserInfoA}
function MsiCollectUserInfoW(szProduct: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiCollectUserInfoW}
function MsiCollectUserInfo(szProduct: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiCollectUserInfo}

// --------------------------------------------------------------------------
// Functions to patch existing products
// --------------------------------------------------------------------------

// Patch all possible installed products.

function MsiApplyPatchA(szPatchPackage: LPCSTR; szInstallPackage: LPCSTR;
  eInstallType: INSTALLTYPE; szCommandLine: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiApplyPatchA}
function MsiApplyPatchW(szPatchPackage: LPCWSTR; szInstallPackage: LPCWSTR;
  eInstallType: INSTALLTYPE; szCommandLine: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiApplyPatchW}
function MsiApplyPatch(szPatchPackage: LPCTSTR; szInstallPackage: LPCTSTR;
  eInstallType: INSTALLTYPE; szCommandLine: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiApplyPatch}

// Return patch info

function MsiGetPatchInfoA(szPatch: LPCSTR; szAttribute: LPCSTR;
  lpValueBuf: LPSTR; pcchValueBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetPatchInfoA}
function MsiGetPatchInfoW(szPatch: LPCWSTR; szAttribute: LPCWSTR;
  lpValueBuf: LPWSTR; pcchValueBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetPatchInfoW}
function MsiGetPatchInfo(szPatch: LPCTSTR; szAttribute: LPCTSTR;
  lpValueBuf: LPTSTR; pcchValueBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetPatchInfo}

// Enumerate all patches for a product

function MsiEnumPatchesA(szProduct: LPCSTR; iPatchIndex: DWORD; lpPatchBuf: LPSTR;
  lpTransformsBuf: LPSTR; var pcchTransformsBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiEnumPatchesA}
function MsiEnumPatchesW(szProduct: LPCWSTR; iPatchIndex: DWORD; lpPatchBuf: LPWSTR;
  lpTransformsBuf: LPWSTR; var pcchTransformsBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiEnumPatchesW}
function MsiEnumPatches(szProduct: LPCTSTR; iPatchIndex: DWORD; lpPatchBuf: LPTSTR;
  lpTransformsBuf: LPTSTR; var pcchTransformsBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiEnumPatches}

// --------------------------------------------------------------------------
// Functions to query and configure a feature within a product.
// --------------------------------------------------------------------------

// Return the installed state for a product feature

function MsiQueryFeatureStateA(szProduct: LPCSTR; szFeature: LPCSTR): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiQueryFeatureStateA}
function MsiQueryFeatureStateW(szProduct: LPCWSTR; szFeature: LPCWSTR): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiQueryFeatureStateW}
function MsiQueryFeatureState(szProduct: LPCTSTR; szFeature: LPCTSTR): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiQueryFeatureState}

// Indicate intent to use a product feature, increments usage count
// Prompts for CD if not loaded, does not install feature

function MsiUseFeatureA(szProduct: LPCSTR; szFeature: LPCSTR): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiUseFeatureA}
function MsiUseFeatureW(szProduct: LPCWSTR; szFeature: LPCWSTR): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiUseFeatureW}
function MsiUseFeature(szProduct: LPCTSTR; szFeature: LPCTSTR): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiUseFeature}

// Indicate intent to use a product feature, increments usage count
// Prompts for CD if not loaded, does not install feature
// Allows for bypassing component detection where performance is critical

function MsiUseFeatureExA(szProduct: LPCSTR; szFeature: LPCSTR;
  dwInstallMode: DWORD; dwReserved: DWORD): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiUseFeatureExA}
function MsiUseFeatureExW(szProduct: LPCWSTR; szFeature: LPCWSTR; dwInstallMode: DWORD;
  dwReserved: DWORD): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiUseFeatureExW}
function MsiUseFeatureEx(szProduct: LPCTSTR; szFeature: LPCTSTR;
  dwInstallMode: DWORD; dwReserved: DWORD): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiUseFeatureEx}

// Return the usage metrics for a product feature

function MsiGetFeatureUsageA(szProduct: LPCSTR; szFeature: LPCSTR;
  var pdwUseCount, pwDateUsed: WORD): UINT; stdcall;
{$EXTERNALSYM MsiGetFeatureUsageA}
function MsiGetFeatureUsageW(szProduct: LPCWSTR; szFeature: LPCWSTR;
  var pdwUseCount, pwDateUsed: WORD): UINT; stdcall;
{$EXTERNALSYM MsiGetFeatureUsageW}
function MsiGetFeatureUsage(szProduct: LPCTSTR; szFeature: LPCTSTR;
  var pdwUseCount, pwDateUsed: WORD): UINT; stdcall;
{$EXTERNALSYM MsiGetFeatureUsage}

// Force the installed state for a product feature

function MsiConfigureFeatureA(szProduct, szFeature: LPCSTR; eInstallState: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiConfigureFeatureA}
function MsiConfigureFeatureW(szProduct, szFeature: LPCWSTR; eInstallState: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiConfigureFeatureW}
function MsiConfigureFeature(szProduct, szFeature: LPCTSTR; eInstallState: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiConfigureFeature}

// Reinstall feature, used to validate or correct problems

function MsiReinstallFeatureA(szProduct, szFeature: LPCSTR; dwReinstallMode: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiReinstallFeatureA}
function MsiReinstallFeatureW(szProduct, szFeature: LPCWSTR; dwReinstallMode: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiReinstallFeatureW}
function MsiReinstallFeature(szProduct, szFeature: LPCTSTR; dwReinstallMode: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiReinstallFeature}

// --------------------------------------------------------------------------
// Functions to return a path to a particular component.
// The state of the feature being used should have been checked previously.
// --------------------------------------------------------------------------

// Return full component path, performing any necessary installation
// calls MsiQueryFeatureState to detect that all components are installed
// then calls MsiConfigureFeature if any of its components are uninstalled
// then calls MsiLocateComponent to obtain the path the its key file

function MsiProvideComponentA(szProduct: LPCSTR; szFeature: LPCSTR; szComponent: LPCSTR;
  dwInstallMode: DWORD; lpPathBuf: LPSTR; pcchPathBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiProvideComponentA}
function MsiProvideComponentW(szProduct: LPCWSTR; szFeature: LPCWSTR; szComponent: LPCWSTR;
  dwInstallMode: DWORD; lpPathBuf: LPWSTR; pcchPathBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiProvideComponentW}
function MsiProvideComponent(szProduct: LPCTSTR; szFeature: LPCTSTR; szComponent: LPCTSTR;
  dwInstallMode: DWORD; lpPathBuf: LPTSTR; pcchPathBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiProvideComponent}

// Return full component path for a qualified component, performing any necessary installation.
// Prompts for source if necessary and increments the usage count for the feature.

function MsiProvideQualifiedComponentA(szCategory: LPCSTR; szQualifier: LPCSTR;
  dwInstallMode: DWORD; lpPathBuf: LPSTR; pcchPathBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiProvideQualifiedComponentA}
function MsiProvideQualifiedComponentW(szCategory: LPCWSTR; szQualifier: LPCWSTR;
  dwInstallMode: DWORD; lpPathBuf: LPWSTR; pcchPathBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiProvideQualifiedComponentW}
function MsiProvideQualifiedComponent(szCategory: LPCTSTR; szQualifier: LPCTSTR;
  dwInstallMode: DWORD; lpPathBuf: LPTSTR; pcchPathBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiProvideQualifiedComponent}

// Return full component path for a qualified component, performing any necessary installation.
// Prompts for source if necessary and increments the usage count for the feature.
// The szProduct parameter specifies the product to match that has published the qualified
// component. If null, this API works the same as MsiProvideQualifiedComponent.

function MsiProvideQualifiedComponentExA(szCategory: LPCSTR; szQualifier: LPCSTR;
  dwInstallMode: DWORD; szProduct: LPCSTR; dwUnused1: DWORD; dwUnused2: DWORD;
  lpPathBuf: LPSTR; pcchPathBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiProvideQualifiedComponentExA}
function MsiProvideQualifiedComponentExW(szCategory: LPCWSTR; szQualifier: LPCWSTR;
  dwInstallMode: DWORD; szProduct: LPCWSTR; dwUnused1: DWORD; dwUnused2: DWORD;
  lpPathBuf: LPWSTR; pcchPathBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiProvideQualifiedComponentExW}
function MsiProvideQualifiedComponentEx(szCategory: LPCTSTR; szQualifier: LPCTSTR;
  dwInstallMode: DWORD; szProduct: LPCTSTR; dwUnused1: DWORD; dwUnused2: DWORD;
  lpPathBuf: LPTSTR; pcchPathBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiProvideQualifiedComponentEx}

// Return full path to an installed component

function MsiGetComponentPathA(szProduct: LPCSTR; szComponent: LPCSTR;
  lpPathBuf: LPSTR; pcchBuf: LPDWORD): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiGetComponentPathA}
function MsiGetComponentPathW(szProduct: LPCWSTR; szComponent: LPCWSTR;
  lpPathBuf: LPWSTR; pcchBuf: LPDWORD): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiGetComponentPathW}
function MsiGetComponentPath(szProduct: LPCTSTR; szComponent: LPCTSTR;
  lpPathBuf: LPTSTR; pcchBuf: LPDWORD): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiGetComponentPath}

const
  MSIASSEMBLYINFO_NETASSEMBLY   = 0; // Net assemblies
  {$EXTERNALSYM MSIASSEMBLYINFO_NETASSEMBLY}
  MSIASSEMBLYINFO_WIN32ASSEMBLY = 1; // Win32 assemblies
  {$EXTERNALSYM MSIASSEMBLYINFO_WIN32ASSEMBLY}

// Return full component path for an assembly installed via the WI, performing any necessary installation.
// Prompts for source if necessary and increments the usage count for the feature.
// The szAssemblyName parameter specifies the stringized assembly name.
// The szAppContext is the full path to the .cfg file or the app exe to which the assembly being requested
// has been privatised to, which is null for global assemblies

function MsiProvideAssemblyA(szAssemblyName, szAppContext: LPCSTR; dwInstallMode, dwAssemblyInfo: DWORD;
  lpPathBuf: LPSTR; pcchPathBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiProvideAssemblyA}
function MsiProvideAssemblyW(szAssemblyName, szAppContext: LPCWSTR; dwInstallMode, dwAssemblyInfo: DWORD;
  lpPathBuf: LPWSTR; pcchPathBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiProvideAssemblyW}
function MsiProvideAssembly(szAssemblyName, szAppContext: LPCTSTR; dwInstallMode, dwAssemblyInfo: DWORD;
  lpPathBuf: LPTSTR; pcchPathBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiProvideAssembly}

// --------------------------------------------------------------------------
// Functions to iterate registered products, features, and components.
// As with reg keys, they accept a 0-based index into the enumeration.
// --------------------------------------------------------------------------

// Enumerate the registered products, either installed or advertised

function MsiEnumProductsA(iProductIndex: DWORD; lpProductBuf: LPSTR): UINT; stdcall;
{$EXTERNALSYM MsiEnumProductsA}
function MsiEnumProductsW(iProductIndex: DWORD; lpProductBuf: LPWSTR): UINT; stdcall;
{$EXTERNALSYM MsiEnumProductsW}
function MsiEnumProducts(iProductIndex: DWORD; lpProductBuf: LPTSTR): UINT; stdcall;
{$EXTERNALSYM MsiEnumProducts}

{$IFDEF MSI110}

// Enumerate products with given upgrade code

function MsiEnumRelatedProductsA(lpUpgradeCode: LPCSTR; dwReserved: DWORD;
  iProductIndex: DWORD; lpProductBuf: LPSTR): UINT; stdcall;
{$EXTERNALSYM MsiEnumRelatedProductsA}
function MsiEnumRelatedProductsW(lpUpgradeCode: LPCWSTR; dwReserved: DWORD;
  iProductIndex: DWORD; lpProductBuf: LPWSTR): UINT; stdcall;
{$EXTERNALSYM MsiEnumRelatedProductsW}
function MsiEnumRelatedProducts(lpUpgradeCode: LPCTSTR; dwReserved: DWORD;
  iProductIndex: DWORD; lpProductBuf: LPTSTR): UINT; stdcall;
{$EXTERNALSYM MsiEnumRelatedProducts}

{$ENDIF MSI110}

// Enumerate the advertised features for a given product.
// If parent is not required, supplying NULL will improve performance.

function MsiEnumFeaturesA(szProduct: LPCSTR; iFeatureIndex: DWORD;
  lpFeatureBuf: LPSTR; lpParentBuf: LPSTR): UINT; stdcall;
{$EXTERNALSYM MsiEnumFeaturesA}
function MsiEnumFeaturesW(szProduct: LPCWSTR; iFeatureIndex: DWORD;
  lpFeatureBuf: LPWSTR; lpParentBuf: LPWSTR): UINT; stdcall;
{$EXTERNALSYM MsiEnumFeaturesW}
function MsiEnumFeatures(szProduct: LPCTSTR; iFeatureIndex: DWORD;
  lpFeatureBuf: LPTSTR; lpParentBuf: LPTSTR): UINT; stdcall;
{$EXTERNALSYM MsiEnumFeatures}

// Enumerate the installed components for all products

function MsiEnumComponentsA(iComponentIndex: DWORD; lpComponentBuf: LPSTR): UINT; stdcall;
{$EXTERNALSYM MsiEnumComponentsA}
function MsiEnumComponentsW(iComponentIndex: DWORD; lpComponentBuf: LPWSTR): UINT; stdcall;
{$EXTERNALSYM MsiEnumComponentsW}
function MsiEnumComponents(iComponentIndex: DWORD; lpComponentBuf: LPTSTR): UINT; stdcall;
{$EXTERNALSYM MsiEnumComponents}

// Enumerate the client products for a component

function MsiEnumClientsA(szComponent: LPCSTR; iProductIndex: DWORD; lpProductBuf: LPSTR): UINT; stdcall;
{$EXTERNALSYM MsiEnumClientsA}
function MsiEnumClientsW(szComponent: LPCWSTR; iProductIndex: DWORD; lpProductBuf: LPWSTR): UINT; stdcall;
{$EXTERNALSYM MsiEnumClientsW}
function MsiEnumClients(szComponent: LPCTSTR; iProductIndex: DWORD; lpProductBuf: LPTSTR): UINT; stdcall;
{$EXTERNALSYM MsiEnumClients}

// Enumerate the qualifiers for an advertised component.

function MsiEnumComponentQualifiersA(szComponent: LPCSTR; iIndex: DWORD;
  lpQualifierBuf: LPSTR; var pcchQualifierBuf: DWORD; lpApplicationDataBuf: LPSTR;
  pcchApplicationDataBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiEnumComponentQualifiersA}
function MsiEnumComponentQualifiersW(szComponent: LPCWSTR; iIndex: DWORD;
  lpQualifierBuf: LPWSTR; var pcchQualifierBuf: DWORD; lpApplicationDataBuf: LPWSTR;
  pcchApplicationDataBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiEnumComponentQualifiersW}
function MsiEnumComponentQualifiers(szComponent: LPCTSTR; iIndex: DWORD;
  lpQualifierBuf: LPTSTR; var pcchQualifierBuf: DWORD; lpApplicationDataBuf: LPTSTR;
  pcchApplicationDataBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiEnumComponentQualifiers}

// --------------------------------------------------------------------------
// Functions to obtain product or package information.
// --------------------------------------------------------------------------

// Open the installation for a product to obtain detailed information

function MsiOpenProductA(szProduct: LPCSTR; var hProduct: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiOpenProductA}
function MsiOpenProductW(szProduct: LPCWSTR; var hProduct: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiOpenProductW}
function MsiOpenProduct(szProduct: LPCTSTR; var hProduct: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiOpenProduct}

// Open a product package in order to access product properties

function MsiOpenPackageA(szPackagePath: LPCSTR; var hProduct: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiOpenPackageA}
function MsiOpenPackageW(szPackagePath: LPCWSTR; var hProduct: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiOpenPackageW}
function MsiOpenPackage(szPackagePath: LPCTSTR; var hProduct: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiOpenPackage}

// Open a product package in order to access product properties
// Option to create a "safe" engine that does not look at machine state
//  and does not allow for modification of machine state

function MsiOpenPackageExA(szPackagePath: LPCSTR; dwOptions: DWORD; var hProduct: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiOpenPackageExA}
function MsiOpenPackageExW(szPackagePath: LPCWSTR; dwOptions: DWORD; var hProduct: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiOpenPackageExW}
function MsiOpenPackageEx(szPackagePath: LPCTSTR; dwOptions: DWORD; var hProduct: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiOpenPackageEx}

// Provide the value for an installation property.

function MsiGetProductPropertyA(hProduct: MSIHANDLE; szProperty: LPCSTR;
  lpValueBuf: LPSTR; pcchValueBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetProductPropertyA}
function MsiGetProductPropertyW(hProduct: MSIHANDLE; szProperty: LPCWSTR;
  lpValueBuf: LPWSTR; pcchValueBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetProductPropertyW}
function MsiGetProductProperty(hProduct: MSIHANDLE; szProperty: LPCTSTR;
  lpValueBuf: LPTSTR; pcchValueBuf: LPDWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetProductProperty}

// Determine whether a file is a package
// Returns ERROR_SUCCESS if file is a package.

function MsiVerifyPackageA(szPackagePath: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiVerifyPackageA}
function MsiVerifyPackageW(szPackagePath: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiVerifyPackageW}
function MsiVerifyPackage(szPackagePath: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiVerifyPackage}

// Provide descriptive information for product feature: title and description.
// Returns the install level for the feature, or -1 if feature is unknown.
//   0 = feature is not available on this machine
//   1 = highest priority, feature installed if parent is installed
//  >1 = decreasing priority, feature installation based on InstallLevel property

function MsiGetFeatureInfoA(hProduct: MSIHANDLE; szFeature: LPCSTR; var lpAttributes: DWORD;
  lpTitleBuf: LPSTR; var pcchTitleBuf: DWORD; lpHelpBuf: LPSTR; var pcchHelpBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetFeatureInfoA}
function MsiGetFeatureInfoW(hProduct: MSIHANDLE; szFeature: LPCWSTR; var lpAttributes: DWORD;
  lpTitleBuf: LPWSTR; var pcchTitleBuf: DWORD; lpHelpBuf: LPWSTR; var pcchHelpBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetFeatureInfoW}
function MsiGetFeatureInfo(hProduct: MSIHANDLE; szFeature: LPCTSTR; var lpAttributes: DWORD;
  lpTitleBuf: LPTSTR; var pcchTitleBuf: DWORD; lpHelpBuf: LPTSTR; var pcchHelpBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetFeatureInfo}

// --------------------------------------------------------------------------
// Functions to access or install missing components and files.
// These should be used as a last resort.
// --------------------------------------------------------------------------

// Install a component unexpectedly missing, provided only for error recovery
// This would typically occur due to failue to establish feature availability
// The product feature having the smallest incremental cost is installed

function MsiInstallMissingComponentA(szProduct: LPCSTR; szComponent: LPCSTR;
  eInstallState: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiInstallMissingComponentA}
function MsiInstallMissingComponentW(szProduct: LPCWSTR; szComponent: LPCWSTR;
  eInstallState: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiInstallMissingComponentW}
function MsiInstallMissingComponent(szProduct: LPCTSTR; szComponent: LPCTSTR;
  eInstallState: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiInstallMissingComponent}

// Install a file unexpectedly missing, provided only for error recovery
// This would typically occur due to failue to establish feature availability
// The missing component is determined from the product's File table, then
// the product feature having the smallest incremental cost is installed

function MsiInstallMissingFileA(szProduct: LPCSTR; szFile: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiInstallMissingFileA}
function MsiInstallMissingFileW(szProduct: LPCWSTR; szFile: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiInstallMissingFileW}
function MsiInstallMissingFile(szProduct: LPCTSTR; szFile: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiInstallMissingFile}

// Return full path to an installed component without a product code
// This function attempts to determine the product using MsiGetProductCode
// but is not guaranteed to find the correct product for the caller.
// MsiGetComponentPath should always be called when possible.

function MsiLocateComponentA(szComponent: LPCSTR; lpPathBuf: LPSTR; pcchBuf: LPDWORD): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiLocateComponentA}
function MsiLocateComponentW(szComponent: LPCWSTR; lpPathBuf: LPWSTR; pcchBuf: LPDWORD): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiLocateComponentW}
function MsiLocateComponent(szComponent: LPCTSTR; lpPathBuf: LPTSTR; pcchBuf: LPDWORD): INSTALLSTATE; stdcall;
{$EXTERNALSYM MsiLocateComponent}

{$IFDEF MSI110}

// --------------------------------------------------------------------------
// Functions used to manage the list of valid sources.
// --------------------------------------------------------------------------

// Opens the list of sources for the specified user's install of the product
// and removes all network sources from the list. A NULL or empty value for
// the user name indicates the per-machine install.

function MsiSourceListClearAllA(szProduct: LPCSTR; szUserName: LPCSTR; dwReserved: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiSourceListClearAllA}
function MsiSourceListClearAllW(szProduct: LPCWSTR; szUserName: LPCWSTR; dwReserved: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiSourceListClearAllW}
function MsiSourceListClearAll(szProduct: LPCTSTR; szUserName: LPCTSTR; dwReserved: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiSourceListClearAll}

// Opens the list of sources for the specified user's install of the product
// and adds the provided source as a new network source. A NULL or empty
// value for the user name indicates the per-machine install.

function MsiSourceListAddSourceA(szProduct: LPCSTR; szUserName: LPCSTR;
  dwReserved: DWORD; szSource: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiSourceListAddSourceA}
function MsiSourceListAddSourceW(szProduct: LPCWSTR; szUserName: LPCWSTR;
  dwReserved: DWORD; szSource: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiSourceListAddSourceW}
function MsiSourceListAddSource(szProduct: LPCTSTR; szUserName: LPCTSTR;
  dwReserved: DWORD; szSource: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiSourceListAddSource}

// Forces the installer to reevaluate the list of sources the next time that
// the specified product needs a source.

function MsiSourceListForceResolutionA(szProduct, szUserName: LPCSTR; dwReserved: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiSourceListForceResolutionA}
function MsiSourceListForceResolutionW(szProduct, szUserName: LPCWSTR; dwReserved: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiSourceListForceResolutionW}
function MsiSourceListForceResolution(szProduct, szUserName: LPCTSTR; dwReserved: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiSourceListForceResolution}

{$ENDIF MSI110}

// --------------------------------------------------------------------------
// Utility functions
// --------------------------------------------------------------------------

// Give the version string and language for a specified file

function MsiGetFileVersionA(szFilePath: LPCSTR; lpVersionBuf: LPSTR;
  var pcchVersionBuf: DWORD; lpLangBuf: LPSTR; var pcchLangBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetFileVersionA}
function MsiGetFileVersionW(szFilePath: LPCWSTR; lpVersionBuf: LPWSTR;
  var pcchVersionBuf: DWORD; lpLangBuf: LPWSTR; var pcchLangBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetFileVersionW}
function MsiGetFileVersion(szFilePath: LPCTSTR; lpVersionBuf: LPTSTR;
  var pcchVersionBuf: DWORD; lpLangBuf: LPTSTR; var pcchLangBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetFileVersion}

function MsiGetFileHashA(szFilePath: LPCSTR; dwOptions: DWORD; pHash: PMSIFILEHASHINFO): UINT; stdcall;
{$EXTERNALSYM MsiGetFileHashA}
function MsiGetFileHashW(szFilePath: LPCWSTR; dwOptions: DWORD; pHash: PMSIFILEHASHINFO): UINT; stdcall;
{$EXTERNALSYM MsiGetFileHashW}
function MsiGetFileHash(szFilePath: LPCTSTR; dwOptions: DWORD; pHash: PMSIFILEHASHINFO): UINT; stdcall;
{$EXTERNALSYM MsiGetFileHash}

function MsiGetFileSignatureInformationA(szSignedObjectPath: LPCSTR; dwFlags: DWORD; var ppcCertContext: PCCERT_CONTEXT;
  pbHashData: LPBYTE; pcbHashData: LPDWORD): HRESULT; stdcall;
{$EXTERNALSYM MsiGetFileSignatureInformationA}
function MsiGetFileSignatureInformationW(szSignedObjectPath: LPCWSTR; dwFlags: DWORD; var ppcCertContext: PCCERT_CONTEXT;
  pbHashData: LPBYTE; pcbHashData: LPDWORD): HRESULT; stdcall;
{$EXTERNALSYM MsiGetFileSignatureInformationW}
function MsiGetFileSignatureInformation(szSignedObjectPath: LPCTSTR; dwFlags: DWORD; var ppcCertContext: PCCERT_CONTEXT;
  pbHashData: LPBYTE; pcbHashData: LPDWORD): HRESULT; stdcall;
{$EXTERNALSYM MsiGetFileSignatureInformation}

// By default, when only requesting the certificate context, an invalid hash
// in the digital signature is not a fatal error.  Set this flag in the dwFlags
// parameter to make the TRUST_E_BAD_DIGEST error fatal.

const
  MSI_INVALID_HASH_IS_FATAL = $1;
  {$EXTERNALSYM MSI_INVALID_HASH_IS_FATAL}

{$IFDEF MSI110}

// examine a shortcut, and retrieve its descriptor information
// if available.

function MsiGetShortcutTargetA(szShortcutPath: LPCSTR; szProductCode: LPSTR;
  szFeatureId: LPSTR; szComponentCode: LPSTR): UINT; stdcall;
{$EXTERNALSYM MsiGetShortcutTargetA}
function MsiGetShortcutTargetW(szShortcutPath: LPCWSTR; szProductCode: LPWSTR;
  szFeatureId: LPWSTR; szComponentCode: LPWSTR): UINT; stdcall;
{$EXTERNALSYM MsiGetShortcutTargetW}
function MsiGetShortcutTarget(szShortcutPath: LPCTSTR; szProductCode: LPTSTR;
  szFeatureId: LPTSTR; szComponentCode: LPTSTR): UINT; stdcall;
{$EXTERNALSYM MsiGetShortcutTarget}

{$ENDIF MSI110}

// checks to see if a product is managed
// checks per-machine if called from system context, per-user if from
// user context

function MsiIsProductElevatedA(szProduct: LPCSTR; var pfElevated: BOOL): UINT; stdcall;
{$EXTERNALSYM MsiIsProductElevatedA}
function MsiIsProductElevatedW(szProduct: LPCWSTR; var pfElevated: BOOL): UINT; stdcall;
{$EXTERNALSYM MsiIsProductElevatedW}
function MsiIsProductElevated(szProduct: LPCTSTR; var pfElevated: BOOL): UINT; stdcall;
{$EXTERNALSYM MsiIsProductElevated}

// --------------------------------------------------------------------------
// Error codes for installer access functions - until merged to winerr.h
// --------------------------------------------------------------------------

{$IFNDEF JWA_INCLUDEMODE}
const
  ERROR_INSTALL_USEREXIT      = 1602; // User cancel installation.
  {$EXTERNALSYM ERROR_INSTALL_USEREXIT}
  ERROR_INSTALL_FAILURE       = 1603; // Fatal error during installation.
  {$EXTERNALSYM ERROR_INSTALL_FAILURE}
  ERROR_INSTALL_SUSPEND       = 1604; // Installation suspended, incomplete.
  {$EXTERNALSYM ERROR_INSTALL_SUSPEND}
  ERROR_UNKNOWN_PRODUCT       = 1605; // This action is only valid for products that are currently installed.
  {$EXTERNALSYM ERROR_UNKNOWN_PRODUCT}
  ERROR_UNKNOWN_FEATURE       = 1606; // Feature ID not registered.
  {$EXTERNALSYM ERROR_UNKNOWN_FEATURE}
  ERROR_UNKNOWN_COMPONENT     = 1607; // Component ID not registered.
  {$EXTERNALSYM ERROR_UNKNOWN_COMPONENT}
  ERROR_UNKNOWN_PROPERTY      = 1608; // Unknown property.
  {$EXTERNALSYM ERROR_UNKNOWN_PROPERTY}
  ERROR_INVALID_HANDLE_STATE  = 1609; // Handle is in an invalid state.
  {$EXTERNALSYM ERROR_INVALID_HANDLE_STATE}
  ERROR_BAD_CONFIGURATION     = 1610; // The configuration data for this product is corrupt.  Contact your support personnel.
  {$EXTERNALSYM ERROR_BAD_CONFIGURATION}
  ERROR_INDEX_ABSENT          = 1611; // Component qualifier not present.
  {$EXTERNALSYM ERROR_INDEX_ABSENT}
  ERROR_INSTALL_SOURCE_ABSENT = 1612; // The installation source for this product is not available.  Verify that the source exists and that you can access it.
  {$EXTERNALSYM ERROR_INSTALL_SOURCE_ABSENT}
  ERROR_PRODUCT_UNINSTALLED   = 1614; // Product is uninstalled.
  {$EXTERNALSYM ERROR_PRODUCT_UNINSTALLED}
  ERROR_BAD_QUERY_SYNTAX      = 1615; // SQL query syntax invalid or unsupported.
  {$EXTERNALSYM ERROR_BAD_QUERY_SYNTAX}
  ERROR_INVALID_FIELD         = 1616; // Record field does not exist.
  {$EXTERNALSYM ERROR_INVALID_FIELD}

  ERROR_INSTALL_SERVICE_FAILURE      = 1601; // The Windows Installer service could not be accessed.  Contact your support personnel to verify that the Windows Installer service is properly registered.
  {$EXTERNALSYM ERROR_INSTALL_SERVICE_FAILURE}
  ERROR_INSTALL_PACKAGE_VERSION      = 1613; // This installation package cannot be installed by the Windows Installer service.  You must install a Windows service pack that contains a newer version of the Windows Installer service.
  {$EXTERNALSYM ERROR_INSTALL_PACKAGE_VERSION}
  ERROR_INSTALL_ALREADY_RUNNING      = 1618; // Another installation is already in progress.  Complete that installation before proceeding with this install.
  {$EXTERNALSYM ERROR_INSTALL_ALREADY_RUNNING}
  ERROR_INSTALL_PACKAGE_OPEN_FAILED  = 1619; // This installation package could not be opened.  Verify that the package exists and that you can access it, or contact the application vendor to verify that this is a valid Windows Installer package.
  {$EXTERNALSYM ERROR_INSTALL_PACKAGE_OPEN_FAILED}
  ERROR_INSTALL_PACKAGE_INVALID      = 1620; // This installation package could not be opened.  Contact the application vendor to verify that this is a valid Windows Installer package.
  {$EXTERNALSYM ERROR_INSTALL_PACKAGE_INVALID}
  ERROR_INSTALL_UI_FAILURE           = 1621; // There was an error starting the Windows Installer service user interface.  Contact your support personnel.
  {$EXTERNALSYM ERROR_INSTALL_UI_FAILURE}
  ERROR_INSTALL_LOG_FAILURE          = 1622; // Error opening installation log file.  Verify that the specified log file location exists and is writable.
  {$EXTERNALSYM ERROR_INSTALL_LOG_FAILURE}
  ERROR_INSTALL_LANGUAGE_UNSUPPORTED = 1623; // This language of this installation package is not supported by your system.
  {$EXTERNALSYM ERROR_INSTALL_LANGUAGE_UNSUPPORTED}
  ERROR_INSTALL_PACKAGE_REJECTED     = 1625; // The system administrator has set policies to prevent this installation.
  {$EXTERNALSYM ERROR_INSTALL_PACKAGE_REJECTED}

  ERROR_FUNCTION_NOT_CALLED = 1626; // Function could not be executed.
  {$EXTERNALSYM ERROR_FUNCTION_NOT_CALLED}
  ERROR_FUNCTION_FAILED     = 1627; // Function failed during execution.
  {$EXTERNALSYM ERROR_FUNCTION_FAILED}
  ERROR_INVALID_TABLE       = 1628; // Invalid or unknown table specified.
  {$EXTERNALSYM ERROR_INVALID_TABLE}
  ERROR_DATATYPE_MISMATCH   = 1629; // Data supplied is of wrong type.
  {$EXTERNALSYM ERROR_DATATYPE_MISMATCH}
  ERROR_UNSUPPORTED_TYPE    = 1630; // Data of this type is not supported.
  {$EXTERNALSYM ERROR_UNSUPPORTED_TYPE}
  ERROR_CREATE_FAILED       = 1631; // The Windows Installer service failed to start.  Contact your support personnel.
  {$EXTERNALSYM ERROR_CREATE_FAILED}

  ERROR_INSTALL_TEMP_UNWRITABLE = 1632; // The Temp folder is on a drive that is full or is inaccessible. Free up space on the drive or verify that you have write permission on the Temp folder.
  {$EXTERNALSYM ERROR_INSTALL_TEMP_UNWRITABLE}

  ERROR_INSTALL_PLATFORM_UNSUPPORTED = 1633; // This installation package is not supported by this processor type. Contact your product vendor.
  {$EXTERNALSYM ERROR_INSTALL_PLATFORM_UNSUPPORTED}

  ERROR_INSTALL_NOTUSED = 1634; // Component not used on this machine
  {$EXTERNALSYM ERROR_INSTALL_NOTUSED}

  ERROR_INSTALL_TRANSFORM_FAILURE = 1624; // Error applying transforms.  Verify that the specified transform paths are valid.
  {$EXTERNALSYM ERROR_INSTALL_TRANSFORM_FAILURE}

  ERROR_PATCH_PACKAGE_OPEN_FAILED = 1635; // This patch package could not be opened.  Verify that the patch package exists and that you can access it, or contact the application vendor to verify that this is a valid Windows Installer patch package.
  {$EXTERNALSYM ERROR_PATCH_PACKAGE_OPEN_FAILED}
  ERROR_PATCH_PACKAGE_INVALID     = 1636; // This patch package could not be opened.  Contact the application vendor to verify that this is a valid Windows Installer patch package.
  {$EXTERNALSYM ERROR_PATCH_PACKAGE_INVALID}
  ERROR_PATCH_PACKAGE_UNSUPPORTED = 1637; // This patch package cannot be processed by the Windows Installer service.  You must install a Windows service pack that contains a newer version of the Windows Installer service.
  {$EXTERNALSYM ERROR_PATCH_PACKAGE_UNSUPPORTED}

  ERROR_PRODUCT_VERSION = 1638; // Another version of this product is already installed.  Installation of this version cannot continue.  To configure or remove the existing version of this product, use Add/Remove Programs on the Control Panel.
  {$EXTERNALSYM ERROR_PRODUCT_VERSION}

  ERROR_INVALID_COMMAND_LINE = 1639; // Invalid command line argument.  Consult the Windows Installer SDK for detailed command line help.
  {$EXTERNALSYM ERROR_INVALID_COMMAND_LINE}

// The following three error codes are not returned from MSI version 1.0

  ERROR_INSTALL_REMOTE_DISALLOWED = 1640; // Configuration of this product is not permitted from remote sessions. Contact your administrator.
  {$EXTERNALSYM ERROR_INSTALL_REMOTE_DISALLOWED}

  ERROR_SUCCESS_REBOOT_INITIATED = 1641; // The requested operation completed successfully.  The system will be restarted so the changes can take effect.
  {$EXTERNALSYM ERROR_SUCCESS_REBOOT_INITIATED}

  ERROR_PATCH_TARGET_NOT_FOUND = 1642; // The upgrade patch cannot be installed by the Windows Installer service because the program to be upgraded may be missing, or the upgrade patch may update a different version of the program. Verify that the program to be upgraded exists on your computer and that you have the correct upgrade patch.
  {$EXTERNALSYM ERROR_PATCH_TARGET_NOT_FOUND}

// The following two error codes are not returned from MSI version 1.0, 1.1. or 1.2

  ERROR_PATCH_PACKAGE_REJECTED      = 1643; // The patch package is not permitted by software restriction policy.
  {$EXTERNALSYM ERROR_PATCH_PACKAGE_REJECTED}
  ERROR_INSTALL_TRANSFORM_REJECTED  = 1644; // One or more customizations are not permitted by software restriction policy.
  {$EXTERNALSYM ERROR_INSTALL_TRANSFORM_REJECTED}

// The following error code is returned only from MSI post version 2.0

// LOCALIZE BEGIN:

//#ifndef ERROR_INSTALL_REMOTE_PROHIBITED
  ERROR_INSTALL_REMOTE_PROHIBITED   = 1645; // The Windows Installer does not permit installation from a Remote Desktop Connection.
  {$EXTERNALSYM ERROR_INSTALL_REMOTE_PROHIBITED}

//#endif
{$ENDIF JWA_INCLUDEMODE}

// LOCALIZE END
{$ENDIF JWA_IMPLEMENTATIONSECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
implementation
//uses ...
{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_INTERFACESECTION}

{$IFNDEF JWA_INCLUDEMODE}
const
  msilib = 'msi.dll';
  {$IFDEF UNICODE}
  AWSuffix = 'W';
  {$ELSE}
  AWSuffix = 'A';
  {$ENDIF UNICODE}
{$ENDIF JWA_INCLUDEMODE}


function MsiCloseHandle; external msilib name 'MsiCloseHandle' delayed;
function MsiCloseAllHandles; external msilib name 'MsiCloseAllHandles' delayed;
function MsiSetInternalUI; external msilib name 'MsiSetInternalUI' delayed;
function MsiSetExternalUIA; external msilib name 'MsiSetExternalUIA' delayed;
function MsiSetExternalUIW; external msilib name 'MsiSetExternalUIW' delayed;
function MsiSetExternalUI; external msilib name 'MsiSetExternalUI' + AWSuffix delayed;
function MsiEnableLogA; external msilib name 'MsiEnableLogA' delayed;
function MsiEnableLogW; external msilib name 'MsiEnableLogW' delayed;
function MsiEnableLog; external msilib name 'MsiEnableLog' + AWSuffix delayed;
function MsiQueryProductStateA; external msilib name 'MsiQueryProductStateA' delayed;
function MsiQueryProductStateW; external msilib name 'MsiQueryProductStateW' delayed;
function MsiQueryProductState; external msilib name 'MsiQueryProductState' + AWSuffix delayed;
function MsiGetProductInfoA; external msilib name 'MsiGetProductInfoA' delayed;
function MsiGetProductInfoW; external msilib name 'MsiGetProductInfoW' delayed;
function MsiGetProductInfo; external msilib name 'MsiGetProductInfo' + AWSuffix delayed;
function MsiInstallProductA; external msilib name 'MsiInstallProductA' delayed;
function MsiInstallProductW; external msilib name 'MsiInstallProductW' delayed;
function MsiInstallProduct; external msilib name 'MsiInstallProduct' + AWSuffix delayed;
function MsiConfigureProductA; external msilib name 'MsiConfigureProductA' delayed;
function MsiConfigureProductW; external msilib name 'MsiConfigureProductW' delayed;
function MsiConfigureProduct; external msilib name 'MsiConfigureProduct' + AWSuffix delayed;
function MsiConfigureProductExA; external msilib name 'MsiConfigureProductExA' delayed;
function MsiConfigureProductExW; external msilib name 'MsiConfigureProductExW' delayed;
function MsiConfigureProductEx; external msilib name 'MsiConfigureProductEx' + AWSuffix delayed;
function MsiReinstallProductA; external msilib name 'MsiReinstallProductA' delayed;
function MsiReinstallProductW; external msilib name 'MsiReinstallProductW' delayed;
function MsiReinstallProduct; external msilib name 'MsiReinstallProduct' + AWSuffix delayed;
function MsiAdvertiseProductExA; external msilib name 'MsiAdvertiseProductExA' delayed;
function MsiAdvertiseProductExW; external msilib name 'MsiAdvertiseProductExW' delayed;
function MsiAdvertiseProductEx; external msilib name 'MsiAdvertiseProductEx' + AWSuffix delayed;
function MsiAdvertiseProductA; external msilib name 'MsiAdvertiseProductA' delayed;
function MsiAdvertiseProductW; external msilib name 'MsiAdvertiseProductW' delayed;
function MsiAdvertiseProduct; external msilib name 'MsiAdvertiseProduct' + AWSuffix delayed;
function MsiProcessAdvertiseScriptA; external msilib name 'MsiProcessAdvertiseScriptA' delayed;
function MsiProcessAdvertiseScriptW; external msilib name 'MsiProcessAdvertiseScriptW' delayed;
function MsiProcessAdvertiseScript; external msilib name 'MsiProcessAdvertiseScript' + AWSuffix delayed;
function MsiAdvertiseScriptA; external msilib name 'MsiAdvertiseScriptA' delayed;
function MsiAdvertiseScriptW; external msilib name 'MsiAdvertiseScriptW' delayed;
function MsiAdvertiseScript; external msilib name 'MsiAdvertiseScript' + AWSuffix delayed;
function MsiGetProductInfoFromScriptA; external msilib name 'MsiGetProductInfoFromScriptA' delayed;
function MsiGetProductInfoFromScriptW; external msilib name 'MsiGetProductInfoFromScriptW' delayed;
function MsiGetProductInfoFromScript; external msilib name 'MsiGetProductInfoFromScript' + AWSuffix delayed;
function MsiGetProductCodeA; external msilib name 'MsiGetProductCodeA' delayed;
function MsiGetProductCodeW; external msilib name 'MsiGetProductCodeW' delayed;
function MsiGetProductCode; external msilib name 'MsiGetProductCode' + AWSuffix delayed;
function MsiGetUserInfoA; external msilib name 'MsiGetUserInfoA' delayed;
function MsiGetUserInfoW; external msilib name 'MsiGetUserInfoW' delayed;
function MsiGetUserInfo; external msilib name 'MsiGetUserInfo' + AWSuffix delayed;
function MsiCollectUserInfoA; external msilib name 'MsiCollectUserInfoA' delayed;
function MsiCollectUserInfoW; external msilib name 'MsiCollectUserInfoW' delayed;
function MsiCollectUserInfo; external msilib name 'MsiCollectUserInfo' + AWSuffix delayed;
function MsiApplyPatchA; external msilib name 'MsiApplyPatchA' delayed;
function MsiApplyPatchW; external msilib name 'MsiApplyPatchW' delayed;
function MsiApplyPatch; external msilib name 'MsiApplyPatch' + AWSuffix delayed;
function MsiGetPatchInfoA; external msilib name 'MsiGetPatchInfoA' delayed;
function MsiGetPatchInfoW; external msilib name 'MsiGetPatchInfoW' delayed;
function MsiGetPatchInfo; external msilib name 'MsiGetPatchInfo' + AWSuffix delayed;
function MsiEnumPatchesA; external msilib name 'MsiEnumPatchesA' delayed;
function MsiEnumPatchesW; external msilib name 'MsiEnumPatchesW' delayed;
function MsiEnumPatches; external msilib name 'MsiEnumPatches' + AWSuffix delayed;
function MsiQueryFeatureStateA; external msilib name 'MsiQueryFeatureStateA' delayed;
function MsiQueryFeatureStateW; external msilib name 'MsiQueryFeatureStateW' delayed;
function MsiQueryFeatureState; external msilib name 'MsiQueryFeatureState' + AWSuffix delayed;
function MsiUseFeatureA; external msilib name 'MsiUseFeatureA' delayed;
function MsiUseFeatureW; external msilib name 'MsiUseFeatureW' delayed;
function MsiUseFeature; external msilib name 'MsiUseFeature' + AWSuffix delayed;
function MsiUseFeatureExA; external msilib name 'MsiUseFeatureExA' delayed;
function MsiUseFeatureExW; external msilib name 'MsiUseFeatureExW' delayed;
function MsiUseFeatureEx; external msilib name 'MsiUseFeatureEx' + AWSuffix delayed;
function MsiGetFeatureUsageA; external msilib name 'MsiGetFeatureUsageA' delayed;
function MsiGetFeatureUsageW; external msilib name 'MsiGetFeatureUsageW' delayed;
function MsiGetFeatureUsage; external msilib name 'MsiGetFeatureUsage' + AWSuffix delayed;
function MsiConfigureFeatureA; external msilib name 'MsiConfigureFeatureA' delayed;
function MsiConfigureFeatureW; external msilib name 'MsiConfigureFeatureW' delayed;
function MsiConfigureFeature; external msilib name 'MsiConfigureFeature' + AWSuffix delayed;
function MsiReinstallFeatureA; external msilib name 'MsiReinstallFeatureA' delayed;
function MsiReinstallFeatureW; external msilib name 'MsiReinstallFeatureW' delayed;
function MsiReinstallFeature; external msilib name 'MsiReinstallFeature' + AWSuffix delayed;
function MsiProvideComponentA; external msilib name 'MsiProvideComponentA' delayed;
function MsiProvideComponentW; external msilib name 'MsiProvideComponentW' delayed;
function MsiProvideComponent; external msilib name 'MsiProvideComponent' + AWSuffix delayed;
function MsiProvideQualifiedComponentA; external msilib name 'MsiProvideQualifiedComponentA' delayed;
function MsiProvideQualifiedComponentW; external msilib name 'MsiProvideQualifiedComponentW' delayed;
function MsiProvideQualifiedComponent; external msilib name 'MsiProvideQualifiedComponent' + AWSuffix delayed;
function MsiProvideQualifiedComponentExA; external msilib name 'MsiProvideQualifiedComponentExA' delayed;
function MsiProvideQualifiedComponentExW; external msilib name 'MsiProvideQualifiedComponentExW' delayed;
function MsiProvideQualifiedComponentEx; external msilib name 'MsiProvideQualifiedComponentEx' + AWSuffix delayed;
function MsiGetComponentPathA; external msilib name 'MsiGetComponentPathA' delayed;
function MsiGetComponentPathW; external msilib name 'MsiGetComponentPathW' delayed;
function MsiGetComponentPath; external msilib name 'MsiGetComponentPath' + AWSuffix delayed;
function MsiProvideAssemblyA; external msilib name 'MsiProvideAssemblyA' delayed;
function MsiProvideAssemblyW; external msilib name 'MsiProvideAssemblyW' delayed;
function MsiProvideAssembly; external msilib name 'MsiProvideAssembly' + AWSuffix delayed;
function MsiEnumProductsA; external msilib name 'MsiEnumProductsA' delayed;
function MsiEnumProductsW; external msilib name 'MsiEnumProductsW' delayed;
function MsiEnumProducts; external msilib name 'MsiEnumProducts' + AWSuffix delayed;
{$IFDEF MSI110}
function MsiEnumRelatedProductsA; external msilib name 'MsiEnumRelatedProductsA' delayed;
function MsiEnumRelatedProductsW; external msilib name 'MsiEnumRelatedProductsW' delayed;
function MsiEnumRelatedProducts; external msilib name 'MsiEnumRelatedProducts' + AWSuffix delayed;
{$ENDIF MSI110}
function MsiEnumFeaturesA; external msilib name 'MsiEnumFeaturesA' delayed;
function MsiEnumFeaturesW; external msilib name 'MsiEnumFeaturesW' delayed;
function MsiEnumFeatures; external msilib name 'MsiEnumFeatures' + AWSuffix delayed;
function MsiEnumComponentsA; external msilib name 'MsiEnumComponentsA' delayed;
function MsiEnumComponentsW; external msilib name 'MsiEnumComponentsW' delayed;
function MsiEnumComponents; external msilib name 'MsiEnumComponents' + AWSuffix delayed;
function MsiEnumClientsA; external msilib name 'MsiEnumClientsA' delayed;
function MsiEnumClientsW; external msilib name 'MsiEnumClientsW' delayed;
function MsiEnumClients; external msilib name 'MsiEnumClients' + AWSuffix delayed;
function MsiEnumComponentQualifiersA; external msilib name 'MsiEnumComponentQualifiersA' delayed;
function MsiEnumComponentQualifiersW; external msilib name 'MsiEnumComponentQualifiersW' delayed;
function MsiEnumComponentQualifiers; external msilib name 'MsiEnumComponentQualifiers' + AWSuffix delayed;
function MsiOpenProductA; external msilib name 'MsiOpenProductA' delayed;
function MsiOpenProductW; external msilib name 'MsiOpenProductW' delayed;
function MsiOpenProduct; external msilib name 'MsiOpenProduct' + AWSuffix delayed;
function MsiOpenPackageA; external msilib name 'MsiOpenPackageA' delayed;
function MsiOpenPackageW; external msilib name 'MsiOpenPackageW' delayed;
function MsiOpenPackage; external msilib name 'MsiOpenPackage' + AWSuffix delayed;
function MsiOpenPackageExA; external msilib name 'MsiOpenPackageExA' delayed;
function MsiOpenPackageExW; external msilib name 'MsiOpenPackageExW' delayed;
function MsiOpenPackageEx; external msilib name 'MsiOpenPackageEx' + AWSuffix delayed;
function MsiGetProductPropertyA; external msilib name 'MsiGetProductPropertyA' delayed;
function MsiGetProductPropertyW; external msilib name 'MsiGetProductPropertyW' delayed;
function MsiGetProductProperty; external msilib name 'MsiGetProductProperty' + AWSuffix delayed;
function MsiVerifyPackageA; external msilib name 'MsiVerifyPackageA' delayed;
function MsiVerifyPackageW; external msilib name 'MsiVerifyPackageW' delayed;
function MsiVerifyPackage; external msilib name 'MsiVerifyPackage' + AWSuffix delayed;
function MsiGetFeatureInfoA; external msilib name 'MsiGetFeatureInfoA' delayed;
function MsiGetFeatureInfoW; external msilib name 'MsiGetFeatureInfoW' delayed;
function MsiGetFeatureInfo; external msilib name 'MsiGetFeatureInfo' + AWSuffix delayed;
function MsiInstallMissingComponentA; external msilib name 'MsiInstallMissingComponentA' delayed;
function MsiInstallMissingComponentW; external msilib name 'MsiInstallMissingComponentW' delayed;
function MsiInstallMissingComponent; external msilib name 'MsiInstallMissingComponent' + AWSuffix delayed;
function MsiInstallMissingFileA; external msilib name 'MsiInstallMissingFileA' delayed;
function MsiInstallMissingFileW; external msilib name 'MsiInstallMissingFileW' delayed;
function MsiInstallMissingFile; external msilib name 'MsiInstallMissingFile' + AWSuffix delayed;
function MsiLocateComponentA; external msilib name 'MsiLocateComponentA' delayed;
function MsiLocateComponentW; external msilib name 'MsiLocateComponentW' delayed;
function MsiLocateComponent; external msilib name 'MsiLocateComponent' + AWSuffix delayed;
{$IFDEF MSI110}
function MsiSourceListClearAllA; external msilib name 'MsiSourceListClearAllA' delayed;
function MsiSourceListClearAllW; external msilib name 'MsiSourceListClearAllW' delayed;
function MsiSourceListClearAll; external msilib name 'MsiSourceListClearAll' + AWSuffix delayed;
function MsiSourceListAddSourceA; external msilib name 'MsiSourceListAddSourceA' delayed;
function MsiSourceListAddSourceW; external msilib name 'MsiSourceListAddSourceW' delayed;
function MsiSourceListAddSource; external msilib name 'MsiSourceListAddSource' + AWSuffix delayed;
function MsiSourceListForceResolutionA; external msilib name 'MsiSourceListForceResolutionA' delayed;
function MsiSourceListForceResolutionW; external msilib name 'MsiSourceListForceResolutionW' delayed;
function MsiSourceListForceResolution; external msilib name 'MsiSourceListForceResolution' + AWSuffix delayed;
{$ENDIF MSI110}
function MsiGetFileVersionA; external msilib name 'MsiGetFileVersionA' delayed;
function MsiGetFileVersionW; external msilib name 'MsiGetFileVersionW' delayed;
function MsiGetFileVersion; external msilib name 'MsiGetFileVersion' + AWSuffix delayed;
function MsiGetFileHashA; external msilib name 'MsiGetFileHashA' delayed;
function MsiGetFileHashW; external msilib name 'MsiGetFileHashW' delayed;
function MsiGetFileHash; external msilib name 'MsiGetFileHash' + AWSuffix delayed;
function MsiGetFileSignatureInformationA; external msilib name 'MsiGetFileSignatureInformationA' delayed;
function MsiGetFileSignatureInformationW; external msilib name 'MsiGetFileSignatureInformationW' delayed;
function MsiGetFileSignatureInformation; external msilib name 'MsiGetFileSignatureInformation' + AWSuffix delayed;
{$IFDEF MSI110}
function MsiGetShortcutTargetA; external msilib name 'MsiGetShortcutTargetA' delayed;
function MsiGetShortcutTargetW; external msilib name 'MsiGetShortcutTargetW' delayed;
function MsiGetShortcutTarget; external msilib name 'MsiGetShortcutTarget' + AWSuffix delayed;
{$ENDIF MSI110}
function MsiIsProductElevatedA; external msilib name 'MsiIsProductElevatedA' delayed;
function MsiIsProductElevatedW; external msilib name 'MsiIsProductElevatedW' delayed;
function MsiIsProductElevated; external msilib name 'MsiIsProductElevated' + AWSuffix delayed;


{$ENDIF JWA_INTERFACESECTION}


{$IFNDEF JWA_OMIT_SECTIONS}
end.
{$ENDIF JWA_OMIT_SECTIONS}
