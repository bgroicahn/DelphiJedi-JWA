{******************************************************************************}
{                                                                              }
{ RPC NSI API interface Unit for Object Pascal                                 }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2001 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The original file is: rpcnsi.h, released June 2000. The original Pascal      }
{ code is: RpcNsi.pas, released December 2000. The initial developer of the    }
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

// $Id: JwaRpcNsi.pas,v 1.12 2007/09/05 11:58:52 dezipaitor Exp $
{$IFNDEF JWA_OMIT_SECTIONS}
unit JwaRpcNsi;

{$WEAKPACKAGEUNIT}
{$ENDIF JWA_OMIT_SECTIONS}

{$HPPEMIT ''}
{$HPPEMIT '#include "RpcNsi.h"'}
{$HPPEMIT ''}

{$IFNDEF JWA_OMIT_SECTIONS}
{$I ..\Includes\JediAPILib.inc}

interface

uses
  JwaWinType, JwaRpc, JwaRpcDce;
{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_IMPLEMENTATIONSECTION}

type
  RPC_NS_HANDLE = Pointer;
  {$EXTERNALSYM RPC_NS_HANDLE}

const
  RPC_C_NS_SYNTAX_DEFAULT = 0;
  {$EXTERNALSYM RPC_C_NS_SYNTAX_DEFAULT}
  RPC_C_NS_SYNTAX_DCE = 3;
  {$EXTERNALSYM RPC_C_NS_SYNTAX_DCE}

  RPC_C_PROFILE_DEFAULT_ELT = 0;
  {$EXTERNALSYM RPC_C_PROFILE_DEFAULT_ELT}
  RPC_C_PROFILE_ALL_ELT = 1;
  {$EXTERNALSYM RPC_C_PROFILE_ALL_ELT}
  RPC_C_PROFILE_ALL_ELTS = RPC_C_PROFILE_ALL_ELT;
  {$EXTERNALSYM RPC_C_PROFILE_ALL_ELTS}
  RPC_C_PROFILE_MATCH_BY_IF = 2;
  {$EXTERNALSYM RPC_C_PROFILE_MATCH_BY_IF}
  RPC_C_PROFILE_MATCH_BY_MBR = 3;
  {$EXTERNALSYM RPC_C_PROFILE_MATCH_BY_MBR}
  RPC_C_PROFILE_MATCH_BY_BOTH = 4;
  {$EXTERNALSYM RPC_C_PROFILE_MATCH_BY_BOTH}

  RPC_C_NS_DEFAULT_EXP_AGE = -1;
  {$EXTERNALSYM RPC_C_NS_DEFAULT_EXP_AGE}

// Server APIs

function RpcNsBindingExportA(EntryNameSyntax: Longword; EntryName: PAnsiChar;
  IfSpec: RPC_IF_HANDLE; BindingVec: PRPC_BINDING_VECTOR;
  ObjectUuidVec: PUUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingExportA}
function RpcNsBindingExportW(EntryNameSyntax: Longword; EntryName: PWideChar;
  IfSpec: RPC_IF_HANDLE; BindingVec: PRPC_BINDING_VECTOR;
  ObjectUuidVec: PUUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingExportW}
function RpcNsBindingExport(EntryNameSyntax: Longword; EntryName: PTSTR;
  IfSpec: RPC_IF_HANDLE; BindingVec: PRPC_BINDING_VECTOR;
  ObjectUuidVec: PUUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingExport}

function RpcNsBindingUnexportA(EntryNameSyntax: Longword; EntryName: PAnsiChar;
  IfSpec: RPC_IF_HANDLE; ObjectUuidVec: PUUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingUnexportA}
function RpcNsBindingUnexportW(EntryNameSyntax: Longword; EntryName: PWideChar;
  IfSpec: RPC_IF_HANDLE; ObjectUuidVec: PUUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingUnexportW}
function RpcNsBindingUnexport(EntryNameSyntax: Longword; EntryName: PTSTR;
  IfSpec: RPC_IF_HANDLE; ObjectUuidVec: PUUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingUnexport}

