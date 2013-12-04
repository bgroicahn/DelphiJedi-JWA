{******************************************************************************}
{                                                                              }
{ Access Control API interface Unit for Object Pascal                          }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2001 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The original file is: aclapi.h, released June 2000. The original Pascal      }
{ code is: AclApi.pas, released December 2000. The initial developer of the    }
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

// $Id: JwaAclApi.pas,v 1.11 2007/09/05 11:58:48 dezipaitor Exp $
{$IFNDEF JWA_OMIT_SECTIONS}
unit JwaAclApi;

{$WEAKPACKAGEUNIT}
{$ENDIF JWA_OMIT_SECTIONS}

{$HPPEMIT ''}
{$HPPEMIT '#include "aclapi.h"'}
{$HPPEMIT ''}

{$IFNDEF JWA_OMIT_SECTIONS}
{$I ..\Includes\JediAPILib.inc}

interface

uses
  JwaAccCtrl, JwaWinNT, JwaWinType;
{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_IMPLEMENTATIONSECTION}


{$IFNDEF JWA_INCLUDEMODE}
//
// Progress Function:
// Caller of tree operation implements this Progress function, then
// passes its function pointer to tree operation.
// Tree operation invokes Progress function to provide progress and error
// information to the caller during the potentially long execution
// of the tree operation.  Tree operation provides the name of the object
// last processed and the error status of the operation on that object.
// Tree operation also passes the current InvokeSetting value.
// Caller may change the InvokeSetting value, for example, from "Always"
// to "Only On Error."
//


type
  FN_PROGRESS = procedure(
    pObjectName: LPWSTR;    // name of object just processed
    Status: DWORD;          // status of operation on object
    var pInvokeSetting: PPROG_INVOKE_SETTING; // Never, always,
    Args: PVOID;            // Caller specific data
    SecuritySet: BOOL       // Whether security was set
    ); stdcall;
  {$EXTERNALSYM FN_PROGRESS}
  TFnProgress = FN_PROGRESS;
{$ENDIF JWA_INCLUDEMODE}  

function SetEntriesInAclA(cCountOfExplicitEntries: ULONG;
  pListOfExplicitEntries: PEXPLICIT_ACCESS_A; OldAcl: PACL;
  var NewAcl: PACL): DWORD; stdcall;
{$EXTERNALSYM SetEntriesInAclA}
function SetEntriesInAclW(cCountOfExplicitEntries: ULONG;
  pListOfExplicitEntries: PEXPLICIT_ACCESS_W; OldAcl: PACL;
  var NewAcl: PACL): DWORD; stdcall;
{$EXTERNALSYM SetEntriesInAclW}
function SetEntriesInAcl(cCountOfExplicitEntries: ULONG;
  pListOfExplicitEntries: PEXPLICIT_ACCESS; OldAcl: PACL;
  var NewAcl: PACL): DWORD; stdcall;
{$EXTERNALSYM SetEntriesInAcl}

function GetExplicitEntriesFromAclA(pacl: PACL; var pcCountOfExplicitEntries: ULONG;
  var pListOfExplicitEntries: PEXPLICIT_ACCESS_A): DWORD; stdcall;
{$EXTERNALSYM GetExplicitEntriesFromAclA}
function GetExplicitEntriesFromAclW(pacl: PACL; var pcCountOfExplicitEntries: ULONG;
  var pListOfExplicitEntries: PEXPLICIT_ACCESS_W): DWORD; stdcall;
{$EXTERNALSYM GetExplicitEntriesFromAclW}
function GetExplicitEntriesFromAcl(pacl: PACL; var pcCountOfExplicitEntries: ULONG;
  var pListOfExplicitEntries: PEXPLICIT_ACCESS): DWORD; stdcall;
{$EXTERNALSYM GetExplicitEntriesFromAcl}

