{******************************************************************************}
{                                                                              }
{ Windows Installer API interface Unit for Object Pascal                       }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2001 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The original file is: msiquery.h, released June 2000. The original Pascal    }
{ code is: MsiQuery.pas, released June 2001. The initial developer of the      }
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

// $Id: JwaMsiQuery.pas,v 1.11 2007/09/05 11:58:51 dezipaitor Exp $
{$IFNDEF JWA_OMIT_SECTIONS}
unit JwaMsiQuery;

{$WEAKPACKAGEUNIT}
{$ENDIF JWA_OMIT_SECTIONS}

{$HPPEMIT ''}
{$HPPEMIT '#include "msiquery.h"'}
{$HPPEMIT ''}

{$IFNDEF JWA_OMIT_SECTIONS}
{$I ..\Includes\JediAPILib.inc}

interface

uses
  JwaMsi, JwaWinBase, JwaWinType;
{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_IMPLEMENTATIONSECTION}
(*****************************************************************************\
*                                                                             *
* MsiQuery.h - Interface to running installer for custom actions and tools    *
*                                                                             *
* Version 1.0 - 1.2                                                           *
*                                                                             *
* NOTES:  All buffers sizes are TCHAR count, null included only on input      *
*         Return argument pointers may be null if not interested in value     *
*         Returned handles of all types must be closed: MsiCloseHandle(h)     *
*         Functions with UINT return type return a system error code          *
*         Designated functions will set or clear the last error record,       *
*         which is then accessible with MsiGetLastErrorRecord. However,       *
*         the following argument errors do not register an error record:      *
*         ERROR_INVALID_HANDLE, ERROR_INVALID_PARAMETER, ERROR_MORE_DATA.     *
*                                                                             *
* Copyright (c) 1999-2000, Microsoft Corp.      All rights reserved.          *
*                                                                             *
\*****************************************************************************)

const
  MSI_NULL_INTEGER = DWORD($80000000);  // integer value reserved for null
  {$EXTERNALSYM MSI_NULL_INTEGER}

// MsiOpenDatabase persist predefine values, otherwise output database path is used

  MSIDBOPEN_READONLY     = LPCTSTR(0);  // database open read-only, no persistent changes
  {$EXTERNALSYM MSIDBOPEN_READONLY}
  MSIDBOPEN_TRANSACT     = LPCTSTR(1);  // database read/write in transaction mode
  {$EXTERNALSYM MSIDBOPEN_TRANSACT}
  MSIDBOPEN_DIRECT       = LPCTSTR(2);  // database direct read/write without transaction
  {$EXTERNALSYM MSIDBOPEN_DIRECT}
  MSIDBOPEN_CREATE       = LPCTSTR(3);  // create new database, transact mode read/write
  {$EXTERNALSYM MSIDBOPEN_CREATE}
  MSIDBOPEN_CREATEDIRECT = LPCTSTR(4);  // create new database, direct mode read/write
  {$EXTERNALSYM MSIDBOPEN_CREATEDIRECT}

  MSIDBOPEN_PATCHFILE    = 32 div SizeOf(TCHAR); // add flag to indicate patch file

  MSIDBSTATE_ERROR    = DWORD(-1);  // invalid database handle
  {$EXTERNALSYM MSIDBSTATE_ERROR}
  MSIDBSTATE_READ     =  0;  // database open read-only, no persistent changes
  {$EXTERNALSYM MSIDBSTATE_READ}
  MSIDBSTATE_WRITE    =  1;  // database readable and updatable
  {$EXTERNALSYM MSIDBSTATE_WRITE}

type
  MSIDBSTATE = DWORD;
  {$EXTERNALSYM MSIDBSTATE}
  TMsiDbState = MSIDBSTATE;

const
  MSIMODIFY_SEEK             = DWORD(-1);  // reposition to current record primary key
  {$EXTERNALSYM MSIMODIFY_SEEK}
  MSIMODIFY_REFRESH          = 0;  // refetch current record data
  {$EXTERNALSYM MSIMODIFY_REFRESH}
  MSIMODIFY_INSERT           = 1;  // insert new record, fails if matching key exists
  {$EXTERNALSYM MSIMODIFY_INSERT}
  MSIMODIFY_UPDATE           = 2;  // update existing non-key data of fetched record
  {$EXTERNALSYM MSIMODIFY_UPDATE}
  MSIMODIFY_ASSIGN           = 3;  // insert record, replacing any existing record
  {$EXTERNALSYM MSIMODIFY_ASSIGN}
  MSIMODIFY_REPLACE          = 4;  // update record, delete old if primary key edit
  {$EXTERNALSYM MSIMODIFY_REPLACE}
  MSIMODIFY_MERGE            = 5;  // fails if record with duplicate key not identical
  {$EXTERNALSYM MSIMODIFY_MERGE}
  MSIMODIFY_DELETE           = 6;  // remove row referenced by this record from table
  {$EXTERNALSYM MSIMODIFY_DELETE}
  MSIMODIFY_INSERT_TEMPORARY = 7;  // insert a temporary record
  {$EXTERNALSYM MSIMODIFY_INSERT_TEMPORARY}
  MSIMODIFY_VALIDATE         = 8;  // validate a fetched record
  {$EXTERNALSYM MSIMODIFY_VALIDATE}
  MSIMODIFY_VALIDATE_NEW     = 9;  // validate a new record
  {$EXTERNALSYM MSIMODIFY_VALIDATE_NEW}
  MSIMODIFY_VALIDATE_FIELD   = 10; // validate field(s) of an incomplete record
  {$EXTERNALSYM MSIMODIFY_VALIDATE_FIELD}
  MSIMODIFY_VALIDATE_DELETE  = 11; // validate before deleting record
  {$EXTERNALSYM MSIMODIFY_VALIDATE_DELETE}

type
  MSIMODIFY = DWORD;
  {$EXTERNALSYM MSIMODIFY}
  TMsiModify = MSIMODIFY;

const
  MSICOLINFO_NAMES = 0;  // return column names
  {$EXTERNALSYM MSICOLINFO_NAMES}
  MSICOLINFO_TYPES = 1;  // return column definitions, datatype code followed by width
  {$EXTERNALSYM MSICOLINFO_TYPES}

type
  MSICOLINFO = DWORD;
  {$EXTERNALSYM MSICOLINFO}
  TMsiColInfo = MSICOLINFO;

const
  MSICONDITION_FALSE = 0;  // expression evaluates to False
  {$EXTERNALSYM MSICONDITION_FALSE}
  MSICONDITION_TRUE  = 1;  // expression evaluates to True
  {$EXTERNALSYM MSICONDITION_TRUE}
  MSICONDITION_NONE  = 2;  // no expression present
  {$EXTERNALSYM MSICONDITION_NONE}
  MSICONDITION_ERROR = 3;  // syntax error in expression
  {$EXTERNALSYM MSICONDITION_ERROR}

type
  MSICONDITION = DWORD;
  {$EXTERNALSYM MSICONDITION}
  TMsiCondition = MSICONDITION;

const
  MSICOSTTREE_SELFONLY = 0;
  {$EXTERNALSYM MSICOSTTREE_SELFONLY}
  MSICOSTTREE_CHILDREN = 1;
  {$EXTERNALSYM MSICOSTTREE_CHILDREN}
  MSICOSTTREE_PARENTS  = 2;
  {$EXTERNALSYM MSICOSTTREE_PARENTS}
  MSICOSTTREE_RESERVED = 3;  // Reserved for future use
  {$EXTERNALSYM MSICOSTTREE_RESERVED}

type
  MSICOSTTREE = DWORD;
  {$EXTERNALSYM MSICOSTTREE}
  TMsiCostTree = MSICOSTTREE;

