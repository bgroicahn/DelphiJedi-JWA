{******************************************************************************}
{                                                                              }
{ RPC DCE API interface Unit for Object Pascal                                 }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2001 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The original file is: rpcdce.h, released June 2000. The original Pascal      }
{ code is: Rpcce.pas, released December 2000. The initial developer of the     }
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

// $Id: JwaRpcDce.pas,v 1.14 2007/09/14 06:48:47 marquardt Exp $
{$IFNDEF JWA_OMIT_SECTIONS}
unit JwaRpcDce;

{$WEAKPACKAGEUNIT}
{$ENDIF JWA_OMIT_SECTIONS}

{$HPPEMIT ''}
{$HPPEMIT '#include "RpcDce.h"'}
{$HPPEMIT ''}
{$HPPEMIT 'typedef RPC_BINDING_VECTOR *PRPC_BINDING_VECTOR'}
{$HPPEMIT 'typedef UUID_VECTOR *PUUID_VECTOR'}
{$HPPEMIT 'typedef RPC_IF_ID *PRPC_IF_ID'}
{$HPPEMIT 'typedef RPC_PROTSEQ_VECTORA *PRPC_PROTSEQ_VECTORA'}
{$HPPEMIT 'typedef RPC_PROTSEQ_VECTORW *PRPC_PROTSEQ_VECTORW'}
{$HPPEMIT 'typedef RPC_STATS_VECTOR *PRPC_STATS_VECTOR'}
{$HPPEMIT 'typedef RPC_IF_ID_VECTOR *PRPC_IF_ID_VECTOR'}
{$HPPEMIT 'typedef RPC_AUTHZ_HANDLE *PRPC_AUTHZ_HANDLE'}
{$HPPEMIT 'typedef RPC_AUTH_IDENTITY_HANDLE *PRPC_AUTH_IDENTITY_HANDLE'}
{$HPPEMIT 'typedef RPC_BINDING_HANDLE *PRPC_BINDING_HANDLE'}
{$HPPEMIT 'typedef UUID *PUUID'}
{$HPPEMIT 'typedef UUID *LPUUID'}
{$HPPEMIT ''}

{$IFNDEF JWA_OMIT_SECTIONS}
{$I ..\Includes\JediAPILib.inc}

interface

uses
  JwaWinNT, JwaWinType, JwaRpc;
{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_IMPLEMENTATIONSECTION}
type
  RPC_BINDING_HANDLE = I_RPC_HANDLE;
  {$EXTERNALSYM RPC_BINDING_HANDLE}

{$IFNDEF JWA_INCLUDEMODE}
  UUID = GUID;
  {$EXTERNALSYM UUID}
{$ENDIF JWA_INCLUDEMODE}

  PRPC_BINDING_HANDLE = ^RPC_BINDING_HANDLE;
  {$NODEFINE PRPC_BINDING_HANDLE}
  PUUID = ^UUID;
  {$NODEFINE PUUID}
  LPUUID = ^UUID;
  {$NODEFINE LPUUID}

type
  PRPC_BINDING_VECTOR = ^RPC_BINDING_VECTOR;
  {$NODEFINE PRPC_BINDING_VECTOR}
  _RPC_BINDING_VECTOR = record
    Count: Cardinal;
    BindingH: array [0..0] of RPC_BINDING_HANDLE;
  end;
  {$EXTERNALSYM _RPC_BINDING_VECTOR}
  RPC_BINDING_VECTOR = _RPC_BINDING_VECTOR;
  {$EXTERNALSYM RPC_BINDING_VECTOR}
  TRpcBindingVector = RPC_BINDING_VECTOR;
  PRpcBindingVector = PRPC_BINDING_VECTOR;

  PUUID_VECTOR = ^UUID_VECTOR;
  {$NODEFINE PUUID_VECTOR}
  _UUID_VECTOR = record
    Count: Cardinal;
    Uuid: array [0..0] of PUUID;
  end;
  {$EXTERNALSYM _UUID_VECTOR}
  UUID_VECTOR = _UUID_VECTOR;
  {$EXTERNALSYM UUID_VECTOR}
  TUuidVector = UUID_VECTOR;
  PUuidVector = ^TUuidVector;

  RPC_IF_HANDLE = LPVOID;
  {$EXTERNALSYM RPC_IF_HANDLE}

  PRPC_IF_ID = ^RPC_IF_ID;
  {$NODEFINE PRPC_IF_ID}
  _RPC_IF_ID = record
    Uuid: UUID;
    VersMajor: Word;
    VersMinor: Word;
  end;
  {$EXTERNALSYM _RPC_IF_ID}
  RPC_IF_ID = _RPC_IF_ID;
  {$EXTERNALSYM RPC_IF_ID}
  TRpcIfId = RPC_IF_ID;
  PRpcIfId = ^TRpcIfId;

const
  RPC_C_BINDING_INFINITE_TIMEOUT = 10;
  {$EXTERNALSYM RPC_C_BINDING_INFINITE_TIMEOUT}
  RPC_C_BINDING_MIN_TIMEOUT      = 0;
  {$EXTERNALSYM RPC_C_BINDING_MIN_TIMEOUT}
  RPC_C_BINDING_DEFAULT_TIMEOUT  = 5;
  {$EXTERNALSYM RPC_C_BINDING_DEFAULT_TIMEOUT}
  RPC_C_BINDING_MAX_TIMEOUT      = 9;
  {$EXTERNALSYM RPC_C_BINDING_MAX_TIMEOUT}

  RPC_C_CANCEL_INFINITE_TIMEOUT  = DWORD(-1);
  {$EXTERNALSYM RPC_C_CANCEL_INFINITE_TIMEOUT}

  RPC_C_LISTEN_MAX_CALLS_DEFAULT = 1234;
  {$EXTERNALSYM RPC_C_LISTEN_MAX_CALLS_DEFAULT}
  RPC_C_PROTSEQ_MAX_REQS_DEFAULT = 10;
  {$EXTERNALSYM RPC_C_PROTSEQ_MAX_REQS_DEFAULT}

// RPC_POLICY EndpointFlags.

  RPC_C_BIND_TO_ALL_NICS  = 1;
  {$EXTERNALSYM RPC_C_BIND_TO_ALL_NICS}
  RPC_C_USE_INTERNET_PORT = $1;
  {$EXTERNALSYM RPC_C_USE_INTERNET_PORT}
  RPC_C_USE_INTRANET_PORT = $2;
  {$EXTERNALSYM RPC_C_USE_INTRANET_PORT}
  RPC_C_DONT_FAIL         = $4;
  {$EXTERNALSYM RPC_C_DONT_FAIL}

// RPC_POLICY EndpointFlags specific to the Falcon/RPC transport:

  RPC_C_MQ_TEMPORARY                 = $0000;
  {$EXTERNALSYM RPC_C_MQ_TEMPORARY}
  RPC_C_MQ_PERMANENT                 = $0001;
  {$EXTERNALSYM RPC_C_MQ_PERMANENT}
  RPC_C_MQ_CLEAR_ON_OPEN             = $0002;
  {$EXTERNALSYM RPC_C_MQ_CLEAR_ON_OPEN}
  RPC_C_MQ_USE_EXISTING_SECURITY     = $0004;
  {$EXTERNALSYM RPC_C_MQ_USE_EXISTING_SECURITY}
  RPC_C_MQ_AUTHN_LEVEL_NONE          = $0000;
  {$EXTERNALSYM RPC_C_MQ_AUTHN_LEVEL_NONE}
  RPC_C_MQ_AUTHN_LEVEL_PKT_INTEGRITY = $0008;
  {$EXTERNALSYM RPC_C_MQ_AUTHN_LEVEL_PKT_INTEGRITY}
  RPC_C_MQ_AUTHN_LEVEL_PKT_PRIVACY   = $0010;
  {$EXTERNALSYM RPC_C_MQ_AUTHN_LEVEL_PKT_PRIVACY}

// Client: RpcBindingSetOption() values for the Falcon/RPC transport:

  RPC_C_OPT_MQ_DELIVERY            = 1;
  {$EXTERNALSYM RPC_C_OPT_MQ_DELIVERY}
  RPC_C_OPT_MQ_PRIORITY            = 2;
  {$EXTERNALSYM RPC_C_OPT_MQ_PRIORITY}
  RPC_C_OPT_MQ_JOURNAL             = 3;
  {$EXTERNALSYM RPC_C_OPT_MQ_JOURNAL}
  RPC_C_OPT_MQ_ACKNOWLEDGE         = 4;
  {$EXTERNALSYM RPC_C_OPT_MQ_ACKNOWLEDGE}
  RPC_C_OPT_MQ_AUTHN_SERVICE       = 5;
  {$EXTERNALSYM RPC_C_OPT_MQ_AUTHN_SERVICE}
  RPC_C_OPT_MQ_AUTHN_LEVEL         = 6;
  {$EXTERNALSYM RPC_C_OPT_MQ_AUTHN_LEVEL}
  RPC_C_OPT_MQ_TIME_TO_REACH_QUEUE = 7;
  {$EXTERNALSYM RPC_C_OPT_MQ_TIME_TO_REACH_QUEUE}
  RPC_C_OPT_MQ_TIME_TO_BE_RECEIVED = 8;
  {$EXTERNALSYM RPC_C_OPT_MQ_TIME_TO_BE_RECEIVED}
  RPC_C_OPT_BINDING_NONCAUSAL      = 9;
  {$EXTERNALSYM RPC_C_OPT_BINDING_NONCAUSAL}
  RPC_C_OPT_SECURITY_CALLBACK      = 10;
  {$EXTERNALSYM RPC_C_OPT_SECURITY_CALLBACK}
  RPC_C_OPT_UNIQUE_BINDING         = 11;
  {$EXTERNALSYM RPC_C_OPT_UNIQUE_BINDING}
  RPC_C_OPT_CALL_TIMEOUT           = 12;
  {$EXTERNALSYM RPC_C_OPT_CALL_TIMEOUT}
  RPC_C_OPT_DONT_LINGER            = 13;
  {$EXTERNALSYM RPC_C_OPT_DONT_LINGER}
  RPC_C_OPT_MAX_OPTIONS            = 14;
  {$EXTERNALSYM RPC_C_OPT_MAX_OPTIONS}

  RPC_C_MQ_EXPRESS     = 0; // Client: RPC_C_MQ_DELIVERY.
  {$EXTERNALSYM RPC_C_MQ_EXPRESS}
  RPC_C_MQ_RECOVERABLE = 1;
  {$EXTERNALSYM RPC_C_MQ_RECOVERABLE}

  RPC_C_MQ_JOURNAL_NONE       = 0; // Client: RPC_C_MQ_JOURNAL.
  {$EXTERNALSYM RPC_C_MQ_JOURNAL_NONE}
  RPC_C_MQ_JOURNAL_DEADLETTER = 1;
  {$EXTERNALSYM RPC_C_MQ_JOURNAL_DEADLETTER}
  RPC_C_MQ_JOURNAL_ALWAYS     = 2;
  {$EXTERNALSYM RPC_C_MQ_JOURNAL_ALWAYS}

// flags for RpcServerInqAuthClientEx

  RPC_C_FULL_CERT_CHAIN = $0001;
  {$EXTERNALSYM RPC_C_FULL_CERT_CHAIN}

