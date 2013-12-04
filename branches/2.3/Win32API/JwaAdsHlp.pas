{******************************************************************************}
{                                                                              }
{ Active Directory Helper Functions API interface Unit for Object Pascal       }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2001 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The original file is: adshlp.h, released June 2000. The original Pascal      }
{ code is: AdsHlp.pas, released December 2000. The initial developer of the    }
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

// $Id: JwaAdsHlp.pas,v 1.12 2007/09/06 14:57:10 marquardt Exp $

{$IFNDEF JWA_OMIT_SECTIONS}
unit JwaAdsHlp;

{$WEAKPACKAGEUNIT}
{$ENDIF JWA_OMIT_SECTIONS}

{$HPPEMIT ''}
{$HPPEMIT '#include "adshlp.h"'}
{$HPPEMIT ''}

{$IFNDEF JWA_OMIT_SECTIONS}
{$I ..\Includes\JediAPILib.inc}

interface

uses
  JwaActiveX, JwaAdsTLB, JwaWinType, JwaWinNT;

{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_IMPLEMENTATIONSECTION}

{$IFNDEF JWA_INCLUDEMODE}

function ADsGetObject(lpszPathName: LPCWSTR; const riid: TGUID; out ppObject: Pointer): HRESULT; stdcall;
{$EXTERNALSYM ADsGetObject}

function ADsBuildEnumerator(pADsContainer: IADsContainer; out ppEnumVariant: IEnumVARIANT): HRESULT; stdcall;
{$EXTERNALSYM ADsBuildEnumerator}

function ADsFreeEnumerator(pEnumVariant: IEnumVARIANT): HRESULT; stdcall;
{$EXTERNALSYM ADsFreeEnumerator}

function ADsEnumerateNext(pEnumVariant: IEnumVARIANT; cElements: ULONG;
  var pvar: OleVariant; var pcElementsFetched: ULONG): HRESULT; stdcall;
{$EXTERNALSYM ADsEnumerateNext}

function ADsBuildVarArrayStr(lppPathNames: LPWSTR; dwPathNames: DWORD;
  var pVar: OleVariant): HRESULT; stdcall;
{$EXTERNALSYM ADsBuildVarArrayStr}

function ADsBuildVarArrayInt(lpdwObjectTypes: LPDWORD; dwObjectTypes: DWORD;
  var pVar: OleVariant): HRESULT; stdcall;
{$EXTERNALSYM ADsBuildVarArrayInt}

function ADsOpenObject(lpszPathName, lpszUserName, lpszPassword: LPCWSTR;
  dwReserved: DWORD; const riid: TGUID; out ppObject: Pointer): HRESULT; stdcall;
{$EXTERNALSYM ADsOpenObject}

//
// Helper functions for extended error support
//

function ADsGetLastError(var lpError: DWORD; lpErrorBuf: LPWSTR;
  dwErrorBufLen: DWORD; lpNameBuf: LPWSTR; dwNameBufLen: DWORD): HRESULT; stdcall;
{$EXTERNALSYM ADsGetLastError}

procedure ADsSetLastError(dwErr: DWORD; pszError, pszProvider: LPCWSTR); stdcall;
{$EXTERNALSYM ADsSetLastError}

//procedure ADsFreeAllErrorRecords; stdcall;
//{$EXTERNALSYM ADsFreeAllErrorRecords}

function AllocADsMem(cb: DWORD): LPVOID; stdcall;
{$EXTERNALSYM AllocADsMem}

function FreeADsMem(pMem: LPVOID): BOOL; stdcall;
{$EXTERNALSYM FreeADsMem}

function ReallocADsMem(pOldMem: LPVOID; cbOld, cbNew: DWORD): LPVOID; stdcall;
{$EXTERNALSYM ReallocADsMem}

function AllocADsStr(pStr: LPCWSTR): LPWSTR; stdcall;
{$EXTERNALSYM AllocADsStr}

function FreeADsStr(pStr: LPWSTR): BOOL; stdcall;
{$EXTERNALSYM FreeADsStr}

function ReallocADsStr(var ppStr: LPWSTR; pStr: LPWSTR): BOOL; stdcall;
{$EXTERNALSYM ReallocADsStr}

function ADsEncodeBinaryData(pbSrcData: PBYTE; dwSrcLen: DWORD;
  var ppszDestData: LPWSTR): HRESULT; stdcall;
{$EXTERNALSYM ADsEncodeBinaryData}

function ADsDecodeBinaryData(szSrcData: LPCWSTR; var ppbDestData: PBYTE;
  var pdwDestLen: ULONG): HRESULT; stdcall;
{$EXTERNALSYM ADsDecodeBinaryData}