// Server PnP APIs

function RpcNsBindingExportPnPA(EntryNameSyntax: Longword; EntryName: PAnsiChar;
  IfSpec: RPC_IF_HANDLE; ObjectVector: PUUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingExportPnPA}
function RpcNsBindingExportPnPW(EntryNameSyntax: Longword; EntryName: PWideChar;
  IfSpec: RPC_IF_HANDLE; ObjectVector: PUUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingExportPnPW}
function RpcNsBindingExportPnP(EntryNameSyntax: Longword; EntryName: PTSTR;
  IfSpec: RPC_IF_HANDLE; ObjectVector: PUUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingExportPnP}

function RpcNsBindingUnexportPnPA(EntryNameSyntax: Longword; EntryName: PAnsiChar;
  IfSpec: RPC_IF_HANDLE; ObjectVector: PUUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingUnexportPnPA}
function RpcNsBindingUnexportPnPW(EntryNameSyntax: Longword; EntryName: PWideChar;
  IfSpec: RPC_IF_HANDLE; ObjectVector: PUUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingUnexportPnPW}
function RpcNsBindingUnexportPnP(EntryNameSyntax: Longword; EntryName: PTSTR;
  IfSpec: RPC_IF_HANDLE; ObjectVector: PUUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingUnexportPnP}

// Client APIs

function RpcNsBindingLookupBeginA(EntryNameSyntax: Longword; EntryName: PAnsiChar;
  IfSpec: RPC_IF_HANDLE; ObjUuid: PUUID; BindingMaxCount: Longword;
  var LookupContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingLookupBeginA}
function RpcNsBindingLookupBeginW(EntryNameSyntax: Longword; EntryName: PWideChar;
  IfSpec: RPC_IF_HANDLE; ObjUuid: PUUID; BindingMaxCount: Longword;
  var LookupContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingLookupBeginW}
function RpcNsBindingLookupBegin(EntryNameSyntax: Longword; EntryName: PTSTR;
  IfSpec: RPC_IF_HANDLE; ObjUuid: PUUID; BindingMaxCount: Longword;
  var LookupContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingLookupBegin}

function RpcNsBindingLookupNext(LookupContext: RPC_NS_HANDLE;
  var BindingVec: PRPC_BINDING_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingLookupNext}

function RpcNsBindingLookupDone(var LookupContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingLookupDone}

// Group APIs

function RpcNsGroupDeleteA(GroupNameSyntax: Longword; GroupName: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupDeleteA}
function RpcNsGroupDeleteW(GroupNameSyntax: Longword; GroupName: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupDeleteW}
function RpcNsGroupDelete(GroupNameSyntax: Longword; GroupName: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupDelete}

function RpcNsGroupMbrAddA(GroupNameSyntax: Longword; GroupName: PAnsiChar;
  MemberNameSyntax: Longword; MemberName: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupMbrAddA}
function RpcNsGroupMbrAddW(GroupNameSyntax: Longword; GroupName: PWideChar;
  MemberNameSyntax: Longword; MemberName: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupMbrAddW}
function RpcNsGroupMbrAdd(GroupNameSyntax: Longword; GroupName: PTSTR;
  MemberNameSyntax: Longword; MemberName: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupMbrAdd}

function RpcNsGroupMbrRemoveA(GroupNameSyntax: Longword; GroupName: PAnsiChar;
  MemberNameSyntax: Longword; MemberName: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupMbrRemoveA}
function RpcNsGroupMbrRemoveW(GroupNameSyntax: Longword; GroupName: PWideChar;
  MemberNameSyntax: Longword; MemberName: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupMbrRemoveW}
function RpcNsGroupMbrRemove(GroupNameSyntax: Longword; GroupName: PTSTR;
  MemberNameSyntax: Longword; MemberName: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupMbrRemove}

function RpcNsGroupMbrInqBeginA(GroupNameSyntax: Longword; GroupName: PAnsiChar;
  MemberNameSyntax: Longword; var InquiryContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupMbrInqBeginA}