type
  PRPC_PROTSEQ_VECTORA = ^RPC_PROTSEQ_VECTORA;
  {$NODEFINE PRPC_PROTSEQ_VECTORA}
  _RPC_PROTSEQ_VECTORA = record
    Count: Cardinal;
    Protseq: array [0..0] of PByte
  end;
  {$EXTERNALSYM _RPC_PROTSEQ_VECTORA}
  RPC_PROTSEQ_VECTORA = _RPC_PROTSEQ_VECTORA;
  {$EXTERNALSYM RPC_PROTSEQ_VECTORA}
  TRpcProtSeqVectorA = RPC_PROTSEQ_VECTORA;
  PRpcProtSeqVectorA = PRPC_PROTSEQ_VECTORA;

  PRPC_PROTSEQ_VECTORW = ^RPC_PROTSEQ_VECTORW;
  {$NODEFINE PRPC_PROTSEQ_VECTORW}
  _RPC_PROTSEQ_VECTORW = record
    Count: Cardinal;
    Protseq: array [0..0] of PWord;
  end;
  {$EXTERNALSYM _RPC_PROTSEQ_VECTORW}
  RPC_PROTSEQ_VECTORW = _RPC_PROTSEQ_VECTORW;
  {$EXTERNALSYM RPC_PROTSEQ_VECTORW}
  TRpcProtSeqVectorW = RPC_PROTSEQ_VECTORW;
  PRpcProtSeqVectorW = PRPC_PROTSEQ_VECTORW;

  {$IFDEF UNICODE}
  RPC_PROTSEQ_VECTOR = RPC_PROTSEQ_VECTORW;
  {$EXTERNALSYM RPC_PROTSEQ_VECTOR}
  PRPC_PROTSEQ_VECTOR = PRPC_PROTSEQ_VECTORW;
  TRpcProtSeqVector = TRpcProtSeqVectorW;
  PRpcProtSeqVector = PRpcProtSeqVectorW;
  {$ELSE}
  RPC_PROTSEQ_VECTOR = RPC_PROTSEQ_VECTORA;
  {$EXTERNALSYM RPC_PROTSEQ_VECTOR}
  PRPC_PROTSEQ_VECTOR = PRPC_PROTSEQ_VECTORA;
  TRpcProtSeqVector = TRpcProtSeqVectorA;
  PRpcProtSeqVector = PRpcProtSeqVectorA;
  {$ENDIF UNICODE}

  PRPC_POLICY = ^RPC_POLICY;
  {$EXTERNALSYM PRPC_POLICY}
  _RPC_POLICY = record
    Length: Cardinal;
    EndpointFlags: Cardinal;
    NICFlags: Cardinal;
  end;
  {$EXTERNALSYM _RPC_POLICY}
  RPC_POLICY = _RPC_POLICY;
  {$EXTERNALSYM RPC_POLICY}
  TRpcPolicy = RPC_POLICY;
  PRpcPolicy = PRPC_POLICY;

  RPC_OBJECT_INQ_FN = procedure(const ObjectUuid: UUID; var TypeUuid: UUID;
    var Status: RPC_STATUS); stdcall;
  {$EXTERNALSYM RPC_OBJECT_INQ_FN}
  TRpcObjectInqFn = RPC_OBJECT_INQ_FN;

  RPC_IF_CALLBACK_FN = function(InterfaceUuid: RPC_IF_HANDLE; Context: Pointer): RPC_STATUS; stdcall;
  {$EXTERNALSYM RPC_IF_CALLBACK_FN}
  TRpcIfCallbackFn = RPC_IF_CALLBACK_FN;

  RPC_SECURITY_CALLBACK_FN = procedure(Context: Pointer); stdcall;
  {$EXTERNALSYM RPC_SECURITY_CALLBACK_FN}
  TRpcSecurityCallbackFn = RPC_SECURITY_CALLBACK_FN;

  PRPC_STATS_VECTOR = ^RPC_STATS_VECTOR;
  {$NODEFINE PRPC_STATS_VECTOR}
  RPC_STATS_VECTOR = record
    Count: Cardinal;
    Stats: array [0..0] of Cardinal;
  end;
  {$EXTERNALSYM RPC_STATS_VECTOR}
  TRpcStatsVector = RPC_STATS_VECTOR;
  PRpcStatsVector = PRPC_STATS_VECTOR;

const
  RPC_C_STATS_CALLS_IN  = 0;
  {$EXTERNALSYM RPC_C_STATS_CALLS_IN}
  RPC_C_STATS_CALLS_OUT = 1;
  {$EXTERNALSYM RPC_C_STATS_CALLS_OUT}
  RPC_C_STATS_PKTS_IN   = 2;
  {$EXTERNALSYM RPC_C_STATS_PKTS_IN}
  RPC_C_STATS_PKTS_OUT  = 3;
  {$EXTERNALSYM RPC_C_STATS_PKTS_OUT}

type
  PRPC_IF_ID_VECTOR = ^RPC_IF_ID_VECTOR;
  {$NODEFINE RPC_IF_ID_VECTOR}
  RPC_IF_ID_VECTOR = record
    Count: Cardinal;
    IfId: array [0..0] of PRpcIfId;
  end;
  {$EXTERNALSYM RPC_IF_ID_VECTOR}
  TRpcIfIdVector = RPC_IF_ID_VECTOR;
  PRpcIfIdVector = PRPC_IF_ID_VECTOR;

function I_RpcBindingIsClientLocal(BindingHandle: RPC_BINDING_HANDLE;
  out ClientLocalFlag: Integer): RPC_STATUS;
{$EXTERNALSYM I_RpcBindingIsClientLocal}

function RpcBindingCopy(SourceBinding: RPC_BINDING_HANDLE;
  var DestinationBinding: RPC_BINDING_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingCopy}

function RpcBindingFree(var Binding: RPC_BINDING_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingFree}

function RpcBindingSetOption(hBinding: RPC_BINDING_HANDLE; option: Cardinal;
  optionValue: ULONG_PTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingSetOption}

function RpcBindingInqOption(hBinding: RPC_BINDING_HANDLE; option: Cardinal;
  var pOptionValue: ULONG_PTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingInqOption}

function RpcBindingFromStringBindingA(StringBinding: PAnsiChar;
  var Binding: RPC_BINDING_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingFromStringBindingA}
function RpcBindingFromStringBindingW(StringBinding: PWideChar;
  var Binding: RPC_BINDING_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingFromStringBindingW}
function RpcBindingFromStringBinding(StringBinding: PTSTR;
  var Binding: RPC_BINDING_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingFromStringBinding}

function RpcSsGetContextBinding(ContextHandle: Pointer; var Binding: RPC_BINDING_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcSsGetContextBinding}

function RpcBindingInqObject(Binding: RPC_BINDING_HANDLE; var ObjectUuid: UUID): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingInqObject}

function RpcBindingReset(Binding: RPC_BINDING_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingReset}

// RpcBindingServerFromClient : UNSUPPORTED
// RpcBindingSetAuthInfo

function RpcBindingSetObject(Binding: RPC_BINDING_HANDLE; const ObjectUuid: UUID): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingSetObject}

function RpcMgmtInqDefaultProtectLevel(AuthnSvc: Cardinal; var AuthnLevel: Cardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtInqDefaultProtectLevel}

function RpcBindingToStringBindingA(Binding: RPC_BINDING_HANDLE;
  var StringBinding: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingToStringBindingA}
function RpcBindingToStringBindingW(Binding: RPC_BINDING_HANDLE;
  var StringBinding: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingToStringBindingW}
function RpcBindingToStringBinding(Binding: RPC_BINDING_HANDLE;
  var StringBinding: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingToStringBinding}

function RpcBindingVectorFree(var BindingVector: PRPC_BINDING_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingVectorFree}

function RpcStringBindingComposeA(ObjUuid, Protseq, NetworkAddr, Endpoint,
  Options: PAnsiChar; var StringBinding: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcStringBindingComposeA}
function RpcStringBindingComposeW(ObjUuid, Protseq, NetworkAddr, Endpoint,
  Options: PWideChar; var StringBinding: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcStringBindingComposeW}
function RpcStringBindingCompose(ObjUuid, Protseq, NetworkAddr, Endpoint,
  Options: PTSTR; var StringBinding: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcStringBindingCompose}

function RpcStringBindingParseA(StringBinding: PAnsiChar; ObjUuid, Protseq,
  NetworkAddr, Endpoint, NetworkOptions: PPAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcStringBindingParseA}
function RpcStringBindingParseW(StringBinding: PWideChar; ObjUuid, Protseq,
  NetworkAddr, Endpoint, NetworkOptions: PPWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcStringBindingParseW}
function RpcStringBindingParse(StringBinding: PTSTR; ObjUuid, Protseq,
  NetworkAddr, Endpoint, NetworkOptions: PPTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcStringBindingParse}

function RpcStringFreeA(var S: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcStringFreeA}
function RpcStringFreeW(var S: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcStringFreeW}
function RpcStringFree(var S: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcStringFree}

function RpcIfInqId(RpcIfHandle: RPC_IF_HANDLE; var RpcIfId: RPC_IF_ID): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcIfInqId}

function RpcNetworkIsProtseqValidA(Protseq: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNetworkIsProtseqValidA}

function RpcNetworkIsProtseqValidW(Protseq: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNetworkIsProtseqValidW}

function RpcMgmtInqComTimeout(Binding: RPC_BINDING_HANDLE; var Timeout: Cardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtInqComTimeout}

function RpcMgmtSetComTimeout(Binding: RPC_BINDING_HANDLE; Timeout: Cardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtSetComTimeout}

function RpcMgmtSetCancelTimeout(Timeout: Longint): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtSetCancelTimeout}

function RpcNetworkInqProtseqsA(var ProtseqVector: PRPC_PROTSEQ_VECTORA): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNetworkInqProtseqsA}
function RpcNetworkInqProtseqsW(var ProtseqVector: PRPC_PROTSEQ_VECTORW): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNetworkInqProtseqsW}
function RpcNetworkInqProtseqs(var ProtseqVector: PRPC_PROTSEQ_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNetworkInqProtseqs}

function RpcObjectInqType(const ObjUuid: UUID; TypeUuid: PUUID): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcObjectInqType}

function RpcObjectSetInqFn(InquiryFn: RPC_OBJECT_INQ_FN): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcObjectSetInqFn}

function RpcObjectSetType(const ObjUuid: UUID; TypeUuid: PUUID): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcObjectSetType}

function RpcProtseqVectorFreeA(var ProtseqVector: PRPC_PROTSEQ_VECTORA): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcProtseqVectorFreeA}
function RpcProtseqVectorFreeW(var ProtseqVector: PRPC_PROTSEQ_VECTORW): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcProtseqVectorFreeW}
function RpcProtseqVectorFree(var ProtseqVector: PRPC_PROTSEQ_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcProtseqVectorFree}

function RpcServerInqBindings(var BindingVector: PRPC_BINDING_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerInqBindings}

function RpcServerInqIf(IfSpec: RPC_IF_HANDLE; MgrTypeUuid: PUUID;
  MgrEpv: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerInqIf}

function RpcServerListen(MinimumCallThreads, MaxCalls, DontWait: Cardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerListen}

function RpcServerRegisterIf(IfSpec: RPC_IF_HANDLE; MgrTypeUuid: PUUID;
  MgrEpv: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerRegisterIf}

function RpcServerRegisterIfEx(IfSpec: RPC_IF_HANDLE; MgrTypeUuid: PUUID;
  MgrEpv: Pointer; Flags, MaxCalls: Cardinal; IfCallback: RPC_IF_CALLBACK_FN): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerRegisterIfEx}

function RpcServerRegisterIf2(IfSpec: RPC_IF_HANDLE; MgrTypeUuid: PUUID;
  MgrEpv: Pointer; Flags, MaxCalls, MaxRpcSize: Cardinal;
  IfCallbackFn: RPC_IF_CALLBACK_FN): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerRegisterIf2}

