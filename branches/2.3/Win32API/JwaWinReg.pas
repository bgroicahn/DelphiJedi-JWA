{******************************************************************************}
{                                                                              }
{ Windows Registry API interface Unit for Object Pascal                        }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2001 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The original file is: winreg.h, released June 2000. The original Pascal      }
{ code is: WinReg.pas, released December 2000. The initial developer of the    }
{ Pascal code is Marcel van Brakel (brakelm att chello dott nl).               }
{                                                                              }
{ Portions created by Marcel van Brakel are Copyright (C) 1999-2001            }
{ Marcel van Brakel. All Rights Reserved.                                      }
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

// $Id: JwaWinReg.pas,v 1.13 2007/09/05 11:58:54 dezipaitor Exp $

{$IFNDEF JWA_OMIT_SECTIONS}
unit JwaWinReg;

{$WEAKPACKAGEUNIT}

{$ENDIF JWA_OMIT_SECTIONS}

{$HPPEMIT ''}
{$HPPEMIT '#include "WinReg.h"'}
{$HPPEMIT ''}



{$IFNDEF JWA_OMIT_SECTIONS}

{$I ..\Includes\JediAPILib.inc}

interface

uses
  JwaReason, JwaWinBase, JwaWinNT, JwaWinType;

{$ENDIF JWA_OMIT_SECTIONS}
{$IFNDEF JWA_IMPLEMENTATIONSECTION}
//
// Requested Key access mask type.
//

type
  REGSAM = ACCESS_MASK;
  {$EXTERNALSYM REGSAM}

//
// Reserved Key Handles.
//

const
  HKEY_CLASSES_ROOT     = HKEY(ULONG_PTR(LONG($80000000)));
  {$EXTERNALSYM HKEY_CLASSES_ROOT}
  HKEY_CURRENT_USER     = HKEY(ULONG_PTR(LONG($80000001)));
  {$EXTERNALSYM HKEY_CURRENT_USER}
  HKEY_LOCAL_MACHINE    = HKEY(ULONG_PTR(LONG($80000002)));
  {$EXTERNALSYM HKEY_LOCAL_MACHINE}
  HKEY_USERS            = HKEY(ULONG_PTR(LONG($80000003)));
  {$EXTERNALSYM HKEY_USERS}
  HKEY_PERFORMANCE_DATA = HKEY(ULONG_PTR(LONG($80000004)));
  {$EXTERNALSYM HKEY_PERFORMANCE_DATA}
  HKEY_PERFORMANCE_TEXT    = HKEY(ULONG_PTR(LONG($80000050)));
  {$EXTERNALSYM HKEY_PERFORMANCE_TEXT}
  HKEY_PERFORMANCE_NLSTEXT = HKEY(ULONG_PTR(LONG($80000060)));
  {$EXTERNALSYM HKEY_PERFORMANCE_NLSTEXT}
  HKEY_CURRENT_CONFIG   = HKEY(ULONG_PTR(LONG($80000005)));
  {$EXTERNALSYM HKEY_CURRENT_CONFIG}
  HKEY_DYN_DATA         = HKEY(ULONG_PTR(LONG($80000006)));
  {$EXTERNALSYM HKEY_DYN_DATA}

  PROVIDER_KEEPS_VALUE_LENGTH = $1;
  {$EXTERNALSYM PROVIDER_KEEPS_VALUE_LENGTH}