function GetEffectiveRightsFromAclA(pacl: PACL; pTrustee: PTRUSTEE_A;
  var pAccessRights: ACCESS_MASK): DWORD; stdcall;
{$EXTERNALSYM GetEffectiveRightsFromAclA}
function GetEffectiveRightsFromAclW(pacl: PACL; pTrustee: PTRUSTEE_W;
  var pAccessRights: ACCESS_MASK): DWORD; stdcall;
{$EXTERNALSYM GetEffectiveRightsFromAclW}
function GetEffectiveRightsFromAcl(pacl: PACL; pTrustee: PTRUSTEE;
  var pAccessRights: ACCESS_MASK): DWORD; stdcall;
{$EXTERNALSYM GetEffectiveRightsFromAcl}

function GetAuditedPermissionsFromAclA(pacl: PACL; pTrustee: PTRUSTEE_A;
  var pSuccessfulAuditedRights, pFailedAuditRights: ACCESS_MASK): DWORD; stdcall;
{$EXTERNALSYM GetAuditedPermissionsFromAclA}
function GetAuditedPermissionsFromAclW(pacl: PACL; pTrustee: PTRUSTEE_W;
  var pSuccessfulAuditedRights, pFailedAuditRights: ACCESS_MASK): DWORD; stdcall;
{$EXTERNALSYM GetAuditedPermissionsFromAclW}
function GetAuditedPermissionsFromAcl(pacl: PACL; pTrustee: PTRUSTEE;
  var pSuccessfulAuditedRights, pFailedAuditRights: ACCESS_MASK): DWORD; stdcall;
{$EXTERNALSYM GetAuditedPermissionsFromAcl}

function GetNamedSecurityInfoA(pObjectName: LPSTR; ObjectType: SE_OBJECT_TYPE;
  SecurityInfo: SECURITY_INFORMATION; ppsidOwner, ppsidGroup: PPSID; ppDacl,
  ppSacl: PPACL; var ppSecurityDescriptor: PSECURITY_DESCRIPTOR): DWORD; stdcall;
{$EXTERNALSYM GetNamedSecurityInfoA}
function GetNamedSecurityInfoW(pObjectName: LPWSTR; ObjectType: SE_OBJECT_TYPE;
  SecurityInfo: SECURITY_INFORMATION; ppsidOwner, ppsidGroup: PPSID; ppDacl,
  ppSacl: PPACL; var ppSecurityDescriptor: PSECURITY_DESCRIPTOR): DWORD; stdcall;
{$EXTERNALSYM GetNamedSecurityInfoW}
function GetNamedSecurityInfo(pObjectName: LPTSTR; ObjectType: SE_OBJECT_TYPE;
  SecurityInfo: SECURITY_INFORMATION; ppsidOwner, ppsidGroup: PPSID; ppDacl,
  ppSacl: PPACL; var ppSecurityDescriptor: PSECURITY_DESCRIPTOR): DWORD; stdcall;
{$EXTERNALSYM GetNamedSecurityInfo}

function GetSecurityInfo(handle: HANDLE; ObjectType: SE_OBJECT_TYPE;
  SecurityInfo: SECURITY_INFORMATION; ppsidOwner: PPSID; ppsidGroup: PPSID;
  ppDacl, ppSacl: PPACL; var ppSecurityDescriptor: PSECURITY_DESCRIPTOR): DWORD; stdcall;
{$EXTERNALSYM GetSecurityInfo}

function SetNamedSecurityInfoA(pObjectName: LPSTR; ObjectType: SE_OBJECT_TYPE;
  SecurityInfo: SECURITY_INFORMATION; psidOwner, psidGroup: PSID;
  pDacl, pSacl: PACL): DWORD; stdcall;
{$EXTERNALSYM SetNamedSecurityInfoA}
function SetNamedSecurityInfoW(pObjectName: LPWSTR; ObjectType: SE_OBJECT_TYPE;
  SecurityInfo: SECURITY_INFORMATION; psidOwner, psidGroup: PSID;
  pDacl, pSacl: PACL): DWORD; stdcall;
{$EXTERNALSYM SetNamedSecurityInfoW}
function SetNamedSecurityInfo(pObjectName: LPTSTR; ObjectType: SE_OBJECT_TYPE;
  SecurityInfo: SECURITY_INFORMATION; psidOwner, psidGroup: PSID;
  pDacl, pSacl: PACL): DWORD; stdcall;
{$EXTERNALSYM SetNamedSecurityInfo}