function RpcServerUnregisterIf(IfSpec: RPC_IF_HANDLE; MgrTypeUuid: PUUID;
  WaitForCallsToComplete: Cardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUnregisterIf}

function RpcServerUnregisterIfEx(IfSpec: RPC_IF_HANDLE; MgrTypeUuid: PUUID;
  RundownContextHandles: Integer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUnregisterIfEx}

function RpcServerUseAllProtseqs(MaxCalls: Cardinal; SecurityDescriptor: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseAllProtseqs}

function RpcServerUseAllProtseqsEx(MaxCalls: Cardinal; SecurityDescriptor: Pointer;
  Policy: PRPC_POLICY): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseAllProtseqsEx}

function RpcServerUseAllProtseqsIf(MaxCalls: Cardinal; IfSpec: RPC_IF_HANDLE;
  SecurityDescriptor: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseAllProtseqsIf}

function RpcServerUseAllProtseqsIfEx(MaxCalls: Cardinal; IfSpec: RPC_IF_HANDLE;
  SecurityDescriptor: Pointer; Policy: PRPC_POLICY): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseAllProtseqsIfEx}

function RpcServerUseProtseqA(Protseq: PAnsiChar; MaxCalls: Cardinal;
  SecurityDescriptor: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqA}
function RpcServerUseProtseqW(Protseq: PWideChar; MaxCalls: Cardinal;
  SecurityDescriptor: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqW}
function RpcServerUseProtseq(Protseq: PTSTR; MaxCalls: Cardinal;
  SecurityDescriptor: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseq}

function RpcServerUseProtseqExA(Protseq: PAnsiChar; MaxCalls: Cardinal;
  SecurityDescriptor: Pointer; const Policy: RPC_POLICY): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqExA}
function RpcServerUseProtseqExW(Protseq: PWideChar; MaxCalls: Cardinal;
  SecurityDescriptor: Pointer; const Policy: RPC_POLICY): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqExW}
function RpcServerUseProtseqEx(Protseq: PTSTR; MaxCalls: Cardinal;
  SecurityDescriptor: Pointer; const Policy: RPC_POLICY): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqEx}

function RpcServerUseProtseqEpA(Protseq: PAnsiChar; MaxCalls: Cardinal;
  Endpoint: PAnsiChar; SecurityDescriptor: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqEpA}
function RpcServerUseProtseqEpW(Protseq: PWideChar; MaxCalls: Cardinal;
  Endpoint: PWideChar; SecurityDescriptor: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqEpW}
function RpcServerUseProtseqEp(Protseq: PTSTR; MaxCalls: Cardinal;
  Endpoint: PTSTR; SecurityDescriptor: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqEp}

function RpcServerUseProtseqEpExA(Protseq: PAnsiChar; MaxCalls: Cardinal;
  Endpoint: PAnsiChar; SecurityDescriptor: Pointer; const Policy: RPC_POLICY): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqEpExA}
function RpcServerUseProtseqEpExW(Protseq: PWideChar; MaxCalls: Cardinal;
  Endpoint: PWideChar; SecurityDescriptor: Pointer; const Policy: RPC_POLICY): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqEpExW}
function RpcServerUseProtseqEpEx(Protseq: PTSTR; MaxCalls: Cardinal;
  Endpoint: PTSTR; SecurityDescriptor: Pointer; const Policy: RPC_POLICY): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqEpEx}

function RpcServerUseProtseqIfA(Protseq: PAnsiChar; MaxCalls: Cardinal;
  IfSpec: RPC_IF_HANDLE; SecurityDescriptor: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqIfA}
function RpcServerUseProtseqIfW(Protseq: PWideChar; MaxCalls: Cardinal;
  IfSpec: RPC_IF_HANDLE; SecurityDescriptor: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqIfW}

function RpcServerUseProtseqIfExA(Protseq: PAnsiChar; MaxCalls: Cardinal;
  IfSpec: RPC_IF_HANDLE; SecurityDescriptor: Pointer; const Policy: RPC_POLICY): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqIfExA}
function RpcServerUseProtseqIfExW(Protseq: PWideChar; MaxCalls: Cardinal;
  IfSpec: RPC_IF_HANDLE; SecurityDescriptor: Pointer; const Policy: RPC_POLICY): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqIfExW}
function RpcServerUseProtseqIfEx(Protseq: PTSTR; MaxCalls: Cardinal;
  IfSpec: RPC_IF_HANDLE; SecurityDescriptor: Pointer; const Policy: RPC_POLICY): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerUseProtseqIfEx}

procedure RpcServerYield; stdcall;
{$EXTERNALSYM RpcServerYield}

function RpcMgmtStatsVectorFree(var StatsVector: PRPC_STATS_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtStatsVectorFree}

function RpcMgmtInqStats(Binding: RPC_BINDING_HANDLE; var Statistics: PRPC_STATS_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtInqStats}

function RpcMgmtIsServerListening(Binding: RPC_BINDING_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtIsServerListening}

function RpcMgmtStopServerListening(Binding: RPC_BINDING_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtStopServerListening}

function RpcMgmtWaitServerListen: RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtWaitServerListen}

function RpcMgmtSetServerStackSize(ThreadStackSize: Cardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtSetServerStackSize}

procedure RpcSsDontSerializeContext; stdcall;
{$EXTERNALSYM RpcSsDontSerializeContext}

function RpcMgmtEnableIdleCleanup: RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtEnableIdleCleanup}

function RpcMgmtInqIfIds(Binding: RPC_BINDING_HANDLE;
  var IfIdVector: PRPC_IF_ID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtInqIfIds}

function RpcIfIdVectorFree(var IfIdVector: PRPC_IF_ID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcIfIdVectorFree}

function RpcMgmtInqServerPrincNameA(Binding: RPC_BINDING_HANDLE;
  AuthnSvc: Cardinal; var ServerPrincName: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtInqServerPrincNameA}
function RpcMgmtInqServerPrincNameW(Binding: RPC_BINDING_HANDLE;
  AuthnSvc: Cardinal; var ServerPrincName: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtInqServerPrincNameW}
function RpcMgmtInqServerPrincName(Binding: RPC_BINDING_HANDLE;
  AuthnSvc: Cardinal; var ServerPrincName: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtInqServerPrincName}

function RpcServerInqDefaultPrincNameA(AuthnSvc: Cardinal; var PrincName: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerInqDefaultPrincNameA}
function RpcServerInqDefaultPrincNameW(AuthnSvc: Cardinal; var PrincName: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerInqDefaultPrincNameW}
function RpcServerInqDefaultPrincName(AuthnSvc: Cardinal; var PrincName: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerInqDefaultPrincName}

function RpcEpResolveBinding(Binding: RPC_BINDING_HANDLE; IfSpe: RPC_IF_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcEpResolveBinding}

function RpcNsBindingInqEntryNameA(Binding: RPC_BINDING_HANDLE;
  EntryNameSyntax: Cardinal; var EntryName: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingInqEntryNameA}
function RpcNsBindingInqEntryNameW(Binding: RPC_BINDING_HANDLE;
  EntryNameSyntax: Cardinal; var EntryName: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingInqEntryNameW}
function RpcNsBindingInqEntryName(Binding: RPC_BINDING_HANDLE;
  EntryNameSyntax: Cardinal; var EntryName: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcNsBindingInqEntryName}

type
  RPC_AUTH_IDENTITY_HANDLE = Pointer;
  {$EXTERNALSYM RPC_AUTH_IDENTITY_HANDLE}
  RPC_AUTHZ_HANDLE = Pointer;
  {$EXTERNALSYM RPC_AUTHZ_HANDLE}
  PRPC_AUTHZ_HANDLE = ^RPC_AUTHZ_HANDLE;
  {$NODEFINE PRPC_AUTHZ_HANDLE}

  PRPC_AUTH_IDENTITY_HANDLE = ^RPC_AUTH_IDENTITY_HANDLE;
  {$NODEFINE PRPC_AUTH_IDENTITY_HANDLE}