function RpcNsGroupMbrInqBeginW(GroupNameSyntax: Longword; GroupName: PWideChar;
  MemberNameSyntax: Longword; var InquiryContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupMbrInqBeginW}
function RpcNsGroupMbrInqBegin(GroupNameSyntax: Longword; GroupName: PTSTR;
  MemberNameSyntax: Longword; var InquiryContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupMbrInqBegin}

function RpcNsGroupMbrInqNextA(InquiryContext: RPC_NS_HANDLE; MemberName: PPAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupMbrInqNextA}
function RpcNsGroupMbrInqNextW(InquiryContext: RPC_NS_HANDLE; MemberName: PPWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupMbrInqNextW}
function RpcNsGroupMbrInqNext(InquiryContext: RPC_NS_HANDLE; MemberName: PPTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupMbrInqNext}

function RpcNsGroupMbrInqDone(var InquiryContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsGroupMbrInqDone}

// Profile APIs

function RpcNsProfileDeleteA(ProfileNameSyntax: Longword; ProfileName: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileDeleteA}
function RpcNsProfileDeleteW(ProfileNameSyntax: Longword; ProfileName: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileDeleteW}
function RpcNsProfileDelete(ProfileNameSyntax: Longword; ProfileName: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileDelete}

function RpcNsProfileEltAddA(ProfileNameSyntax: Longword; ProfileName: PAnsiChar;
  IfId: PRPC_IF_ID; MemberNameSyntax: Longword; MemberName: PAnsiChar;
  Priority: Longword; Annotation: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileEltAddA}
function RpcNsProfileEltAddW(ProfileNameSyntax: Longword; ProfileName: PWideChar;
  IfId: PRPC_IF_ID; MemberNameSyntax: Longword; MemberName: PWideChar;
  Priority: Longword; Annotation: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileEltAddW}
function RpcNsProfileEltAdd(ProfileNameSyntax: Longword; ProfileName: PTSTR;
  IfId: PRPC_IF_ID; MemberNameSyntax: Longword; MemberName: PTSTR;
  Priority: Longword; Annotation: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileEltAdd}

function RpcNsProfileEltRemoveA(ProfileNameSyntax: Longword; ProfileName: PAnsiChar;
  IfId: PRPC_IF_ID; MemberNameSyntax: Longword; MemberName: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileEltRemoveA}
function RpcNsProfileEltRemoveW(ProfileNameSyntax: Longword; ProfileName: PWideChar;
  IfId: PRPC_IF_ID; MemberNameSyntax: Longword; MemberName: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileEltRemoveW}
function RpcNsProfileEltRemove(ProfileNameSyntax: Longword; ProfileName: PTSTR;
  IfId: PRPC_IF_ID; MemberNameSyntax: Longword; MemberName: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileEltRemove}

function RpcNsProfileEltInqBeginA(ProfileNameSyntax: Longword; ProfileName: PAnsiChar;
  InquiryType: Longword; IfId: PRPC_IF_ID; VersOption, MemberNameSyntax: Longword;
  MemberName: PAnsiChar; var InquiryContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileEltInqBeginA}
function RpcNsProfileEltInqBeginW(ProfileNameSyntax: Longword; ProfileName: PWideChar;
  InquiryType: Longword; IfId: PRPC_IF_ID; VersOption, MemberNameSyntax: Longword;
  MemberName: PWideChar; var InquiryContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileEltInqBeginW}
function RpcNsProfileEltInqBegin(ProfileNameSyntax: Longword; ProfileName: PTSTR;
  InquiryType: Longword; IfId: PRPC_IF_ID; VersOption, MemberNameSyntax: Longword;
  MemberName: PTSTR; var InquiryContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileEltInqBegin}

function RpcNsProfileEltInqNextA(InquiryContext: RPC_NS_HANDLE; var IfId: RPC_IF_ID;
  MemberName: PPAnsiChar; var Priority: Longword; Annotation: PPAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileEltInqNextA}