function SetSecurityInfo(handle: HANDLE; ObjectType: SE_OBJECT_TYPE;
  SecurityInfo: SECURITY_INFORMATION; psidOwner, psidGroup: PSID;
  pDacl, pSacl: PACL): DWORD; stdcall;
{$EXTERNALSYM SetSecurityInfo}

function GetInheritanceSourceA(pObjectName: LPSTR; ObjectType: SE_OBJECT_TYPE;
  SecurityInfo: SECURITY_INFORMATION; Container: BOOL; pObjectClassGuids: LPGUID;
  GuidCount: DWORD; pAcl: PACL; pfnArray: PFN_OBJECT_MGR_FUNCTS;
  pGenericMapping: PGENERIC_MAPPING; pInheritArray: PINHERITED_FROMA): DWORD; stdcall;
{$EXTERNALSYM GetInheritanceSourceA}
function GetInheritanceSourceW(pObjectName: LPWSTR; ObjectType: SE_OBJECT_TYPE;
  SecurityInfo: SECURITY_INFORMATION; Container: BOOL; pObjectClassGuids: LPGUID;
  GuidCount: DWORD; pAcl: PACL; pfnArray: PFN_OBJECT_MGR_FUNCTS;
  pGenericMapping: PGENERIC_MAPPING; pInheritArray: PINHERITED_FROMW): DWORD; stdcall;
{$EXTERNALSYM GetInheritanceSourceW}
function GetInheritanceSource(pObjectName: LPTSTR; ObjectType: SE_OBJECT_TYPE;
  SecurityInfo: SECURITY_INFORMATION; Container: BOOL; pObjectClassGuids: LPGUID;
  GuidCount: DWORD; pAcl: PACL; pfnArray: PFN_OBJECT_MGR_FUNCTS;
  pGenericMapping: PGENERIC_MAPPING; pInheritArray: PINHERITED_FROM): DWORD; stdcall;
{$EXTERNALSYM GetInheritanceSource}

function FreeInheritedFromArray(pInheritArray: PINHERITED_FROMW; AceCnt: USHORT;
  pfnArray: PFN_OBJECT_MGR_FUNCTS): DWORD; stdcall;
{$EXTERNALSYM FreeInheritedFromArray}

function TreeResetNamedSecurityInfoA(pObjectName: LPSTR; ObjectType: SE_OBJECT_TYPE;
  SecurityInfo: SECURITY_INFORMATION; pOwner, pGroup: PSID; pDacl, pSacl: PACL;
  KeepExplicit: BOOL; fnProgress: FN_PROGRESS; ProgressInvokeSetting: PROG_INVOKE_SETTING;
  Args: PVOID): DWORD; stdcall;
{$EXTERNALSYM TreeResetNamedSecurityInfoA}
function TreeResetNamedSecurityInfoW(pObjectName: LPWSTR; ObjectType: SE_OBJECT_TYPE;
  SecurityInfo: SECURITY_INFORMATION; pOwner, pGroup: PSID; pDacl, pSacl: PACL;
  KeepExplicit: BOOL; fnProgress: FN_PROGRESS; ProgressInvokeSetting: PROG_INVOKE_SETTING;
  Args: PVOID): DWORD; stdcall;
{$EXTERNALSYM TreeResetNamedSecurityInfoW}
function TreeResetNamedSecurityInfo(pObjectName: LPTSTR; ObjectType: SE_OBJECT_TYPE;
  SecurityInfo: SECURITY_INFORMATION; pOwner, pGroup: PSID; pDacl, pSacl: PACL;
  KeepExplicit: BOOL; fnProgress: FN_PROGRESS; ProgressInvokeSetting: PROG_INVOKE_SETTING;
  Args: PVOID): DWORD; stdcall;
{$EXTERNALSYM TreeResetNamedSecurityInfo}

//----------------------------------------------------------------------------
// The following API are provided for trusted servers to use to
// implement access control on their own objects.
//----------------------------------------------------------------------------

