{******************************************************************************}
{                                                                              }
{ Services API interface Unit for Object Pascal                                }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2001 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The original file is: winsvc.h, released June 2000. The original Pascal      }
{ code is: WinSvc.pas, released December 2000. The initial developer of the    }
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

// $Id: JwaWinSvc.pas,v 1.12 2007/09/05 11:58:54 dezipaitor Exp $
{$IFNDEF JWA_OMIT_SECTIONS}
unit JwaWinSvc;

{$WEAKPACKAGEUNIT}
{$ENDIF JWA_OMIT_SECTIONS}

{$HPPEMIT ''}
{$HPPEMIT '#include "WinSvc.h"'}
{$HPPEMIT ''}

{$IFNDEF JWA_OMIT_SECTIONS}
{$I ..\Includes\JediAPILib.inc}

interface

uses
  JwaWinNT, JwaWinType;
{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_IMPLEMENTATIONSECTION}
//
// Service database names
//

const
  SERVICES_ACTIVE_DATABASEW = 'ServicesActive';
  {$EXTERNALSYM SERVICES_ACTIVE_DATABASEW}
  SERVICES_FAILED_DATABASEW = 'ServicesFailed';
  {$EXTERNALSYM SERVICES_FAILED_DATABASEW}

  SERVICES_ACTIVE_DATABASEA = 'ServicesActive';
  {$EXTERNALSYM SERVICES_ACTIVE_DATABASEA}
  SERVICES_FAILED_DATABASEA = 'ServicesFailed';
  {$EXTERNALSYM SERVICES_FAILED_DATABASEA}

//
// Character to designate that a name is a group
//

  SC_GROUP_IDENTIFIERW = '+';
  {$EXTERNALSYM SC_GROUP_IDENTIFIERW}
  SC_GROUP_IDENTIFIERA = '+';
  {$EXTERNALSYM SC_GROUP_IDENTIFIERA}

  {$IFDEF UNICODE}

  SERVICES_ACTIVE_DATABASE = SERVICES_ACTIVE_DATABASEW;
  {$EXTERNALSYM SERVICES_ACTIVE_DATABASE}
  SERVICES_FAILED_DATABASE = SERVICES_FAILED_DATABASEW;
  {$EXTERNALSYM SERVICES_FAILED_DATABASE}

  SC_GROUP_IDENTIFIER = SC_GROUP_IDENTIFIERW;
  {$EXTERNALSYM SC_GROUP_IDENTIFIER}

  {$ELSE}

  SERVICES_ACTIVE_DATABASE = SERVICES_ACTIVE_DATABASEA;
  {$EXTERNALSYM SERVICES_ACTIVE_DATABASE}
  SERVICES_FAILED_DATABASE = SERVICES_FAILED_DATABASEA;
  {$EXTERNALSYM SERVICES_FAILED_DATABASE}

  SC_GROUP_IDENTIFIER = SC_GROUP_IDENTIFIERA;
  {$EXTERNALSYM SC_GROUP_IDENTIFIER}

  {$ENDIF UNICODE}

//
// Value to indicate no change to an optional parameter
//

  SERVICE_NO_CHANGE = $ffffffff;
  {$EXTERNALSYM SERVICE_NO_CHANGE}

//
// Service State -- for Enum Requests (Bit Mask)
//

  SERVICE_ACTIVE    = $00000001;
  {$EXTERNALSYM SERVICE_ACTIVE}
  SERVICE_INACTIVE  = $00000002;
  {$EXTERNALSYM SERVICE_INACTIVE}
  SERVICE_STATE_ALL = SERVICE_ACTIVE or SERVICE_INACTIVE;
  {$EXTERNALSYM SERVICE_STATE_ALL}

//
// Controls
//

  SERVICE_CONTROL_STOP                  = $00000001;
  {$EXTERNALSYM SERVICE_CONTROL_STOP}
  SERVICE_CONTROL_PAUSE                 = $00000002;
  {$EXTERNALSYM SERVICE_CONTROL_PAUSE}
  SERVICE_CONTROL_CONTINUE              = $00000003;
  {$EXTERNALSYM SERVICE_CONTROL_CONTINUE}
  SERVICE_CONTROL_INTERROGATE           = $00000004;
  {$EXTERNALSYM SERVICE_CONTROL_INTERROGATE}
  SERVICE_CONTROL_SHUTDOWN              = $00000005;
  {$EXTERNALSYM SERVICE_CONTROL_SHUTDOWN}
  SERVICE_CONTROL_PARAMCHANGE           = $00000006;
  {$EXTERNALSYM SERVICE_CONTROL_PARAMCHANGE}
  SERVICE_CONTROL_NETBINDADD            = $00000007;
  {$EXTERNALSYM SERVICE_CONTROL_NETBINDADD}
  SERVICE_CONTROL_NETBINDREMOVE         = $00000008;
  {$EXTERNALSYM SERVICE_CONTROL_NETBINDREMOVE}
  SERVICE_CONTROL_NETBINDENABLE         = $00000009;
  {$EXTERNALSYM SERVICE_CONTROL_NETBINDENABLE}
  SERVICE_CONTROL_NETBINDDISABLE        = $0000000A;
  {$EXTERNALSYM SERVICE_CONTROL_NETBINDDISABLE}
  SERVICE_CONTROL_DEVICEEVENT           = $0000000B;
  {$EXTERNALSYM SERVICE_CONTROL_DEVICEEVENT}
  SERVICE_CONTROL_HARDWAREPROFILECHANGE = $0000000C;
  {$EXTERNALSYM SERVICE_CONTROL_HARDWAREPROFILECHANGE}
  SERVICE_CONTROL_POWEREVENT            = $0000000D;
  {$EXTERNALSYM SERVICE_CONTROL_POWEREVENT}
  SERVICE_CONTROL_SESSIONCHANGE         = $0000000E;
  {$EXTERNALSYM SERVICE_CONTROL_SESSIONCHANGE}

//
// Service State -- for CurrentState
//

  SERVICE_STOPPED          = $00000001;
  {$EXTERNALSYM SERVICE_STOPPED}
  SERVICE_START_PENDING    = $00000002;
  {$EXTERNALSYM SERVICE_START_PENDING}
  SERVICE_STOP_PENDING     = $00000003;
  {$EXTERNALSYM SERVICE_STOP_PENDING}
  SERVICE_RUNNING          = $00000004;
  {$EXTERNALSYM SERVICE_RUNNING}
  SERVICE_CONTINUE_PENDING = $00000005;
  {$EXTERNALSYM SERVICE_CONTINUE_PENDING}
  SERVICE_PAUSE_PENDING    = $00000006;
  {$EXTERNALSYM SERVICE_PAUSE_PENDING}
  SERVICE_PAUSED           = $00000007;
  {$EXTERNALSYM SERVICE_PAUSED}

//
// Controls Accepted  (Bit Mask)
//

  SERVICE_ACCEPT_STOP                  = $00000001;
  {$EXTERNALSYM SERVICE_ACCEPT_STOP}
  SERVICE_ACCEPT_PAUSE_CONTINUE        = $00000002;
  {$EXTERNALSYM SERVICE_ACCEPT_PAUSE_CONTINUE}
  SERVICE_ACCEPT_SHUTDOWN              = $00000004;
  {$EXTERNALSYM SERVICE_ACCEPT_SHUTDOWN}
  SERVICE_ACCEPT_PARAMCHANGE           = $00000008;
  {$EXTERNALSYM SERVICE_ACCEPT_PARAMCHANGE}
  SERVICE_ACCEPT_NETBINDCHANGE         = $00000010;
  {$EXTERNALSYM SERVICE_ACCEPT_NETBINDCHANGE}
  SERVICE_ACCEPT_HARDWAREPROFILECHANGE = $00000020;
  {$EXTERNALSYM SERVICE_ACCEPT_HARDWAREPROFILECHANGE}
  SERVICE_ACCEPT_POWEREVENT            = $00000040;
  {$EXTERNALSYM SERVICE_ACCEPT_POWEREVENT}
  SERVICE_ACCEPT_SESSIONCHANGE         = $00000080;
  {$EXTERNALSYM SERVICE_ACCEPT_SESSIONCHANGE}