const
  RPC_C_AUTHN_LEVEL_DEFAULT       = 0;
  {$EXTERNALSYM RPC_C_AUTHN_LEVEL_DEFAULT}
  RPC_C_AUTHN_LEVEL_NONE          = 1;
  {$EXTERNALSYM RPC_C_AUTHN_LEVEL_NONE}
  RPC_C_AUTHN_LEVEL_CONNECT       = 2;
  {$EXTERNALSYM RPC_C_AUTHN_LEVEL_CONNECT}
  RPC_C_AUTHN_LEVEL_CALL          = 3;
  {$EXTERNALSYM RPC_C_AUTHN_LEVEL_CALL}
  RPC_C_AUTHN_LEVEL_PKT           = 4;
  {$EXTERNALSYM RPC_C_AUTHN_LEVEL_PKT}
  RPC_C_AUTHN_LEVEL_PKT_INTEGRITY = 5;
  {$EXTERNALSYM RPC_C_AUTHN_LEVEL_PKT_INTEGRITY}
  RPC_C_AUTHN_LEVEL_PKT_PRIVACY   = 6;
  {$EXTERNALSYM RPC_C_AUTHN_LEVEL_PKT_PRIVACY}

  RPC_C_IMP_LEVEL_DEFAULT     = 0;
  {$EXTERNALSYM RPC_C_IMP_LEVEL_DEFAULT}
  RPC_C_IMP_LEVEL_ANONYMOUS   = 1;
  {$EXTERNALSYM RPC_C_IMP_LEVEL_ANONYMOUS}
  RPC_C_IMP_LEVEL_IDENTIFY    = 2;
  {$EXTERNALSYM RPC_C_IMP_LEVEL_IDENTIFY}
  RPC_C_IMP_LEVEL_IMPERSONATE = 3;
  {$EXTERNALSYM RPC_C_IMP_LEVEL_IMPERSONATE}
  RPC_C_IMP_LEVEL_DELEGATE    = 4;
  {$EXTERNALSYM RPC_C_IMP_LEVEL_DELEGATE}

  RPC_C_QOS_IDENTITY_STATIC  = 0;
  {$EXTERNALSYM RPC_C_QOS_IDENTITY_STATIC}
  RPC_C_QOS_IDENTITY_DYNAMIC = 1;
  {$EXTERNALSYM RPC_C_QOS_IDENTITY_DYNAMIC}

  RPC_C_QOS_CAPABILITIES_DEFAULT                      = $0;
  {$EXTERNALSYM RPC_C_QOS_CAPABILITIES_DEFAULT}
  RPC_C_QOS_CAPABILITIES_MUTUAL_AUTH                  = $1;
  {$EXTERNALSYM RPC_C_QOS_CAPABILITIES_MUTUAL_AUTH}
  RPC_C_QOS_CAPABILITIES_MAKE_FULLSIC                 = $2;
  {$EXTERNALSYM RPC_C_QOS_CAPABILITIES_MAKE_FULLSIC}
  RPC_C_QOS_CAPABILITIES_ANY_AUTHORITY                = $4;
  {$EXTERNALSYM RPC_C_QOS_CAPABILITIES_ANY_AUTHORITY}
  RPC_C_QOS_CAPABILITIES_IGNORE_DELEGATE_FAILURE      = $8;
  {$EXTERNALSYM RPC_C_QOS_CAPABILITIES_IGNORE_DELEGATE_FAILURE}
  RPC_C_QOS_CAPABILITIES_LOCAL_MA_HINT                = $10;
  {$EXTERNALSYM RPC_C_QOS_CAPABILITIES_LOCAL_MA_HINT}

  RPC_C_PROTECT_LEVEL_DEFAULT       = RPC_C_AUTHN_LEVEL_DEFAULT;
  {$EXTERNALSYM RPC_C_PROTECT_LEVEL_DEFAULT}
  RPC_C_PROTECT_LEVEL_NONE          = RPC_C_AUTHN_LEVEL_NONE;
  {$EXTERNALSYM RPC_C_PROTECT_LEVEL_NONE}
  RPC_C_PROTECT_LEVEL_CONNECT       = RPC_C_AUTHN_LEVEL_CONNECT;
  {$EXTERNALSYM RPC_C_PROTECT_LEVEL_CONNECT}
  RPC_C_PROTECT_LEVEL_CALL          = RPC_C_AUTHN_LEVEL_CALL;
  {$EXTERNALSYM RPC_C_PROTECT_LEVEL_CALL}
  RPC_C_PROTECT_LEVEL_PKT           = RPC_C_AUTHN_LEVEL_PKT;
  {$EXTERNALSYM RPC_C_PROTECT_LEVEL_PKT}
  RPC_C_PROTECT_LEVEL_PKT_INTEGRITY = RPC_C_AUTHN_LEVEL_PKT_INTEGRITY;
  {$EXTERNALSYM RPC_C_PROTECT_LEVEL_PKT_INTEGRITY}
  RPC_C_PROTECT_LEVEL_PKT_PRIVACY   = RPC_C_AUTHN_LEVEL_PKT_PRIVACY;
  {$EXTERNALSYM RPC_C_PROTECT_LEVEL_PKT_PRIVACY}

  RPC_C_AUTHN_NONE          = 0;
  {$EXTERNALSYM RPC_C_AUTHN_NONE}
  RPC_C_AUTHN_DCE_PRIVATE   = 1;
  {$EXTERNALSYM RPC_C_AUTHN_DCE_PRIVATE}
  RPC_C_AUTHN_DCE_PUBLIC    = 2;
  {$EXTERNALSYM RPC_C_AUTHN_DCE_PUBLIC}
  RPC_C_AUTHN_DEC_PUBLIC    = 4;
  {$EXTERNALSYM RPC_C_AUTHN_DEC_PUBLIC}
  RPC_C_AUTHN_GSS_NEGOTIATE = 9;
  {$EXTERNALSYM RPC_C_AUTHN_GSS_NEGOTIATE}
  RPC_C_AUTHN_WINNT         = 10;
  {$EXTERNALSYM RPC_C_AUTHN_WINNT}
  RPC_C_AUTHN_GSS_SCHANNEL  = 14;
  {$EXTERNALSYM RPC_C_AUTHN_GSS_SCHANNEL}
  RPC_C_AUTHN_GSS_KERBEROS  = 16;
  {$EXTERNALSYM RPC_C_AUTHN_GSS_KERBEROS}
  RPC_C_AUTHN_DPA           = 17;
  {$EXTERNALSYM RPC_C_AUTHN_DPA}
  RPC_C_AUTHN_MSN           = 18;
  {$EXTERNALSYM RPC_C_AUTHN_MSN}
  RPC_C_AUTHN_DIGEST        = 21;
  {$EXTERNALSYM RPC_C_AUTHN_DIGEST}
  RPC_C_AUTHN_MQ            = 100;
  {$EXTERNALSYM RPC_C_AUTHN_MQ}
  RPC_C_AUTHN_DEFAULT       = DWORD($FFFFFFFF);
  {$EXTERNALSYM RPC_C_AUTHN_DEFAULT}

  RPC_C_NO_CREDENTIALS = RPC_AUTH_IDENTITY_HANDLE(MAXUINT_PTR);
  {$EXTERNALSYM RPC_C_NO_CREDENTIALS}

  RPC_C_SECURITY_QOS_VERSION = 1;
  {$EXTERNALSYM RPC_C_SECURITY_QOS_VERSION}
  RPC_C_SECURITY_QOS_VERSION_1 = 1;
  {$EXTERNALSYM RPC_C_SECURITY_QOS_VERSION_1}

type
  _RPC_SECURITY_QOS = record
    Version: Longint;
    Capabilities: Longint;
    IdentityTracking: Longint;
    ImpersonationType: Longint;
  end;
  {$EXTERNALSYM _RPC_SECURITY_QOS}
  RPC_SECURITY_QOS = _RPC_SECURITY_QOS;
  {$EXTERNALSYM RPC_SECURITY_QOS}
  PRPC_SECURITY_QOS = ^RPC_SECURITY_QOS;
  {$EXTERNALSYM PRPC_SECURITY_QOS}
  TRpcSecurityQos = RPC_SECURITY_QOS;
  PRpcSecurityQos = PRPC_SECURITY_QOS;

{$IFNDEF JWA_INCLUDEMODE}

const
  SEC_WINNT_AUTH_IDENTITY_ANSI    = $1;
  {$EXTERNALSYM SEC_WINNT_AUTH_IDENTITY_ANSI}
  SEC_WINNT_AUTH_IDENTITY_UNICODE = $2;
  {$EXTERNALSYM SEC_WINNT_AUTH_IDENTITY_UNICODE}

type
  _SEC_WINNT_AUTH_IDENTITY_W = record
    User: PWideChar;
    UserLength: Longint;
    Domain: PWideChar;
    DomainLength: Longint;
    Password: PWideChar;
    PasswordLength: Longint;
    Flags: Longint;
  end;
  {$EXTERNALSYM _SEC_WINNT_AUTH_IDENTITY_W}
  SEC_WINNT_AUTH_IDENTITY_W = _SEC_WINNT_AUTH_IDENTITY_W;
  {$EXTERNALSYM SEC_WINNT_AUTH_IDENTITY_W}
  PSEC_WINNT_AUTH_IDENTITY_W = ^SEC_WINNT_AUTH_IDENTITY_W;
  {$EXTERNALSYM PSEC_WINNT_AUTH_IDENTITY_W}
  TSecWinNTAuthIdentityW = SEC_WINNT_AUTH_IDENTITY_W;
  PSecWinNTAuthIdentityW = PSEC_WINNT_AUTH_IDENTITY_W;

  _SEC_WINNT_AUTH_IDENTITY_A = record
    User: PAnsiChar;
    UserLength: Longint;
    Domain: PAnsiChar;
    DomainLength: Longint;
    Password: PAnsiChar;
    PasswordLength: Longint;
    Flags: Longint;
  end;
  {$EXTERNALSYM _SEC_WINNT_AUTH_IDENTITY_A}
  SEC_WINNT_AUTH_IDENTITY_A = _SEC_WINNT_AUTH_IDENTITY_A;
  {$EXTERNALSYM SEC_WINNT_AUTH_IDENTITY_A}
  PSEC_WINNT_AUTH_IDENTITY_A = ^SEC_WINNT_AUTH_IDENTITY_A;
  {$EXTERNALSYM PSEC_WINNT_AUTH_IDENTITY_A}
  TSecWinNTAuthIdentityA = SEC_WINNT_AUTH_IDENTITY_A;
  PSecWinNTAuthIdentityA = PSEC_WINNT_AUTH_IDENTITY_A;

  {$IFDEF UNICODE}
  SEC_WINNT_AUTH_IDENTITY = SEC_WINNT_AUTH_IDENTITY_W;
  {$EXTERNALSYM SEC_WINNT_AUTH_IDENTITY}
  PSEC_WINNT_AUTH_IDENTITY = PSEC_WINNT_AUTH_IDENTITY_W;
  {$EXTERNALSYM PSEC_WINNT_AUTH_IDENTITY}
  _SEC_WINNT_AUTH_IDENTITY = _SEC_WINNT_AUTH_IDENTITY_W;
  {$EXTERNALSYM _SEC_WINNT_AUTH_IDENTITY}
  TSecWinNTAuthIdentity = TSecWinNTAuthIdentityW;
  PSecWinNTAuthIdentity = PSecWinNTAuthIdentityW;
  {$ELSE}
  SEC_WINNT_AUTH_IDENTITY = SEC_WINNT_AUTH_IDENTITY_A;
  {$EXTERNALSYM SEC_WINNT_AUTH_IDENTITY}
  PSEC_WINNT_AUTH_IDENTITY = PSEC_WINNT_AUTH_IDENTITY_A;
  {$EXTERNALSYM PSEC_WINNT_AUTH_IDENTITY}
  _SEC_WINNT_AUTH_IDENTITY = _SEC_WINNT_AUTH_IDENTITY_A;
  {$EXTERNALSYM _SEC_WINNT_AUTH_IDENTITY}
  TSecWinNTAuthIdentity = TSecWinNTAuthIdentityA;
  PSecWinNTAuthIdentity = PSecWinNTAuthIdentityA;
  {$ENDIF UNICODE}

{$ENDIF JWA_INCLUDEMODE}

const
  RPC_C_SECURITY_QOS_VERSION_2 = 2;
  {$EXTERNALSYM RPC_C_SECURITY_QOS_VERSION_2}

  RPC_C_AUTHN_INFO_TYPE_HTTP                 = 1;
  {$EXTERNALSYM RPC_C_AUTHN_INFO_TYPE_HTTP}

  RPC_C_HTTP_AUTHN_TARGET_SERVER             = 1;
  {$EXTERNALSYM RPC_C_HTTP_AUTHN_TARGET_SERVER}
  RPC_C_HTTP_AUTHN_TARGET_PROXY              = 2;
  {$EXTERNALSYM RPC_C_HTTP_AUTHN_TARGET_PROXY}

  RPC_C_HTTP_AUTHN_SCHEME_BASIC     = $00000001;
  {$EXTERNALSYM RPC_C_HTTP_AUTHN_SCHEME_BASIC}
  RPC_C_HTTP_AUTHN_SCHEME_NTLM      = $00000002;
  {$EXTERNALSYM RPC_C_HTTP_AUTHN_SCHEME_NTLM}
  RPC_C_HTTP_AUTHN_SCHEME_PASSPORT  = $00000004;
  {$EXTERNALSYM RPC_C_HTTP_AUTHN_SCHEME_PASSPORT}
  RPC_C_HTTP_AUTHN_SCHEME_DIGEST    = $00000008;
  {$EXTERNALSYM RPC_C_HTTP_AUTHN_SCHEME_DIGEST}
  RPC_C_HTTP_AUTHN_SCHEME_NEGOTIATE = $00000010;
  {$EXTERNALSYM RPC_C_HTTP_AUTHN_SCHEME_NEGOTIATE}

  RPC_C_HTTP_FLAG_USE_SSL                    = 1;
  {$EXTERNALSYM RPC_C_HTTP_FLAG_USE_SSL}
  RPC_C_HTTP_FLAG_USE_FIRST_AUTH_SCHEME      = 2;
  {$EXTERNALSYM RPC_C_HTTP_FLAG_USE_FIRST_AUTH_SCHEME}