function BuildSecurityDescriptorA(pOwner: PTRUSTEE_A; pGroup: PTRUSTEE_A;
  cCountOfAccessEntries: ULONG; pListOfAccessEntries: PEXPLICIT_ACCESS_A;
  cCountOfAuditEntries: ULONG; pListOfAuditEntries: PEXPLICIT_ACCESS_A;
  pOldSD: PSECURITY_DESCRIPTOR; var pSizeNewSD: ULONG;
  var pNewSD: PSECURITY_DESCRIPTOR): DWORD; stdcall;
{$EXTERNALSYM BuildSecurityDescriptorA}
function BuildSecurityDescriptorW(pOwner: PTRUSTEE_W; pGroup: PTRUSTEE_W;
  cCountOfAccessEntries: ULONG; pListOfAccessEntries: PEXPLICIT_ACCESS_W;
  cCountOfAuditEntries: ULONG; pListOfAuditEntries: PEXPLICIT_ACCESS_W;
  pOldSD: PSECURITY_DESCRIPTOR; var pSizeNewSD: ULONG;
  var pNewSD: PSECURITY_DESCRIPTOR): DWORD; stdcall;
{$EXTERNALSYM BuildSecurityDescriptorW}
function BuildSecurityDescriptor(pOwner: PTRUSTEE; pGroup: PTRUSTEE;
  cCountOfAccessEntries: ULONG; pListOfAccessEntries: PEXPLICIT_ACCESS;
  cCountOfAuditEntries: ULONG; pListOfAuditEntries: PEXPLICIT_ACCESS;
  pOldSD: PSECURITY_DESCRIPTOR; var pSizeNewSD: ULONG;
  var pNewSD: PSECURITY_DESCRIPTOR): DWORD; stdcall;
{$EXTERNALSYM BuildSecurityDescriptor}

function LookupSecurityDescriptorPartsA(pOwner, pGroup: PPTRUSTEE_A;
  cCountOfAccessEntries: PULONG; pListOfAccessEntries: PEXPLICIT_ACCESS_A;
  cCountOfAuditEntries: PULONG; pListOfAuditEntries: PEXPLICIT_ACCESS_A;
  var pSD: SECURITY_DESCRIPTOR): DWORD; stdcall;
{$EXTERNALSYM LookupSecurityDescriptorPartsA}
function LookupSecurityDescriptorPartsW(pOwner, pGroup: PPTRUSTEE_W;
  cCountOfAccessEntries: PULONG; pListOfAccessEntries: PEXPLICIT_ACCESS_W;
  cCountOfAuditEntries: PULONG; pListOfAuditEntries: PEXPLICIT_ACCESS_W;
  var pSD: SECURITY_DESCRIPTOR): DWORD; stdcall;
{$EXTERNALSYM LookupSecurityDescriptorPartsW}
function LookupSecurityDescriptorParts(pOwner, pGroup: PPTRUSTEE;
  cCountOfAccessEntries: PULONG; pListOfAccessEntries: PEXPLICIT_ACCESS;
  cCountOfAuditEntries: PULONG; pListOfAuditEntries: PEXPLICIT_ACCESS;
  var pSD: SECURITY_DESCRIPTOR): DWORD; stdcall;
{$EXTERNALSYM LookupSecurityDescriptorParts}

//----------------------------------------------------------------------------
// The following helper API are provided for building
// access control structures.
//----------------------------------------------------------------------------

procedure BuildExplicitAccessWithNameA(pExplicitAccess: PEXPLICIT_ACCESS_A;
  pTrusteeName: LPSTR; AccessPermissions: DWORD; AccessMode: ACCESS_MODE;
  Inheritance: DWORD); stdcall;
{$EXTERNALSYM BuildExplicitAccessWithNameA}
procedure BuildExplicitAccessWithNameW(pExplicitAccess: PEXPLICIT_ACCESS_W;
  pTrusteeName: LPWSTR; AccessPermissions: DWORD; AccessMode: ACCESS_MODE;
  Inheritance: DWORD); stdcall;
{$EXTERNALSYM BuildExplicitAccessWithNameW}
procedure BuildExplicitAccessWithName(pExplicitAccess: PEXPLICIT_ACCESS;
  pTrusteeName: LPTSTR; AccessPermissions: DWORD; AccessMode: ACCESS_MODE;
  Inheritance: DWORD); stdcall;
{$EXTERNALSYM BuildExplicitAccessWithName}