//
// Service Control Manager object specific access types
//

  SC_MANAGER_CONNECT            = $0001;
  {$EXTERNALSYM SC_MANAGER_CONNECT}
  SC_MANAGER_CREATE_SERVICE     = $0002;
  {$EXTERNALSYM SC_MANAGER_CREATE_SERVICE}
  SC_MANAGER_ENUMERATE_SERVICE  = $0004;
  {$EXTERNALSYM SC_MANAGER_ENUMERATE_SERVICE}
  SC_MANAGER_LOCK               = $0008;
  {$EXTERNALSYM SC_MANAGER_LOCK}
  SC_MANAGER_QUERY_LOCK_STATUS  = $0010;
  {$EXTERNALSYM SC_MANAGER_QUERY_LOCK_STATUS}
  SC_MANAGER_MODIFY_BOOT_CONFIG = $0020;
  {$EXTERNALSYM SC_MANAGER_MODIFY_BOOT_CONFIG}

  SC_MANAGER_ALL_ACCESS         = STANDARD_RIGHTS_REQUIRED or
                                  SC_MANAGER_CONNECT or
                                  SC_MANAGER_CREATE_SERVICE or
                                  SC_MANAGER_ENUMERATE_SERVICE or
                                  SC_MANAGER_LOCK or
                                  SC_MANAGER_QUERY_LOCK_STATUS or
                                  SC_MANAGER_MODIFY_BOOT_CONFIG;
  {$EXTERNALSYM SC_MANAGER_ALL_ACCESS}

//
// Service object specific access type
//

  SERVICE_QUERY_CONFIG         = $0001;
  {$EXTERNALSYM SERVICE_QUERY_CONFIG}
  SERVICE_CHANGE_CONFIG        = $0002;
  {$EXTERNALSYM SERVICE_CHANGE_CONFIG}
  SERVICE_QUERY_STATUS         = $0004;
  {$EXTERNALSYM SERVICE_QUERY_STATUS}
  SERVICE_ENUMERATE_DEPENDENTS = $0008;
  {$EXTERNALSYM SERVICE_ENUMERATE_DEPENDENTS}
  SERVICE_START                = $0010;
  {$EXTERNALSYM SERVICE_START}
  SERVICE_STOP                 = $0020;
  {$EXTERNALSYM SERVICE_STOP}
  SERVICE_PAUSE_CONTINUE       = $0040;
  {$EXTERNALSYM SERVICE_PAUSE_CONTINUE}
  SERVICE_INTERROGATE          = $0080;
  {$EXTERNALSYM SERVICE_INTERROGATE}
  SERVICE_USER_DEFINED_CONTROL = $0100;
  {$EXTERNALSYM SERVICE_USER_DEFINED_CONTROL}

  SERVICE_ALL_ACCESS           = STANDARD_RIGHTS_REQUIRED or
                                 SERVICE_QUERY_CONFIG or
                                 SERVICE_CHANGE_CONFIG or
                                 SERVICE_QUERY_STATUS or
                                 SERVICE_ENUMERATE_DEPENDENTS or
                                 SERVICE_START or
                                 SERVICE_STOP or
                                 SERVICE_PAUSE_CONTINUE or
                                 SERVICE_INTERROGATE or
                                 SERVICE_USER_DEFINED_CONTROL;
  {$EXTERNALSYM SERVICE_ALL_ACCESS}

//
// Service flags for QueryServiceStatusEx
//

  SERVICE_RUNS_IN_SYSTEM_PROCESS = $00000001;
  {$EXTERNALSYM SERVICE_RUNS_IN_SYSTEM_PROCESS}

//
// Info levels for ChangeServiceConfig2 and QueryServiceConfig2
//

  SERVICE_CONFIG_DESCRIPTION     = 1;
  {$EXTERNALSYM SERVICE_CONFIG_DESCRIPTION}
  SERVICE_CONFIG_FAILURE_ACTIONS = 2;
  {$EXTERNALSYM SERVICE_CONFIG_FAILURE_ACTIONS}
  SERVICE_CONFIG_DELAYED_AUTO_START_INFO = 3; //VISTA
  {$EXTERNALSYM SERVICE_CONFIG_DELAYED_AUTO_START_INFO}

//
// Service description string
//

type
  LPSERVICE_DESCRIPTIONA = ^SERVICE_DESCRIPTIONA;
  {$EXTERNALSYM LPSERVICE_DESCRIPTIONA}
  _SERVICE_DESCRIPTIONA = record
    lpDescription: LPSTR;
  end;
  {$EXTERNALSYM _SERVICE_DESCRIPTIONA}
  SERVICE_DESCRIPTIONA = _SERVICE_DESCRIPTIONA;
  {$EXTERNALSYM SERVICE_DESCRIPTIONA}
  TServiceDescriptionA = SERVICE_DESCRIPTIONA;
  PServiceDescriptionA = LPSERVICE_DESCRIPTIONA;

//
// Service description string
//

  LPSERVICE_DESCRIPTIONW = ^SERVICE_DESCRIPTIONW;
  {$EXTERNALSYM LPSERVICE_DESCRIPTIONW}
  _SERVICE_DESCRIPTIONW = record
    lpDescription: LPWSTR;
  end;
  {$EXTERNALSYM _SERVICE_DESCRIPTIONW}
  SERVICE_DESCRIPTIONW = _SERVICE_DESCRIPTIONW;
  {$EXTERNALSYM SERVICE_DESCRIPTIONW}
  TServiceDescriptionW = SERVICE_DESCRIPTIONW;
  PServiceDescriptionW = LPSERVICE_DESCRIPTIONW;

  {$IFDEF UNICODE}
  SERVICE_DESCRIPTION = SERVICE_DESCRIPTIONW;
  {$EXTERNALSYM SERVICE_DESCRIPTION}
  LPSERVICE_DESCRIPTION = LPSERVICE_DESCRIPTIONW;
  {$EXTERNALSYM LPSERVICE_DESCRIPTION}
  TServiceDescription = TServiceDescriptionW;
  PServiceDescription = PServiceDescriptionW;
  {$ELSE}
  SERVICE_DESCRIPTION = SERVICE_DESCRIPTIONA;
  {$EXTERNALSYM SERVICE_DESCRIPTION}
  LPSERVICE_DESCRIPTION = LPSERVICE_DESCRIPTIONA;
  {$EXTERNALSYM LPSERVICE_DESCRIPTION}
  TServiceDescription = TServiceDescriptionA;
  PServiceDescription = PServiceDescriptionA;
  {$ENDIF UNICODE}