const
  MSIDBERROR_INVALIDARG        = DWORD(-3); //  invalid argument
  {$EXTERNALSYM MSIDBERROR_INVALIDARG}
  MSIDBERROR_MOREDATA          = DWORD(-2); //  buffer too small
  {$EXTERNALSYM MSIDBERROR_MOREDATA}
  MSIDBERROR_FUNCTIONERROR     = DWORD(-1); //  function error
  {$EXTERNALSYM MSIDBERROR_FUNCTIONERROR}
  MSIDBERROR_NOERROR           = 0;  //  no error
  {$EXTERNALSYM MSIDBERROR_NOERROR}
  MSIDBERROR_DUPLICATEKEY      = 1;  //  new record duplicates primary keys of existing record in table
  {$EXTERNALSYM MSIDBERROR_DUPLICATEKEY}
  MSIDBERROR_REQUIRED          = 2;  //  non-nullable column, no null values allowed
  {$EXTERNALSYM MSIDBERROR_REQUIRED}
  MSIDBERROR_BADLINK           = 3;  //  corresponding record in foreign table not found
  {$EXTERNALSYM MSIDBERROR_BADLINK}
  MSIDBERROR_OVERFLOW          = 4;  //  data greater than maximum value allowed
  {$EXTERNALSYM MSIDBERROR_OVERFLOW}
  MSIDBERROR_UNDERFLOW         = 5;  //  data less than minimum value allowed
  {$EXTERNALSYM MSIDBERROR_UNDERFLOW}
  MSIDBERROR_NOTINSET          = 6;  //  data not a member of the values permitted in the set
  {$EXTERNALSYM MSIDBERROR_NOTINSET}
  MSIDBERROR_BADVERSION        = 7;  //  invalid version string
  {$EXTERNALSYM MSIDBERROR_BADVERSION}
  MSIDBERROR_BADCASE           = 8;  //  invalid case, must be all upper-case or all lower-case
  {$EXTERNALSYM MSIDBERROR_BADCASE}
  MSIDBERROR_BADGUID           = 9;  //  invalid GUID
  {$EXTERNALSYM MSIDBERROR_BADGUID}
  MSIDBERROR_BADWILDCARD       = 10; //  invalid wildcardfilename or use of wildcards
  {$EXTERNALSYM MSIDBERROR_BADWILDCARD}
  MSIDBERROR_BADIDENTIFIER     = 11; //  bad identifier
  {$EXTERNALSYM MSIDBERROR_BADIDENTIFIER}
  MSIDBERROR_BADLANGUAGE       = 12; //  bad language Id(s)
  {$EXTERNALSYM MSIDBERROR_BADLANGUAGE}
  MSIDBERROR_BADFILENAME       = 13; //  bad filename
  {$EXTERNALSYM MSIDBERROR_BADFILENAME}
  MSIDBERROR_BADPATH           = 14; //  bad path
  {$EXTERNALSYM MSIDBERROR_BADPATH}
  MSIDBERROR_BADCONDITION      = 15; //  bad conditional statement
  {$EXTERNALSYM MSIDBERROR_BADCONDITION}
  MSIDBERROR_BADFORMATTED      = 16; //  bad format string
  {$EXTERNALSYM MSIDBERROR_BADFORMATTED}
  MSIDBERROR_BADTEMPLATE       = 17; //  bad template string
  {$EXTERNALSYM MSIDBERROR_BADTEMPLATE}
  MSIDBERROR_BADDEFAULTDIR     = 18; //  bad string in DefaultDir column of Directory table
  {$EXTERNALSYM MSIDBERROR_BADDEFAULTDIR}
  MSIDBERROR_BADREGPATH        = 19; //  bad registry path string
  {$EXTERNALSYM MSIDBERROR_BADREGPATH}
  MSIDBERROR_BADCUSTOMSOURCE   = 20; //  bad string in CustomSource column of CustomAction table
  {$EXTERNALSYM MSIDBERROR_BADCUSTOMSOURCE}
  MSIDBERROR_BADPROPERTY       = 21; //  bad property string
  {$EXTERNALSYM MSIDBERROR_BADPROPERTY}
  MSIDBERROR_MISSINGDATA       = 22; //  _Validation table missing reference to column
  {$EXTERNALSYM MSIDBERROR_MISSINGDATA}
  MSIDBERROR_BADCATEGORY       = 23; //  Category column of _Validation table for column is invalid
  {$EXTERNALSYM MSIDBERROR_BADCATEGORY}
  MSIDBERROR_BADKEYTABLE       = 24; //  table in KeyTable column of _Validation table could not be found/loaded
  {$EXTERNALSYM MSIDBERROR_BADKEYTABLE}
  MSIDBERROR_BADMAXMINVALUES   = 25; //  value in MaxValue column of _Validation table is less than value in MinValue column
  {$EXTERNALSYM MSIDBERROR_BADMAXMINVALUES}
  MSIDBERROR_BADCABINET        = 26; //  bad cabinet name
  {$EXTERNALSYM MSIDBERROR_BADCABINET}
  MSIDBERROR_BADSHORTCUT       = 27; //  bad shortcut target
  {$EXTERNALSYM MSIDBERROR_BADSHORTCUT}
  MSIDBERROR_STRINGOVERFLOW    = 28; //  string overflow (greater than length allowed in column def)
  {$EXTERNALSYM MSIDBERROR_STRINGOVERFLOW}
  MSIDBERROR_BADLOCALIZEATTRIB = 29; //  invalid localization attribute (primary keys cannot be localized)
  {$EXTERNALSYM MSIDBERROR_BADLOCALIZEATTRIB}

type
  MSIDBERROR = DWORD;
  {$EXTERNALSYM MSIDBERROR}
  TMsiDbError = MSIDBERROR;

const
  MSIRUNMODE_ADMIN           =  0; // admin mode install, else product install
  {$EXTERNALSYM MSIRUNMODE_ADMIN}
  MSIRUNMODE_ADVERTISE       =  1; // installing advertisements, else installing or updating product
  {$EXTERNALSYM MSIRUNMODE_ADVERTISE}
  MSIRUNMODE_MAINTENANCE     =  2; // modifying an existing installation, else new installation
  {$EXTERNALSYM MSIRUNMODE_MAINTENANCE}
  MSIRUNMODE_ROLLBACKENABLED =  3; // rollback is enabled
  {$EXTERNALSYM MSIRUNMODE_ROLLBACKENABLED}
  MSIRUNMODE_LOGENABLED      =  4; // log file active, enabled prior to install session
  {$EXTERNALSYM MSIRUNMODE_LOGENABLED}
  MSIRUNMODE_OPERATIONS      =  5; // spooling execute operations, else in determination phase
  {$EXTERNALSYM MSIRUNMODE_OPERATIONS}
  MSIRUNMODE_REBOOTATEND     =  6; // reboot needed after successful installation (settable)
  {$EXTERNALSYM MSIRUNMODE_REBOOTATEND}
  MSIRUNMODE_REBOOTNOW       =  7; // reboot needed to continue installation (settable)
  {$EXTERNALSYM MSIRUNMODE_REBOOTNOW}
  MSIRUNMODE_CABINET         =  8; // installing files from cabinets and files using Media table
  {$EXTERNALSYM MSIRUNMODE_CABINET}
  MSIRUNMODE_SOURCESHORTNAMES=  9; // source LongFileNames suppressed via PID_MSISOURCE summary property
  {$EXTERNALSYM MSIRUNMODE_SOURCESHORTNAMES}
  MSIRUNMODE_TARGETSHORTNAMES= 10; // target LongFileNames suppressed via SHORTFILENAMES property
  {$EXTERNALSYM MSIRUNMODE_TARGETSHORTNAMES}
  MSIRUNMODE_RESERVED11      = 11; // future use
  {$EXTERNALSYM MSIRUNMODE_RESERVED11}
  MSIRUNMODE_WINDOWS9X       = 12; // operating systems is Windows9?, else Windows NT
  {$EXTERNALSYM MSIRUNMODE_WINDOWS9X}
  MSIRUNMODE_ZAWENABLED      = 13; // operating system supports demand installation
  {$EXTERNALSYM MSIRUNMODE_ZAWENABLED}
  MSIRUNMODE_RESERVED14      = 14; // future use
  {$EXTERNALSYM MSIRUNMODE_RESERVED14}
  MSIRUNMODE_RESERVED15      = 15; // future use
  {$EXTERNALSYM MSIRUNMODE_RESERVED15}
  MSIRUNMODE_SCHEDULED       = 16; // custom action call from install script execution
  {$EXTERNALSYM MSIRUNMODE_SCHEDULED}
  MSIRUNMODE_ROLLBACK        = 17; // custom action call from rollback execution script
  {$EXTERNALSYM MSIRUNMODE_ROLLBACK}
  MSIRUNMODE_COMMIT          = 18; // custom action call from commit execution script
  {$EXTERNALSYM MSIRUNMODE_COMMIT}

type
  MSIRUNMODE = DWORD;
  {$EXTERNALSYM MSIRUNMODE}
  TMsiRunMode = MSIRUNMODE;

const
  INSTALLMESSAGE_TYPEMASK = DWORD($FF000000);  // mask for type code
  {$EXTERNALSYM INSTALLMESSAGE_TYPEMASK}

// Note: INSTALLMESSAGE_ERROR, INSTALLMESSAGE_WARNING, INSTALLMESSAGE_USER are to or'd
// with a message box style to indicate the buttons to display and return:
// MB_OK,MB_OKCANCEL,MB_ABORTRETRYIGNORE,MB_YESNOCANCEL,MB_YESNO,MB_RETRYCANCEL
// the default button (MB_DEFBUTTON1 is normal default):
// MB_DEFBUTTON1, MB_DEFBUTTON2, MB_DEFBUTTON3
// and optionally an icon style:
// MB_ICONERROR, MB_ICONQUESTION, MB_ICONWARNING, MB_ICONINFORMATION