type
  _RPC_HTTP_TRANSPORT_CREDENTIALS_W = record
    TransportCredentials: PSEC_WINNT_AUTH_IDENTITY_W;
    Flags: Cardinal;
    AuthenticationTarget: Cardinal;
    NumberOfAuthnSchemes: Cardinal;
    AuthnSchemes: PCardinal;
    ServerCertificateSubject: PWord;
  end;
  {$EXTERNALSYM RPC_HTTP_TRANSPORT_CREDENTIALS_W}
  RPC_HTTP_TRANSPORT_CREDENTIALS_W = _RPC_HTTP_TRANSPORT_CREDENTIALS_W;
  {$EXTERNALSYM RPC_HTTP_TRANSPORT_CREDENTIALS_W}
  PRPC_HTTP_TRANSPORT_CREDENTIALS_W = ^RPC_HTTP_TRANSPORT_CREDENTIALS_W;
  {$EXTERNALSYM PRPC_HTTP_TRANSPORT_CREDENTIALS_W}
  TRpcHttpTransportCredentialsW = RPC_HTTP_TRANSPORT_CREDENTIALS_W;
  PRpcHttpTransportCredentialsW = PRPC_HTTP_TRANSPORT_CREDENTIALS_W;

  _RPC_HTTP_TRANSPORT_CREDENTIALS_A = record
    TransportCredentials: PSEC_WINNT_AUTH_IDENTITY_A;
    Flags: Cardinal;
    AuthenticationTarget: Cardinal;
    NumberOfAuthnSchemes: Cardinal;
    AuthnSchemes: PCardinal;
    ServerCertificateSubject: PByte;
  end;
  {$EXTERNALSYM RPC_HTTP_TRANSPORT_CREDENTIALS_A}
  RPC_HTTP_TRANSPORT_CREDENTIALS_A = _RPC_HTTP_TRANSPORT_CREDENTIALS_A;
  {$EXTERNALSYM RPC_HTTP_TRANSPORT_CREDENTIALS_A}
  PRPC_HTTP_TRANSPORT_CREDENTIALS_A = ^RPC_HTTP_TRANSPORT_CREDENTIALS_A;
  {$EXTERNALSYM PRPC_HTTP_TRANSPORT_CREDENTIALS_A}
  TRpcHttpTransportCredentialsA = RPC_HTTP_TRANSPORT_CREDENTIALS_A;
  PRpcHttpTransportCredentialsA = PRPC_HTTP_TRANSPORT_CREDENTIALS_A;

  _RPC_SECURITY_QOS_V2_W = record
    Version: Cardinal;
    Capabilities: Cardinal;
    IdentityTracking: Cardinal;
    ImpersonationType: Cardinal;
    AdditionalSecurityInfoType: Cardinal;
    case Integer of
      0: (HttpCredentials: PRPC_HTTP_TRANSPORT_CREDENTIALS_W);
  end;
  {$EXTERNALSYM _RPC_SECURITY_QOS_V2_W}
  RPC_SECURITY_QOS_V2_W = _RPC_SECURITY_QOS_V2_W;
  {$EXTERNALSYM RPC_SECURITY_QOS_V2_W}
  PRPC_SECURITY_QOS_V2_W = ^RPC_SECURITY_QOS_V2_W;
  {$EXTERNALSYM PRPC_SECURITY_QOS_V2_W}
  TRpcSecurityQosV2W = RPC_SECURITY_QOS_V2_W;
  PRpcSecurityQosV2W = PRPC_SECURITY_QOS_V2_W;  

  _RPC_SECURITY_QOS_V2_A = record
    Version: Cardinal;
    Capabilities: Cardinal;
    IdentityTracking: Cardinal;
    ImpersonationType: Cardinal;
    AdditionalSecurityInfoType: Cardinal;
    case Integer of
      0: (HttpCredentials: PRPC_HTTP_TRANSPORT_CREDENTIALS_A);
  end;
  {$EXTERNALSYM _RPC_SECURITY_QOS_V2_A}
  RPC_SECURITY_QOS_V2_A = _RPC_SECURITY_QOS_V2_A;
  {$EXTERNALSYM RPC_SECURITY_QOS_V2_A}
  PRPC_SECURITY_QOS_V2_A = ^RPC_SECURITY_QOS_V2_A;
  {$EXTERNALSYM PRPC_SECURITY_QOS_V2_A}
  TRpcSecurityQosV2A = RPC_SECURITY_QOS_V2_A;
  PRpcSecurityQosV2A = PRPC_SECURITY_QOS_V2_A;

const
  RPC_C_SECURITY_QOS_VERSION_3 = 3;
  {$EXTERNALSYM RPC_C_SECURITY_QOS_VERSION_3}

type
  _RPC_SECURITY_QOS_V3_W = record
    Version: Cardinal;
    Capabilities: Cardinal;
    IdentityTracking: Cardinal;
    ImpersonationType: Cardinal;
    AdditionalSecurityInfoType: Cardinal;
    u: record
    case Integer of
      0: (HttpCredentials: PRPC_HTTP_TRANSPORT_CREDENTIALS_W);
    end;
    Sid: Pointer;
  end;
  {$EXTERNALSYM _RPC_SECURITY_QOS_V3_W}
  RPC_SECURITY_QOS_V3_W = _RPC_SECURITY_QOS_V3_W;
  {$EXTERNALSYM RPC_SECURITY_QOS_V3_W}
  PRPC_SECURITY_QOS_V3_W = ^RPC_SECURITY_QOS_V3_W;
  {$EXTERNALSYM PRPC_SECURITY_QOS_V3_W}
  TRpcSecurityQosV3W = RPC_SECURITY_QOS_V3_W;
  PRpcSecurityQosV3W = PRPC_SECURITY_QOS_V3_W;

  _RPC_SECURITY_QOS_V3_A = record
    Version: Cardinal;
    Capabilities: Cardinal;
    IdentityTracking: Cardinal;
    ImpersonationType: Cardinal;
    AdditionalSecurityInfoType: Cardinal;
    u: record
    case Integer of
      0: (HttpCredentials: PRPC_HTTP_TRANSPORT_CREDENTIALS_A);
    end;
    Sid: Pointer;
  end;
  {$EXTERNALSYM _RPC_SECURITY_QOS_V3_A}
  RPC_SECURITY_QOS_V3_A = _RPC_SECURITY_QOS_V3_A;
  {$EXTERNALSYM RPC_SECURITY_QOS_V3_A}
  PRPC_SECURITY_QOS_V3_A = ^RPC_SECURITY_QOS_V3_A;
  {$EXTERNALSYM PRPC_SECURITY_QOS_V3_A}
  TRpcSecurityQosV3A = RPC_SECURITY_QOS_V3_A;
  PRpcSecurityQosV3A = PRPC_SECURITY_QOS_V3_A;

  {$IFDEF UNICODE}

  RPC_SECURITY_QOS_V2 = RPC_SECURITY_QOS_V2_W;
  {$EXTERNALSYM RPC_SECURITY_QOS_V2}
  PRPC_SECURITY_QOS_V2 = PRPC_SECURITY_QOS_V2_W;
  {$EXTERNALSYM PRPC_SECURITY_QOS_V2}
  _RPC_SECURITY_QOS_V2 = _RPC_SECURITY_QOS_V2_W;
  {$EXTERNALSYM _RPC_SECURITY_QOS_V2}
  TRpcSecurityQosV2 = TRpcSecurityQosV2W;
  PRpcSecurityQosV2 = PRpcSecurityQosV2W;

  RPC_HTTP_TRANSPORT_CREDENTIALS = RPC_HTTP_TRANSPORT_CREDENTIALS_W;
  {$EXTERNALSYM RPC_HTTP_TRANSPORT_CREDENTIALS}
  PRPC_HTTP_TRANSPORT_CREDENTIALS = PRPC_HTTP_TRANSPORT_CREDENTIALS_W;
  {$EXTERNALSYM PRPC_HTTP_TRANSPORT_CREDENTIALS}
  _RPC_HTTP_TRANSPORT_CREDENTIALS = _RPC_HTTP_TRANSPORT_CREDENTIALS_W;
  {$EXTERNALSYM _RPC_HTTP_TRANSPORT_CREDENTIALS}
  TRpcHttpTransportCredentials = TRpcHttpTransportCredentialsW;
  PRpcHttpTransportCredentials = PRpcHttpTransportCredentialsW;

  RPC_SECURITY_QOS_V3 = RPC_SECURITY_QOS_V3_W;
  {$EXTERNALSYM RPC_SECURITY_QOS_V3}
  PRPC_SECURITY_QOS_V3 = PRPC_SECURITY_QOS_V3_W;
  {$EXTERNALSYM PRPC_SECURITY_QOS_V3}
  _RPC_SECURITY_QOS_V3 = _RPC_SECURITY_QOS_V3_W;
  {$EXTERNALSYM _RPC_SECURITY_QOS_V3}
  TRpcSecurityQosV3 = TRpcSecurityQosV3W;
  PRpcSecurityQosV3 = PRpcSecurityQosV3W;

  {$ELSE}

  RPC_SECURITY_QOS_V2 = RPC_SECURITY_QOS_V2_A;
  {$EXTERNALSYM RPC_SECURITY_QOS_V2}
  PRPC_SECURITY_QOS_V2 = PRPC_SECURITY_QOS_V2_A;
  {$EXTERNALSYM PRPC_SECURITY_QOS_V2}
  _RPC_SECURITY_QOS_V2 = _RPC_SECURITY_QOS_V2_A;
  {$EXTERNALSYM _RPC_SECURITY_QOS_V2}
  TRpcSecurityQosV2 = TRpcSecurityQosV2A;
  PRpcSecurityQosV2 = PRpcSecurityQosV2A;

  RPC_HTTP_TRANSPORT_CREDENTIALS = RPC_HTTP_TRANSPORT_CREDENTIALS_A;
  {$EXTERNALSYM RPC_HTTP_TRANSPORT_CREDENTIALS}
  PRPC_HTTP_TRANSPORT_CREDENTIALS = PRPC_HTTP_TRANSPORT_CREDENTIALS_A;
  {$EXTERNALSYM PRPC_HTTP_TRANSPORT_CREDENTIALS}
  _RPC_HTTP_TRANSPORT_CREDENTIALS = _RPC_HTTP_TRANSPORT_CREDENTIALS_A;
  {$EXTERNALSYM _RPC_HTTP_TRANSPORT_CREDENTIALS}
  TRpcHttpTransportCredentials = TRpcHttpTransportCredentialsA;
  PRpcHttpTransportCredentials = PRpcHttpTransportCredentialsA;

  RPC_SECURITY_QOS_V3 = RPC_SECURITY_QOS_V3_A;
  {$EXTERNALSYM RPC_SECURITY_QOS_V3}
  PRPC_SECURITY_QOS_V3 = PRPC_SECURITY_QOS_V3_A;
  {$EXTERNALSYM PRPC_SECURITY_QOS_V3}
  _RPC_SECURITY_QOS_V3 = _RPC_SECURITY_QOS_V3_A;
  {$EXTERNALSYM _RPC_SECURITY_QOS_V3}
  TRpcSecurityQosV3 = TRpcSecurityQosV3A;
  PRpcSecurityQosV3 = PRpcSecurityQosV3A;

  {$ENDIF UNICODE}

type
  RPC_NEW_HTTP_PROXY_CHANNEL = function(ServerName: PWideChar; ServerPort: PWord; RemoteUser: PByte; out NewServerName: PWord): RPC_STATUS; stdcall;
  {$EXTERNALSYM RPC_NEW_HTTP_PROXY_CHANNEL}

  RPC_HTTP_PROXY_FREE_STRING = procedure(ServerName: PWideChar); stdcall;
  {$EXTERNALSYM RPC_HTTP_PROXY_FREE_STRING}

const
  RPC_C_AUTHZ_NONE    = 0;
  {$EXTERNALSYM RPC_C_AUTHZ_NONE}
  RPC_C_AUTHZ_NAME    = 1;
  {$EXTERNALSYM RPC_C_AUTHZ_NAME}
  RPC_C_AUTHZ_DCE     = 2;
  {$EXTERNALSYM RPC_C_AUTHZ_DCE}
  RPC_C_AUTHZ_DEFAULT = DWORD($ffffffff);
  {$EXTERNALSYM RPC_C_AUTHZ_DEFAULT}

function RpcImpersonateClient(BindingHandle: RPC_BINDING_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcImpersonateClient}