//
// Actions to take on service failure
//

  _SC_ACTION_TYPE = (SC_ACTION_NONE, SC_ACTION_RESTART, SC_ACTION_REBOOT,
    SC_ACTION_RUN_COMMAND);
  {$EXTERNALSYM _SC_ACTION_TYPE}
  SC_ACTION_TYPE = _SC_ACTION_TYPE;
  {$EXTERNALSYM SC_ACTION_TYPE}
  TScActionType = _SC_ACTION_TYPE;

  LPSC_ACTION = ^SC_ACTION;
  {$EXTERNALSYM LPSC_ACTION}
  _SC_ACTION = record
    Type_: SC_ACTION_TYPE;
    Delay: DWORD;
  end;
  {$EXTERNALSYM _SC_ACTION}
  SC_ACTION = _SC_ACTION;
  {$EXTERNALSYM SC_ACTION}
  TScAction = SC_ACTION;
  PScAction = LPSC_ACTION;

  LPSERVICE_FAILURE_ACTIONSA = ^SERVICE_FAILURE_ACTIONSA;
  {$EXTERNALSYM LPSERVICE_FAILURE_ACTIONSA}
  _SERVICE_FAILURE_ACTIONSA = record
    dwResetPeriod: DWORD;
    lpRebootMsg: LPSTR;
    lpCommand: LPSTR;
    cActions: DWORD;
    lpsaActions: LPSC_ACTION;
  end;
  {$EXTERNALSYM _SERVICE_FAILURE_ACTIONSA}
  SERVICE_FAILURE_ACTIONSA = _SERVICE_FAILURE_ACTIONSA;
  {$EXTERNALSYM SERVICE_FAILURE_ACTIONSA}
  TServiceFailureActionsA = SERVICE_FAILURE_ACTIONSA;
  PServiceFailureActionsA = LPSERVICE_FAILURE_ACTIONSA;

  LPSERVICE_FAILURE_ACTIONSW = ^SERVICE_FAILURE_ACTIONSW;
  {$EXTERNALSYM LPSERVICE_FAILURE_ACTIONSW}
  _SERVICE_FAILURE_ACTIONSW = record
    dwResetPeriod: DWORD;
    lpRebootMsg: LPWSTR;
    lpCommand: LPWSTR;
    cActions: DWORD;
    lpsaActions: LPSC_ACTION;
  end;
  {$EXTERNALSYM _SERVICE_FAILURE_ACTIONSW}
  SERVICE_FAILURE_ACTIONSW = _SERVICE_FAILURE_ACTIONSW;
  {$EXTERNALSYM SERVICE_FAILURE_ACTIONSW}
  TServiceFailureActionsW = SERVICE_FAILURE_ACTIONSW;
  PServiceFailureActionsW = LPSERVICE_FAILURE_ACTIONSW;

  {$IFDEF UNICODE}
  SERVICE_FAILURE_ACTIONS = SERVICE_FAILURE_ACTIONSW;
  {$EXTERNALSYM SERVICE_FAILURE_ACTIONS}
  LPSERVICE_FAILURE_ACTIONS = LPSERVICE_FAILURE_ACTIONSW;
  {$EXTERNALSYM LPSERVICE_FAILURE_ACTIONS}
  TServiceFailureActions = TServiceFailureActionsW;
  PServiceFailureActions = PServiceFailureActionsW;
  {$ELSE}
  SERVICE_FAILURE_ACTIONS = SERVICE_FAILURE_ACTIONSA;
  {$EXTERNALSYM SERVICE_FAILURE_ACTIONS}
  LPSERVICE_FAILURE_ACTIONS = LPSERVICE_FAILURE_ACTIONSA;
  {$EXTERNALSYM LPSERVICE_FAILURE_ACTIONS}
  TServiceFailureActions = TServiceFailureActionsA;
  PServiceFailureActions = PServiceFailureActionsA;
  {$ENDIF UNICODE}

  _SERVICE_DELAYED_AUTO_START_INFO = record
    {WARNING:
	The C struct uses a BOOL which is in fact an Integer.
	You can't use true and false here without casting to Integer first:
	  fDelayedAutostart := Integer(true);
	Using Boolean or BOOL does not work since the record must be 4 bytes in size,
	otherwise random data behind the first byte is also interpreted by the functions.
	
	BOOL defines true as -1 and not 1. ChangeServiceConfig2 uses this record
	and refuses to work if -1 is supplied.	
	
	See also BOOL declaration in JwaWinType.pas for more information.
	
	CW@2008
	} 
    fDelayedAutostart : Integer; 
  end;
  {$EXTERNALSYM _SERVICE_DELAYED_AUTO_START_INFO}
  SERVICE_DELAYED_AUTO_START_INFO = _SERVICE_DELAYED_AUTO_START_INFO;
  {$EXTERNALSYM SERVICE_DELAYED_AUTO_START_INFO}
  
  TServiceDelayedAutoStartInfo = _SERVICE_DELAYED_AUTO_START_INFO;
  PServiceDelayedAutoStartInfo = ^TServiceDelayedAutoStartInfo;

//
// Handle Types
//

  SC_HANDLE = HANDLE;
  {$EXTERNALSYM SC_HANDLE}
  LPSC_HANDLE = ^SC_HANDLE;
  {$EXTERNALSYM LPSC_HANDLE}

  SERVICE_STATUS_HANDLE = HANDLE;
  {$EXTERNALSYM SERVICE_STATUS_HANDLE}

//
// Info levels for QueryServiceStatusEx
//

  _SC_STATUS_TYPE = (SC_STATUS_PROCESS_INFO);
  {$EXTERNALSYM _SC_STATUS_TYPE}
  SC_STATUS_TYPE = _SC_STATUS_TYPE;
  {$EXTERNALSYM SC_STATUS_TYPE}

//
// Info levels for EnumServicesStatusEx
//

  _SC_ENUM_TYPE = (SC_ENUM_PROCESS_INFO);
  {$EXTERNALSYM _SC_ENUM_TYPE}
  SC_ENUM_TYPE = _SC_ENUM_TYPE;
  {$EXTERNALSYM SC_ENUM_TYPE}

//
// Service Status Structures
//

  LPSERVICE_STATUS = ^SERVICE_STATUS;
  {$EXTERNALSYM LPSERVICE_STATUS}
  _SERVICE_STATUS = record
    dwServiceType: DWORD;
    dwCurrentState: DWORD;
    dwControlsAccepted: DWORD;
    dwWin32ExitCode: DWORD;
    dwServiceSpecificExitCode: DWORD;
    dwCheckPoint: DWORD;
    dwWaitHint: DWORD;
  end;
  {$EXTERNALSYM _SERVICE_STATUS}
  SERVICE_STATUS = _SERVICE_STATUS;
  {$EXTERNALSYM SERVICE_STATUS}
  TServiceStatus = SERVICE_STATUS;
  PServiceStatus = LPSERVICE_STATUS;

  LPSERVICE_STATUS_PROCESS = ^SERVICE_STATUS_PROCESS;
  {$EXTERNALSYM LPSERVICE_STATUS_PROCESS}
  _SERVICE_STATUS_PROCESS = record
    dwServiceType: DWORD;
    dwCurrentState: DWORD;
    dwControlsAccepted: DWORD;
    dwWin32ExitCode: DWORD;
    dwServiceSpecificExitCode: DWORD;
    dwCheckPoint: DWORD;
    dwWaitHint: DWORD;
    dwProcessId: DWORD;
    dwServiceFlags: DWORD;
  end;
  {$EXTERNALSYM _SERVICE_STATUS_PROCESS}
  SERVICE_STATUS_PROCESS = _SERVICE_STATUS_PROCESS;
  {$EXTERNALSYM SERVICE_STATUS_PROCESS}
  TServiceStatusProcess = SERVICE_STATUS_PROCESS;
  PServiceStatusProcess = LPSERVICE_STATUS_PROCESS;