procedure BuildImpersonateExplicitAccessWithNameA(pExplicitAccess: PEXPLICIT_ACCESS_A;
  pTrusteeName: LPSTR; pTrustee: PTRUSTEE_A; AccessPermissions: DWORD;
  AccessMode: ACCESS_MODE; Inheritance: DWORD); stdcall;
{$EXTERNALSYM BuildImpersonateExplicitAccessWithNameA}
procedure BuildImpersonateExplicitAccessWithNameW(pExplicitAccess: PEXPLICIT_ACCESS_W;
  pTrusteeName: LPWSTR; pTrustee: PTRUSTEE_W; AccessPermissions: DWORD;
  AccessMode: ACCESS_MODE; Inheritance: DWORD); stdcall;
{$EXTERNALSYM BuildImpersonateExplicitAccessWithNameW}
procedure BuildImpersonateExplicitAccessWithName(pExplicitAccess: PEXPLICIT_ACCESS;
  pTrusteeName: LPTSTR; pTrustee: PTRUSTEE; AccessPermissions: DWORD;
  AccessMode: ACCESS_MODE; Inheritance: DWORD); stdcall;
{$EXTERNALSYM BuildImpersonateExplicitAccessWithName}

procedure BuildTrusteeWithNameA(pTrustee: PTRUSTEE_A; pName: LPSTR); stdcall;
{$EXTERNALSYM BuildTrusteeWithNameA}
procedure BuildTrusteeWithNameW(pTrustee: PTRUSTEE_W; pName: LPWSTR); stdcall;
{$EXTERNALSYM BuildTrusteeWithNameW}
procedure BuildTrusteeWithName(pTrustee: PTRUSTEE; pName: LPTSTR); stdcall;
{$EXTERNALSYM BuildTrusteeWithName}

procedure BuildImpersonateTrusteeA(pTrustee: PTRUSTEE_A;
  pImpersonateTrustee: PTRUSTEE_A); stdcall;
{$EXTERNALSYM BuildImpersonateTrusteeA}
procedure BuildImpersonateTrusteeW(pTrustee: PTRUSTEE_W;
  pImpersonateTrustee: PTRUSTEE_W); stdcall;
{$EXTERNALSYM BuildImpersonateTrusteeW}
procedure BuildImpersonateTrustee(pTrustee: PTRUSTEE;
  pImpersonateTrustee: PTRUSTEE); stdcall;
{$EXTERNALSYM BuildImpersonateTrustee}

procedure BuildTrusteeWithSidA(pTrustee: PTRUSTEE_A; pSid: PSID); stdcall;
{$EXTERNALSYM BuildTrusteeWithSidA}
procedure BuildTrusteeWithSidW(pTrustee: PTRUSTEE_W; pSid: PSID); stdcall;
{$EXTERNALSYM BuildTrusteeWithSidW}
procedure BuildTrusteeWithSid(pTrustee: PTRUSTEE; pSid: PSID); stdcall;
{$EXTERNALSYM BuildTrusteeWithSid}

procedure BuildTrusteeWithObjectsAndSidA(pTrustee: PTRUSTEE_A;
  pObjSid: POBJECTS_AND_SID; pObjectGuid: PGUID; pInheritedObjectGuid: PGUID;
  pSid: PSID); stdcall;
{$EXTERNALSYM BuildTrusteeWithObjectsAndSidA}
procedure BuildTrusteeWithObjectsAndSidW(pTrustee: PTRUSTEE_W;
  pObjSid: POBJECTS_AND_SID; pObjectGuid: PGUID; pInheritedObjectGuid: PGUID;
  pSid: PSID); stdcall;
{$EXTERNALSYM BuildTrusteeWithObjectsAndSidW}
procedure BuildTrusteeWithObjectsAndSid(pTrustee: PTRUSTEE;
  pObjSid: POBJECTS_AND_SID; pObjectGuid: PGUID; pInheritedObjectGuid: PGUID;
  pSid: PSID); stdcall;
{$EXTERNALSYM BuildTrusteeWithObjectsAndSid}