function RpcRevertToSelfEx(BindingHandle: RPC_BINDING_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcRevertToSelfEx}

function RpcRevertToSelf: RPC_STATUS; stdcall;
{$EXTERNALSYM RpcRevertToSelf}

function RpcBindingInqAuthClientA(ClientBinding: RPC_BINDING_HANDLE;
  Privs: PRPC_AUTHZ_HANDLE; ServerPrincName: PPAnsiChar; AuthnLevel, AuthnSvc,
  AuthzSvc: PCardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingInqAuthClientA}
function RpcBindingInqAuthClientW(ClientBinding: RPC_BINDING_HANDLE;
  Privs: PRPC_AUTHZ_HANDLE; ServerPrincName: PPWideChar; AuthnLevel, AuthnSvc,
  AuthzSvc: PCardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingInqAuthClientW}

function RpcBindingInqAuthClientExA(ClientBinding: RPC_BINDING_HANDLE;
  Privs: PRPC_AUTHZ_HANDLE; ServerPrincName: PPAnsiChar; AuthnLevel, AuthnSvc,
  AuthzSvc: PCardinal; Flags: Cardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingInqAuthClientExA}
function RpcBindingInqAuthClientExW(ClientBinding: RPC_BINDING_HANDLE;
  Privs: PRPC_AUTHZ_HANDLE; ServerPrincName: PPWideChar; AuthnLevel, AuthnSvc,
  AuthzSvc: PCardinal; Flags: Cardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingInqAuthClientExW}

function RpcBindingInqAuthInfoA(Binding: RPC_BINDING_HANDLE; ServerPrincName: PPAnsiChar;
  AuthnLevel, AuthnSvc: PCardinal; AuthIdentity: PRPC_AUTH_IDENTITY_HANDLE;
  AuthzSvc: PCardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingInqAuthInfoA}
function RpcBindingInqAuthInfoW(Binding: RPC_BINDING_HANDLE; ServerPrincName: PPWideChar;
  AuthnLevel, AuthnSvc: PCardinal; AuthIdentity: PRPC_AUTH_IDENTITY_HANDLE;
  AuthzSvc: PCardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingInqAuthInfoW}

function RpcBindingSetAuthInfoA(Binding: RPC_BINDING_HANDLE; ServerPrincName: PAnsiChar;
  AuthnLevel, AuthnSvc: Cardinal; AuthIdentity: RPC_AUTH_IDENTITY_HANDLE;
  AuthzSvc: Cardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingSetAuthInfoA}
function RpcBindingSetAuthInfoW(Binding: RPC_BINDING_HANDLE; ServerPrincName: PWideChar;
  AuthnLevel, AuthnSvc: Cardinal; AuthIdentity: RPC_AUTH_IDENTITY_HANDLE;
  AuthzSvc: Cardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingSetAuthInfoW}

function RpcBindingSetAuthInfoExA(Binding: RPC_BINDING_HANDLE;
  ServerPrincName: PAnsiChar; AuthnLevel, AuthnSvc: Cardinal;
  AuthIdentity: RPC_AUTH_IDENTITY_HANDLE; AuthzSvc: Cardinal;
  const SecurityQOS: RPC_SECURITY_QOS): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingSetAuthInfoExA}
function RpcBindingSetAuthInfoExW(Binding: RPC_BINDING_HANDLE;
  ServerPrincName: PWideChar; AuthnLevel, AuthnSvc: Cardinal;
  AuthIdentity: RPC_AUTH_IDENTITY_HANDLE; AuthzSvc: Cardinal;
  const SecurityQOS: RPC_SECURITY_QOS): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingSetAuthInfoExW}

function RpcBindingInqAuthInfoExA(Binding: RPC_BINDING_HANDLE;
  ServerPrincName: PPAnsiChar; AuthnLevel, AuthnSvc: PCardinal;
  AuthIdentity: PRPC_AUTH_IDENTITY_HANDLE; AuthzSvc: PCardinal;
  RpcQosVersion: Cardinal; var SecurityQOS: RPC_SECURITY_QOS): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingInqAuthInfoExA}
function RpcBindingInqAuthInfoExW(Binding: RPC_BINDING_HANDLE;
  ServerPrincName: PPWideChar; AuthnLevel, AuthnSvc: PCardinal;
  AuthIdentity: PRPC_AUTH_IDENTITY_HANDLE; AuthzSvc: PCardinal;
  RpcQosVersion: Cardinal; var SecurityQOS: RPC_SECURITY_QOS): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingInqAuthInfoExW}

type
  RPC_AUTH_KEY_RETRIEVAL_FN = procedure(Arg: Pointer; ServerPrincName: PWideChar;
    KeyVer: Cardinal; var Key: Pointer; var Status: RPC_STATUS); stdcall;
  {$EXTERNALSYM RPC_AUTH_KEY_RETRIEVAL_FN}
  TRpcAuthKeyRetrievalFn = RPC_AUTH_KEY_RETRIEVAL_FN;

function RpcServerRegisterAuthInfoA(ServerPrincName: PAnsiChar; AuthnSvc: Cardinal;
  GetKeyFn: RPC_AUTH_KEY_RETRIEVAL_FN; Arg: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerRegisterAuthInfoA}
function RpcServerRegisterAuthInfoW(ServerPrincName: PWideChar; AuthnSvc: Cardinal;
  GetKeyFn: RPC_AUTH_KEY_RETRIEVAL_FN; Arg: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerRegisterAuthInfoW}
function RpcBindingInqAuthClient(ClientBinding: RPC_BINDING_HANDLE;
  Privs: PRPC_AUTHZ_HANDLE; ServerPrincName: PPTSTR; AuthnLevel, AuthnSvc,
  AuthzSvc: PCardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingInqAuthClient}
function RpcBindingInqAuthClientEx(ClientBinding: RPC_BINDING_HANDLE;
  Privs: PRPC_AUTHZ_HANDLE; ServerPrincName: PPTSTR; AuthnLevel, AuthnSvc,
  AuthzSvc: PCardinal; Flags: Cardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingInqAuthClientEx}
function RpcBindingInqAuthInfo(Binding: RPC_BINDING_HANDLE; ServerPrincName: PPTSTR;
  AuthnLevel, AuthnSvc: PCardinal; AuthIdentity: PRPC_AUTH_IDENTITY_HANDLE;
  AuthzSvc: PCardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingInqAuthInfo}
function RpcBindingSetAuthInfo(Binding: RPC_BINDING_HANDLE; ServerPrincName: PTSTR;
  AuthnLevel, AuthnSvc: Cardinal; AuthIdentity: RPC_AUTH_IDENTITY_HANDLE;
  AuthzSvc: Cardinal): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingSetAuthInfo}
function RpcBindingSetAuthInfoEx(Binding: RPC_BINDING_HANDLE;
  ServerPrincName: PTSTR; AuthnLevel, AuthnSvc: Cardinal;
  AuthIdentity: RPC_AUTH_IDENTITY_HANDLE; AuthzSvc: Cardinal;
  const SecurityQOS: RPC_SECURITY_QOS): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingSetAuthInfoEx}
function RpcBindingInqAuthInfoEx(Binding: RPC_BINDING_HANDLE;
  ServerPrincName: PPTSTR; AuthnLevel, AuthnSvc: PCardinal;
  AuthIdentity: PRPC_AUTH_IDENTITY_HANDLE; AuthzSvc: PCardinal;
  RpcQosVersion: Cardinal; var SecurityQOS: RPC_SECURITY_QOS): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingInqAuthInfoEx}
function RpcServerRegisterAuthInfo(ServerPrincName: PTSTR; AuthnSvc: Cardinal;
  GetKeyFn: RPC_AUTH_KEY_RETRIEVAL_FN; Arg: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerRegisterAuthInfo}

type
  RPC_CLIENT_INFORMATION1 = record
    UserName: PAnsiChar;
    ComputerName: PAnsiChar;
    Privilege: Word;
    AuthFlags: Longword;
  end;
  {$EXTERNALSYM RPC_CLIENT_INFORMATION1}
  PRPC_CLIENT_INFORMATION1 = ^RPC_CLIENT_INFORMATION1;
  {$EXTERNALSYM PRPC_CLIENT_INFORMATION1}
  TRpcClientInformation1 = RPC_CLIENT_INFORMATION1;
  PRpcClientInformation1 = PRPC_CLIENT_INFORMATION1;

function RpcBindingServerFromClient(ClientBinding: RPC_BINDING_HANDLE;
  var ServerBinding: RPC_BINDING_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcBindingServerFromClient}

procedure RpcRaiseException(exception: RPC_STATUS); stdcall;
{$EXTERNALSYM RpcRaiseException}

function RpcTestCancel: RPC_STATUS; stdcall;
{$EXTERNALSYM RpcTestCancel}

function RpcServerTestCancel(BindingHandle: RPC_BINDING_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcServerTestCancel}

function RpcCancelThread(Thread: Pointer): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcCancelThread}

function RpcCancelThreadEx(Thread: Pointer; Timeout: Longint): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcCancelThreadEx}

function UuidCreate(var Uuid: UUID): RPC_STATUS; stdcall;
{$EXTERNALSYM UuidCreate}

function UuidCreateSequential(out Uuid: UUID): RPC_STATUS; stdcall;
{$EXTERNALSYM UuidCreateSequential}

function UuidFromStringA(StringUuid: PAnsiChar; var Uuid: UUID): RPC_STATUS; stdcall;
{$EXTERNALSYM UuidFromStringA}
function UuidFromStringW(StringUuid: PWideChar; var Uuid: UUID): RPC_STATUS; stdcall;
{$EXTERNALSYM UuidFromStringW}
function UuidFromString(StringUuid: PTSTR; var Uuid: UUID): RPC_STATUS; stdcall;
{$EXTERNALSYM UuidFromString}

function UuidToStringA(const Uuid: UUID; var StringUuid: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM UuidToStringA}
function UuidToStringW(const Uuid: UUID; var StringUuid: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM UuidToStringW}
function UuidToString(const Uuid: UUID; var StringUuid: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM UuidToString}

function UuidCompare(const Uuid1, Uuid2: UUID; var Status: RPC_STATUS): Integer; stdcall;
{$EXTERNALSYM UuidCompare}

function UuidCreateNil(var NilUuid: UUID): RPC_STATUS; stdcall;
{$EXTERNALSYM UuidCreateNil}

function UuidEqual(const Uuid1, Uuid2: UUID; var Status: RPC_STATUS): Integer; stdcall;
{$EXTERNALSYM UuidEqual}

function UuidHash(const Uuid: UUID; var Status: RPC_STATUS): Word; stdcall;
{$EXTERNALSYM UuidHash}

function UuidIsNil(const Uuid: UUID; var Status: RPC_STATUS): Integer; stdcall;
{$EXTERNALSYM UuidIsNil}

function RpcEpRegisterNoReplaceA(IfSpec: RPC_IF_HANDLE;
  BindingVector: PRPC_BINDING_VECTOR; UuidVector: PUUID_VECTOR;
  Annotation: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcEpRegisterNoReplaceA}
function RpcEpRegisterNoReplaceW(IfSpec: RPC_IF_HANDLE;
  BindingVector: PRPC_BINDING_VECTOR; UuidVector: PUUID_VECTOR;
  Annotation: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcEpRegisterNoReplaceW}
function RpcEpRegisterNoReplace(IfSpec: RPC_IF_HANDLE;
  BindingVector: PRPC_BINDING_VECTOR; UuidVector: PUUID_VECTOR;
  Annotation: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcEpRegisterNoReplace}