//
// Service Status Enumeration Structure
//

  LPENUM_SERVICE_STATUSA = ^ENUM_SERVICE_STATUSA;
  {$EXTERNALSYM LPENUM_SERVICE_STATUSA}
  _ENUM_SERVICE_STATUSA = record
    lpServiceName: LPSTR;
    lpDisplayName: LPSTR;
    ServiceStatus: SERVICE_STATUS;
  end;
  {$EXTERNALSYM _ENUM_SERVICE_STATUSA}
  ENUM_SERVICE_STATUSA = _ENUM_SERVICE_STATUSA;
  {$EXTERNALSYM ENUM_SERVICE_STATUSA}
  TEnumServiceStatusA = ENUM_SERVICE_STATUSA;
  PEnumServiceStatusA = LPENUM_SERVICE_STATUSA;

  LPENUM_SERVICE_STATUSW = ^ENUM_SERVICE_STATUSW;
  {$EXTERNALSYM LPENUM_SERVICE_STATUSW}
  _ENUM_SERVICE_STATUSW = record
    lpServiceName: LPWSTR;
    lpDisplayName: LPWSTR;
    ServiceStatus: SERVICE_STATUS;
  end;
  {$EXTERNALSYM _ENUM_SERVICE_STATUSW}
  ENUM_SERVICE_STATUSW = _ENUM_SERVICE_STATUSW;
  {$EXTERNALSYM ENUM_SERVICE_STATUSW}
  TEnumServiceStatusW = ENUM_SERVICE_STATUSW;
  PEnumServiceStatusW = LPENUM_SERVICE_STATUSW;

  {$IFDEF UNICODE}
  ENUM_SERVICE_STATUS = ENUM_SERVICE_STATUSW;
  {$EXTERNALSYM ENUM_SERVICE_STATUS}
  LPENUM_SERVICE_STATUS = LPENUM_SERVICE_STATUSW;
  {$EXTERNALSYM LPENUM_SERVICE_STATUS}
  TEnumServiceStatus = TEnumServiceStatusW;
  PEnumServiceStatus = PEnumServiceStatusW;
  {$ELSE}
  ENUM_SERVICE_STATUS = ENUM_SERVICE_STATUSA;
  {$EXTERNALSYM ENUM_SERVICE_STATUS}
  LPENUM_SERVICE_STATUS = LPENUM_SERVICE_STATUSA;
  {$EXTERNALSYM LPENUM_SERVICE_STATUS}
  TEnumServiceStatus = TEnumServiceStatusA;
  PEnumServiceStatus = PEnumServiceStatusA;
  {$ENDIF UNICODE}

  LPENUM_SERVICE_STATUS_PROCESSA = ^ENUM_SERVICE_STATUS_PROCESSA;
  {$EXTERNALSYM LPENUM_SERVICE_STATUS_PROCESSA}
  _ENUM_SERVICE_STATUS_PROCESSA = record
    lpServiceName: LPSTR;
    lpDisplayName: LPSTR;
    ServiceStatusProcess: SERVICE_STATUS_PROCESS;
  end;
  {$EXTERNALSYM _ENUM_SERVICE_STATUS_PROCESSA}
  ENUM_SERVICE_STATUS_PROCESSA = _ENUM_SERVICE_STATUS_PROCESSA;
  {$EXTERNALSYM ENUM_SERVICE_STATUS_PROCESSA}
  TEnumServiceStatusProcessA = ENUM_SERVICE_STATUS_PROCESSA;
  PEnumServiceStatusProcessA = LPENUM_SERVICE_STATUS_PROCESSA;

  LPENUM_SERVICE_STATUS_PROCESSW = ^ENUM_SERVICE_STATUS_PROCESSW;
  {$EXTERNALSYM LPENUM_SERVICE_STATUS_PROCESSW}
  _ENUM_SERVICE_STATUS_PROCESSW = record
    lpServiceName: LPWSTR;
    lpDisplayName: LPWSTR;
    ServiceStatusProcess: SERVICE_STATUS_PROCESS;
  end;
  {$EXTERNALSYM _ENUM_SERVICE_STATUS_PROCESSW}
  ENUM_SERVICE_STATUS_PROCESSW = _ENUM_SERVICE_STATUS_PROCESSW;
  {$EXTERNALSYM ENUM_SERVICE_STATUS_PROCESSW}
  TEnumServiceStatusProcessW = ENUM_SERVICE_STATUS_PROCESSW;
  PEnumServiceStatusProcessW = LPENUM_SERVICE_STATUS_PROCESSW;

  {$IFDEF UNICODE}
  ENUM_SERVICE_STATUS_PROCESS = ENUM_SERVICE_STATUS_PROCESSW;
  {$EXTERNALSYM ENUM_SERVICE_STATUS_PROCESS}
  LPENUM_SERVICE_STATUS_PROCESS = LPENUM_SERVICE_STATUS_PROCESSW;
  {$EXTERNALSYM LPENUM_SERVICE_STATUS_PROCESS}
  TEnumServiceStatusProcess = TEnumServiceStatusProcessW;
  PEnumServiceStatusProcess = PEnumServiceStatusProcessW;
  {$ELSE}
  ENUM_SERVICE_STATUS_PROCESS = ENUM_SERVICE_STATUS_PROCESSA;
  {$EXTERNALSYM ENUM_SERVICE_STATUS_PROCESS}
  LPENUM_SERVICE_STATUS_PROCESS = LPENUM_SERVICE_STATUS_PROCESSA;
  {$EXTERNALSYM LPENUM_SERVICE_STATUS_PROCESS}
  TEnumServiceStatusProcess = TEnumServiceStatusProcessA;
  PEnumServiceStatusProcess = PEnumServiceStatusProcessA;
  {$ENDIF UNICODE}

//
// Structures for the Lock API functions
//

  SC_LOCK = LPVOID;
  {$EXTERNALSYM SC_LOCK}

  LPQUERY_SERVICE_LOCK_STATUSA = ^QUERY_SERVICE_LOCK_STATUSA;
  {$EXTERNALSYM LPQUERY_SERVICE_LOCK_STATUSA}
  _QUERY_SERVICE_LOCK_STATUSA = record
    fIsLocked: DWORD;
    lpLockOwner: LPSTR;
    dwLockDuration: DWORD;
  end;
  {$EXTERNALSYM _QUERY_SERVICE_LOCK_STATUSA}
  QUERY_SERVICE_LOCK_STATUSA = _QUERY_SERVICE_LOCK_STATUSA;
  {$EXTERNALSYM QUERY_SERVICE_LOCK_STATUSA}
  TQueryServiceLockStatusA = QUERY_SERVICE_LOCK_STATUSA;
  PQueryServiceLockStatusA = LPQUERY_SERVICE_LOCK_STATUSA;

  LPQUERY_SERVICE_LOCK_STATUSW = ^QUERY_SERVICE_LOCK_STATUSW;
  {$EXTERNALSYM LPQUERY_SERVICE_LOCK_STATUSW}
  _QUERY_SERVICE_LOCK_STATUSW = record
    fIsLocked: DWORD;
    lpLockOwner: LPWSTR;
    dwLockDuration: DWORD;
  end;
  {$EXTERNALSYM _QUERY_SERVICE_LOCK_STATUSW}
  QUERY_SERVICE_LOCK_STATUSW = _QUERY_SERVICE_LOCK_STATUSW;
  {$EXTERNALSYM QUERY_SERVICE_LOCK_STATUSW}
  TQueryServiceLockStatusW = QUERY_SERVICE_LOCK_STATUSW;
  PQueryServiceLockStatusW = LPQUERY_SERVICE_LOCK_STATUSW;

  {$IFDEF UNICODE}
  QUERY_SERVICE_LOCK_STATUS = QUERY_SERVICE_LOCK_STATUSW;
  {$EXTERNALSYM QUERY_SERVICE_LOCK_STATUS}
  LPQUERY_SERVICE_LOCK_STATUS = LPQUERY_SERVICE_LOCK_STATUSW;
  {$EXTERNALSYM LPQUERY_SERVICE_LOCK_STATUS}
  TQueryServiceLockStatus = TQueryServiceLockStatusW;
  PQueryServiceLockStatus = PQueryServiceLockStatusW;
  {$ELSE}
  QUERY_SERVICE_LOCK_STATUS = QUERY_SERVICE_LOCK_STATUSA;
  {$EXTERNALSYM QUERY_SERVICE_LOCK_STATUS}
  LPQUERY_SERVICE_LOCK_STATUS = LPQUERY_SERVICE_LOCK_STATUSA;
  {$EXTERNALSYM LPQUERY_SERVICE_LOCK_STATUS}
  TQueryServiceLockStatus = TQueryServiceLockStatusA;
  PQueryServiceLockStatus = PQueryServiceLockStatusA;
  {$ENDIF UNICODE}