procedure BuildTrusteeWithObjectsAndNameA(pTrustee: PTRUSTEE_A;
  pObjName: POBJECTS_AND_NAME_A; ObjectType: SE_OBJECT_TYPE;
  ObjectTypeName, InheritedObjectTypeName, Name: LPSTR); stdcall;
{$EXTERNALSYM BuildTrusteeWithObjectsAndNameA}
procedure BuildTrusteeWithObjectsAndNameW(pTrustee: PTRUSTEE_W;
  pObjName: POBJECTS_AND_NAME_W; ObjectType: SE_OBJECT_TYPE;
  ObjectTypeName, InheritedObjectTypeName, Name: LPWSTR); stdcall;
{$EXTERNALSYM BuildTrusteeWithObjectsAndNameW}
procedure BuildTrusteeWithObjectsAndName(pTrustee: PTRUSTEE;
  pObjName: POBJECTS_AND_NAME; ObjectType: SE_OBJECT_TYPE;
  ObjectTypeName, InheritedObjectTypeName, Name: LPTSTR); stdcall;
{$EXTERNALSYM BuildTrusteeWithObjectsAndName}

function GetTrusteeNameA(pTrustee: PTRUSTEE_A): LPSTR; stdcall;
{$EXTERNALSYM GetTrusteeNameA}
function GetTrusteeNameW(pTrustee: PTRUSTEE_W): LPWSTR; stdcall;
{$EXTERNALSYM GetTrusteeNameW}
function GetTrusteeName(pTrustee: PTRUSTEE): LPTSTR; stdcall;
{$EXTERNALSYM GetTrusteeName}

function GetTrusteeTypeA(pTrustee: PTRUSTEE_A): TRUSTEE_TYPE; stdcall;
{$EXTERNALSYM GetTrusteeTypeA}
function GetTrusteeTypeW(pTrustee: PTRUSTEE_W): TRUSTEE_TYPE; stdcall;
{$EXTERNALSYM GetTrusteeTypeW}
function GetTrusteeType(pTrustee: PTRUSTEE): TRUSTEE_TYPE; stdcall;
{$EXTERNALSYM GetTrusteeType}

function GetTrusteeFormA(pTrustee: PTRUSTEE_A): TRUSTEE_FORM; stdcall;
{$EXTERNALSYM GetTrusteeFormA}
function GetTrusteeFormW(pTrustee: PTRUSTEE_W): TRUSTEE_FORM; stdcall;
{$EXTERNALSYM GetTrusteeFormW}
function GetTrusteeForm(pTrustee: PTRUSTEE): TRUSTEE_FORM; stdcall;
{$EXTERNALSYM GetTrusteeForm}

function GetMultipleTrusteeOperationA(pTrustee: PTRUSTEE_A): MULTIPLE_TRUSTEE_OPERATION; stdcall;
{$EXTERNALSYM GetMultipleTrusteeOperationA}
function GetMultipleTrusteeOperationW(pTrustee: PTRUSTEE_W): MULTIPLE_TRUSTEE_OPERATION; stdcall;
{$EXTERNALSYM GetMultipleTrusteeOperationW}
function GetMultipleTrusteeOperation(pTrustee: PTRUSTEE): MULTIPLE_TRUSTEE_OPERATION; stdcall;
{$EXTERNALSYM GetMultipleTrusteeOperation}

function GetMultipleTrusteeA(pTrustee: PTRUSTEE_A): PTRUSTEE_A; stdcall;
{$EXTERNALSYM GetMultipleTrusteeA}
function GetMultipleTrusteeW(pTrustee: PTRUSTEE_W): PTRUSTEE_W; stdcall;
{$EXTERNALSYM GetMultipleTrusteeW}
function GetMultipleTrustee(pTrustee: PTRUSTEE): PTRUSTEE; stdcall;
{$EXTERNALSYM GetMultipleTrustee}