type
  val_context = record
    valuelen: Integer;       // the total length of this value
    value_context: LPVOID;   // provider's context
    val_buff_ptr: LPVOID;    // where in the ouput buffer the value is.
  end;
  {$EXTERNALSYM val_context}
  PVALCONTEXT = ^val_context;
  {$EXTERNALSYM PVALCONTEXT}
  TValContext = val_context;

  PVALUEA = record           // Provider supplied value/context.
    pv_valuename: LPSTR;     // The value name pointer
    pv_valuelen: Integer;
    pv_value_context: LPVOID;
    pv_type: DWORD;
  end;
  {$EXTERNALSYM PVALUEA}
  PPVALUEA = ^PVALUEA;
  {$EXTERNALSYM PPVALUEA}
  TPValueA = PVALUEA;

  PVALUEW = record           // Provider supplied value/context.
    pv_valuename: LPWSTR;    // The value name pointer
    pv_valuelen: Integer;
    pv_value_context: LPVOID;
    pv_type: DWORD;
  end;
  {$EXTERNALSYM PVALUEW}
  PPVALUEW = ^PVALUEW;
  {$EXTERNALSYM PPVALUEW}
  TPValueW = PVALUEW;

  {$IFDEF UNICODE}
  PVALUE = PVALUEW;
  {$EXTERNALSYM PVALUE}
  PPVALUE = PPVALUEW;
  {$EXTERNALSYM PPVALUE}
  TPValue = TPValueW;
  {$ELSE}
  PVALUE = PVALUEA;
  {$EXTERNALSYM PVALUE}
  PPVALUE = PPVALUEA;
  {$EXTERNALSYM PPVALUE}
  TPValue = TPValueA;
  {$ENDIF UNICODE}

  QUERYHANDLER = function(keycontext: LPVOID; val_list: PVALCONTEXT;
    num_vals: DWORD; outputbuffer: LPVOID; total_outlen: LPDWORD;
    input_blen: DWORD): DWORD; cdecl;
  {$EXTERNALSYM QUERYHANDLER}
  PQUERYHANDLER = ^QUERYHANDLER;
  {$EXTERNALSYM PQUERYHANDLER}
  TQueryHandler = QUERYHANDLER;

  provider_info = record
    pi_R0_1val: PQUERYHANDLER;
    pi_R0_allvals: PQUERYHANDLER;
    pi_R3_1val: PQUERYHANDLER;
    pi_R3_allvals: PQUERYHANDLER;
    pi_flags: DWORD;    // capability flags (none defined yet).
    pi_key_context: LPVOID;
  end;
  {$EXTERNALSYM provider_info}
  REG_PROVIDER = provider_info;
  {$EXTERNALSYM REG_PROVIDER}
  PPROVIDER = ^provider_info;
  {$EXTERNALSYM PPROVIDER}
  TProviderInfo = provider_info;
  PProviderInfo = ^provider_info;

  value_entA = record
    ve_valuename: LPSTR;
    ve_valuelen: DWORD;
    ve_valueptr: DWORD_PTR;
    ve_type: DWORD;
  end;
  {$EXTERNALSYM value_entA}
  VALENTA = value_entA;
  {$EXTERNALSYM VALENTA}
  PVALENTA = ^VALENTA;
  {$EXTERNALSYM PVALENTA}
  TValueEntA = value_entA;
  PValueEntA = ^value_entA;

  value_entW = record
    ve_valuename: LPWSTR;
    ve_valuelen: DWORD;
    ve_valueptr: DWORD_PTR;
    ve_type: DWORD;
  end;
  {$EXTERNALSYM value_entW}
  VALENTW = value_entW;
  {$EXTERNALSYM VALENTW}
  PVALENTW = ^VALENTW;
  {$EXTERNALSYM PVALENTW}
  TValueEntW = value_entW;
  PValueEntW = ^value_entW;

  {$IFDEF UNICODE}
  VALENT = VALENTW;
  {$EXTERNALSYM VALENT}
  PVALENT = PVALENTW;
  {$EXTERNALSYM PVALENT}
  TValueEnt = TValueEntW;
  PValueEnt = PValueEntW;
  {$ELSE}
  VALENT = VALENTA;
  {$EXTERNALSYM VALENT}
  PVALENT = PVALENTA;
  {$EXTERNALSYM PVALENT}
  TValueEnt = TValueEntA;
  PValueEnt = PValueEntA;
  {$ENDIF UNICODE}

//
// Default values for parameters that do not exist in the Win 3.1
// compatible APIs.
//

const
  WIN31_CLASS = nil;
  {$EXTERNALSYM WIN31_CLASS}

//
// API Prototypes.
//

function RegCloseKey(hKey: HKEY): LONG; stdcall;
{$EXTERNALSYM RegCloseKey}

function RegOverridePredefKey(hKey: HKEY; hNewHKey: HKEY): LONG; stdcall;
{$EXTERNALSYM RegOverridePredefKey}

function RegOpenUserClassesRoot(hToken: HANDLE; dwOptions: DWORD;
  samDesired: REGSAM; var phkResult: HKEY): LONG; stdcall;
{$EXTERNALSYM RegOpenUserClassesRoot}

function RegOpenCurrentUser(samDesired: REGSAM; var phkResult: HKEY): LONG; stdcall;
{$EXTERNALSYM RegOpenCurrentUser}

function RegDisablePredefinedCache: LONG; stdcall;
{$EXTERNALSYM RegDisablePredefinedCache}

function RegConnectRegistryA(lpMachineName: LPCSTR; hKey: HKEY;
  var phkResult: HKEY): LONG; stdcall;
{$EXTERNALSYM RegConnectRegistryA}
function RegConnectRegistryW(lpMachineName: LPCWSTR; hKey: HKEY;
  var phkResult: HKEY): LONG; stdcall;
{$EXTERNALSYM RegConnectRegistryW}
function RegConnectRegistry(lpMachineName: LPCTSTR; hKey: HKEY;
  var phkResult: HKEY): LONG; stdcall;
{$EXTERNALSYM RegConnectRegistry}

function RegCreateKeyA(hKey: HKEY; lpSubKey: LPCSTR; var phkResult: HKEY): LONG; stdcall;
{$EXTERNALSYM RegCreateKeyA}
function RegCreateKeyW(hKey: HKEY; lpSubKey: LPCWSTR; var phkResult: HKEY): LONG; stdcall;
{$EXTERNALSYM RegCreateKeyW}
function RegCreateKey(hKey: HKEY; lpSubKey: LPCTSTR; var phkResult: HKEY): LONG; stdcall;
{$EXTERNALSYM RegCreateKey}