const
  MSITRANSFORM_ERROR_ADDEXISTINGROW   = $00000001;
  {$EXTERNALSYM MSITRANSFORM_ERROR_ADDEXISTINGROW}
  MSITRANSFORM_ERROR_DELMISSINGROW    = $00000002;
  {$EXTERNALSYM MSITRANSFORM_ERROR_DELMISSINGROW}
  MSITRANSFORM_ERROR_ADDEXISTINGTABLE = $00000004;
  {$EXTERNALSYM MSITRANSFORM_ERROR_ADDEXISTINGTABLE}
  MSITRANSFORM_ERROR_DELMISSINGTABLE  = $00000008;
  {$EXTERNALSYM MSITRANSFORM_ERROR_DELMISSINGTABLE}
  MSITRANSFORM_ERROR_UPDATEMISSINGROW = $00000010;
  {$EXTERNALSYM MSITRANSFORM_ERROR_UPDATEMISSINGROW}
  MSITRANSFORM_ERROR_CHANGECODEPAGE   = $00000020;
  {$EXTERNALSYM MSITRANSFORM_ERROR_CHANGECODEPAGE}
  MSITRANSFORM_ERROR_VIEWTRANSFORM    = $00000100;
  {$EXTERNALSYM MSITRANSFORM_ERROR_VIEWTRANSFORM}

type
  MSITRANSFORM_ERROR = DWORD;
  {$EXTERNALSYM MSITRANSFORM_ERROR}
  TMsiTransformError = MSITRANSFORM_ERROR;

const
  MSITRANSFORM_VALIDATE_LANGUAGE                   = $00000001;
  {$EXTERNALSYM MSITRANSFORM_VALIDATE_LANGUAGE}
  MSITRANSFORM_VALIDATE_PRODUCT                    = $00000002;
  {$EXTERNALSYM MSITRANSFORM_VALIDATE_PRODUCT}
  MSITRANSFORM_VALIDATE_PLATFORM                   = $00000004;
  {$EXTERNALSYM MSITRANSFORM_VALIDATE_PLATFORM}
  MSITRANSFORM_VALIDATE_MAJORVERSION               = $00000008;
  {$EXTERNALSYM MSITRANSFORM_VALIDATE_MAJORVERSION}
  MSITRANSFORM_VALIDATE_MINORVERSION               = $00000010;
  {$EXTERNALSYM MSITRANSFORM_VALIDATE_MINORVERSION}
  MSITRANSFORM_VALIDATE_UPDATEVERSION              = $00000020;
  {$EXTERNALSYM MSITRANSFORM_VALIDATE_UPDATEVERSION}
  MSITRANSFORM_VALIDATE_NEWLESSBASEVERSION         = $00000040;
  {$EXTERNALSYM MSITRANSFORM_VALIDATE_NEWLESSBASEVERSION}
  MSITRANSFORM_VALIDATE_NEWLESSEQUALBASEVERSION    = $00000080;
  {$EXTERNALSYM MSITRANSFORM_VALIDATE_NEWLESSEQUALBASEVERSION}
  MSITRANSFORM_VALIDATE_NEWEQUALBASEVERSION        = $00000100;
  {$EXTERNALSYM MSITRANSFORM_VALIDATE_NEWEQUALBASEVERSION}
  MSITRANSFORM_VALIDATE_NEWGREATEREQUALBASEVERSION = $00000200;
  {$EXTERNALSYM MSITRANSFORM_VALIDATE_NEWGREATEREQUALBASEVERSION}
  MSITRANSFORM_VALIDATE_NEWGREATERBASEVERSION      = $00000400;
  {$EXTERNALSYM MSITRANSFORM_VALIDATE_NEWGREATERBASEVERSION}
  MSITRANSFORM_VALIDATE_UPGRADECODE                = $00000800;
  {$EXTERNALSYM MSITRANSFORM_VALIDATE_UPGRADECODE}

type
  MSITRANSFORM_VALIDATE = DWORD;
  {$EXTERNALSYM MSITRANSFORM_VALIDATE}
  TMsiTransformValidate = MSITRANSFORM_VALIDATE;

// -----------------------------------------------------------------------------
// Installer database access functions
// -----------------------------------------------------------------------------

// Prepare a database query, creating a view object
// Returns ERROR_SUCCESS if successful, and the view handle is returned,
// else ERROR_INVALID_HANDLE, ERROR_INVALID_HANDLE_STATE, ERROR_BAD_QUERY_SYNTAX, ERROR_GEN_FAILURE
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiDatabaseOpenViewA(hDatabase: MSIHANDLE; szQuery: LPCSTR; var phView: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseOpenViewA}
function MsiDatabaseOpenViewW(hDatabase: MSIHANDLE; szQuery: LPCWSTR; var phView: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseOpenViewW}
function MsiDatabaseOpenView(hDatabase: MSIHANDLE; szQuery: LPCTSTR; var phView: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseOpenView}

// Returns the MSIDBERROR enum and name of the column corresponding to the error
// Similar to a GetLastError function, but for the view. NOT the same as MsiGetLastErrorRecord
// Returns errors of MsiViewModify.

function MsiViewGetErrorA(hView: MSIHANDLE; szColumnNameBuffer: LPSTR;
  var pcchBuf: DWORD): MSIDBERROR; stdcall;
{$EXTERNALSYM MsiViewGetErrorA}
function MsiViewGetErrorW(hView: MSIHANDLE; szColumnNameBuffer: LPWSTR;
  var pcchBuf: DWORD): MSIDBERROR; stdcall;
{$EXTERNALSYM MsiViewGetErrorW}
function MsiViewGetError(hView: MSIHANDLE; szColumnNameBuffer: LPTSTR;
  var pcchBuf: DWORD): MSIDBERROR; stdcall;
{$EXTERNALSYM MsiViewGetError}

// Exectute the view query, supplying parameters as required
// Returns ERROR_SUCCESS, ERROR_INVALID_HANDLE, ERROR_INVALID_HANDLE_STATE, ERROR_GEN_FAILURE
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiViewExecute(hView: MSIHANDLE; hRecord: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiViewExecute}

// Fetch the next sequential record from the view
// Result is ERROR_SUCCESS if a row is found, and its handle is returned
// else ERROR_NO_MORE_ITEMS if no records remain, and a null handle is returned
// else result is error: ERROR_INVALID_HANDLE_STATE, ERROR_INVALID_HANDLE, ERROR_GEN_FAILURE

function MsiViewFetch(hView: MSIHANDLE; var phRecord: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiViewFetch}

// Modify a database record, parameters must match types in query columns
// Returns ERROR_SUCCESS, ERROR_INVALID_HANDLE, ERROR_INVALID_HANDLE_STATE, ERROR_GEN_FAILURE, ERROR_ACCESS_DENIED
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiViewModify(hView: MSIHANDLE; eModifyMode: MSIMODIFY; hRecord: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiViewModify}

// Return the column names or specifications for the current view
// Returns ERROR_SUCCESS, ERROR_INVALID_HANDLE, ERROR_INVALID_PARAMETER, or ERROR_INVALID_HANDLE_STATE

function MsiViewGetColumnInfo(hView: MSIHANDLE; eColumnInfo: MSICOLINFO;
  var phRecord: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiViewGetColumnInfo}

// Release the result set for an executed view, to allow re-execution
// Only needs to be called if not all records have been fetched
// Returns ERROR_SUCCESS, ERROR_INVALID_HANDLE, ERROR_INVALID_HANDLE_STATE

function MsiViewClose(hView: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiViewClose}

// Return a record containing the names of all primary key columns for a given table
// Returns an MSIHANDLE for a record containing the name of each column.
// The field count of the record corresponds to the number of primary key columns.
// Field [0] of the record contains the table name.
// Returns ERROR_SUCCESS, ERROR_INVALID_HANDLE, ERROR_INVALID_TABLE

function MsiDatabaseGetPrimaryKeysA(hDatabase: MSIHANDLE; szTableName: LPCSTR;
  var phRecord: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseGetPrimaryKeysA}
function MsiDatabaseGetPrimaryKeysW(hDatabase: MSIHANDLE; szTableName: LPCWSTR;
  var phRecord: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseGetPrimaryKeysW}
function MsiDatabaseGetPrimaryKeys(hDatabase: MSIHANDLE; szTableName: LPCTSTR;
  var phRecord: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseGetPrimaryKeys}

// Return an enum defining the state of the table (temporary, unknown, or persistent).
// Returns MSICONDITION_ERROR, MSICONDITION_FALSE, MSICONDITION_TRUE, MSICONDITION_NONE