{$ENDIF JWA_IMPLEMENTATIONSECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
implementation
//uses ...
{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_INTERFACESECTION}

{$IFNDEF JWA_INCLUDEMODE}
const
  aclapilib = 'advapi32.dll';
  {$IFDEF UNICODE}
  AWSuffix = 'W';
  {$ELSE}
  AWSuffix = 'A';
  {$ENDIF UNICODE}
{$ENDIF JWA_INCLUDEMODE}


function SetEntriesInAclA; external aclapilib name 'SetEntriesInAclA' delayed;
function SetEntriesInAclW; external aclapilib name 'SetEntriesInAclW' delayed;
function SetEntriesInAcl; external aclapilib name 'SetEntriesInAcl' + AWSuffix delayed;
function GetExplicitEntriesFromAclA; external aclapilib name 'GetExplicitEntriesFromAclA' delayed;
function GetExplicitEntriesFromAclW; external aclapilib name 'GetExplicitEntriesFromAclW' delayed;
function GetExplicitEntriesFromAcl; external aclapilib name 'GetExplicitEntriesFromAcl' + AWSuffix delayed;
function GetEffectiveRightsFromAclA; external aclapilib name 'GetEffectiveRightsFromAclA' delayed;
function GetEffectiveRightsFromAclW; external aclapilib name 'GetEffectiveRightsFromAclW' delayed;
function GetEffectiveRightsFromAcl; external aclapilib name 'GetEffectiveRightsFromAcl' + AWSuffix delayed;
function GetAuditedPermissionsFromAclA; external aclapilib name 'GetAuditedPermissionsFromAclA' delayed;
function GetAuditedPermissionsFromAclW; external aclapilib name 'GetAuditedPermissionsFromAclW' delayed;
function GetAuditedPermissionsFromAcl; external aclapilib name 'GetAuditedPermissionsFromAcl' + AWSuffix delayed;
function GetNamedSecurityInfoA; external aclapilib name 'GetNamedSecurityInfoA' delayed;
function GetNamedSecurityInfoW; external aclapilib name 'GetNamedSecurityInfoW' delayed;
function GetNamedSecurityInfo; external aclapilib name 'GetNamedSecurityInfo' + AWSuffix delayed;
function GetSecurityInfo; external aclapilib name 'GetSecurityInfo' delayed;
function SetNamedSecurityInfoA; external aclapilib name 'SetNamedSecurityInfoA' delayed;
function SetNamedSecurityInfoW; external aclapilib name 'SetNamedSecurityInfoW' delayed;
function SetNamedSecurityInfo; external aclapilib name 'SetNamedSecurityInfo' + AWSuffix delayed;
function SetSecurityInfo; external aclapilib name 'SetSecurityInfo' delayed;
function GetInheritanceSourceA; external aclapilib name 'GetInheritanceSourceA' delayed;
function GetInheritanceSourceW; external aclapilib name 'GetInheritanceSourceW' delayed;
function GetInheritanceSource; external aclapilib name 'GetInheritanceSource' + AWSuffix delayed;
function FreeInheritedFromArray; external aclapilib name 'FreeInheritedFromArray' delayed;
function TreeResetNamedSecurityInfoA; external aclapilib name 'TreeResetNamedSecurityInfoA' delayed;
function TreeResetNamedSecurityInfoW; external aclapilib name 'TreeResetNamedSecurityInfoW' delayed;
function TreeResetNamedSecurityInfo; external aclapilib name 'TreeResetNamedSecurityInfo' + AWSuffix delayed;
function BuildSecurityDescriptorA; external aclapilib name 'BuildSecurityDescriptorA' delayed;
function BuildSecurityDescriptorW; external aclapilib name 'BuildSecurityDescriptorW' delayed;
function BuildSecurityDescriptor; external aclapilib name 'BuildSecurityDescriptor' + AWSuffix delayed;
function LookupSecurityDescriptorPartsA; external aclapilib name 'LookupSecurityDescriptorPartsA' delayed;
function LookupSecurityDescriptorPartsW; external aclapilib name 'LookupSecurityDescriptorPartsW' delayed;
function LookupSecurityDescriptorParts; external aclapilib name 'LookupSecurityDescriptorParts' + AWSuffix delayed;
procedure BuildExplicitAccessWithNameA; external aclapilib name 'BuildExplicitAccessWithNameA' delayed;
procedure BuildExplicitAccessWithNameW; external aclapilib name 'BuildExplicitAccessWithNameW' delayed;
procedure BuildExplicitAccessWithName; external aclapilib name 'BuildExplicitAccessWithName' + AWSuffix delayed;
procedure BuildImpersonateExplicitAccessWithNameA; external aclapilib name 'BuildImpersonateExplicitAccessWithNameA' delayed;
procedure BuildImpersonateExplicitAccessWithNameW; external aclapilib name 'BuildImpersonateExplicitAccessWithNameW' delayed;
procedure BuildImpersonateExplicitAccessWithName; external aclapilib name 'BuildImpersonateExplicitAccessWithName' + AWSuffix delayed;
procedure BuildTrusteeWithNameA; external aclapilib name 'BuildTrusteeWithNameA' delayed;
procedure BuildTrusteeWithNameW; external aclapilib name 'BuildTrusteeWithNameW' delayed;
procedure BuildTrusteeWithName; external aclapilib name 'BuildTrusteeWithName' + AWSuffix delayed;
procedure BuildImpersonateTrusteeA; external aclapilib name 'BuildImpersonateTrusteeA' delayed;
procedure BuildImpersonateTrusteeW; external aclapilib name 'BuildImpersonateTrusteeW' delayed;
procedure BuildImpersonateTrustee; external aclapilib name 'BuildImpersonateTrustee' + AWSuffix delayed;
procedure BuildTrusteeWithSidA; external aclapilib name 'BuildTrusteeWithSidA' delayed;
procedure BuildTrusteeWithSidW; external aclapilib name 'BuildTrusteeWithSidW' delayed;
procedure BuildTrusteeWithSid; external aclapilib name 'BuildTrusteeWithSid' + AWSuffix delayed;
procedure BuildTrusteeWithObjectsAndSidA; external aclapilib name 'BuildTrusteeWithObjectsAndSidA' delayed;
procedure BuildTrusteeWithObjectsAndSidW; external aclapilib name 'BuildTrusteeWithObjectsAndSidW' delayed;
procedure BuildTrusteeWithObjectsAndSid; external aclapilib name 'BuildTrusteeWithObjectsAndSid' + AWSuffix delayed;
procedure BuildTrusteeWithObjectsAndNameA; external aclapilib name 'BuildTrusteeWithObjectsAndNameA' delayed;
procedure BuildTrusteeWithObjectsAndNameW; external aclapilib name 'BuildTrusteeWithObjectsAndNameW' delayed;
procedure BuildTrusteeWithObjectsAndName; external aclapilib name 'BuildTrusteeWithObjectsAndName' + AWSuffix delayed;
function GetTrusteeNameA; external aclapilib name 'GetTrusteeNameA' delayed;
function GetTrusteeNameW; external aclapilib name 'GetTrusteeNameW' delayed;
function GetTrusteeName; external aclapilib name 'GetTrusteeName' + AWSuffix delayed;
function GetTrusteeTypeA; external aclapilib name 'GetTrusteeTypeA' delayed;
function GetTrusteeTypeW; external aclapilib name 'GetTrusteeTypeW' delayed;
function GetTrusteeType; external aclapilib name 'GetTrusteeType' + AWSuffix delayed;
function GetTrusteeFormA; external aclapilib name 'GetTrusteeFormA' delayed;
function GetTrusteeFormW; external aclapilib name 'GetTrusteeFormW' delayed;
function GetTrusteeForm; external aclapilib name 'GetTrusteeForm' + AWSuffix delayed;
function GetMultipleTrusteeOperationA; external aclapilib name 'GetMultipleTrusteeOperationA' delayed;
function GetMultipleTrusteeOperationW; external aclapilib name 'GetMultipleTrusteeOperationW' delayed;
function GetMultipleTrusteeOperation; external aclapilib name 'GetMultipleTrusteeOperation' + AWSuffix delayed;
function GetMultipleTrusteeA; external aclapilib name 'GetMultipleTrusteeA' delayed;
function GetMultipleTrusteeW; external aclapilib name 'GetMultipleTrusteeW' delayed;
function GetMultipleTrustee; external aclapilib name 'GetMultipleTrustee' + AWSuffix delayed;


{$ENDIF JWA_INTERFACESECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
end.
{$ENDIF JWA_OMIT_SECTIONS}