//
// Query Service Configuration Structure
//

  LPQUERY_SERVICE_CONFIGA = ^QUERY_SERVICE_CONFIGA;
  {$EXTERNALSYM LPQUERY_SERVICE_CONFIGA}
  _QUERY_SERVICE_CONFIGA = record
    dwServiceType: DWORD;
    dwStartType: DWORD;
    dwErrorControl: DWORD;
    lpBinaryPathName: LPSTR;
    lpLoadOrderGroup: LPSTR;
    dwTagId: DWORD;
    lpDependencies: LPSTR;
    lpServiceStartName: LPSTR;
    lpDisplayName: LPSTR;
  end;
  {$EXTERNALSYM _QUERY_SERVICE_CONFIGA}
  QUERY_SERVICE_CONFIGA = _QUERY_SERVICE_CONFIGA;
  {$EXTERNALSYM QUERY_SERVICE_CONFIGA}
  TQueryServiceConfigA = QUERY_SERVICE_CONFIGA;
  PQueryServiceConfigA = LPQUERY_SERVICE_CONFIGA;

  LPQUERY_SERVICE_CONFIGW = ^QUERY_SERVICE_CONFIGW;
  {$EXTERNALSYM LPQUERY_SERVICE_CONFIGW}
  _QUERY_SERVICE_CONFIGW = record
    dwServiceType: DWORD;
    dwStartType: DWORD;
    dwErrorControl: DWORD;
    lpBinaryPathName: LPWSTR;
    lpLoadOrderGroup: LPWSTR;
    dwTagId: DWORD;
    lpDependencies: LPWSTR;
    lpServiceStartName: LPWSTR;
    lpDisplayName: LPWSTR;
  end;
  {$EXTERNALSYM _QUERY_SERVICE_CONFIGW}
  QUERY_SERVICE_CONFIGW = _QUERY_SERVICE_CONFIGW;
  {$EXTERNALSYM QUERY_SERVICE_CONFIGW}
  TQueryServiceConfigW = QUERY_SERVICE_CONFIGW;
  PQueryServiceConfigW = LPQUERY_SERVICE_CONFIGW;

  {$IFDEF UNICODE}
  QUERY_SERVICE_CONFIG = QUERY_SERVICE_CONFIGW;
  {$EXTERNALSYM QUERY_SERVICE_CONFIG}
  LPQUERY_SERVICE_CONFIG = LPQUERY_SERVICE_CONFIGW;
  {$EXTERNALSYM LPQUERY_SERVICE_CONFIG}
  TQueryServiceConfig = TQueryServiceConfigW;
  PQueryServiceConfig = PQueryServiceConfigW;
  {$ELSE}
  QUERY_SERVICE_CONFIG = QUERY_SERVICE_CONFIGA;
  {$EXTERNALSYM QUERY_SERVICE_CONFIG}
  LPQUERY_SERVICE_CONFIG = LPQUERY_SERVICE_CONFIGA;
  {$EXTERNALSYM LPQUERY_SERVICE_CONFIG}
  TQueryServiceConfig = TQueryServiceConfigA;
  PQueryServiceConfig = PQueryServiceConfigA;
  {$ENDIF UNICODE}

//
// Function Prototype for the Service Main Function
//

type
  LPSERVICE_MAIN_FUNCTIONW = procedure(dwNumServicesArgs: DWORD;
    lpServiceArgVectors: LPWSTR); stdcall;
  {$EXTERNALSYM LPSERVICE_MAIN_FUNCTIONW}
  LPSERVICE_MAIN_FUNCTIONA = procedure(dwNumServicesArgs: DWORD;
    lpServiceArgVectors: LPSTR); stdcall;
  {$EXTERNALSYM LPSERVICE_MAIN_FUNCTIONA}

  TServiceMainFunctionA = LPSERVICE_MAIN_FUNCTIONA;
  TServiceMainFunctionW = LPSERVICE_MAIN_FUNCTIONW;

  {$IFDEF UNICODE}
  LPSERVICE_MAIN_FUNCTION = LPSERVICE_MAIN_FUNCTIONW;
  {$EXTERNALSYM LPSERVICE_MAIN_FUNCTION}
  TServiceMainFunction = LPSERVICE_MAIN_FUNCTIONW;
  {$ELSE}
  LPSERVICE_MAIN_FUNCTION = LPSERVICE_MAIN_FUNCTIONA;
  {$EXTERNALSYM LPSERVICE_MAIN_FUNCTION}
  TServiceMainFunction = LPSERVICE_MAIN_FUNCTIONA;
  {$ENDIF UNICODE}

//
// Service Start Table
//

  LPSERVICE_TABLE_ENTRYA = ^SERVICE_TABLE_ENTRYA;
  {$EXTERNALSYM LPSERVICE_TABLE_ENTRYA}
  _SERVICE_TABLE_ENTRYA = record
    lpServiceName: LPSTR;
    lpServiceProc: LPSERVICE_MAIN_FUNCTIONA;
  end;
  {$EXTERNALSYM _SERVICE_TABLE_ENTRYA}
  SERVICE_TABLE_ENTRYA = _SERVICE_TABLE_ENTRYA;
  {$EXTERNALSYM SERVICE_TABLE_ENTRYA}
  TServiceTableEntryA = SERVICE_TABLE_ENTRYA;
  PServiceTableEntryA = LPSERVICE_TABLE_ENTRYA;

  LPSERVICE_TABLE_ENTRYW = ^SERVICE_TABLE_ENTRYW;
  {$EXTERNALSYM LPSERVICE_TABLE_ENTRYW}
  _SERVICE_TABLE_ENTRYW = record
    lpServiceName: LPWSTR;
    lpServiceProc: LPSERVICE_MAIN_FUNCTIONW;
  end;
  {$EXTERNALSYM _SERVICE_TABLE_ENTRYW}
  SERVICE_TABLE_ENTRYW = _SERVICE_TABLE_ENTRYW;
  {$EXTERNALSYM SERVICE_TABLE_ENTRYW}
  TServiceTableEntryW = SERVICE_TABLE_ENTRYW;
  PServiceTableEntryW = LPSERVICE_TABLE_ENTRYW;

  {$IFDEF UNICODE}
  SERVICE_TABLE_ENTRY = SERVICE_TABLE_ENTRYW;
  LPSERVICE_TABLE_ENTRY = LPSERVICE_TABLE_ENTRYW;
  TServiceTableEntry = TServiceTableEntryW;
  PServiceTableEntry = PServiceTableEntryW;
  {$ELSE}
  SERVICE_TABLE_ENTRY = SERVICE_TABLE_ENTRYA;
  LPSERVICE_TABLE_ENTRY = LPSERVICE_TABLE_ENTRYA;
  TServiceTableEntry = TServiceTableEntryA;
  PServiceTableEntry = PServiceTableEntryA;
  {$ENDIF UNICODE}

//
// Prototype for the Service Control Handler Function
//

  LPHANDLER_FUNCTION = procedure(dwControl: DWORD); stdcall;
  {$EXTERNALSYM LPHANDLER_FUNCTION}
  THandlerFunction = LPHANDLER_FUNCTION;

  LPHANDLER_FUNCTION_EX = function(dwControl, dwEventType: DWORD;
    lpEventData, lpContext: LPVOID): DWORD; stdcall;
  {$EXTERNALSYM LPHANDLER_FUNCTION_EX}
  THandlerFunctionEx = LPHANDLER_FUNCTION_EX;

///////////////////////////////////////////////////////////////////////////
// API Function Prototypes
///////////////////////////////////////////////////////////////////////////

function ChangeServiceConfigA(hService: SC_HANDLE; dwServiceType, dwStartType,
  dwErrorControl: DWORD; lpBinaryPathName, lpLoadOrderGroup: LPCSTR;
  lpdwTagId: LPDWORD; lpDependencies, lpServiceStartName, lpPassword,
  lpDisplayName: LPCSTR): BOOL; stdcall;
{$EXTERNALSYM ChangeServiceConfigA}
function ChangeServiceConfigW(hService: SC_HANDLE; dwServiceType, dwStartType,
  dwErrorControl: DWORD; lpBinaryPathName, lpLoadOrderGroup: LPCWSTR;
  lpdwTagId: LPDWORD; lpDependencies, lpServiceStartName, lpPassword,
  lpDisplayName: LPCWSTR): BOOL; stdcall;
{$EXTERNALSYM ChangeServiceConfigW}
function ChangeServiceConfig(hService: SC_HANDLE; dwServiceType, dwStartType,
  dwErrorControl: DWORD; lpBinaryPathName, lpLoadOrderGroup: LPCTSTR;
  lpdwTagId: LPDWORD; lpDependencies, lpServiceStartName, lpPassword,
  lpDisplayName: LPCTSTR): BOOL; stdcall;
{$EXTERNALSYM ChangeServiceConfig}