function MsiDatabaseIsTablePersistentA(hDatabase: MSIHANDLE; szTableName: LPCSTR): MSICONDITION; stdcall;
{$EXTERNALSYM MsiDatabaseIsTablePersistentA}
function MsiDatabaseIsTablePersistentW(hDatabase: MSIHANDLE; szTableName: LPCWSTR): MSICONDITION; stdcall;
{$EXTERNALSYM MsiDatabaseIsTablePersistentW}
function MsiDatabaseIsTablePersistent(hDatabase: MSIHANDLE; szTableName: LPCTSTR): MSICONDITION; stdcall;
{$EXTERNALSYM MsiDatabaseIsTablePersistent}

// --------------------------------------------------------------------------
// Summary information stream management functions
// --------------------------------------------------------------------------

// Integer Property IDs:    1, 14, 15, 16, 19
// DateTime Property IDs:   10, 11, 12, 13
// Text Property IDs:       2, 3, 4, 5, 6, 7, 8, 9, 18
// Unsupported Propery IDs: 0 (PID_DICTIONARY), 17 (PID_THUMBNAIL)

// Obtain a handle for the _SummaryInformation stream for an MSI database
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiGetSummaryInformationA(hDatabase: MSIHANDLE; szDatabasePath: LPCSTR;
  uiUpdateCount: UINT; var phSummaryInfo: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiGetSummaryInformationA}
function MsiGetSummaryInformationW(hDatabase: MSIHANDLE; szDatabasePath: LPCWSTR;
  uiUpdateCount: UINT; var phSummaryInfo: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiGetSummaryInformationW}
function MsiGetSummaryInformation(hDatabase: MSIHANDLE; szDatabasePath: LPCTSTR;
  uiUpdateCount: UINT; var phSummaryInfo: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiGetSummaryInformation}

// Obtain the number of existing properties in the SummaryInformation stream

function MsiSummaryInfoGetPropertyCount(hSummaryInfo: MSIHANDLE; var puiPropertyCount: UINT): UINT; stdcall;
{$EXTERNALSYM MsiSummaryInfoGetPropertyCount}

// Set a single summary information property
// Returns ERROR_SUCCESS, ERROR_INVALID_HANDLE, ERROR_UNKNOWN_PROPERTY

function MsiSummaryInfoSetPropertyA(hSummaryInfo: MSIHANDLE; uiProperty: UINT;
  uiDataType: UINT; iValue: Integer; const pftValue: FILETIME; szValue: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiSummaryInfoSetPropertyA}
function MsiSummaryInfoSetPropertyW(hSummaryInfo: MSIHANDLE; uiProperty: UINT;
  uiDataType: UINT; iValue: Integer; const pftValue: FILETIME; szValue: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiSummaryInfoSetPropertyW}
function MsiSummaryInfoSetProperty(hSummaryInfo: MSIHANDLE; uiProperty: UINT;
  uiDataType: UINT; iValue: Integer; const pftValue: FILETIME; szValue: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiSummaryInfoSetProperty}

// Get a single property from the summary information
// Returns ERROR_SUCCESS, ERROR_INVALID_HANDLE, ERROR_UNKNOWN_PROPERTY

function MsiSummaryInfoGetPropertyA(hSummaryInfo: MSIHANDLE; uiProperty: UINT;
  var puiDataType: UINT; var piValue: Integer; var pftValue: FILETIME; szValueBuf: LPSTR;
  var pcchValueBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiSummaryInfoGetPropertyA}
function MsiSummaryInfoGetPropertyW(hSummaryInfo: MSIHANDLE; uiProperty: UINT;
  var puiDataType: UINT; var piValue: Integer; var pftValue: FILETIME; szValueBuf: LPWSTR;
  var pcchValueBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiSummaryInfoGetPropertyW}
function MsiSummaryInfoGetProperty(hSummaryInfo: MSIHANDLE; uiProperty: UINT;
  var puiDataType: UINT; var piValue: Integer; var pftValue: FILETIME; szValueBuf: LPTSTR;
  var pcchValueBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiSummaryInfoGetProperty}

// Write back changed information to summary information stream

function MsiSummaryInfoPersist(hSummaryInfo: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiSummaryInfoPersist}

// --------------------------------------------------------------------------
// Installer database management functions - not used by custom actions
// --------------------------------------------------------------------------

// Open an installer database, specifying the persistance mode, which is a pointer.
// Predefined persist values are reserved pointer values, requiring pointer arithmetic.
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiOpenDatabaseA(szDatabasePath: LPCSTR; szPersist: LPCSTR;
  var phDatabase: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiOpenDatabaseA}
function MsiOpenDatabaseW(szDatabasePath: LPCWSTR; szPersist: LPCWSTR;
  var phDatabase: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiOpenDatabaseW}
function MsiOpenDatabase(szDatabasePath: LPCTSTR; szPersist: LPCTSTR;
  var phDatabase: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiOpenDatabase}

// Import an MSI text archive table into an open database
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiDatabaseImportA(hDatabase: MSIHANDLE; szFolderPath: LPCSTR;
  szFileName: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseImportA}
function MsiDatabaseImportW(hDatabase: MSIHANDLE; szFolderPath: LPCWSTR;
  szFileName: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseImportW}
function MsiDatabaseImport(hDatabase: MSIHANDLE; szFolderPath: LPCTSTR;
  szFileName: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseImport}

// Export an MSI table from an open database to a text archive file
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiDatabaseExportA(hDatabase: MSIHANDLE; szTableName: LPCSTR;
  szFolderPath: LPCSTR; szFileName: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseExportA}
function MsiDatabaseExportW(hDatabase: MSIHANDLE; szTableName: LPCWSTR;
  szFolderPath: LPCWSTR; szFileName: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseExportW}
function MsiDatabaseExport(hDatabase: MSIHANDLE; szTableName: LPCTSTR;
  szFolderPath: LPCTSTR; szFileName: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseExport}

// Merge two database together, allowing duplicate rows
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiDatabaseMergeA(hDatabase: MSIHANDLE; hDatabaseMerge: MSIHANDLE;
  szTableName: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseMergeA}
function MsiDatabaseMergeW(hDatabase: MSIHANDLE; hDatabaseMerge: MSIHANDLE;
  szTableName: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseMergeW}
function MsiDatabaseMerge(hDatabase: MSIHANDLE; hDatabaseMerge: MSIHANDLE;
  szTableName: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseMerge}

// Generate a transform file of differences between two databases
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiDatabaseGenerateTransformA(hDatabase: MSIHANDLE; hDatabaseReference: MSIHANDLE;
  szTransformFile: LPCSTR; iReserved1: Integer; iReserved2: Integer): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseGenerateTransformA}
function MsiDatabaseGenerateTransformW(hDatabase: MSIHANDLE; hDatabaseReference: MSIHANDLE;
  szTransformFile: LPCWSTR; iReserved1: Integer; iReserved2: Integer): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseGenerateTransformW}
function MsiDatabaseGenerateTransform(hDatabase: MSIHANDLE; hDatabaseReference: MSIHANDLE;
  szTransformFile: LPCTSTR; iReserved1: Integer; iReserved2: Integer): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseGenerateTransform}

// Apply a transform file containing database difference
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiDatabaseApplyTransformA(hDatabase: MSIHANDLE; szTransformFile: LPCSTR;
  iErrorConditions: Integer): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseApplyTransformA}
function MsiDatabaseApplyTransformW(hDatabase: MSIHANDLE; szTransformFile: LPCWSTR;
  iErrorConditions: Integer): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseApplyTransformW}
function MsiDatabaseApplyTransform(hDatabase: MSIHANDLE; szTransformFile: LPCTSTR;
  iErrorConditions: Integer): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseApplyTransform}

// Create summary information of existing transform to include validation and error conditions
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiCreateTransformSummaryInfoA(hDatabase: MSIHANDLE; hDatabaseReference: MSIHANDLE;
  szTransformFile: LPCSTR; iErrorConditions: Integer; iValidation: Integer): UINT; stdcall;
{$EXTERNALSYM MsiCreateTransformSummaryInfoA}
function MsiCreateTransformSummaryInfoW(hDatabase: MSIHANDLE; hDatabaseReference: MSIHANDLE;
  szTransformFile: LPCWSTR; iErrorConditions: Integer; iValidation: Integer): UINT; stdcall;
{$EXTERNALSYM MsiCreateTransformSummaryInfoW}
function MsiCreateTransformSummaryInfo(hDatabase: MSIHANDLE; hDatabaseReference: MSIHANDLE;
  szTransformFile: LPCTSTR; iErrorConditions: Integer; iValidation: Integer): UINT; stdcall;
{$EXTERNALSYM MsiCreateTransformSummaryInfo}