function RegCreateKeyExA(hKey: HKEY; lpSubKey: LPCSTR; Reserved: DWORD;
  lpClass: LPSTR; dwOptions: DWORD; samDesired: REGSAM;
  lpSecurityAttributes: LPSECURITY_ATTRIBUTES; var phkResult: HKEY;
  lpdwDisposition: LPDWORD): LONG; stdcall;
{$EXTERNALSYM RegCreateKeyExA}
function RegCreateKeyExW(hKey: HKEY; lpSubKey: LPCWSTR; Reserved: DWORD;
  lpClass: LPWSTR; dwOptions: DWORD; samDesired: REGSAM;
  lpSecurityAttributes: LPSECURITY_ATTRIBUTES; var phkResult: HKEY;
  lpdwDisposition: LPDWORD): LONG; stdcall;
{$EXTERNALSYM RegCreateKeyExW}
function RegCreateKeyEx(hKey: HKEY; lpSubKey: LPCTSTR; Reserved: DWORD;
  lpClass: LPTSTR; dwOptions: DWORD; samDesired: REGSAM;
  lpSecurityAttributes: LPSECURITY_ATTRIBUTES; var phkResult: HKEY;
  lpdwDisposition: LPDWORD): LONG; stdcall;
{$EXTERNALSYM RegCreateKeyEx}

function RegDeleteKeyA(hKey: HKEY; lpSubKey: LPCSTR): LONG; stdcall;
{$EXTERNALSYM RegDeleteKeyA}
function RegDeleteKeyW(hKey: HKEY; lpSubKey: LPCWSTR): LONG; stdcall;
{$EXTERNALSYM RegDeleteKeyW}
function RegDeleteKey(hKey: HKEY; lpSubKey: LPCTSTR): LONG; stdcall;
{$EXTERNALSYM RegDeleteKey}

function RegDeleteKeyExA(hKey: HKEY; lpSubKey: LPCSTR; samDesired : REGSAM; Reserved : DWORD): LONG; stdcall;
{$EXTERNALSYM RegDeleteKeyExA}
function RegDeleteKeyExW(hKey: HKEY; lpSubKey: LPCWSTR; samDesired : REGSAM; Reserved : DWORD): LONG; stdcall;
{$EXTERNALSYM RegDeleteKeyExW}
function RegDeleteKeyEx(hKey: HKEY; lpSubKey: LPCTSTR; samDesired : REGSAM; Reserved : DWORD): LONG; stdcall;
{$EXTERNALSYM RegDeleteKeyEx}


function RegDeleteValueA(hKey: HKEY; lpValueName: LPCSTR): LONG; stdcall;
{$EXTERNALSYM RegDeleteValueA}
function RegDeleteValueW(hKey: HKEY; lpValueName: LPCWSTR): LONG; stdcall;
{$EXTERNALSYM RegDeleteValueW}
function RegDeleteValue(hKey: HKEY; lpValueName: LPCTSTR): LONG; stdcall;
{$EXTERNALSYM RegDeleteValue}

function RegEnumKeyA(hKey: HKEY; dwIndex: DWORD; lpName: LPSTR; cbName: DWORD): LONG; stdcall;
{$EXTERNALSYM RegEnumKeyA}
function RegEnumKeyW(hKey: HKEY; dwIndex: DWORD; lpName: LPWSTR; cbName: DWORD): LONG; stdcall;
{$EXTERNALSYM RegEnumKeyW}
function RegEnumKey(hKey: HKEY; dwIndex: DWORD; lpName: LPTSTR; cbName: DWORD): LONG; stdcall;
{$EXTERNALSYM RegEnumKey}

function RegEnumKeyExA(hKey: HKEY; dwIndex: DWORD; lpName: LPSTR;
  var lpcbName: DWORD; lpReserved: LPDWORD; lpClass: LPSTR; lpcbClass: LPDWORD;
  lpftLastWriteTime: PFILETIME): LONG; stdcall;
{$EXTERNALSYM RegEnumKeyExA}
function RegEnumKeyExW(hKey: HKEY; dwIndex: DWORD; lpName: LPWSTR;
  var lpcbName: DWORD; lpReserved: LPDWORD; lpClass: LPWSTR; lpcbClass: LPDWORD;
  lpftLastWriteTime: PFILETIME): LONG; stdcall;
{$EXTERNALSYM RegEnumKeyExW}
function RegEnumKeyEx(hKey: HKEY; dwIndex: DWORD; lpName: LPTSTR;
  var lpcbName: LPDWORD; lpReserved: LPDWORD; lpClass: LPTSTR; lpcbClass: LPDWORD;
  lpftLastWriteTime: PFILETIME): LONG; stdcall;
{$EXTERNALSYM RegEnumKeyEx}

function RegEnumValueA(hKey: HKEY; dwIndex: DWORD; lpValueName: LPSTR;
  var lpcbValueName: DWORD; lpReserved, lpType: LPDWORD; lpData: LPBYTE;
  lpcbData: LPDWORD): LONG; stdcall;
{$EXTERNALSYM RegEnumValueA}
function RegEnumValueW(hKey: HKEY; dwIndex: DWORD; lpValueName: LPWSTR;
  var lpcbValueName: DWORD; lpReserved, lpType: LPDWORD; lpData: LPBYTE;
  lpcbData: LPDWORD): LONG; stdcall;
{$EXTERNALSYM RegEnumValueW}
function RegEnumValue(hKey: HKEY; dwIndex: DWORD; lpValueName: LPTSTR;
  var lpcbValueName: DWORD; lpReserved, lpType: LPDWORD; lpData: LPBYTE;
  lpcbData: LPDWORD): LONG; stdcall;
{$EXTERNALSYM RegEnumValue}