function RpcEpRegisterA(IfSpec: RPC_IF_HANDLE; BindingVector: PRPC_BINDING_VECTOR;
  UuidVector: PUUID_VECTOR; Annotation: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcEpRegisterA}
function RpcEpRegisterW(IfSpec: RPC_IF_HANDLE; BindingVector: PRPC_BINDING_VECTOR;
  UuidVector: PUUID_VECTOR; Annotation: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcEpRegisterW}

function RpcEpRegister(IfSpec: RPC_IF_HANDLE; BindingVector: PRPC_BINDING_VECTOR;
  UuidVector: PUUID_VECTOR; Annotation: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcEpRegister}

function RpcEpUnregister(IfSpec: RPC_IF_HANDLE; BindingVector: PRPC_BINDING_VECTOR;
  UuidVector: UUID_VECTOR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcEpUnregister}

function DceErrorInqTextA(RpcStatus: RPC_STATUS; ErrorText: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM DceErrorInqTextA}
function DceErrorInqTextW(RpcStatus: RPC_STATUS; ErrorText: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM DceErrorInqTextW}
function DceErrorInqText(RpcStatus: RPC_STATUS; ErrorText: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM DceErrorInqText}

const
  DCE_C_ERROR_STRING_LEN = 256;
  {$EXTERNALSYM DCE_C_ERROR_STRING_LEN}

type
  RPC_EP_INQ_HANDLE = ^I_RPC_HANDLE;
  {$EXTERNALSYM RPC_EP_INQ_HANDLE}

const
  RPC_C_EP_ALL_ELTS      = 0;
  {$EXTERNALSYM RPC_C_EP_ALL_ELTS}
  RPC_C_EP_MATCH_BY_IF   = 1;
  {$EXTERNALSYM RPC_C_EP_MATCH_BY_IF}
  RPC_C_EP_MATCH_BY_OBJ  = 2;
  {$EXTERNALSYM RPC_C_EP_MATCH_BY_OBJ}
  RPC_C_EP_MATCH_BY_BOTH = 3;
  {$EXTERNALSYM RPC_C_EP_MATCH_BY_BOTH}

  RPC_C_VERS_ALL        = 1;
  {$EXTERNALSYM RPC_C_VERS_ALL}
  RPC_C_VERS_COMPATIBLE = 2;
  {$EXTERNALSYM RPC_C_VERS_COMPATIBLE}
  RPC_C_VERS_EXACT      = 3;
  {$EXTERNALSYM RPC_C_VERS_EXACT}
  RPC_C_VERS_MAJOR_ONLY = 4;
  {$EXTERNALSYM RPC_C_VERS_MAJOR_ONLY}
  RPC_C_VERS_UPTO       = 5;
  {$EXTERNALSYM RPC_C_VERS_UPTO}

function RpcMgmtEpEltInqBegin(EpBinding: RPC_BINDING_HANDLE; InquiryType: Cardinal;
  IfId: PRPC_IF_ID; VersOption: Cardinal; ObjectUuid: PUUID;
  var InquiryContext: RPC_EP_INQ_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtEpEltInqBegin}

function RpcMgmtEpEltInqDone(var InquiryContext: RPC_EP_INQ_HANDLE): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtEpEltInqDone}

function RpcMgmtEpEltInqNextA(InquiryContext: RPC_EP_INQ_HANDLE; var IfId: RPC_IF_ID;
  Binding: PRPC_BINDING_HANDLE; ObjectUuid: PUUID; var Annotation: PAnsiChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtEpEltInqNextA}
function RpcMgmtEpEltInqNextW(InquiryContext: RPC_EP_INQ_HANDLE; var IfId: RPC_IF_ID;
  Binding: PRPC_BINDING_HANDLE; ObjectUuid: PUUID; var Annotation: PWideChar): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtEpEltInqNextW}
function RpcMgmtEpEltInqNext(InquiryContext: RPC_EP_INQ_HANDLE; var IfId: RPC_IF_ID;
  Binding: PRPC_BINDING_HANDLE; ObjectUuid: PUUID; var Annotation: PTSTR): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtEpEltInqNext}

function RpcMgmtEpUnregister(EpBinding: RPC_BINDING_HANDLE; IfId: PRPC_IF_ID;
  Binding: RPC_BINDING_HANDLE; ObjectUuid : PUUID): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtEpUnregister}

type
  RPC_MGMT_AUTHORIZATION_FN = function(ClientBinding: RPC_BINDING_HANDLE;
    RequestedMgmtOperation: Cardinal; var Status: RPC_STATUS): Integer; stdcall;
  {$EXTERNALSYM RPC_MGMT_AUTHORIZATION_FN}
  TRpcMgmtAuthorizationFn = RPC_MGMT_AUTHORIZATION_FN;

const
  RPC_C_MGMT_INQ_IF_IDS         = 0;
  {$EXTERNALSYM RPC_C_MGMT_INQ_IF_IDS}
  RPC_C_MGMT_INQ_PRINC_NAME     = 1;
  {$EXTERNALSYM RPC_C_MGMT_INQ_PRINC_NAME}
  RPC_C_MGMT_INQ_STATS          = 2;
  {$EXTERNALSYM RPC_C_MGMT_INQ_STATS}
  RPC_C_MGMT_IS_SERVER_LISTEN   = 3;
  {$EXTERNALSYM RPC_C_MGMT_IS_SERVER_LISTEN}
  RPC_C_MGMT_STOP_SERVER_LISTEN = 4;
  {$EXTERNALSYM RPC_C_MGMT_STOP_SERVER_LISTEN}

function RpcMgmtSetAuthorizationFn(AuthorizationFn: RPC_MGMT_AUTHORIZATION_FN): RPC_STATUS; stdcall;
{$EXTERNALSYM RpcMgmtSetAuthorizationFn}

const
  RPC_C_PARM_MAX_PACKET_LENGTH = 1;
  {$EXTERNALSYM RPC_C_PARM_MAX_PACKET_LENGTH}
  RPC_C_PARM_BUFFER_LENGTH     = 2;
  {$EXTERNALSYM RPC_C_PARM_BUFFER_LENGTH}

  RPC_IF_AUTOLISTEN              = $0001;
  {$EXTERNALSYM RPC_IF_AUTOLISTEN}
  RPC_IF_OLE                     = $0002;
  {$EXTERNALSYM RPC_IF_OLE}
  RPC_IF_ALLOW_UNKNOWN_AUTHORITY = $0004;
  {$EXTERNALSYM RPC_IF_ALLOW_UNKNOWN_AUTHORITY}
  RPC_IF_ALLOW_SECURE_ONLY       = $0008;
  {$EXTERNALSYM RPC_IF_ALLOW_SECURE_ONLY}
  RPC_IF_ALLOW_CALLBACKS_WITH_NO_AUTH = $0010;
  {$EXTERNALSYM RPC_IF_ALLOW_CALLBACKS_WITH_NO_AUTH}