// Write out all persistent table data, ignored if database opened read-only
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiDatabaseCommit(hDatabase: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiDatabaseCommit}

// Return the update state of a database

function MsiGetDatabaseState(hDatabase: MSIHANDLE): MSIDBSTATE; stdcall;
{$EXTERNALSYM MsiGetDatabaseState}

// --------------------------------------------------------------------------
// Record object functions
// --------------------------------------------------------------------------

// Create a new record object with the requested number of fields
// Field 0, not included in count, is used for format strings and op codes
// All fields are initialized to null
// Returns a handle to the created record, or 0 if memory could not be allocated

function MsiCreateRecord(cParams: UINT): MSIHANDLE; stdcall;
{$EXTERNALSYM MsiCreateRecord}

// Report whether a record field is NULL
// Returns TRUE if the field is null or does not exist
// Returns FALSE if the field contains data, or the handle is invalid

function MsiRecordIsNull(hRecord: MSIHANDLE; iField: UINT): BOOL; stdcall;
{$EXTERNALSYM MsiRecordIsNull}

// Return the length of a record field
// Returns 0 if field is NULL or non-existent
// Returns sizeof(Integer) if integer data
// Returns character count if string data (not counting null terminator)
// Returns bytes count if stream data

function MsiRecordDataSize(hRecord: MSIHANDLE; iField: UINT): UINT; stdcall;
{$EXTERNALSYM MsiRecordDataSize}

// Set a record field to an integer value
// Returns ERROR_SUCCESS, ERROR_INVALID_HANDLE, ERROR_INVALID_FIELD

function MsiRecordSetInteger(hRecord: MSIHANDLE; iField: UINT; iValue: Integer): UINT; stdcall;
{$EXTERNALSYM MsiRecordSetInteger}

// Copy a string into the designated field
// A null string pointer and an empty string both set the field to null
// Returns ERROR_SUCCESS, ERROR_INVALID_HANDLE, ERROR_INVALID_FIELD

function MsiRecordSetStringA(hRecord: MSIHANDLE; iField: UINT; szValue: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiRecordSetStringA}
function MsiRecordSetStringW(hRecord: MSIHANDLE; iField: UINT; szValue: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiRecordSetStringW}
function MsiRecordSetString(hRecord: MSIHANDLE; iField: UINT; szValue: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiRecordSetString}

// Return the integer value from a record field
// Returns the value MSI_NULL_INTEGER if the field is null
// or if the field is a string that cannot be converted to an integer

function MsiRecordGetInteger(hRecord: MSIHANDLE; iField: UINT): Integer; stdcall;
{$EXTERNALSYM MsiRecordGetInteger}

// Return the string value of a record field
// Integer fields will be converted to a string
// Null and non-existent fields will report a value of 0
// Fields containing stream data will return ERROR_INVALID_DATATYPE
// Returns ERROR_SUCCESS, ERROR_MORE_DATA,
//         ERROR_INVALID_HANDLE, ERROR_INVALID_FIELD, ERROR_BAD_ARGUMENTS

function MsiRecordGetStringA(hRecord: MSIHANDLE; iField: UINT; szValueBuf: LPSTR;
  var pcchValueBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiRecordGetStringA}
function MsiRecordGetStringW(hRecord: MSIHANDLE; iField: UINT; szValueBuf: LPWSTR;
  var pcchValueBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiRecordGetStringW}
function MsiRecordGetString(hRecord: MSIHANDLE; iField: UINT; szValueBuf: LPTSTR;
  var pcchValueBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiRecordGetString}

// Returns the number of fields allocated in the record
// Does not count field 0, used for formatting and op codes

function MsiRecordGetFieldCount(hRecord: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiRecordGetFieldCount}

// Set a record stream field from a file
// The contents of the specified file will be read into a stream object
// The stream will be persisted if the record is inserted into the database
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiRecordSetStreamA(hRecord: MSIHANDLE; iField: UINT; szFilePath: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiRecordSetStreamA}
function MsiRecordSetStreamW(hRecord: MSIHANDLE; iField: UINT; szFilePath: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiRecordSetStreamW}
function MsiRecordSetStream(hRecord: MSIHANDLE; iField: UINT; szFilePath: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiRecordSetStream}

// Read bytes from a record stream field into a buffer
// Must set the in/out argument to the requested byte count to read
// The number of bytes transferred is returned through the argument
// If no more bytes are available, ERROR_SUCCESS is still returned

function MsiRecordReadStream(hRecord: MSIHANDLE; iField: UINT; szDataBuf: PAnsiChar;
  var pcbDataBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiRecordReadStream}

// Clears all data fields in a record to NULL

function MsiRecordClearData(hRecord: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiRecordClearData}

// --------------------------------------------------------------------------
// Functions to access a running installation, called from custom actions
// The install handle is the single argument passed to custom actions
// --------------------------------------------------------------------------

// Return a handle to the database currently in use by this installer instance

function MsiGetActiveDatabase(hInstall: MSIHANDLE): MSIHANDLE; stdcall;
{$EXTERNALSYM MsiGetActiveDatabase}

// Set the value for an installer property
// If the property is not defined, it will be created
// If the value is null or an empty string, the property will be removed
// Returns ERROR_SUCCESS, ERROR_INVALID_HANDLE, ERROR_BAD_ARGUMENTS

function MsiSetPropertyA(hInstall: MSIHANDLE; szName: LPCSTR; szValue: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiSetPropertyA}
function MsiSetPropertyW(hInstall: MSIHANDLE; szName: LPCWSTR; szValue: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiSetPropertyW}
function MsiSetProperty(hInstall: MSIHANDLE; szName: LPCTSTR; szValue: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiSetProperty}

// Get the value for an installer property
// If the property is not defined, it is equivalent to a 0-length value, not error
// Returns ERROR_SUCCESS, ERROR_MORE_DATA, ERROR_INVALID_HANDLE, ERROR_BAD_ARGUMENTS

function MsiGetPropertyA(hInstall: MSIHANDLE; szName: LPCSTR; szValueBuf: LPSTR;
  var pcchValueBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetPropertyA}
function MsiGetPropertyW(hInstall: MSIHANDLE; szName: LPCWSTR; szValueBuf: LPWSTR;
  var pcchValueBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetPropertyW}
function MsiGetProperty(hInstall: MSIHANDLE; szName: LPCTSTR; szValueBuf: LPTSTR;
  var pcchValueBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetProperty}

// Return the numeric language for the currently running install
// Returns 0 if an install not running

function MsiGetLanguage(hInstall: MSIHANDLE): LANGID; stdcall;
{$EXTERNALSYM MsiGetLanguage}

// Return one of the boolean internal installer states
// Returns FALSE if the handle is not active or if the mode is not implemented

function MsiGetMode(hInstall: MSIHANDLE; eRunMode: MSIRUNMODE): BOOL; stdcall;
{$EXTERNALSYM MsiGetMode}

// Set an internal install session boolean mode - Note: most modes are read-only
// Returns ERROR_SUCCESS if the mode can be set to the desired state
// Returns ERROR_ACCESS_DENIED if the mode is not settable
// Returns ERROR_INVALID_HANDLE if the handle is not an active install session

function MsiSetMode(hInstall: MSIHANDLE; eRunMode: MSIRUNMODE; fState: BOOL): UINT; stdcall;
{$EXTERNALSYM MsiSetMode}

// Format record data using a format string containing field markers and/or properties
// Record field 0 must contain the format string
// Other fields must contain data that may be referenced by the format string.

function MsiFormatRecordA(hInstall: MSIHANDLE; hRecord: MSIHANDLE; szResultBuf: LPSTR;
  var pcchResultBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiFormatRecordA}
function MsiFormatRecordW(hInstall: MSIHANDLE; hRecord: MSIHANDLE; szResultBuf: LPWSTR;
  var pcchResultBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiFormatRecordW}
function MsiFormatRecord(hInstall: MSIHANDLE; hRecord: MSIHANDLE; szResultBuf: LPTSTR;
  var pcchResultBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiFormatRecord}

// Execute another action, either built-in, custom, or UI wizard
// Returns ERROR_FUNCTION_NOT_CALLED if action not found
// Returns ERROR_SUCCESS if action completed succesfully
// Returns ERROR_INSTALL_USEREXIT if user cancelled during action
// Returns ERROR_INSTALL_FAILURE if action failed
// Returns ERROR_INSTALL_SUSPEND if user suspended installation
// Returns ERROR_MORE_DATA if action wishes to skip remaining actions
// Returns ERROR_INVALID_HANDLE_STATE if install session not active
// Returns ERROR_INVALID_DATA if failure calling custom action
// Returns ERROR_INVALID_HANDLE or ERROR_INVALID_PARAMETER if arguments invalid