function RegFlushKey(hKey: HKEY): LONG; stdcall;
{$EXTERNALSYM RegFlushKey}

function RegGetKeySecurity(hKey: HKEY; SecurityInformation: SECURITY_INFORMATION;
  pSecurityDescriptor: PSECURITY_DESCRIPTOR; var lpcbSecurityDescriptor: DWORD): LONG; stdcall;
{$EXTERNALSYM RegGetKeySecurity}

function RegLoadKeyA(hKey: HKEY; lpSubKey: LPCSTR; lpFile: LPCSTR): LONG; stdcall;
{$EXTERNALSYM RegLoadKeyA}
function RegLoadKeyW(hKey: HKEY; lpSubKey: LPCWSTR; lpFile: LPCWSTR): LONG; stdcall;
{$EXTERNALSYM RegLoadKeyW}
function RegLoadKey(hKey: HKEY; lpSubKey: LPCTSTR; lpFile: LPCTSTR): LONG; stdcall;
{$EXTERNALSYM RegLoadKey}

function RegNotifyChangeKeyValue(hKey: HKEY; bWatchSubtree: BOOL;
  dwNotifyFilter: DWORD; hEvent: HANDLE; fAsynchronus: BOOL): LONG;
{$EXTERNALSYM RegNotifyChangeKeyValue}

function RegOpenKeyA(hKey: HKEY; lpSubKey: LPCSTR; var phkResult: HKEY): LONG; stdcall;
{$EXTERNALSYM RegOpenKeyA}
function RegOpenKeyW(hKey: HKEY; lpSubKey: LPCWSTR; var phkResult: HKEY): LONG; stdcall;
{$EXTERNALSYM RegOpenKeyW}
function RegOpenKey(hKey: HKEY; lpSubKey: LPCTSTR; var phkResult: HKEY): LONG; stdcall;
{$EXTERNALSYM RegOpenKey}

function RegOpenKeyExA(hKey: HKEY; lpSubKey: LPCSTR; ulOptions: DWORD;
  samDesired: REGSAM; var phkResult: HKEY): LONG; stdcall;
{$EXTERNALSYM RegOpenKeyExA}
function RegOpenKeyExW(hKey: HKEY; lpSubKey: LPCWSTR; ulOptions: DWORD;
  samDesired: REGSAM; var phkResult: HKEY): LONG; stdcall;
{$EXTERNALSYM RegOpenKeyExW}
function RegOpenKeyEx(hKey: HKEY; lpSubKey: LPCTSTR; ulOptions: DWORD;
  samDesired: REGSAM; var phkResult: HKEY): LONG; stdcall;
{$EXTERNALSYM RegOpenKeyEx}

function RegQueryInfoKeyA(hKey: HKEY; lpClass: LPSTR; lpcbClass, lpReserved,
  lpcSubKeys, lpcbMaxSubKeyLen, lpcbMaxClassLen, lpcValues, lpcbMaxValueNameLen,
  lpcbMaxValueLen, lpcbSecurityDescriptor: LPDWORD; lpftLastWriteTime: PFILETIME): LONG; stdcall;
{$EXTERNALSYM RegQueryInfoKeyA}
function RegQueryInfoKeyW(hKey: HKEY; lpClass: LPWSTR; lpcbClass, lpReserved,
  lpcSubKeys, lpcbMaxSubKeyLen, lpcbMaxClassLen, lpcValues, lpcbMaxValueNameLen,
  lpcbMaxValueLen, lpcbSecurityDescriptor: LPDWORD; lpftLastWriteTime: PFILETIME): LONG; stdcall;
{$EXTERNALSYM RegQueryInfoKeyW}
function RegQueryInfoKey(hKey: HKEY; lpClass: LPTSTR; lpcbClass, lpReserved,
  lpcSubKeys, lpcbMaxSubKeyLen, lpcbMaxClassLen, lpcValues, lpcbMaxValueNameLen,
  lpcbMaxValueLen, lpcbSecurityDescriptor: LPDWORD; lpftLastWriteTime: PFILETIME): LONG; stdcall;
{$EXTERNALSYM RegQueryInfoKey}

function RegQueryValueA(hKey: HKEY; lpSubKey: LPCSTR; lpValue: LPSTR;
  var lpcbValue: LONG): LONG; stdcall;
{$EXTERNALSYM RegQueryValueA}
function RegQueryValueW(hKey: HKEY; lpSubKey: LPCWSTR; lpValue: LPWSTR;
  var lpcbValue: LONG): LONG; stdcall;
{$EXTERNALSYM RegQueryValueW}
function RegQueryValue(hKey: HKEY; lpSubKey: LPCTSTR; lpValue: LPTSTR;
  var lpcbValue: LONG): LONG; stdcall;
{$EXTERNALSYM RegQueryValue}

function RegQueryMultipleValuesA(hKey: HKEY; val_list: PVALENTA; num_vals: DWORD;
  lpValueBuf: LPSTR; var ldwTotsize: DWORD): LONG; stdcall;
{$EXTERNALSYM RegQueryMultipleValuesA}
function RegQueryMultipleValuesW(hKey: HKEY; val_list: PVALENTW; num_vals: DWORD;
  lpValueBuf: LPWSTR; var ldwTotsize: DWORD): LONG; stdcall;
{$EXTERNALSYM RegQueryMultipleValuesW}
function RegQueryMultipleValues(hKey: HKEY; val_list: PVALENT; num_vals: DWORD;
  lpValueBuf: LPTSTR; var ldwTotsize: DWORD): LONG; stdcall;
{$EXTERNALSYM RegQueryMultipleValues}