type
  // imports of a type library sometimes are missing a few decls, these are just
  // a few of them to make this file compile at all. I really should do all of
  // them one day.

  PADSVALUE = ^_adsvalue;
  {$EXTERNALSYM PADSVALUE}
  PADS_ATTR_INFO = ^_ads_attr_info;
  {$EXTERNALSYM PADS_ATTR_INFO}

function PropVariantToAdsType(var pVariant: OleVariant; dwNumVariant: DWORD;
  var ppAdsValues: PADSVALUE; pdwNumValues: PDWORD): HRESULT; stdcall;
{$EXTERNALSYM PropVariantToAdsType}


function AdsTypeToPropVariant(pAdsValues: PADSVALUE; dwNumValues: DWORD;
  var pVariant: OleVariant): HRESULT; stdcall;
{$EXTERNALSYM AdsTypeToPropVariant}

procedure AdsFreeAdsValues(pAdsValues: PADSVALUE; dwNumValues: DWORD); stdcall;
{$EXTERNALSYM AdsFreeAdsValues}

//
// Helper routines to convert IADsSecurityDescriptor to a binary
// security descriptor and also to convert a binary SD to 
// IADsSecurityDescriptor.
//

// TODO VARIANT!

function BinarySDToSecurityDescriptor(pSecurityDescriptor: PSECURITY_DESCRIPTOR;
  var pVarsec: VARIANT; pszServerName, userName, passWord: LPCWSTR; dwFlags: DWORD): HRESULT; stdcall;
{$EXTERNALSYM BinarySDToSecurityDescriptor}

{$ENDIF JWA_INCLUDEMODE}

function SecurityDescriptorToBinarySD(vVarSecDes: VARIANT;
  var ppSecurityDescriptor: PSECURITY_DESCRIPTOR; pdwSDLength: PDWORD;
  pszServerName, userName, passWord: LPCWSTR; dwFlags: DWORD): HRESULT; stdcall;
{$EXTERNALSYM SecurityDescriptorToBinarySD}

{$ENDIF JWA_IMPLEMENTATIONSECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
implementation
//uses ...
{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_INTERFACESECTION}

{$IFNDEF JWA_INCLUDEMODE}
const
  adslib = 'activeds.dll';
{$ENDIF JWA_INCLUDEMODE}

//procedure ADsFreeAllErrorRecords


{$IFNDEF JWA_INCLUDEMODE}
function ADsGetObject; external adslib name 'ADsGetObject' delayed;
function ADsBuildEnumerator; external adslib name 'ADsBuildEnumerator' delayed;
function ADsFreeEnumerator; external adslib name 'ADsFreeEnumerator' delayed;
function ADsEnumerateNext; external adslib name 'ADsEnumerateNext' delayed;
function ADsBuildVarArrayStr; external adslib name 'ADsBuildVarArrayStr' delayed;
function ADsBuildVarArrayInt; external adslib name 'ADsBuildVarArrayInt' delayed;
function ADsOpenObject; external adslib name 'ADsOpenObject' delayed;
function ADsGetLastError; external adslib name 'ADsGetLastError' delayed;
procedure ADsSetLastError; external adslib name 'ADsSetLastError' delayed;
function AllocADsMem; external adslib name 'AllocADsMem' delayed;
function FreeADsMem; external adslib name 'FreeADsMem' delayed;
function ReallocADsMem; external adslib name 'ReallocADsMem' delayed;
function AllocADsStr; external adslib name 'AllocADsStr' delayed;
function FreeADsStr; external adslib name 'FreeADsStr' delayed;
function ReallocADsStr; external adslib name 'ReallocADsStr' delayed;
function ADsEncodeBinaryData; external adslib name 'ADsEncodeBinaryData' delayed;
function ADsDecodeBinaryData; external adslib name 'ADsDecodeBinaryData' delayed;
function PropVariantToAdsType; external adslib name 'PropVariantToAdsType' delayed;
function AdsTypeToPropVariant; external adslib name 'AdsTypeToPropVariant' delayed;
procedure AdsFreeAdsValues; external adslib name 'AdsFreeAdsValues' delayed;
function BinarySDToSecurityDescriptor; external adslib name 'BinarySDToSecurityDescriptor' delayed;
{$ENDIF JWA_INCLUDEMODE}

function SecurityDescriptorToBinarySD; external adslib name 'SecurityDescriptorToBinarySD';


{$ENDIF JWA_INTERFACESECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
end.
{$ENDIF JWA_OMIT_SECTIONS}