function MsiDoActionA(hInstall: MSIHANDLE; szAction: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiDoActionA}
function MsiDoActionW(hInstall: MSIHANDLE; szAction: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiDoActionW}
function MsiDoAction(hInstall: MSIHANDLE; szAction: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiDoAction}

// Execute another action sequence, as descibed in the specified table
// Returns the same error codes as MsiDoAction

function MsiSequenceA(hInstall: MSIHANDLE; szTable: LPCSTR; iSequenceMode: Integer): UINT; stdcall;
{$EXTERNALSYM MsiSequenceA}
function MsiSequenceW(hInstall: MSIHANDLE; szTable: LPCWSTR; iSequenceMode: Integer): UINT; stdcall;
{$EXTERNALSYM MsiSequenceW}
function MsiSequence(hInstall: MSIHANDLE; szTable: LPCTSTR; iSequenceMode: Integer): UINT; stdcall;
{$EXTERNALSYM MsiSequence}

// Send an error record to the installer for processing.
// If field 0 (template) is not set, field 1 must be set to the error code,
//   corresponding the the error message in the Error database table,
//   and the message will be formatted using the template from the Error table
//   before passing it to the UI handler for display.
// Returns Win32 button codes: IDOK IDCANCEL IDABORT IDRETRY IDIGNORE IDYES IDNO
//   or 0 if no action taken, or -1 if invalid argument or handle

function MsiProcessMessage(hInstall: MSIHANDLE; eMessageType: INSTALLMESSAGE;
  hRecord: MSIHANDLE): Integer; stdcall;
{$EXTERNALSYM MsiProcessMessage}

// Evaluate a conditional expression containing property names and values

function MsiEvaluateConditionA(hInstall: MSIHANDLE; szCondition: LPCSTR): MSICONDITION; stdcall;
{$EXTERNALSYM MsiEvaluateConditionA}
function MsiEvaluateConditionW(hInstall: MSIHANDLE; szCondition: LPCWSTR): MSICONDITION; stdcall;
{$EXTERNALSYM MsiEvaluateConditionW}
function MsiEvaluateCondition(hInstall: MSIHANDLE; szCondition: LPCTSTR): MSICONDITION; stdcall;
{$EXTERNALSYM MsiEvaluateCondition}

// Get the installed state and requested action state of a feature
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiGetFeatureStateA(hInstall: MSIHANDLE; szFeature: LPCSTR;
  var piInstalled: INSTALLSTATE; var piAction: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiGetFeatureStateA}
function MsiGetFeatureStateW(hInstall: MSIHANDLE; szFeature: LPCWSTR;
  var piInstalled: INSTALLSTATE; var piAction: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiGetFeatureStateW}
function MsiGetFeatureState(hInstall: MSIHANDLE; szFeature: LPCTSTR;
  var piInstalled: INSTALLSTATE; var piAction: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiGetFeatureState}

// Request a feature to be set to a specified state
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiSetFeatureStateA(hInstall: MSIHANDLE; szFeature: LPCSTR;
  iState: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiSetFeatureStateA}
function MsiSetFeatureStateW(hInstall: MSIHANDLE; szFeature: LPCWSTR;
  iState: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiSetFeatureStateW}
function MsiSetFeatureState(hInstall: MSIHANDLE; szFeature: LPCTSTR;
  iState: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiSetFeatureState}

// Set the attribute bits of a specified feature at runtime.
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiSetFeatureAttributesA(hInstall: MSIHANDLE; szFeature: LPCSTR;
  dwAttributes: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiSetFeatureAttributesA}
function MsiSetFeatureAttributesW(hInstall: MSIHANDLE; szFeature: LPCWSTR;
  dwAttributes: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiSetFeatureAttributesW}
function MsiSetFeatureAttributes(hInstall: MSIHANDLE; szFeature: LPCTSTR;
  dwAttributes: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiSetFeatureAttributes}

// Get the installed state and requested action state of a component
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiGetComponentStateA(hInstall: MSIHANDLE; szComponent: LPCSTR;
  var piInstalled: INSTALLSTATE; var piAction: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiGetComponentStateA}
function MsiGetComponentStateW(hInstall: MSIHANDLE; szComponent: LPCWSTR;
  var piInstalled: INSTALLSTATE; var piAction: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiGetComponentStateW}
function MsiGetComponentState(hInstall: MSIHANDLE; szComponent: LPCTSTR;
  var piInstalled: INSTALLSTATE; var piAction: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiGetComponentState}

// Request a component to be set to a specified state
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiSetComponentStateA(hInstall: MSIHANDLE; szComponent: LPCSTR;
  iState: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiSetComponentStateA}
function MsiSetComponentStateW(hInstall: MSIHANDLE; szComponent: LPCWSTR;
  iState: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiSetComponentStateW}
function MsiSetComponentState(hInstall: MSIHANDLE; szComponent: LPCTSTR;
  iState: INSTALLSTATE): UINT; stdcall;
{$EXTERNALSYM MsiSetComponentState}

// Return the disk cost for a feature and related features
// Can specify either current feature state or proposed state
// Can specify extent of related features to cost
// Note that adding costs for several features may produce an
// excessively large cost due to shared components and parents.
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiGetFeatureCostA(hInstall: MSIHANDLE; szFeature: LPCSTR;
  iCostTree: MSICOSTTREE; iState: INSTALLSTATE; var piCost: Integer): UINT; stdcall;
{$EXTERNALSYM MsiGetFeatureCostA}
function MsiGetFeatureCostW(hInstall: MSIHANDLE; szFeature: LPCWSTR;
  iCostTree: MSICOSTTREE; iState: INSTALLSTATE; var piCost: Integer): UINT; stdcall;
{$EXTERNALSYM MsiGetFeatureCostW}
function MsiGetFeatureCost(hInstall: MSIHANDLE; szFeature: LPCTSTR;
  iCostTree: MSICOSTTREE; iState: INSTALLSTATE; var piCost: Integer): UINT; stdcall;
{$EXTERNALSYM MsiGetFeatureCost}

// Enumerates the costs and temporary costs per drives for
// szComponent. If szComponent is set to NULL, it enumerates
// the above costs for the engine, per drives.
//
// The enumeration is 0-based, i.e. it returns the data for
// the first drive when called w/ dwIndex set to 0.
//
// Can specify either current feature state or proposed state.
//
// Execution of this function sets the error record, accessible
// via MsiGetLastErrorRecord.

function MsiEnumComponentCostsA(hInstall: MSIHANDLE; szComponent: LPCSTR; dwIndex: DWORD; iState: INSTALLSTATE;
  szDriveBuf: LPSTR; var pcchDriveBuf: DWORD; var piCost: INT; piTempCost: INT): UINT; stdcall;
{$EXTERNALSYM MsiEnumComponentCostsA}
function MsiEnumComponentCostsW(hInstall: MSIHANDLE; szComponent: LPCWSTR; dwIndex: DWORD; iState: INSTALLSTATE;
  szDriveBuf: LPWSTR; var pcchDriveBuf: DWORD; var piCost: INT; var piTempCost: INT): UINT; stdcall;
{$EXTERNALSYM MsiEnumComponentCostsW}
function MsiEnumComponentCosts(hInstall: MSIHANDLE; szComponent: LPCTSTR; dwIndex: DWORD; iState: INSTALLSTATE;
  szDriveBuf: LPTSTR; var pcchDriveBuf: DWORD; var piCost: INT; var piTempCost: INT): UINT; stdcall;
{$EXTERNALSYM MsiEnumComponentCosts}

// Set the install level for a full product installation (not a feature request)
// Setting the value to 0 initialized components and features to the default level
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiSetInstallLevel(hInstall: MSIHANDLE; iInstallLevel: Integer): UINT; stdcall;
{$EXTERNALSYM MsiSetInstallLevel}

// Get the valid install states for a feature, represented by bit flags
// For each valid install state, a bit is set of value: (1 << INSTALLSTATE)
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiGetFeatureValidStatesA(hInstall: MSIHANDLE; szFeature: LPCSTR;
  var dwInstallStates: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetFeatureValidStatesA}
function MsiGetFeatureValidStatesW(hInstall: MSIHANDLE; szFeature: LPCWSTR;
  var dwInstallStates: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetFeatureValidStatesW}
function MsiGetFeatureValidStates(hInstall: MSIHANDLE; szFeature: LPCTSTR;
  var dwInstallStates: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetFeatureValidStates}

// Return the full source path for a folder in the Directory table
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiGetSourcePathA(hInstall: MSIHANDLE; szFolder: LPCSTR; szPathBuf: LPSTR;
  var pcchPathBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetSourcePathA}
function MsiGetSourcePathW(hInstall: MSIHANDLE; szFolder: LPCWSTR; szPathBuf: LPWSTR;
  var pcchPathBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetSourcePathW}