function RegQueryValueExA(hKey: HKEY; lpValueName: LPCSTR; lpReserved: LPDWORD;
  lpType: LPDWORD; lpData: LPBYTE; lpcbData: LPDWORD): LONG; stdcall;
{$EXTERNALSYM RegQueryValueExA}
function RegQueryValueExW(hKey: HKEY; lpValueName: LPCWSTR; lpReserved: LPDWORD;
  lpType: LPDWORD; lpData: LPBYTE; lpcbData: LPDWORD): LONG; stdcall;
{$EXTERNALSYM RegQueryValueExW}
function RegQueryValueEx(hKey: HKEY; lpValueName: LPCTSTR; lpReserved: LPDWORD;
  lpType: LPDWORD; lpData: LPBYTE; lpcbData: LPDWORD): LONG; stdcall;
{$EXTERNALSYM RegQueryValueEx}

function RegReplaceKeyA(hKey: HKEY; lpSubKey: LPCSTR; lpNewFile: LPCSTR;
  lpOldFile: LPCSTR): LONG; stdcall;
{$EXTERNALSYM RegReplaceKeyA}
function RegReplaceKeyW(hKey: HKEY; lpSubKey: LPCWSTR; lpNewFile: LPCWSTR;
  lpOldFile: LPCWSTR): LONG; stdcall;
{$EXTERNALSYM RegReplaceKeyW}
function RegReplaceKey(hKey: HKEY; lpSubKey: LPCTSTR; lpNewFile: LPCTSTR;
  lpOldFile: LPCTSTR): LONG; stdcall;
{$EXTERNALSYM RegReplaceKey}

function RegRestoreKeyA(hKey: HKEY; lpFile: LPCSTR; dwFlags: DWORD): LONG; stdcall;
{$EXTERNALSYM RegRestoreKeyA}
function RegRestoreKeyW(hKey: HKEY; lpFile: LPCWSTR; dwFlags: DWORD): LONG; stdcall;
{$EXTERNALSYM RegRestoreKeyW}
function RegRestoreKey(hKey: HKEY; lpFile: LPCTSTR; dwFlags: DWORD): LONG; stdcall;
{$EXTERNALSYM RegRestoreKey}

function RegSaveKeyA(hKey: HKEY; lpFile: LPCSTR;
  lpSecurityAttributes: LPSECURITY_ATTRIBUTES): LONG; stdcall;
{$EXTERNALSYM RegSaveKeyA}
function RegSaveKeyW(hKey: HKEY; lpFile: LPCWSTR;
  lpSecurityAttributes: LPSECURITY_ATTRIBUTES): LONG; stdcall;
{$EXTERNALSYM RegSaveKeyW}
function RegSaveKey(hKey: HKEY; lpFile: LPCTSTR;
  lpSecurityAttributes: LPSECURITY_ATTRIBUTES): LONG; stdcall;
{$EXTERNALSYM RegSaveKey}

function RegSetKeySecurity(hKey: HKEY; SecurityInformation: SECURITY_INFORMATION;
  pSecurityDescriptor: PSECURITY_DESCRIPTOR): LONG; stdcall;
{$EXTERNALSYM RegSetKeySecurity}

function RegSetValueA(hKey: HKEY; lpSubKey: LPCSTR; dwType: DWORD;
  lpData: LPCSTR; cbData: DWORD): LONG; stdcall;
{$EXTERNALSYM RegSetValueA}
function RegSetValueW(hKey: HKEY; lpSubKey: LPCWSTR; dwType: DWORD;
  lpData: LPCWSTR; cbData: DWORD): LONG; stdcall;
{$EXTERNALSYM RegSetValueW}
function RegSetValue(hKey: HKEY; lpSubKey: LPCTSTR; dwType: DWORD;
  lpData: LPCTSTR; cbData: DWORD): LONG; stdcall;
{$EXTERNALSYM RegSetValue}

function RegSetValueExA(hKey: HKEY; lpValueName: LPCSTR; Reserved: DWORD;
  dwType: DWORD; lpData: LPBYTE; cbData: DWORD): LONG; stdcall;
{$EXTERNALSYM RegSetValueExA}
function RegSetValueExW(hKey: HKEY; lpValueName: LPCWSTR; Reserved: DWORD;
  dwType: DWORD; lpData: LPBYTE; cbData: DWORD): LONG; stdcall;
{$EXTERNALSYM RegSetValueExW}
function RegSetValueEx(hKey: HKEY; lpValueName: LPCTSTR; Reserved: DWORD;
  dwType: DWORD; lpData: LPBYTE; cbData: DWORD): LONG; stdcall;
{$EXTERNALSYM RegSetValueEx}