function ChangeServiceConfig2A(hService: SC_HANDLE; dwInfoLevel: DWORD;
  lpInfo: LPVOID): BOOL; stdcall;
{$EXTERNALSYM ChangeServiceConfig2A}
function ChangeServiceConfig2W(hService: SC_HANDLE; dwInfoLevel: DWORD;
  lpInfo: LPVOID): BOOL; stdcall;
{$EXTERNALSYM ChangeServiceConfig2W}
function ChangeServiceConfig2(hService: SC_HANDLE; dwInfoLevel: DWORD;
  lpInfo: LPVOID): BOOL; stdcall;
{$EXTERNALSYM ChangeServiceConfig2}

function CloseServiceHandle(hSCObject: SC_HANDLE): BOOL; stdcall;
{$EXTERNALSYM CloseServiceHandle}

function ControlService(hService: SC_HANDLE; dwControl: DWORD;
  var lpServiceStatus: SERVICE_STATUS): BOOL; stdcall;
{$EXTERNALSYM ControlService}

function CreateServiceA(hSCManager: SC_HANDLE; lpServiceName, lpDisplayName: LPCSTR;
  dwDesiredAccess, dwServiceType, dwStartType, dwErrorControl: DWORD;
  lpBinaryPathName, lpLoadOrderGroup: LPCSTR; lpdwTagId: LPDWORD;
  lpDependencies, lpServiceStartName, lpPassword: LPCSTR): SC_HANDLE; stdcall;
{$EXTERNALSYM CreateServiceA}
function CreateServiceW(hSCManager: SC_HANDLE; lpServiceName, lpDisplayName: LPCWSTR;
  dwDesiredAccess, dwServiceType, dwStartType, dwErrorControl: DWORD;
  lpBinaryPathName, lpLoadOrderGroup: LPCWSTR; lpdwTagId: LPDWORD;
  lpDependencies, lpServiceStartName, lpPassword: LPCWSTR): SC_HANDLE; stdcall;
{$EXTERNALSYM CreateServiceW}
function CreateService(hSCManager: SC_HANDLE; lpServiceName, lpDisplayName: LPCTSTR;
  dwDesiredAccess, dwServiceType, dwStartType, dwErrorControl: DWORD;
  lpBinaryPathName, lpLoadOrderGroup: LPCTSTR; lpdwTagId: LPDWORD;
  lpDependencies, lpServiceStartName, lpPassword: LPCTSTR): SC_HANDLE; stdcall;
{$EXTERNALSYM CreateService}

function DeleteService(hService: SC_HANDLE): BOOL; stdcall;
{$EXTERNALSYM DeleteService}

function EnumDependentServicesA(hService: SC_HANDLE; dwServiceState: DWORD;
  lpServices: LPENUM_SERVICE_STATUSA; cbBufSize: DWORD; var pcbBytesNeeded,
  lpServicesReturned: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumDependentServicesA}
function EnumDependentServicesW(hService: SC_HANDLE; dwServiceState: DWORD;
  lpServices: LPENUM_SERVICE_STATUSW; cbBufSize: DWORD; var pcbBytesNeeded,
  lpServicesReturned: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumDependentServicesW}
function EnumDependentServices(hService: SC_HANDLE; dwServiceState: DWORD;
  lpServices: LPENUM_SERVICE_STATUS; cbBufSize: DWORD; var pcbBytesNeeded,
  lpServicesReturned: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumDependentServices}

function EnumServicesStatusA(hSCManager: SC_HANDLE; dwServiceType: DWORD;
  dwServiceState: DWORD; lpServices: LPENUM_SERVICE_STATUSA; cbBufSize: DWORD;
  var pcbBytesNeeded, lpServicesReturned, lpResumeHandle: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumServicesStatusA}
function EnumServicesStatusW(hSCManager: SC_HANDLE; dwServiceType: DWORD;
  dwServiceState: DWORD; lpServices: LPENUM_SERVICE_STATUSW; cbBufSize: DWORD;
  var pcbBytesNeeded, lpServicesReturned, lpResumeHandle: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumServicesStatusW}
function EnumServicesStatus(hSCManager: SC_HANDLE; dwServiceType: DWORD;
  dwServiceState: DWORD; lpServices: LPENUM_SERVICE_STATUS; cbBufSize: DWORD;
  var pcbBytesNeeded, lpServicesReturned, lpResumeHandle: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumServicesStatus}

function EnumServicesStatusExA(hSCManager: SC_HANDLE; InfoLevel: SC_ENUM_TYPE;
  dwServiceType: DWORD; dwServiceState: DWORD; lpServices: LPBYTE;
  cbBufSize: DWORD; var pcbBytesNeeded, lpServicesReturned, lpResumeHandle: DWORD;
  pszGroupName: LPCSTR): BOOL; stdcall;
{$EXTERNALSYM EnumServicesStatusExA}
function EnumServicesStatusExW(hSCManager: SC_HANDLE; InfoLevel: SC_ENUM_TYPE;
  dwServiceType: DWORD; dwServiceState: DWORD; lpServices: LPBYTE;
  cbBufSize: DWORD; var pcbBytesNeeded, lpServicesReturned, lpResumeHandle: DWORD;
  pszGroupName: LPCWSTR): BOOL; stdcall;
{$EXTERNALSYM EnumServicesStatusExW}
function EnumServicesStatusEx(hSCManager: SC_HANDLE; InfoLevel: SC_ENUM_TYPE;
  dwServiceType: DWORD; dwServiceState: DWORD; lpServices: LPBYTE;
  cbBufSize: DWORD; var pcbBytesNeeded, lpServicesReturned, lpResumeHandle: DWORD;
  pszGroupName: LPCTSTR): BOOL; stdcall;
{$EXTERNALSYM EnumServicesStatusEx}

function GetServiceKeyNameA(hSCManager: SC_HANDLE; lpDisplayName: LPCSTR;
  lpServiceName: LPSTR; var lpcchBuffer: DWORD): BOOL; stdcall;
{$EXTERNALSYM GetServiceKeyNameA}
function GetServiceKeyNameW(hSCManager: SC_HANDLE; lpDisplayName: LPCWSTR;
  lpServiceName: LPWSTR; var lpcchBuffer: DWORD): BOOL; stdcall;
{$EXTERNALSYM GetServiceKeyNameW}
function GetServiceKeyName(hSCManager: SC_HANDLE; lpDisplayName: LPCTSTR;
  lpServiceName: LPTSTR; var lpcchBuffer: DWORD): BOOL; stdcall;
{$EXTERNALSYM GetServiceKeyName}

function GetServiceDisplayNameA(hSCManager: SC_HANDLE; lpServiceName: LPCSTR;
  lpDisplayName: LPSTR; var lpcchBuffer: DWORD): BOOL; stdcall;
{$EXTERNALSYM GetServiceDisplayNameA}
function GetServiceDisplayNameW(hSCManager: SC_HANDLE; lpServiceName: LPCWSTR;
  lpDisplayName: LPWSTR; var lpcchBuffer: DWORD): BOOL; stdcall;
{$EXTERNALSYM GetServiceDisplayNameW}
function GetServiceDisplayName(hSCManager: SC_HANDLE; lpServiceName: LPCTSTR;
  lpDisplayName: LPTSTR; var lpcchBuffer: DWORD): BOOL; stdcall;
{$EXTERNALSYM GetServiceDisplayName}