function MsiGetSourcePath(hInstall: MSIHANDLE; szFolder: LPCTSTR; szPathBuf: LPTSTR;
  var pcchPathBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetSourcePath}

// Return the full target path for a folder in the Directory table
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiGetTargetPathA(hInstall: MSIHANDLE; szFolder: LPCSTR;
  szPathBuf: LPSTR; var pcchPathBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetTargetPathA}
function MsiGetTargetPathW(hInstall: MSIHANDLE; szFolder: LPCWSTR;
  szPathBuf: LPWSTR; var pcchPathBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetTargetPathW}
function MsiGetTargetPath(hInstall: MSIHANDLE; szFolder: LPCTSTR;
  szPathBuf: LPTSTR; var pcchPathBuf: DWORD): UINT; stdcall;
{$EXTERNALSYM MsiGetTargetPath}

// Set the full target path for a folder in the Directory table
// Execution of this function sets the error record, accessible via MsiGetLastErrorRecord

function MsiSetTargetPathA(hInstall: MSIHANDLE; szFolder: LPCSTR;
  szFolderPath: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiSetTargetPathA}
function MsiSetTargetPathW(hInstall: MSIHANDLE; szFolder: LPCWSTR;
  szFolderPath: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiSetTargetPathW}
function MsiSetTargetPath(hInstall: MSIHANDLE; szFolder: LPCTSTR;
  szFolderPath: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiSetTargetPath}

// Check to see if sufficent disk space is present for the current installation
// Returns ERROR_SUCCESS, ERROR_DISK_FULL, ERROR_INVALID_HANDLE_STATE, or ERROR_INVALID_HANDLE

function MsiVerifyDiskSpace(hInstall: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiVerifyDiskSpace}

// --------------------------------------------------------------------------
// Functions for rendering UI dialogs from the database representations.
// Purpose is for product development, not for use during installation.
// --------------------------------------------------------------------------

// Enable UI in preview mode to facilitate authoring of UI dialogs.
// The preview mode will end when the handle is closed.

function MsiEnableUIPreview(hDatabase: MSIHANDLE; var phPreview: MSIHANDLE): UINT; stdcall;
{$EXTERNALSYM MsiEnableUIPreview}

// Display any UI dialog as modeless and inactive.
// Supplying a null name will remove any current dialog.

function MsiPreviewDialogA(hPreview: MSIHANDLE; szDialogName: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiPreviewDialogA}
function MsiPreviewDialogW(hPreview: MSIHANDLE; szDialogName: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiPreviewDialogW}
function MsiPreviewDialog(hPreview: MSIHANDLE; szDialogName: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiPreviewDialog}

// Display a billboard within a host control in the displayed dialog.
// Supplying a null billboard name will remove any billboard displayed.

function MsiPreviewBillboardA(hPreview: MSIHANDLE; szControlName: LPCSTR;
  szBillboard: LPCSTR): UINT; stdcall;
{$EXTERNALSYM MsiPreviewBillboardA}
function MsiPreviewBillboardW(hPreview: MSIHANDLE; szControlName: LPCWSTR;
  szBillboard: LPCWSTR): UINT; stdcall;
{$EXTERNALSYM MsiPreviewBillboardW}
function MsiPreviewBillboard(hPreview: MSIHANDLE; szControlName: LPCTSTR;
  szBillboard: LPCTSTR): UINT; stdcall;
{$EXTERNALSYM MsiPreviewBillboard}

// --------------------------------------------------------------------------
// Error handling not associated with any particular object
// --------------------------------------------------------------------------

// Return a record handle to the last function that generated an error record
// Only specified functions will set the error record, or clear it if success
// Field 1 of the record will contain the internal MSI error code
// Other fields will contain data specific to the particular error
// The error record is released internally after this function is executed

function MsiGetLastErrorRecord: MSIHANDLE; stdcall;
{$EXTERNALSYM MsiGetLastErrorRecord}

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