function RegUnLoadKeyA(hKey: HKEY; lpSubKey: LPCSTR): LONG; stdcall;
{$EXTERNALSYM RegUnLoadKeyA}
function RegUnLoadKeyW(hKey: HKEY; lpSubKey: LPCWSTR): LONG; stdcall;
{$EXTERNALSYM RegUnLoadKeyW}
function RegUnLoadKey(hKey: HKEY; lpSubKey: LPCTSTR): LONG; stdcall;
{$EXTERNALSYM RegUnLoadKey}

//
// Remoteable System Shutdown APIs
//

function InitiateSystemShutdownA(lpMachineName: LPSTR; lpMessage: LPSTR;
  dwTimeout: DWORD; bForceAppsClosed, bRebootAfterShutdown: BOOL): BOOL; stdcall;
{$EXTERNALSYM InitiateSystemShutdownA}
function InitiateSystemShutdownW(lpMachineName: LPWSTR; lpMessage: LPWSTR;
  dwTimeout: DWORD; bForceAppsClosed, bRebootAfterShutdown: BOOL): BOOL; stdcall;
{$EXTERNALSYM InitiateSystemShutdownW}
function InitiateSystemShutdown(lpMachineName: LPTSTR; lpMessage: LPTSTR;
  dwTimeout: DWORD; bForceAppsClosed, bRebootAfterShutdown: BOOL): BOOL; stdcall;
{$EXTERNALSYM InitiateSystemShutdown}

function AbortSystemShutdownA(lpMachineName: LPSTR): BOOL; stdcall;
{$EXTERNALSYM AbortSystemShutdownA}
function AbortSystemShutdownW(lpMachineName: LPWSTR): BOOL; stdcall;
{$EXTERNALSYM AbortSystemShutdownW}
function AbortSystemShutdown(lpMachineName: LPTSTR): BOOL; stdcall;
{$EXTERNALSYM AbortSystemShutdown}

//
// defines for InitiateSystemShutdownEx reason codes
//

const
  REASON_SWINSTALL    = SHTDN_REASON_MAJOR_SOFTWARE or SHTDN_REASON_MINOR_INSTALLATION;
  {$EXTERNALSYM REASON_SWINSTALL}
  REASON_HWINSTALL    = SHTDN_REASON_MAJOR_HARDWARE or SHTDN_REASON_MINOR_INSTALLATION;
  {$EXTERNALSYM REASON_HWINSTALL}
  REASON_SERVICEHANG  = SHTDN_REASON_MAJOR_SOFTWARE or SHTDN_REASON_MINOR_HUNG;
  {$EXTERNALSYM REASON_SERVICEHANG}
  REASON_UNSTABLE     = SHTDN_REASON_MAJOR_SYSTEM or SHTDN_REASON_MINOR_UNSTABLE;
  {$EXTERNALSYM REASON_UNSTABLE}
  REASON_SWHWRECONF   = SHTDN_REASON_MAJOR_SOFTWARE or SHTDN_REASON_MINOR_RECONFIG;
  {$EXTERNALSYM REASON_SWHWRECONF}
  REASON_OTHER        = SHTDN_REASON_MAJOR_OTHER or SHTDN_REASON_MINOR_OTHER;
  {$EXTERNALSYM REASON_OTHER}
  REASON_UNKNOWN      = SHTDN_REASON_UNKNOWN;
  {$EXTERNALSYM REASON_UNKNOWN}
  REASON_LEGACY_API   = SHTDN_REASON_LEGACY_API;
  {$EXTERNALSYM REASON_LEGACY_API}
  REASON_PLANNED_FLAG = SHTDN_REASON_FLAG_PLANNED;
  {$EXTERNALSYM REASON_PLANNED_FLAG}

//
// MAX Shutdown TimeOut == 10 Years in seconds
//

  MAX_SHUTDOWN_TIMEOUT = 10 * 365 * 24 * 60 * 60;
  {$EXTERNALSYM MAX_SHUTDOWN_TIMEOUT}

function InitiateSystemShutdownExA(lpMachineName: LPSTR; lpMessage: LPSTR;
  dwTimeout: DWORD; bForceAppsClosed, bRebootAfterShutdown: BOOL; dwReason: DWORD): BOOL; stdcall;
{$EXTERNALSYM InitiateSystemShutdownExA}
function InitiateSystemShutdownExW(lpMachineName: LPWSTR; lpMessage: LPWSTR;
  dwTimeout: DWORD; bForceAppsClosed, bRebootAfterShutdown: BOOL; dwReason: DWORD): BOOL; stdcall;
{$EXTERNALSYM InitiateSystemShutdownExW}
function InitiateSystemShutdownEx(lpMachineName: LPTSTR; lpMessage: LPTSTR;
  dwTimeout: DWORD; bForceAppsClosed, bRebootAfterShutdown: BOOL; dwReason: DWORD): BOOL; stdcall;
{$EXTERNALSYM InitiateSystemShutdownEx}

function RegSaveKeyExA(hKey: HKEY; lpFile: LPCSTR;
  lpSecurityAttributes: LPSECURITY_ATTRIBUTES; Flags: DWORD): LONG; stdcall;
{$EXTERNALSYM RegSaveKeyExA}
function RegSaveKeyExW(hKey: HKEY; lpFile: LPCWSTR;
  lpSecurityAttributes: LPSECURITY_ATTRIBUTES; Flags: DWORD): LONG; stdcall;
{$EXTERNALSYM RegSaveKeyExW}
function RegSaveKeyEx(hKey: HKEY; lpFile: LPCTSTR;
  lpSecurityAttributes: LPSECURITY_ATTRIBUTES; Flags: DWORD): LONG; stdcall;
{$EXTERNALSYM RegSaveKeyEx}