function LockServiceDatabase(hSCManager: SC_HANDLE): SC_LOCK; stdcall;
{$EXTERNALSYM LockServiceDatabase}

function NotifyBootConfigStatus(BootAcceptable: BOOL): BOOL; stdcall;
{$EXTERNALSYM NotifyBootConfigStatus}

function OpenSCManagerA(lpMachineName: LPCSTR; lpDatabaseName: LPCSTR;
  dwDesiredAccess: DWORD): SC_HANDLE; stdcall;
{$EXTERNALSYM OpenSCManagerA}
function OpenSCManagerW(lpMachineName: LPCWSTR; lpDatabaseName: LPCWSTR;
  dwDesiredAccess: DWORD): SC_HANDLE; stdcall;
{$EXTERNALSYM OpenSCManagerW}
function OpenSCManager(lpMachineName: LPCTSTR; lpDatabaseName: LPCTSTR;
  dwDesiredAccess: DWORD): SC_HANDLE; stdcall;
{$EXTERNALSYM OpenSCManager}

function OpenServiceA(hSCManager: SC_HANDLE; lpServiceName: LPCSTR;
  dwDesiredAccess: DWORD): SC_HANDLE; stdcall;
{$EXTERNALSYM OpenServiceA}
function OpenServiceW(hSCManager: SC_HANDLE; lpServiceName: LPCWSTR;
  dwDesiredAccess: DWORD): SC_HANDLE; stdcall;
{$EXTERNALSYM OpenServiceW}
function OpenService(hSCManager: SC_HANDLE; lpServiceName: LPCTSTR;
  dwDesiredAccess: DWORD): SC_HANDLE; stdcall;
{$EXTERNALSYM OpenService}

function QueryServiceConfigA(hService: SC_HANDLE;
  lpServiceConfig: LPQUERY_SERVICE_CONFIGA; cbBufSize: DWORD;
  var pcbBytesNeeded: DWORD): BOOL; stdcall;
{$EXTERNALSYM QueryServiceConfigA}
function QueryServiceConfigW(hService: SC_HANDLE;
  lpServiceConfig: LPQUERY_SERVICE_CONFIGW; cbBufSize: DWORD;
  var pcbBytesNeeded: DWORD): BOOL; stdcall;
{$EXTERNALSYM QueryServiceConfigW}
function QueryServiceConfig(hService: SC_HANDLE;
  lpServiceConfig: LPQUERY_SERVICE_CONFIG; cbBufSize: DWORD;
  var pcbBytesNeeded: DWORD): BOOL; stdcall;
{$EXTERNALSYM QueryServiceConfig}

function QueryServiceConfig2A(hService: SC_HANDLE; dwInfoLevel: DWORD;
  lpBuffer: LPBYTE; cbBufSize: DWORD; var pcbBytesNeeded: DWORD): BOOL; stdcall;
{$EXTERNALSYM QueryServiceConfig2A}
function QueryServiceConfig2W(hService: SC_HANDLE; dwInfoLevel: DWORD;
  lpBuffer: LPBYTE; cbBufSize: DWORD; var pcbBytesNeeded: DWORD): BOOL; stdcall;
{$EXTERNALSYM QueryServiceConfig2W}
function QueryServiceConfig2(hService: SC_HANDLE; dwInfoLevel: DWORD;
  lpBuffer: LPBYTE; cbBufSize: DWORD; var pcbBytesNeeded: DWORD): BOOL; stdcall;
{$EXTERNALSYM QueryServiceConfig2}

function QueryServiceLockStatusA(hSCManager: SC_HANDLE;
  lpLockStatus: LPQUERY_SERVICE_LOCK_STATUSA; cbBufSize: DWORD;
  var pcbBytesNeeded: DWORD): BOOL; stdcall;
{$EXTERNALSYM QueryServiceLockStatusA}
function QueryServiceLockStatusW(hSCManager: SC_HANDLE;
  lpLockStatus: LPQUERY_SERVICE_LOCK_STATUSW; cbBufSize: DWORD;
  var pcbBytesNeeded: DWORD): BOOL; stdcall;
{$EXTERNALSYM QueryServiceLockStatusW}
function QueryServiceLockStatus(hSCManager: SC_HANDLE;
  lpLockStatus: LPQUERY_SERVICE_LOCK_STATUS; cbBufSize: DWORD;
  var pcbBytesNeeded: DWORD): BOOL; stdcall;
{$EXTERNALSYM QueryServiceLockStatus}

function QueryServiceObjectSecurity(hService: SC_HANDLE;
  dwSecurityInformation: SECURITY_INFORMATION;
  var lpSecurityDescriptor: SECURITY_DESCRIPTOR; cbBufSize: DWORD;
  var pcbBytesNeeded: DWORD): BOOL; stdcall;
{$EXTERNALSYM QueryServiceObjectSecurity}

function QueryServiceStatus(hService: SC_HANDLE;
  var lpServiceStatus: SERVICE_STATUS): BOOL; stdcall;
{$EXTERNALSYM QueryServiceStatus}

function QueryServiceStatusEx(hService: SC_HANDLE; InfoLevel: SC_STATUS_TYPE;
  lpBuffer: LPBYTE; cbBufSize: DWORD; var pcbBytesNeeded: DWORD): BOOL; stdcall;
{$EXTERNALSYM QueryServiceStatusEx}

function RegisterServiceCtrlHandlerA(lpServiceName: LPCSTR;
  lpHandlerProc: LPHANDLER_FUNCTION): SERVICE_STATUS_HANDLE; stdcall;
{$EXTERNALSYM RegisterServiceCtrlHandlerA}
function RegisterServiceCtrlHandlerW(lpServiceName: LPCWSTR;
  lpHandlerProc: LPHANDLER_FUNCTION): SERVICE_STATUS_HANDLE; stdcall;
{$EXTERNALSYM RegisterServiceCtrlHandlerW}
function RegisterServiceCtrlHandler(lpServiceName: LPCTSTR;
  lpHandlerProc: LPHANDLER_FUNCTION): SERVICE_STATUS_HANDLE; stdcall;
{$EXTERNALSYM RegisterServiceCtrlHandler}

function RegisterServiceCtrlHandlerExA(lpServiceName: LPCSTR;
  lpHandlerProc: LPHANDLER_FUNCTION_EX; lpContext: LPVOID): SERVICE_STATUS_HANDLE; stdcall;
{$EXTERNALSYM RegisterServiceCtrlHandlerExA}
function RegisterServiceCtrlHandlerExW(lpServiceName: LPCWSTR;
  lpHandlerProc: LPHANDLER_FUNCTION_EX; lpContext: LPVOID): SERVICE_STATUS_HANDLE; stdcall;
{$EXTERNALSYM RegisterServiceCtrlHandlerExW}
function RegisterServiceCtrlHandlerEx(lpServiceName: LPCTSTR;
  lpHandlerProc: LPHANDLER_FUNCTION_EX; lpContext: LPVOID): SERVICE_STATUS_HANDLE; stdcall;
{$EXTERNALSYM RegisterServiceCtrlHandlerEx}

// 9/4/2002 Changed last parameter from const to pointer - reported by James Ots.

function SetServiceObjectSecurity(hService: SC_HANDLE;
  dwSecurityInformation: SECURITY_INFORMATION;
  lpSecurityDescriptor: PSECURITY_DESCRIPTOR): BOOL; stdcall;
{$EXTERNALSYM SetServiceObjectSecurity}

function SetServiceStatus(hServiceStatus: SERVICE_STATUS_HANDLE;
  const lpServiceStatus: SERVICE_STATUS): BOOL; stdcall;
{$EXTERNALSYM SetServiceStatus}