function MsiDatabaseOpenViewA; external msilib name 'MsiDatabaseOpenViewA' delayed;
function MsiDatabaseOpenViewW; external msilib name 'MsiDatabaseOpenViewW' delayed;
function MsiDatabaseOpenView; external msilib name 'MsiDatabaseOpenView' + AWSuffix delayed;
function MsiViewGetErrorA; external msilib name 'MsiViewGetErrorA' delayed;
function MsiViewGetErrorW; external msilib name 'MsiViewGetErrorW' delayed;
function MsiViewGetError; external msilib name 'MsiViewGetError' + AWSuffix delayed;
function MsiViewExecute; external msilib name 'MsiViewExecute' delayed;
function MsiViewFetch; external msilib name 'MsiViewFetch' delayed;
function MsiViewModify; external msilib name 'MsiViewModify' delayed;
function MsiViewGetColumnInfo; external msilib name 'MsiViewGetColumnInfo' delayed;
function MsiViewClose; external msilib name 'MsiViewClose' delayed;
function MsiDatabaseGetPrimaryKeysA; external msilib name 'MsiDatabaseGetPrimaryKeysA' delayed;
function MsiDatabaseGetPrimaryKeysW; external msilib name 'MsiDatabaseGetPrimaryKeysW' delayed;
function MsiDatabaseGetPrimaryKeys; external msilib name 'MsiDatabaseGetPrimaryKeys' + AWSuffix delayed;
function MsiDatabaseIsTablePersistentA; external msilib name 'MsiDatabaseIsTablePersistentA' delayed;
function MsiDatabaseIsTablePersistentW; external msilib name 'MsiDatabaseIsTablePersistentW' delayed;
function MsiDatabaseIsTablePersistent; external msilib name 'MsiDatabaseIsTablePersistent' + AWSuffix delayed;
function MsiGetSummaryInformationA; external msilib name 'MsiGetSummaryInformationA' delayed;
function MsiGetSummaryInformationW; external msilib name 'MsiGetSummaryInformationW' delayed;
function MsiGetSummaryInformation; external msilib name 'MsiGetSummaryInformation' + AWSuffix delayed;
function MsiSummaryInfoGetPropertyCount; external msilib name 'MsiSummaryInfoGetPropertyCount' delayed;
function MsiSummaryInfoSetPropertyA; external msilib name 'MsiSummaryInfoSetPropertyA' delayed;
function MsiSummaryInfoSetPropertyW; external msilib name 'MsiSummaryInfoSetPropertyW' delayed;
function MsiSummaryInfoSetProperty; external msilib name 'MsiSummaryInfoSetProperty' + AWSuffix delayed;
function MsiSummaryInfoGetPropertyA; external msilib name 'MsiSummaryInfoGetPropertyA' delayed;
function MsiSummaryInfoGetPropertyW; external msilib name 'MsiSummaryInfoGetPropertyW' delayed;
function MsiSummaryInfoGetProperty; external msilib name 'MsiSummaryInfoGetProperty' + AWSuffix delayed;
function MsiSummaryInfoPersist; external msilib name 'MsiSummaryInfoPersist' delayed;
function MsiOpenDatabaseA; external msilib name 'MsiOpenDatabaseA' delayed;
function MsiOpenDatabaseW; external msilib name 'MsiOpenDatabaseW' delayed;
function MsiOpenDatabase; external msilib name 'MsiOpenDatabase' + AWSuffix delayed;
function MsiDatabaseImportA; external msilib name 'MsiDatabaseImportA' delayed;
function MsiDatabaseImportW; external msilib name 'MsiDatabaseImportW' delayed;
function MsiDatabaseImport; external msilib name 'MsiDatabaseImport' + AWSuffix delayed;
function MsiDatabaseExportA; external msilib name 'MsiDatabaseExportA' delayed;
function MsiDatabaseExportW; external msilib name 'MsiDatabaseExportW' delayed;
function MsiDatabaseExport; external msilib name 'MsiDatabaseExport' + AWSuffix delayed;
function MsiDatabaseMergeA; external msilib name 'MsiDatabaseMergeA' delayed;
function MsiDatabaseMergeW; external msilib name 'MsiDatabaseMergeW' delayed;
function MsiDatabaseMerge; external msilib name 'MsiDatabaseMerge' + AWSuffix delayed;
function MsiDatabaseGenerateTransformA; external msilib name 'MsiDatabaseGenerateTransformA' delayed;
function MsiDatabaseGenerateTransformW; external msilib name 'MsiDatabaseGenerateTransformW' delayed;
function MsiDatabaseGenerateTransform; external msilib name 'MsiDatabaseGenerateTransform' + AWSuffix delayed;
function MsiDatabaseApplyTransformA; external msilib name 'MsiDatabaseApplyTransformA' delayed;
function MsiDatabaseApplyTransformW; external msilib name 'MsiDatabaseApplyTransformW' delayed;
function MsiDatabaseApplyTransform; external msilib name 'MsiDatabaseApplyTransform' + AWSuffix delayed;
function MsiCreateTransformSummaryInfoA; external msilib name 'MsiCreateTransformSummaryInfoA' delayed;
function MsiCreateTransformSummaryInfoW; external msilib name 'MsiCreateTransformSummaryInfoW' delayed;
function MsiCreateTransformSummaryInfo; external msilib name 'MsiCreateTransformSummaryInfo' + AWSuffix delayed;
function MsiDatabaseCommit; external msilib name 'MsiDatabaseCommit' delayed;
function MsiGetDatabaseState; external msilib name 'MsiGetDatabaseState' delayed;
function MsiCreateRecord; external msilib name 'MsiCreateRecord' delayed;
function MsiRecordIsNull; external msilib name 'MsiRecordIsNull' delayed;
function MsiRecordDataSize; external msilib name 'MsiRecordDataSize' delayed;
function MsiRecordSetInteger; external msilib name 'MsiRecordSetInteger' delayed;
function MsiRecordSetStringA; external msilib name 'MsiRecordSetStringA' delayed;
function MsiRecordSetStringW; external msilib name 'MsiRecordSetStringW' delayed;
function MsiRecordSetString; external msilib name 'MsiRecordSetString' + AWSuffix delayed;
function MsiRecordGetInteger; external msilib name 'MsiRecordGetInteger' delayed;
function MsiRecordGetStringA; external msilib name 'MsiRecordGetStringA' delayed;
function MsiRecordGetStringW; external msilib name 'MsiRecordGetStringW' delayed;
function MsiRecordGetString; external msilib name 'MsiRecordGetString' + AWSuffix delayed;
function MsiRecordGetFieldCount; external msilib name 'MsiRecordGetFieldCount' delayed;
function MsiRecordSetStreamA; external msilib name 'MsiRecordSetStreamA' delayed;
function MsiRecordSetStreamW; external msilib name 'MsiRecordSetStreamW' delayed;
function MsiRecordSetStream; external msilib name 'MsiRecordSetStream' + AWSuffix delayed;
function MsiRecordReadStream; external msilib name 'MsiRecordReadStream' delayed;
function MsiRecordClearData; external msilib name 'MsiRecordClearData' delayed;
function MsiGetActiveDatabase; external msilib name 'MsiGetActiveDatabase' delayed;
function MsiSetPropertyA; external msilib name 'MsiSetPropertyA' delayed;
function MsiSetPropertyW; external msilib name 'MsiSetPropertyW' delayed;
function MsiSetProperty; external msilib name 'MsiSetProperty' + AWSuffix delayed;
function MsiGetPropertyA; external msilib name 'MsiGetPropertyA' delayed;
function MsiGetPropertyW; external msilib name 'MsiGetPropertyW' delayed;
function MsiGetProperty; external msilib name 'MsiGetProperty' + AWSuffix delayed;
function MsiGetLanguage; external msilib name 'MsiGetLanguage' delayed;
function MsiGetMode; external msilib name 'MsiGetMode' delayed;
function MsiSetMode; external msilib name 'MsiSetMode' delayed;
function MsiFormatRecordA; external msilib name 'MsiFormatRecordA' delayed;
function MsiFormatRecordW; external msilib name 'MsiFormatRecordW' delayed;
function MsiFormatRecord; external msilib name 'MsiFormatRecord' + AWSuffix delayed;
function MsiDoActionA; external msilib name 'MsiDoActionA' delayed;
function MsiDoActionW; external msilib name 'MsiDoActionW' delayed;
function MsiDoAction; external msilib name 'MsiDoAction' + AWSuffix delayed;
function MsiSequenceA; external msilib name 'MsiSequenceA' delayed;
function MsiSequenceW; external msilib name 'MsiSequenceW' delayed;
function MsiSequence; external msilib name 'MsiSequence' + AWSuffix delayed;
function MsiProcessMessage; external msilib name 'MsiProcessMessage' delayed;
function MsiEvaluateConditionA; external msilib name 'MsiEvaluateConditionA' delayed;
function MsiEvaluateConditionW; external msilib name 'MsiEvaluateConditionW' delayed;
function MsiEvaluateCondition; external msilib name 'MsiEvaluateCondition' + AWSuffix delayed;
function MsiGetFeatureStateA; external msilib name 'MsiGetFeatureStateA' delayed;
function MsiGetFeatureStateW; external msilib name 'MsiGetFeatureStateW' delayed;
function MsiGetFeatureState; external msilib name 'MsiGetFeatureState' + AWSuffix delayed;
function MsiSetFeatureStateA; external msilib name 'MsiSetFeatureStateA' delayed;
function MsiSetFeatureStateW; external msilib name 'MsiSetFeatureStateW' delayed;
function MsiSetFeatureState; external msilib name 'MsiSetFeatureState' + AWSuffix delayed;
function MsiSetFeatureAttributesA; external msilib name 'MsiSetFeatureAttributesA' delayed;
function MsiSetFeatureAttributesW; external msilib name 'MsiSetFeatureAttributesW' delayed;
function MsiSetFeatureAttributes; external msilib name 'MsiSetFeatureAttributes' + AWSuffix delayed;
function MsiGetComponentStateA; external msilib name 'MsiGetComponentStateA' delayed;
function MsiGetComponentStateW; external msilib name 'MsiGetComponentStateW' delayed;
function MsiGetComponentState; external msilib name 'MsiGetComponentState' + AWSuffix delayed;
function MsiSetComponentStateA; external msilib name 'MsiSetComponentStateA' delayed;
function MsiSetComponentStateW; external msilib name 'MsiSetComponentStateW' delayed;
function MsiSetComponentState; external msilib name 'MsiSetComponentState' + AWSuffix delayed;
function MsiGetFeatureCostA; external msilib name 'MsiGetFeatureCostA' delayed;
function MsiGetFeatureCostW; external msilib name 'MsiGetFeatureCostW' delayed;
function MsiGetFeatureCost; external msilib name 'MsiGetFeatureCost' + AWSuffix delayed;
function MsiEnumComponentCostsA; external msilib name 'MsiEnumComponentCostsA' delayed;
function MsiEnumComponentCostsW; external msilib name 'MsiEnumComponentCostsW' delayed;
function MsiEnumComponentCosts; external msilib name 'MsiEnumComponentCosts' + AWSuffix delayed;
function MsiSetInstallLevel; external msilib name 'MsiSetInstallLevel' delayed;
function MsiGetFeatureValidStatesA; external msilib name 'MsiGetFeatureValidStatesA' delayed;
function MsiGetFeatureValidStatesW; external msilib name 'MsiGetFeatureValidStatesW' delayed;
function MsiGetFeatureValidStates; external msilib name 'MsiGetFeatureValidStates' + AWSuffix delayed;
function MsiGetSourcePathA; external msilib name 'MsiGetSourcePathA' delayed;
function MsiGetSourcePathW; external msilib name 'MsiGetSourcePathW' delayed;
function MsiGetSourcePath; external msilib name 'MsiGetSourcePath' + AWSuffix delayed;
function MsiGetTargetPathA; external msilib name 'MsiGetTargetPathA' delayed;
function MsiGetTargetPathW; external msilib name 'MsiGetTargetPathW' delayed;
function MsiGetTargetPath; external msilib name 'MsiGetTargetPath' + AWSuffix delayed;
function MsiSetTargetPathA; external msilib name 'MsiSetTargetPathA' delayed;
function MsiSetTargetPathW; external msilib name 'MsiSetTargetPathW' delayed;
function MsiSetTargetPath; external msilib name 'MsiSetTargetPath' + AWSuffix delayed;
function MsiVerifyDiskSpace; external msilib name 'MsiVerifyDiskSpace' delayed;
function MsiEnableUIPreview; external msilib name 'MsiEnableUIPreview' delayed;
function MsiPreviewDialogA; external msilib name 'MsiPreviewDialogA' delayed;
function MsiPreviewDialogW; external msilib name 'MsiPreviewDialogW' delayed;
function MsiPreviewDialog; external msilib name 'MsiPreviewDialog' + AWSuffix delayed;
function MsiPreviewBillboardA; external msilib name 'MsiPreviewBillboardA' delayed;
function MsiPreviewBillboardW; external msilib name 'MsiPreviewBillboardW' delayed;
function MsiPreviewBillboard; external msilib name 'MsiPreviewBillboard' + AWSuffix delayed;
function MsiGetLastErrorRecord; external msilib name 'MsiGetLastErrorRecord' delayed;

{$ENDIF JWA_INTERFACESECTION}


{$IFNDEF JWA_OMIT_SECTIONS}
end.
{$ENDIF JWA_OMIT_SECTIONS}