function Wow64Win32ApiEntry(dwFuncNumber, dwFlag, dwRes: DWORD): LONG; stdcall;
{$EXTERNALSYM Wow64Win32ApiEntry}

{$ENDIF JWA_IMPLEMENTATIONSECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
implementation
//uses ...
{$ENDIF JWA_OMIT_SECTIONS}


{$IFNDEF JWA_INTERFACESECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
const
  advapi32 = 'advapi32.dll';
  {$IFDEF UNICODE}
  AWSuffix = 'W';
  {$ELSE}
  AWSuffix = 'A';
  {$ENDIF UNICODE}
{$ENDIF JWA_OMIT_SECTIONS}

type
  TRegNotifyChangeKeyValue = function(hKey: HKEY; bWatchSubtree: LongBool; dwNotifyFilter: DWORD; hEvent: HANDLE; fAsynchronus: LongBool): LONG; stdcall;

var
  _RegNotifyChangeKeyValue: Pointer;

function RegNotifyChangeKeyValue(hKey: HKEY; bWatchSubtree: LongBool; dwNotifyFilter: DWORD; hEvent: HANDLE; fAsynchronus: LongBool): LONG;
begin
  GetProcedureAddress(_RegNotifyChangeKeyValue, advapi32, 'RegNotifyChangeKeyValue');
  if bWatchSubTree then
    Result := TRegNotifyChangeKeyValue(_RegNotifyChangeKeyValue)(hKey, LongBool(1), dwNotifyFilter, hEvent, fAsynchronus)
  else
    Result := TRegNotifyChangeKeyValue(_RegNotifyChangeKeyValue)(hKey, LongBool(0), dwNotifyFilter, hEvent, fAsynchronus);
end;

function RegCloseKey; external advapi32 name 'RegCloseKey' delayed;
function RegOverridePredefKey; external advapi32 name 'RegOverridePredefKey' delayed;
function RegOpenUserClassesRoot; external advapi32 name 'RegOpenUserClassesRoot' delayed;
function RegOpenCurrentUser; external advapi32 name 'RegOpenCurrentUser' delayed;
function RegDisablePredefinedCache; external advapi32 name 'RegDisablePredefinedCache' delayed;
function RegConnectRegistryA; external advapi32 name 'RegConnectRegistryA' delayed;
function RegConnectRegistryW; external advapi32 name 'RegConnectRegistryW' delayed;
function RegConnectRegistry; external advapi32 name 'RegConnectRegistry' + AWSuffix delayed;
function RegCreateKeyA; external advapi32 name 'RegCreateKeyA' delayed;
function RegCreateKeyW; external advapi32 name 'RegCreateKeyW' delayed;
function RegCreateKey; external advapi32 name 'RegCreateKey' + AWSuffix delayed;
function RegCreateKeyExA; external advapi32 name 'RegCreateKeyExA' delayed;
function RegCreateKeyExW; external advapi32 name 'RegCreateKeyExW' delayed;
function RegCreateKeyEx; external advapi32 name 'RegCreateKeyEx' + AWSuffix delayed;
function RegDeleteKeyA; external advapi32 name 'RegDeleteKeyA' delayed;
function RegDeleteKeyW; external advapi32 name 'RegDeleteKeyW' delayed;
function RegDeleteKey; external advapi32 name 'RegDeleteKey' + AWSuffix delayed;
function RegDeleteKeyExA; external advapi32 name 'RegDeleteKeyExA' delayed;
function RegDeleteKeyExW; external advapi32 name 'RegDeleteKeyExW' delayed;
function RegDeleteKeyEx; external advapi32 name 'RegDeleteKeyEx' + AWSuffix delayed;
function RegDeleteValueA; external advapi32 name 'RegDeleteValueA' delayed;
function RegDeleteValueW; external advapi32 name 'RegDeleteValueW' delayed;
function RegDeleteValue; external advapi32 name 'RegDeleteValue' + AWSuffix delayed;
function RegEnumKeyA; external advapi32 name 'RegEnumKeyA' delayed;
function RegEnumKeyW; external advapi32 name 'RegEnumKeyW' delayed;
function RegEnumKey; external advapi32 name 'RegEnumKey' + AWSuffix delayed;
function RegEnumKeyExA; external advapi32 name 'RegEnumKeyExA' delayed;
function RegEnumKeyExW; external advapi32 name 'RegEnumKeyExW' delayed;
function RegEnumKeyEx; external advapi32 name 'RegEnumKeyEx' + AWSuffix delayed;
function RegEnumValueA; external advapi32 name 'RegEnumValueA' delayed;
function RegEnumValueW; external advapi32 name 'RegEnumValueW' delayed;
function RegEnumValue; external advapi32 name 'RegEnumValue' + AWSuffix delayed;
function RegFlushKey; external advapi32 name 'RegFlushKey' delayed;
function RegGetKeySecurity; external advapi32 name 'RegGetKeySecurity' delayed;
function RegLoadKeyA; external advapi32 name 'RegLoadKeyA' delayed;
function RegLoadKeyW; external advapi32 name 'RegLoadKeyW' delayed;
function RegLoadKey; external advapi32 name 'RegLoadKey' + AWSuffix delayed;
function RegOpenKeyA; external advapi32 name 'RegOpenKeyA' delayed;
function RegOpenKeyW; external advapi32 name 'RegOpenKeyW' delayed;
function RegOpenKey; external advapi32 name 'RegOpenKey' + AWSuffix delayed;
function RegOpenKeyExA; external advapi32 name 'RegOpenKeyExA' delayed;
function RegOpenKeyExW; external advapi32 name 'RegOpenKeyExW' delayed;
function RegOpenKeyEx; external advapi32 name 'RegOpenKeyEx' + AWSuffix delayed;
function RegQueryInfoKeyA; external advapi32 name 'RegQueryInfoKeyA' delayed;
function RegQueryInfoKeyW; external advapi32 name 'RegQueryInfoKeyW' delayed;
function RegQueryInfoKey; external advapi32 name 'RegQueryInfoKey' + AWSuffix delayed;
function RegQueryValueA; external advapi32 name 'RegQueryValueA' delayed;
function RegQueryValueW; external advapi32 name 'RegQueryValueW' delayed;
function RegQueryValue; external advapi32 name 'RegQueryValue' + AWSuffix delayed;
function RegQueryMultipleValuesA; external advapi32 name 'RegQueryMultipleValuesA' delayed;
function RegQueryMultipleValuesW; external advapi32 name 'RegQueryMultipleValuesW' delayed;
function RegQueryMultipleValues; external advapi32 name 'RegQueryMultipleValues' + AWSuffix delayed;
function RegQueryValueExA; external advapi32 name 'RegQueryValueExA' delayed;
function RegQueryValueExW; external advapi32 name 'RegQueryValueExW' delayed;
function RegQueryValueEx; external advapi32 name 'RegQueryValueEx' + AWSuffix delayed;
function RegReplaceKeyA; external advapi32 name 'RegReplaceKeyA' delayed;
function RegReplaceKeyW; external advapi32 name 'RegReplaceKeyW' delayed;
function RegReplaceKey; external advapi32 name 'RegReplaceKey' + AWSuffix delayed;
function RegRestoreKeyA; external advapi32 name 'RegRestoreKeyA' delayed;
function RegRestoreKeyW; external advapi32 name 'RegRestoreKeyW' delayed;
function RegRestoreKey; external advapi32 name 'RegRestoreKey' + AWSuffix delayed;
function RegSaveKeyA; external advapi32 name 'RegSaveKeyA' delayed;
function RegSaveKeyW; external advapi32 name 'RegSaveKeyW' delayed;
function RegSaveKey; external advapi32 name 'RegSaveKey' + AWSuffix delayed;
function RegSetKeySecurity; external advapi32 name 'RegSetKeySecurity' delayed;
function RegSetValueA; external advapi32 name 'RegSetValueA' delayed;
function RegSetValueW; external advapi32 name 'RegSetValueW' delayed;
function RegSetValue; external advapi32 name 'RegSetValue' + AWSuffix delayed;
function RegSetValueExA; external advapi32 name 'RegSetValueExA' delayed;
function RegSetValueExW; external advapi32 name 'RegSetValueExW' delayed;
function RegSetValueEx; external advapi32 name 'RegSetValueEx' + AWSuffix delayed;
function RegUnLoadKeyA; external advapi32 name 'RegUnLoadKeyA' delayed;
function RegUnLoadKeyW; external advapi32 name 'RegUnLoadKeyW' delayed;
function RegUnLoadKey; external advapi32 name 'RegUnLoadKey' + AWSuffix delayed;
function InitiateSystemShutdownA; external advapi32 name 'InitiateSystemShutdownA' delayed;
function InitiateSystemShutdownW; external advapi32 name 'InitiateSystemShutdownW' delayed;
function InitiateSystemShutdown; external advapi32 name 'InitiateSystemShutdown' + AWSuffix delayed;
function AbortSystemShutdownA; external advapi32 name 'AbortSystemShutdownA' delayed;
function AbortSystemShutdownW; external advapi32 name 'AbortSystemShutdownW' delayed;
function AbortSystemShutdown; external advapi32 name 'AbortSystemShutdown' + AWSuffix delayed;
function InitiateSystemShutdownExA; external advapi32 name 'InitiateSystemShutdownExA' delayed;
function InitiateSystemShutdownExW; external advapi32 name 'InitiateSystemShutdownExW' delayed;
function InitiateSystemShutdownEx; external advapi32 name 'InitiateSystemShutdownEx' + AWSuffix delayed;
function RegSaveKeyExA; external advapi32 name 'RegSaveKeyExA' delayed;
function RegSaveKeyExW; external advapi32 name 'RegSaveKeyExW' delayed;
function RegSaveKeyEx; external advapi32 name 'RegSaveKeyEx' + AWSuffix delayed;
function Wow64Win32ApiEntry; external advapi32 name 'Wow64Win32ApiEntry' delayed;



{$ENDIF JWA_INTERFACESECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
end.
{$ENDIF JWA_OMIT_SECTIONS}