{$ENDIF JWA_IMPLEMENTATIONSECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
implementation
//uses ...
{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_INTERFACESECTION}

{$IFNDEF JWA_INCLUDEMODE}
const
  rpclib = 'rpcrt4.dll';
  {$IFDEF UNICODE}
  AWSuffix = 'W';
  {$ELSE}
  AWSuffix = 'A';
  {$ENDIF UNICODE}
{$ENDIF JWA_INCLUDEMODE}

function I_RpcBindingIsClientLocal; external rpclib name 'I_RpcBindingIsClientLocal' delayed;
function RpcBindingCopy; external rpclib name 'RpcBindingCopy' delayed;
function RpcBindingFree; external rpclib name 'RpcBindingFree' delayed;
function RpcBindingSetOption; external rpclib name 'RpcBindingSetOption' delayed;
function RpcBindingInqOption; external rpclib name 'RpcBindingInqOption' delayed;
function RpcBindingFromStringBindingA; external rpclib name 'RpcBindingFromStringBindingA' delayed;
function RpcBindingFromStringBindingW; external rpclib name 'RpcBindingFromStringBindingW' delayed;
function RpcBindingFromStringBinding; external rpclib name 'RpcBindingFromStringBinding' + AWSuffix delayed;
function RpcSsGetContextBinding; external rpclib name 'RpcSsGetContextBinding' delayed;
function RpcBindingInqObject; external rpclib name 'RpcBindingInqObject' delayed;
function RpcBindingReset; external rpclib name 'RpcBindingReset' delayed;
function RpcBindingSetObject; external rpclib name 'RpcBindingSetObject' delayed;
function RpcMgmtInqDefaultProtectLevel; external rpclib name 'RpcMgmtInqDefaultProtectLevel' delayed;
function RpcBindingToStringBindingA; external rpclib name 'RpcBindingToStringBindingA' delayed;
function RpcBindingToStringBindingW; external rpclib name 'RpcBindingToStringBindingW' delayed;
function RpcBindingToStringBinding; external rpclib name 'RpcBindingToStringBinding' + AWSuffix delayed;
function RpcBindingVectorFree; external rpclib name 'RpcBindingVectorFree' delayed;
function RpcStringBindingComposeA; external rpclib name 'RpcStringBindingComposeA' delayed;
function RpcStringBindingComposeW; external rpclib name 'RpcStringBindingComposeW' delayed;
function RpcStringBindingCompose; external rpclib name 'RpcStringBindingCompose' + AWSuffix delayed;
function RpcStringBindingParseA; external rpclib name 'RpcStringBindingParseA' delayed;
function RpcStringBindingParseW; external rpclib name 'RpcStringBindingParseW' delayed;
function RpcStringBindingParse; external rpclib name 'RpcStringBindingParse' + AWSuffix delayed;
function RpcStringFreeA; external rpclib name 'RpcStringFreeA' delayed;
function RpcStringFreeW; external rpclib name 'RpcStringFreeW' delayed;
function RpcStringFree; external rpclib name 'RpcStringFree' + AWSuffix delayed;
function RpcIfInqId; external rpclib name 'RpcIfInqId' delayed;
function RpcNetworkIsProtseqValidA; external rpclib name 'RpcNetworkIsProtseqValidA' delayed;
function RpcNetworkIsProtseqValidW; external rpclib name 'RpcNetworkIsProtseqValidW' delayed;
function RpcMgmtInqComTimeout; external rpclib name 'RpcMgmtInqComTimeout' delayed;
function RpcMgmtSetComTimeout; external rpclib name 'RpcMgmtSetComTimeout' delayed;
function RpcMgmtSetCancelTimeout; external rpclib name 'RpcMgmtSetCancelTimeout' delayed;
function RpcNetworkInqProtseqsA; external rpclib name 'RpcNetworkInqProtseqsA' delayed;
function RpcNetworkInqProtseqsW; external rpclib name 'RpcNetworkInqProtseqsW' delayed;
function RpcNetworkInqProtseqs; external rpclib name 'RpcNetworkInqProtseqs' + AWSuffix delayed;
function RpcObjectInqType; external rpclib name 'RpcObjectInqType' delayed;
function RpcObjectSetInqFn; external rpclib name 'RpcObjectSetInqFn' delayed;
function RpcObjectSetType; external rpclib name 'RpcObjectSetType' delayed;
function RpcProtseqVectorFreeA; external rpclib name 'RpcProtseqVectorFreeA' delayed;
function RpcProtseqVectorFreeW; external rpclib name 'RpcProtseqVectorFreeW' delayed;
function RpcProtseqVectorFree; external rpclib name 'RpcProtseqVectorFree' + AWSuffix delayed;
function RpcServerInqBindings; external rpclib name 'RpcServerInqBindings' delayed;
function RpcServerInqIf; external rpclib name 'RpcServerInqIf' delayed;
function RpcServerListen; external rpclib name 'RpcServerListen' delayed;
function RpcServerRegisterIf; external rpclib name 'RpcServerRegisterIf' delayed;
function RpcServerRegisterIfEx; external rpclib name 'RpcServerRegisterIfEx' delayed;
function RpcServerRegisterIf2; external rpclib name 'RpcServerRegisterIf2' delayed;
function RpcServerUnregisterIf; external rpclib name 'RpcServerUnregisterIf' delayed;
function RpcServerUnregisterIfEx; external rpclib name 'RpcServerUnregisterIfEx' delayed;
function RpcServerUseAllProtseqs; external rpclib name 'RpcServerUseAllProtseqs' delayed;
function RpcServerUseAllProtseqsEx; external rpclib name 'RpcServerUseAllProtseqsEx' delayed;
function RpcServerUseAllProtseqsIf; external rpclib name 'RpcServerUseAllProtseqsIf' delayed;
function RpcServerUseAllProtseqsIfEx; external rpclib name 'RpcServerUseAllProtseqsIfEx' delayed;
function RpcServerUseProtseqA; external rpclib name 'RpcServerUseProtseqA' delayed;
function RpcServerUseProtseqW; external rpclib name 'RpcServerUseProtseqW' delayed;
function RpcServerUseProtseq; external rpclib name 'RpcServerUseProtseq' + AWSuffix delayed;
function RpcServerUseProtseqExA; external rpclib name 'RpcServerUseProtseqExA' delayed;
function RpcServerUseProtseqExW; external rpclib name 'RpcServerUseProtseqExW' delayed;
function RpcServerUseProtseqEx; external rpclib name 'RpcServerUseProtseqEx' + AWSuffix delayed;
function RpcServerUseProtseqEpA; external rpclib name 'RpcServerUseProtseqEpA' delayed;
function RpcServerUseProtseqEpW; external rpclib name 'RpcServerUseProtseqEpW' delayed;
function RpcServerUseProtseqEp; external rpclib name 'RpcServerUseProtseqEp' + AWSuffix delayed;
function RpcServerUseProtseqEpExA; external rpclib name 'RpcServerUseProtseqEpExA' delayed;
function RpcServerUseProtseqEpExW; external rpclib name 'RpcServerUseProtseqEpExW' delayed;
function RpcServerUseProtseqEpEx; external rpclib name 'RpcServerUseProtseqEpEx' + AWSuffix delayed;
function RpcServerUseProtseqIfA; external rpclib name 'RpcServerUseProtseqIfA' delayed;
function RpcServerUseProtseqIfW; external rpclib name 'RpcServerUseProtseqIfW' delayed;
function RpcServerUseProtseqIfExA; external rpclib name 'RpcServerUseProtseqIfExA' delayed;
function RpcServerUseProtseqIfExW; external rpclib name 'RpcServerUseProtseqIfExW' delayed;
function RpcServerUseProtseqIfEx; external rpclib name 'RpcServerUseProtseqIfEx' + AWSuffix delayed;
procedure RpcServerYield; external rpclib name 'RpcServerYield' delayed;
function RpcMgmtStatsVectorFree; external rpclib name 'RpcMgmtStatsVectorFree' delayed;
function RpcMgmtInqStats; external rpclib name 'RpcMgmtInqStats' delayed;
function RpcMgmtIsServerListening; external rpclib name 'RpcMgmtIsServerListening' delayed;
function RpcMgmtStopServerListening; external rpclib name 'RpcMgmtStopServerListening' delayed;
function RpcMgmtWaitServerListen; external rpclib name 'RpcMgmtWaitServerListen' delayed;
function RpcMgmtSetServerStackSize; external rpclib name 'RpcMgmtSetServerStackSize' delayed;
procedure RpcSsDontSerializeContext; external rpclib name 'RpcSsDontSerializeContext' delayed;
function RpcMgmtEnableIdleCleanup; external rpclib name 'RpcMgmtEnableIdleCleanup' delayed;
function RpcMgmtInqIfIds; external rpclib name 'RpcMgmtInqIfIds' delayed;
function RpcIfIdVectorFree; external rpclib name 'RpcIfIdVectorFree' delayed;
function RpcMgmtInqServerPrincNameA; external rpclib name 'RpcMgmtInqServerPrincNameA' delayed;
function RpcMgmtInqServerPrincNameW; external rpclib name 'RpcMgmtInqServerPrincNameW' delayed;
function RpcMgmtInqServerPrincName; external rpclib name 'RpcMgmtInqServerPrincName' + AWSuffix delayed;
function RpcServerInqDefaultPrincNameA; external rpclib name 'RpcServerInqDefaultPrincNameA' delayed;
function RpcServerInqDefaultPrincNameW; external rpclib name 'RpcServerInqDefaultPrincNameW' delayed;
function RpcServerInqDefaultPrincName; external rpclib name 'RpcServerInqDefaultPrincName' + AWSuffix delayed;
function RpcEpResolveBinding; external rpclib name 'RpcEpResolveBinding' delayed;
function RpcNsBindingInqEntryNameA; external rpclib name 'RpcNsBindingInqEntryNameA' delayed;
function RpcNsBindingInqEntryNameW; external rpclib name 'RpcNsBindingInqEntryNameW' delayed;
function RpcNsBindingInqEntryName; external rpclib name 'RpcNsBindingInqEntryName' + AWSuffix delayed;
function RpcImpersonateClient; external rpclib name 'RpcImpersonateClient' delayed;
function RpcRevertToSelfEx; external rpclib name 'RpcRevertToSelfEx' delayed;
function RpcRevertToSelf; external rpclib name 'RpcRevertToSelf' delayed;
function RpcBindingInqAuthClientA; external rpclib name 'RpcBindingInqAuthClientA' delayed;
function RpcBindingInqAuthClientW; external rpclib name 'RpcBindingInqAuthClientW' delayed;
function RpcBindingInqAuthClientExA; external rpclib name 'RpcBindingInqAuthClientExA' delayed;
function RpcBindingInqAuthClientExW; external rpclib name 'RpcBindingInqAuthClientExW' delayed;
function RpcBindingInqAuthInfoA; external rpclib name 'RpcBindingInqAuthInfoA' delayed;
function RpcBindingInqAuthInfoW; external rpclib name 'RpcBindingInqAuthInfoW' delayed;
function RpcBindingSetAuthInfoA; external rpclib name 'RpcBindingSetAuthInfoA' delayed;
function RpcBindingSetAuthInfoW; external rpclib name 'RpcBindingSetAuthInfoW' delayed;
function RpcBindingSetAuthInfoExA; external rpclib name 'RpcBindingSetAuthInfoExA' delayed;
function RpcBindingSetAuthInfoExW; external rpclib name 'RpcBindingSetAuthInfoExW' delayed;
function RpcBindingInqAuthInfoExA; external rpclib name 'RpcBindingInqAuthInfoExA' delayed;
function RpcBindingInqAuthInfoExW; external rpclib name 'RpcBindingInqAuthInfoExW' delayed;
function RpcServerRegisterAuthInfoA; external rpclib name 'RpcServerRegisterAuthInfoA' delayed;
function RpcServerRegisterAuthInfoW; external rpclib name 'RpcServerRegisterAuthInfoW' delayed;
function RpcBindingInqAuthClient; external rpclib name 'RpcBindingInqAuthClient' + AWSuffix delayed;
function RpcBindingInqAuthClientEx; external rpclib name 'RpcBindingInqAuthClientEx' + AWSuffix delayed;
function RpcBindingInqAuthInfo; external rpclib name 'RpcBindingInqAuthInfo' + AWSuffix delayed;
function RpcBindingSetAuthInfo; external rpclib name 'RpcBindingSetAuthInfo' + AWSuffix delayed;
function RpcBindingSetAuthInfoEx; external rpclib name 'RpcBindingSetAuthInfoEx' + AWSuffix delayed;
function RpcBindingInqAuthInfoEx; external rpclib name 'RpcBindingInqAuthInfoEx' + AWSuffix delayed;
function RpcServerRegisterAuthInfo; external rpclib name 'RpcServerRegisterAuthInfo' + AWSuffix delayed;
function RpcBindingServerFromClient; external rpclib name 'RpcBindingServerFromClient' delayed;
procedure RpcRaiseException; external rpclib name 'RpcRaiseException' delayed;
function RpcTestCancel; external rpclib name 'RpcTestCancel' delayed;
function RpcServerTestCancel; external rpclib name 'RpcServerTestCancel' delayed;
function RpcCancelThread; external rpclib name 'RpcCancelThread' delayed;
function RpcCancelThreadEx; external rpclib name 'RpcCancelThreadEx' delayed;
function UuidCreate; external rpclib name 'UuidCreate' delayed;
function UuidCreateSequential; external rpclib name 'UuidCreateSequential' delayed;
function UuidFromStringA; external rpclib name 'UuidFromStringA' delayed;
function UuidFromStringW; external rpclib name 'UuidFromStringW' delayed;
function UuidFromString; external rpclib name 'UuidFromString' + AWSuffix delayed;
function UuidToStringA; external rpclib name 'UuidToStringA' delayed;
function UuidToStringW; external rpclib name 'UuidToStringW' delayed;
function UuidToString; external rpclib name 'UuidToString' + AWSuffix delayed;
function UuidCompare; external rpclib name 'UuidCompare' delayed;
function UuidCreateNil; external rpclib name 'UuidCreateNil' delayed;
function UuidEqual; external rpclib name 'UuidEqual' delayed;
function UuidHash; external rpclib name 'UuidHash' delayed;
function UuidIsNil; external rpclib name 'UuidIsNil' delayed;
function RpcEpRegisterNoReplaceA; external rpclib name 'RpcEpRegisterNoReplaceA' delayed;
function RpcEpRegisterNoReplaceW; external rpclib name 'RpcEpRegisterNoReplaceW' delayed;
function RpcEpRegisterNoReplace; external rpclib name 'RpcEpRegisterNoReplace' + AWSuffix delayed;
function RpcEpRegisterA; external rpclib name 'RpcEpRegisterA' delayed;
function RpcEpRegisterW; external rpclib name 'RpcEpRegisterW' delayed;
function RpcEpRegister; external rpclib name 'RpcEpRegister' + AWSuffix delayed;
function RpcEpUnregister; external rpclib name 'RpcEpUnregister' delayed;
function DceErrorInqTextA; external rpclib name 'DceErrorInqTextA' delayed;
function DceErrorInqTextW; external rpclib name 'DceErrorInqTextW' delayed;
function DceErrorInqText; external rpclib name 'DceErrorInqText' + AWSuffix delayed;
function RpcMgmtEpEltInqBegin; external rpclib name 'RpcMgmtEpEltInqBegin' delayed;
function RpcMgmtEpEltInqDone; external rpclib name 'RpcMgmtEpEltInqDone' delayed;
function RpcMgmtEpEltInqNextA; external rpclib name 'RpcMgmtEpEltInqNextA' delayed;
function RpcMgmtEpEltInqNextW; external rpclib name 'RpcMgmtEpEltInqNextW' delayed;
function RpcMgmtEpEltInqNext; external rpclib name 'RpcMgmtEpEltInqNext' + AWSuffix delayed;
function RpcMgmtEpUnregister; external rpclib name 'RpcMgmtEpUnregister' delayed;
function RpcMgmtSetAuthorizationFn; external rpclib name 'RpcMgmtSetAuthorizationFn' delayed;

{$ENDIF JWA_INTERFACESECTION}


{$IFNDEF JWA_OMIT_SECTIONS}
end.
{$ENDIF JWA_OMIT_SECTIONS}