function StartServiceCtrlDispatcherA(lpServiceStartTable: LPSERVICE_TABLE_ENTRYA): BOOL; stdcall;
{$EXTERNALSYM StartServiceCtrlDispatcherA}
function StartServiceCtrlDispatcherW(lpServiceStartTable: LPSERVICE_TABLE_ENTRYW): BOOL; stdcall;
{$EXTERNALSYM StartServiceCtrlDispatcherW}
function StartServiceCtrlDispatcher(lpServiceStartTable: LPSERVICE_TABLE_ENTRY): BOOL; stdcall;
{$EXTERNALSYM StartServiceCtrlDispatcher}

function StartServiceA(hService: SC_HANDLE; dwNumServiceArgs: DWORD;
  lpServiceArgVectors: LPCSTR): BOOL; stdcall;
{$EXTERNALSYM StartServiceA}
function StartServiceW(hService: SC_HANDLE; dwNumServiceArgs: DWORD;
  lpServiceArgVectors: LPCWSTR): BOOL; stdcall;
{$EXTERNALSYM StartServiceW}
function StartService(hService: SC_HANDLE; dwNumServiceArgs: DWORD;
  lpServiceArgVectors: LPCTSTR): BOOL; stdcall;
{$EXTERNALSYM StartService}

function UnlockServiceDatabase(ScLock: SC_LOCK): BOOL; stdcall;
{$EXTERNALSYM UnlockServiceDatabase}

{$ENDIF JWA_IMPLEMENTATIONSECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
implementation
//uses ...
{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_INTERFACESECTION}

{$IFNDEF JWA_INCLUDEMODE}
const
  advapi32 = 'advapi32.dll';
  {$IFDEF UNICODE}
  AWSuffix = 'W';
  {$ELSE}
  AWSuffix = 'A';
  {$ENDIF UNICODE}
{$ENDIF JWA_INCLUDEMODE}


function ChangeServiceConfigA; external advapi32 name 'ChangeServiceConfigA' delayed;
function ChangeServiceConfigW; external advapi32 name 'ChangeServiceConfigW' delayed;
function ChangeServiceConfig; external advapi32 name 'ChangeServiceConfig' + AWSuffix delayed;
function ChangeServiceConfig2A; external advapi32 name 'ChangeServiceConfig2A' delayed;
function ChangeServiceConfig2W; external advapi32 name 'ChangeServiceConfig2W' delayed;
function ChangeServiceConfig2; external advapi32 name 'ChangeServiceConfig2' + AWSuffix delayed;
function CloseServiceHandle; external advapi32 name 'CloseServiceHandle' delayed;
function ControlService; external advapi32 name 'ControlService' delayed;
function CreateServiceA; external advapi32 name 'CreateServiceA' delayed;
function CreateServiceW; external advapi32 name 'CreateServiceW' delayed;
function CreateService; external advapi32 name 'CreateService' + AWSuffix delayed;
function DeleteService; external advapi32 name 'DeleteService' delayed;
function EnumDependentServicesA; external advapi32 name 'EnumDependentServicesA' delayed;
function EnumDependentServicesW; external advapi32 name 'EnumDependentServicesW' delayed;
function EnumDependentServices; external advapi32 name 'EnumDependentServices' + AWSuffix delayed;
function EnumServicesStatusA; external advapi32 name 'EnumServicesStatusA' delayed;
function EnumServicesStatusW; external advapi32 name 'EnumServicesStatusW' delayed;
function EnumServicesStatus; external advapi32 name 'EnumServicesStatus' + AWSuffix delayed;
function EnumServicesStatusExA; external advapi32 name 'EnumServicesStatusExA' delayed;
function EnumServicesStatusExW; external advapi32 name 'EnumServicesStatusExW' delayed;
function EnumServicesStatusEx; external advapi32 name 'EnumServicesStatusEx' + AWSuffix delayed;
function GetServiceKeyNameA; external advapi32 name 'GetServiceKeyNameA' delayed;
function GetServiceKeyNameW; external advapi32 name 'GetServiceKeyNameW' delayed;
function GetServiceKeyName; external advapi32 name 'GetServiceKeyName' + AWSuffix delayed;
function GetServiceDisplayNameA; external advapi32 name 'GetServiceDisplayNameA' delayed;
function GetServiceDisplayNameW; external advapi32 name 'GetServiceDisplayNameW' delayed;
function GetServiceDisplayName; external advapi32 name 'GetServiceDisplayName' + AWSuffix delayed;
function LockServiceDatabase; external advapi32 name 'LockServiceDatabase' delayed;
function NotifyBootConfigStatus; external advapi32 name 'NotifyBootConfigStatus' delayed;
function OpenSCManagerA; external advapi32 name 'OpenSCManagerA' delayed;
function OpenSCManagerW; external advapi32 name 'OpenSCManagerW' delayed;
function OpenSCManager; external advapi32 name 'OpenSCManager' + AWSuffix delayed;
function OpenServiceA; external advapi32 name 'OpenServiceA' delayed;
function OpenServiceW; external advapi32 name 'OpenServiceW' delayed;
function OpenService; external advapi32 name 'OpenService' + AWSuffix delayed;
function QueryServiceConfigA; external advapi32 name 'QueryServiceConfigA' delayed;
function QueryServiceConfigW; external advapi32 name 'QueryServiceConfigW' delayed;
function QueryServiceConfig; external advapi32 name 'QueryServiceConfig' + AWSuffix delayed;
function QueryServiceConfig2A; external advapi32 name 'QueryServiceConfig2A' delayed;
function QueryServiceConfig2W; external advapi32 name 'QueryServiceConfig2W' delayed;
function QueryServiceConfig2; external advapi32 name 'QueryServiceConfig2' + AWSuffix delayed;
function QueryServiceLockStatusA; external advapi32 name 'QueryServiceLockStatusA' delayed;
function QueryServiceLockStatusW; external advapi32 name 'QueryServiceLockStatusW' delayed;
function QueryServiceLockStatus; external advapi32 name 'QueryServiceLockStatus' + AWSuffix delayed;
function QueryServiceObjectSecurity; external advapi32 name 'QueryServiceObjectSecurity' delayed;
function QueryServiceStatus; external advapi32 name 'QueryServiceStatus' delayed;
function QueryServiceStatusEx; external advapi32 name 'QueryServiceStatusEx' delayed;
function RegisterServiceCtrlHandlerA; external advapi32 name 'RegisterServiceCtrlHandlerA' delayed;
function RegisterServiceCtrlHandlerW; external advapi32 name 'RegisterServiceCtrlHandlerW' delayed;
function RegisterServiceCtrlHandler; external advapi32 name 'RegisterServiceCtrlHandler' + AWSuffix delayed;
function RegisterServiceCtrlHandlerExA; external advapi32 name 'RegisterServiceCtrlHandlerExA' delayed;
function RegisterServiceCtrlHandlerExW; external advapi32 name 'RegisterServiceCtrlHandlerExW' delayed;
function RegisterServiceCtrlHandlerEx; external advapi32 name 'RegisterServiceCtrlHandlerEx' + AWSuffix delayed;
function SetServiceObjectSecurity; external advapi32 name 'SetServiceObjectSecurity' delayed;
function SetServiceStatus; external advapi32 name 'SetServiceStatus' delayed;
function StartServiceCtrlDispatcherA; external advapi32 name 'StartServiceCtrlDispatcherA' delayed;
function StartServiceCtrlDispatcherW; external advapi32 name 'StartServiceCtrlDispatcherW' delayed;
function StartServiceCtrlDispatcher; external advapi32 name 'StartServiceCtrlDispatcher' + AWSuffix delayed;
function StartServiceA; external advapi32 name 'StartServiceA' delayed;
function StartServiceW; external advapi32 name 'StartServiceW' delayed;
function StartService; external advapi32 name 'StartService' + AWSuffix delayed;
function UnlockServiceDatabase; external advapi32 name 'UnlockServiceDatabase' delayed;


{$ENDIF JWA_INTERFACESECTION}


{$IFNDEF JWA_OMIT_SECTIONS}
end.
{$ENDIF JWA_OMIT_SECTIONS}