function RpcNsProfileEltInqNextW(InquiryContext: RPC_NS_HANDLE; var IfId: RPC_IF_ID;
  MemberName: PPWideChar; var Priority: Longword; Annotation: PPWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileEltInqNextW}
function RpcNsProfileEltInqNext(InquiryContext: RPC_NS_HANDLE; var IfId: RPC_IF_ID;
  MemberName: PPTSTR; var Priority: Longword; Annotation: PPTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileEltInqNext}

function RpcNsProfileEltInqDone(var InquiryContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsProfileEltInqDone}

// Entry object APIs

function RpcNsEntryObjectInqBeginA(EntryNameSyntax: Longword; EntryName: PAnsiChar;
  var InquiryContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsEntryObjectInqBeginA}
function RpcNsEntryObjectInqBeginW(EntryNameSyntax: Longword; EntryName: PWideChar;
  var InquiryContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsEntryObjectInqBeginW}
function RpcNsEntryObjectInqBegin(EntryNameSyntax: Longword; EntryName: PTSTR;
  var InquiryContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsEntryObjectInqBegin}

function RpcNsEntryObjectInqNext(InquiryContext: RPC_NS_HANDLE; ObjUuid: PUUID): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsEntryObjectInqNext}

function RpcNsEntryObjectInqDone(var InquiryContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsEntryObjectInqDone}

// Management and MISC APIs

function RpcNsEntryExpandNameA(EntryNameSyntax: Longword; EntryName: PAnsiChar;
  var ExpandedName: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsEntryExpandNameA}
function RpcNsEntryExpandNameW(EntryNameSyntax: Longword; EntryName: PWideChar;
  var ExpandedName: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsEntryExpandNameW}
function RpcNsEntryExpandName(EntryNameSyntax: Longword; EntryName: PTSTR;
  var ExpandedName: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsEntryExpandName}

function RpcNsMgmtBindingUnexportA(EntryNameSyntax: Longword; EntryName: PAnsiChar;
  IfId: PRPC_IF_ID; VersOption: Longword; ObjectUuidVec: PUUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsMgmtBindingUnexportA}
function RpcNsMgmtBindingUnexportW(EntryNameSyntax: Longword; EntryName: PWideChar;
  IfId: PRPC_IF_ID; VersOption: Longword; ObjectUuidVec: PUUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsMgmtBindingUnexportW}
function RpcNsMgmtBindingUnexport(EntryNameSyntax: Longword; EntryName: PTSTR;
  IfId: PRPC_IF_ID; VersOption: Longword; ObjectUuidVec: PUUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsMgmtBindingUnexport}

function RpcNsMgmtEntryCreateA(EntryNameSyntax: Longword; EntryName: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsMgmtEntryCreateA}
function RpcNsMgmtEntryCreateW(EntryNameSyntax: Longword; EntryName: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsMgmtEntryCreateW}
function RpcNsMgmtEntryCreate(EntryNameSyntax: Longword; EntryName: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsMgmtEntryCreate}

function RpcNsMgmtEntryDeleteA(EntryNameSyntax: Longword; EntryName: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsMgmtEntryDeleteA}
function RpcNsMgmtEntryDeleteW(EntryNameSyntax: Longword; EntryName: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsMgmtEntryDeleteW}
function RpcNsMgmtEntryDelete(EntryNameSyntax: Longword; EntryName: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsMgmtEntryDelete}

function RpcNsMgmtEntryInqIfIdsA(EntryNameSyntax: Longword; EntryName: PAnsiChar;
  var IfIdVec: PRPC_IF_ID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsMgmtEntryInqIfIdsA}
function RpcNsMgmtEntryInqIfIdsW(EntryNameSyntax: Longword; EntryName: PWideChar;
  var IfIdVec: PRPC_IF_ID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsMgmtEntryInqIfIdsW}
function RpcNsMgmtEntryInqIfIds(EntryNameSyntax: Longword; EntryName: PTSTR;
  var IfIdVec: PRPC_IF_ID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsMgmtEntryInqIfIds}

function RpcNsMgmtHandleSetExpAge(NsHandle: RPC_NS_HANDLE;
  ExpirationAge: Longword): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsMgmtHandleSetExpAge}

function RpcNsMgmtInqExpAge(var ExpirationAge: Longword): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsMgmtInqExpAge}

function RpcNsMgmtSetExpAge(ExpirationAge: Longword): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsMgmtSetExpAge}

// Client API's implemented in wrappers.

function RpcNsBindingImportBeginA(EntryNameSyntax: Longword; EntryName: PAnsiChar;
  IfSpec: RPC_IF_HANDLE; ObjUuid: PUUID; var ImportContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingImportBeginA}
function RpcNsBindingImportBeginW(EntryNameSyntax: Longword; EntryName: PWideChar;
  IfSpec: RPC_IF_HANDLE; ObjUuid: PUUID; var ImportContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingImportBeginW}
function RpcNsBindingImportBegin(EntryNameSyntax: Longword; EntryName: PTSTR;
  IfSpec: RPC_IF_HANDLE; ObjUuid: PUUID; var ImportContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingImportBegin}

function RpcNsBindingImportNext(ImportContext: RPC_NS_HANDLE;
  var Binding: RPC_BINDING_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingImportNext}

function RpcNsBindingImportDone(var ImportContext: RPC_NS_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingImportDone}

function RpcNsBindingSelect(BindingVec: PRPC_BINDING_VECTOR; var Binding: RPC_BINDING_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingSelect}

{$ENDIF JWA_IMPLEMENTATIONSECTION}



{$IFNDEF JWA_OMIT_SECTIONS}
implementation
//uses ...
{$ENDIF JWA_OMIT_SECTIONS}



{$IFNDEF JWA_INTERFACESECTION}

{$IFNDEF JWA_INCLUDEMODE}
const
  rpcns4 = 'rpcns4.dll';
  {$IFDEF UNICODE}
  AWSuffix = 'W';
  {$ELSE}
  AWSuffix = 'A';
  {$ENDIF UNICODE}
{$ENDIF JWA_INCLUDEMODE}


function RpcNsBindingExportA; external rpcns4 name 'RpcNsBindingExportA' delayed;
function RpcNsBindingExportW; external rpcns4 name 'RpcNsBindingExportW' delayed;
function RpcNsBindingExport; external rpcns4 name 'RpcNsBindingExport' + AWSuffix delayed;
function RpcNsBindingUnexportA; external rpcns4 name 'RpcNsBindingUnexportA' delayed;
function RpcNsBindingUnexportW; external rpcns4 name 'RpcNsBindingUnexportW' delayed;
function RpcNsBindingUnexport; external rpcns4 name 'RpcNsBindingUnexport' + AWSuffix delayed;
function RpcNsBindingExportPnPA; external rpcns4 name 'RpcNsBindingExportPnPA' delayed;
function RpcNsBindingExportPnPW; external rpcns4 name 'RpcNsBindingExportPnPW' delayed;
function RpcNsBindingExportPnP; external rpcns4 name 'RpcNsBindingExportPnP' + AWSuffix delayed;
function RpcNsBindingUnexportPnPA; external rpcns4 name 'RpcNsBindingUnexportPnPA' delayed;
function RpcNsBindingUnexportPnPW; external rpcns4 name 'RpcNsBindingUnexportPnPW' delayed;
function RpcNsBindingUnexportPnP; external rpcns4 name 'RpcNsBindingUnexportPnP' + AWSuffix delayed;
function RpcNsBindingLookupBeginA; external rpcns4 name 'RpcNsBindingLookupBeginA' delayed;
function RpcNsBindingLookupBeginW; external rpcns4 name 'RpcNsBindingLookupBeginW' delayed;
function RpcNsBindingLookupBegin; external rpcns4 name 'RpcNsBindingLookupBegin' + AWSuffix delayed;
function RpcNsBindingLookupNext; external rpcns4 name 'RpcNsBindingLookupNext' delayed;
function RpcNsBindingLookupDone; external rpcns4 name 'RpcNsBindingLookupDone' delayed;
function RpcNsGroupDeleteA; external rpcns4 name 'RpcNsGroupDeleteA' delayed;
function RpcNsGroupDeleteW; external rpcns4 name 'RpcNsGroupDeleteW' delayed;
function RpcNsGroupDelete; external rpcns4 name 'RpcNsGroupDelete' + AWSuffix delayed;
function RpcNsGroupMbrAddA; external rpcns4 name 'RpcNsGroupMbrAddA' delayed;
function RpcNsGroupMbrAddW; external rpcns4 name 'RpcNsGroupMbrAddW' delayed;
function RpcNsGroupMbrAdd; external rpcns4 name 'RpcNsGroupMbrAdd' + AWSuffix delayed;
function RpcNsGroupMbrRemoveA; external rpcns4 name 'RpcNsGroupMbrRemoveA' delayed;
function RpcNsGroupMbrRemoveW; external rpcns4 name 'RpcNsGroupMbrRemoveW' delayed;
function RpcNsGroupMbrRemove; external rpcns4 name 'RpcNsGroupMbrRemove' + AWSuffix delayed;
function RpcNsGroupMbrInqBeginA; external rpcns4 name 'RpcNsGroupMbrInqBeginA' delayed;
function RpcNsGroupMbrInqBeginW; external rpcns4 name 'RpcNsGroupMbrInqBeginW' delayed;
function RpcNsGroupMbrInqBegin; external rpcns4 name 'RpcNsGroupMbrInqBegin' + AWSuffix delayed;
function RpcNsGroupMbrInqNextA; external rpcns4 name 'RpcNsGroupMbrInqNextA' delayed;
function RpcNsGroupMbrInqNextW; external rpcns4 name 'RpcNsGroupMbrInqNextW' delayed;
function RpcNsGroupMbrInqNext; external rpcns4 name 'RpcNsGroupMbrInqNext' + AWSuffix delayed;
function RpcNsGroupMbrInqDone; external rpcns4 name 'RpcNsGroupMbrInqDone' delayed;
function RpcNsProfileDeleteA; external rpcns4 name 'RpcNsProfileDeleteA' delayed;
function RpcNsProfileDeleteW; external rpcns4 name 'RpcNsProfileDeleteW' delayed;
function RpcNsProfileDelete; external rpcns4 name 'RpcNsProfileDelete' + AWSuffix delayed;
function RpcNsProfileEltAddA; external rpcns4 name 'RpcNsProfileEltAddA' delayed;
function RpcNsProfileEltAddW; external rpcns4 name 'RpcNsProfileEltAddW' delayed;
function RpcNsProfileEltAdd; external rpcns4 name 'RpcNsProfileEltAdd' + AWSuffix delayed;
function RpcNsProfileEltRemoveA; external rpcns4 name 'RpcNsProfileEltRemoveA' delayed;
function RpcNsProfileEltRemoveW; external rpcns4 name 'RpcNsProfileEltRemoveW' delayed;
function RpcNsProfileEltRemove; external rpcns4 name 'RpcNsProfileEltRemove' + AWSuffix delayed;
function RpcNsProfileEltInqBeginA; external rpcns4 name 'RpcNsProfileEltInqBeginA' delayed;
function RpcNsProfileEltInqBeginW; external rpcns4 name 'RpcNsProfileEltInqBeginW' delayed;
function RpcNsProfileEltInqBegin; external rpcns4 name 'RpcNsProfileEltInqBegin' + AWSuffix delayed;
function RpcNsProfileEltInqNextA; external rpcns4 name 'RpcNsProfileEltInqNextA' delayed;
function RpcNsProfileEltInqNextW; external rpcns4 name 'RpcNsProfileEltInqNextW' delayed;
function RpcNsProfileEltInqNext; external rpcns4 name 'RpcNsProfileEltInqNext' + AWSuffix delayed;
function RpcNsProfileEltInqDone; external rpcns4 name 'RpcNsProfileEltInqDone' delayed;
function RpcNsEntryObjectInqBeginA; external rpcns4 name 'RpcNsEntryObjectInqBeginA' delayed;
function RpcNsEntryObjectInqBeginW; external rpcns4 name 'RpcNsEntryObjectInqBeginW' delayed;
function RpcNsEntryObjectInqBegin; external rpcns4 name 'RpcNsEntryObjectInqBegin' + AWSuffix delayed;
function RpcNsEntryObjectInqNext; external rpcns4 name 'RpcNsEntryObjectInqNext' delayed;
function RpcNsEntryObjectInqDone; external rpcns4 name 'RpcNsEntryObjectInqDone' delayed;
function RpcNsEntryExpandNameA; external rpcns4 name 'RpcNsEntryExpandNameA' delayed;
function RpcNsEntryExpandNameW; external rpcns4 name 'RpcNsEntryExpandNameW' delayed;
function RpcNsEntryExpandName; external rpcns4 name 'RpcNsEntryExpandName' + AWSuffix delayed;
function RpcNsMgmtBindingUnexportA; external rpcns4 name 'RpcNsMgmtBindingUnexportA' delayed;
function RpcNsMgmtBindingUnexportW; external rpcns4 name 'RpcNsMgmtBindingUnexportW' delayed;
function RpcNsMgmtBindingUnexport; external rpcns4 name 'RpcNsMgmtBindingUnexport' + AWSuffix delayed;
function RpcNsMgmtEntryCreateA; external rpcns4 name 'RpcNsMgmtEntryCreateA' delayed;
function RpcNsMgmtEntryCreateW; external rpcns4 name 'RpcNsMgmtEntryCreateW' delayed;
function RpcNsMgmtEntryCreate; external rpcns4 name 'RpcNsMgmtEntryCreate' + AWSuffix delayed;
function RpcNsMgmtEntryDeleteA; external rpcns4 name 'RpcNsMgmtEntryDeleteA' delayed;
function RpcNsMgmtEntryDeleteW; external rpcns4 name 'RpcNsMgmtEntryDeleteW' delayed;
function RpcNsMgmtEntryDelete; external rpcns4 name 'RpcNsMgmtEntryDelete' + AWSuffix delayed;
function RpcNsMgmtEntryInqIfIdsA; external rpcns4 name 'RpcNsMgmtEntryInqIfIdsA' delayed;
function RpcNsMgmtEntryInqIfIdsW; external rpcns4 name 'RpcNsMgmtEntryInqIfIdsW' delayed;
function RpcNsMgmtEntryInqIfIds; external rpcns4 name 'RpcNsMgmtEntryInqIfIds' + AWSuffix delayed;
function RpcNsMgmtHandleSetExpAge; external rpcns4 name 'RpcNsMgmtHandleSetExpAge' delayed;
function RpcNsMgmtInqExpAge; external rpcns4 name 'RpcNsMgmtInqExpAge' delayed;
function RpcNsMgmtSetExpAge; external rpcns4 name 'RpcNsMgmtSetExpAge' delayed;
function RpcNsBindingImportBeginA; external rpcns4 name 'RpcNsBindingImportBeginA' delayed;
function RpcNsBindingImportBeginW; external rpcns4 name 'RpcNsBindingImportBeginW' delayed;
function RpcNsBindingImportBegin; external rpcns4 name 'RpcNsBindingImportBegin' + AWSuffix delayed;
function RpcNsBindingImportNext; external rpcns4 name 'RpcNsBindingImportNext' delayed;
function RpcNsBindingImportDone; external rpcns4 name 'RpcNsBindingImportDone' delayed;
function RpcNsBindingSelect; external rpcns4 name 'RpcNsBindingSelect' delayed;


{$ENDIF JWA_INTERFACESECTION}



{$IFNDEF JWA_OMIT_SECTIONS}
end.
{$ENDIF JWA_OMIT_SECTIONS}
