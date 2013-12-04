{******************************************************************************}
{                                                                              }
{ Performance Data Helper API interface Unit for Object Pascal                 }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2001 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The original file is: pdh.h, released June 2000. The original Pascal         }
{ code is: Pdh.pas, released December 2000. The initial developer of the       }
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

// $Id: JwaPdh.pas,v 1.15 2007/09/14 06:48:46 marquardt Exp $
{$IFNDEF JWA_OMIT_SECTIONS}
unit JwaPdh;

{$WEAKPACKAGEUNIT}
{$ENDIF JWA_OMIT_SECTIONS}

{$HPPEMIT ''}
{$HPPEMIT '#include "pdh.h"'}
{$HPPEMIT ''}

{$IFNDEF JWA_OMIT_SECTIONS}
{$I ..\Includes\JediAPILib.inc}

interface

uses
  JwaWinBase, JwaWinType, JwaWinPerf;
{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_IMPLEMENTATIONSECTION}
type
  PDH_STATUS = DWORD;
  {$EXTERNALSYM PDH_STATUS}

const

// version info

  PDH_CVERSION_WIN40 = DWORD($0400);
  {$EXTERNALSYM PDH_CVERSION_WIN40}
  PDH_CVERSION_WIN50 = DWORD($0500);
  {$EXTERNALSYM PDH_CVERSION_WIN50}

// v1.1 revision of PDH -- basic log functions
// v1.2 of the PDH -- adds variable instance counters
// v1.3 of the PDH -- adds log service control & stubs for NT5/PDH v2 fn's
// v2.0 of the PDH -- is the NT v 5.0 B2 version

  PDH_VERSION        = DWORD((PDH_CVERSION_WIN50) + $0003);
  {$EXTERNALSYM PDH_VERSION}

// define severity masks

function IsSuccessSeverity(ErrorCode: Longint): Boolean;
{$EXTERNALSYM IsSuccessSeverity}
function IsInformationalSeverity(ErrorCode: Longint): Boolean;
{$EXTERNALSYM IsInformationalSeverity}
function IsWarningSeverity(ErrorCode: Longint): Boolean;
{$EXTERNALSYM IsWarningSeverity}
function IsErrorSeverity(ErrorCode: Longint): Boolean;
{$EXTERNALSYM IsErrorSeverity}

const
  MAX_COUNTER_PATH = 256;         // Maximum counter path length
  {$EXTERNALSYM MAX_COUNTER_PATH}

  PDH_MAX_COUNTER_NAME    = 1024;  // Maximum counter name length.
  {$EXTERNALSYM PDH_MAX_COUNTER_NAME}
  PDH_MAX_INSTANCE_NAME   = 1024;  // Maximum counter instance name length.
  {$EXTERNALSYM PDH_MAX_INSTANCE_NAME}
  PDH_MAX_COUNTER_PATH    = 2048;  // Maximum full counter path length.
  {$EXTERNALSYM PDH_MAX_COUNTER_PATH}
  PDH_MAX_DATASOURCE_PATH = 1024;  // MAximum full counter log name length.
  {$EXTERNALSYM PDH_MAX_DATASOURCE_PATH}

// data type definitions

type
  PDH_HCOUNTER = HANDLE;
  {$EXTERNALSYM PDH_HCOUNTER}
  PDH_HQUERY = HANDLE;
  {$EXTERNALSYM PDH_HQUERY}
  PDH_HLOG = HANDLE;
  {$EXTERNALSYM PDH_HLOG}

  HCOUNTER = PDH_HCOUNTER;
  {$EXTERNALSYM HCOUNTER}
  HQUERY = PDH_HQUERY;
  {$EXTERNALSYM HQUERY}
  {$IFNDEF JWA_INCLUDEMODE}
  HLOG = PDH_HLOG;
  {$EXTERNALSYM HLOG}
  {$ENDIF JWA_INCLUDEMODE}

const
  {$IFNDEF JWA_INCLUDEMODE}
  INVALID_HANDLE_VALUE = HANDLE(LONG_PTR(-1));
  {$EXTERNALSYM INVALID_HANDLE_VALUE}
  {$ENDIF JWA_INCLUDEMODE}

  H_REALTIME_DATASOURCE = NULL;
  {$EXTERNALSYM H_REALTIME_DATASOURCE}
  H_WBEM_DATASOURCE     = INVALID_HANDLE_VALUE;
  {$EXTERNALSYM H_WBEM_DATASOURCE}

type
  PPDH_RAW_COUNTER = ^PDH_RAW_COUNTER;
  {$EXTERNALSYM PPDH_RAW_COUNTER}
  _PDH_RAW_COUNTER = record
    CStatus: DWORD;
    TimeStamp: FILETIME;
    FirstValue: LONGLONG;
    SecondValue: LONGLONG;
    MultiCount: DWORD;
  end;
  {$EXTERNALSYM _PDH_RAW_COUNTER}
  PDH_RAW_COUNTER = _PDH_RAW_COUNTER;
  {$EXTERNALSYM PDH_RAW_COUNTER}
  TPdhRawCounter = PDH_RAW_COUNTER;
  PPdhRawCounter = PPDH_RAW_COUNTER;

  PPDH_RAW_COUNTER_ITEM_A = ^PDH_RAW_COUNTER_ITEM_A;
  {$EXTERNALSYM PPDH_RAW_COUNTER_ITEM_A}
  _PDH_RAW_COUNTER_ITEM_A = record
    szName: LPSTR;
    RawValue: PDH_RAW_COUNTER;
  end;
  {$EXTERNALSYM _PDH_RAW_COUNTER_ITEM_A}
  PDH_RAW_COUNTER_ITEM_A = _PDH_RAW_COUNTER_ITEM_A;
  {$EXTERNALSYM PDH_RAW_COUNTER_ITEM_A}
  TPdhRawCounterItemA = PDH_RAW_COUNTER_ITEM_A;
  PPdhRawCounterItemA = PPDH_RAW_COUNTER_ITEM_A;

  PPDH_RAW_COUNTER_ITEM_W = ^PDH_RAW_COUNTER_ITEM_W;
  {$EXTERNALSYM PPDH_RAW_COUNTER_ITEM_W}
  _PDH_RAW_COUNTER_ITEM_W = record
    szName: LPWSTR;
    RawValue: PDH_RAW_COUNTER;
  end;
  {$EXTERNALSYM _PDH_RAW_COUNTER_ITEM_W}
  PDH_RAW_COUNTER_ITEM_W = _PDH_RAW_COUNTER_ITEM_W;
  {$EXTERNALSYM PDH_RAW_COUNTER_ITEM_W}
  TPdhRawCounterItemW = PDH_RAW_COUNTER_ITEM_W;
  PPdhRawCounterItemW = PPDH_RAW_COUNTER_ITEM_W;

  {$IFDEF UNICODE}
  PPdhRawCounterItem = PPdhRawCounterItemW;
  PDH_RAW_COUNTER_ITEM = _PDH_RAW_COUNTER_ITEM_W;
  {$EXTERNALSYM PDH_RAW_COUNTER_ITEM}
  PPDH_RAW_COUNTER_ITEM = PPDH_RAW_COUNTER_ITEM_W;
  {$EXTERNALSYM PPDH_RAW_COUNTER_ITEM}
  TPdhRawCounterItem = _PDH_RAW_COUNTER_ITEM_W;
  {$ELSE}
  PPdhRawCounterItem = PPdhRawCounterItemA;
  PDH_RAW_COUNTER_ITEM = _PDH_RAW_COUNTER_ITEM_A;
  {$EXTERNALSYM PDH_RAW_COUNTER_ITEM}
  PPDH_RAW_COUNTER_ITEM = PPDH_RAW_COUNTER_ITEM_A;
  {$EXTERNALSYM PPDH_RAW_COUNTER_ITEM}
  TPdhRawCounterItem = _PDH_RAW_COUNTER_ITEM_A;
  {$ENDIF UNICODE}

  PPDH_FMT_COUNTERVALUE = ^PDH_FMT_COUNTERVALUE;
  {$EXTERNALSYM PPDH_FMT_COUNTERVALUE}
  _PDH_FMT_COUNTERVALUE = record
    CStatus: DWORD;
    case Longint of
      1: (longValue: LONG);
      2: (doubleValue: Double);
      3: (largeValue: LONGLONG);
      4: (AnsiStringValue: LPSTR);
      5: (WideStringValue: LPCWSTR);
  end;
  {$EXTERNALSYM _PDH_FMT_COUNTERVALUE}
  PDH_FMT_COUNTERVALUE = _PDH_FMT_COUNTERVALUE;
  {$EXTERNALSYM PDH_FMT_COUNTERVALUE}
  TPdhFmtCounterValue = PDH_FMT_COUNTERVALUE;
  PPdhFmtCounterValue = PPDH_FMT_COUNTERVALUE;

  PPDH_FMT_COUNTERVALUE_ITEM_A = ^PDH_FMT_COUNTERVALUE_ITEM_A;
  {$EXTERNALSYM PPDH_FMT_COUNTERVALUE_ITEM_A}
  _PDH_FMT_COUNTERVALUE_ITEM_A = record
    szName: LPSTR;
    FmtValue: PDH_FMT_COUNTERVALUE;
  end;
  {$EXTERNALSYM _PDH_FMT_COUNTERVALUE_ITEM_A}
  PDH_FMT_COUNTERVALUE_ITEM_A = _PDH_FMT_COUNTERVALUE_ITEM_A;
  {$EXTERNALSYM PDH_FMT_COUNTERVALUE_ITEM_A}
  TPdhFmtCounterValueItemA = PDH_FMT_COUNTERVALUE_ITEM_A;
  PPdhFmtCounterValueItemA = PPDH_FMT_COUNTERVALUE_ITEM_A;

  PPDH_FMT_COUNTERVALUE_ITEM_W = ^PDH_FMT_COUNTERVALUE_ITEM_W;
  {$EXTERNALSYM PPDH_FMT_COUNTERVALUE_ITEM_W}
  _PDH_FMT_COUNTERVALUE_ITEM_W = record
    szName: LPWSTR;
    FmtValue: PDH_FMT_COUNTERVALUE;
  end;
  {$EXTERNALSYM _PDH_FMT_COUNTERVALUE_ITEM_W}
  PDH_FMT_COUNTERVALUE_ITEM_W = _PDH_FMT_COUNTERVALUE_ITEM_W;
  {$EXTERNALSYM PDH_FMT_COUNTERVALUE_ITEM_W}
  TPdhFmtCounterValueItemW = PDH_FMT_COUNTERVALUE_ITEM_W;
  PPdhFmtCounterValueItemW = PPDH_FMT_COUNTERVALUE_ITEM_W;

  {$IFDEF UNICODE}
  PPdhFmtCounterValueItem = PPdhFmtCounterValueItemW;
  PDH_FMT_COUNTERVALUE_ITEM = _PDH_FMT_COUNTERVALUE_ITEM_W;
  {$EXTERNALSYM PDH_FMT_COUNTERVALUE_ITEM}
  PPDH_FMT_COUNTERVALUE_ITEM = PPDH_FMT_COUNTERVALUE_ITEM_W;
  {$EXTERNALSYM PPDH_FMT_COUNTERVALUE_ITEM}
  TPdhFmtCounterValueItem = _PDH_FMT_COUNTERVALUE_ITEM_W;
  {$ELSE}
  PPdhFmtCounterValueItem = PPdhFmtCounterValueItemA;
  PDH_FMT_COUNTERVALUE_ITEM = _PDH_FMT_COUNTERVALUE_ITEM_A;
  {$EXTERNALSYM PDH_FMT_COUNTERVALUE_ITEM}
  PPDH_FMT_COUNTERVALUE_ITEM = PPDH_FMT_COUNTERVALUE_ITEM_A;
  {$EXTERNALSYM PPDH_FMT_COUNTERVALUE_ITEM}
  TPdhFmtCounterValueItem = _PDH_FMT_COUNTERVALUE_ITEM_A;
  {$ENDIF UNICODE}

  PPDH_STATISTICS = ^PDH_STATISTICS;
  {$EXTERNALSYM PPDH_STATISTICS}
  _PDH_STATISTICS = record
    dwFormat: DWORD;
    Count: DWORD;
    min: PDH_FMT_COUNTERVALUE;
    max: PDH_FMT_COUNTERVALUE;
    mean: PDH_FMT_COUNTERVALUE;
  end;
  {$EXTERNALSYM _PDH_STATISTICS}
  PDH_STATISTICS = _PDH_STATISTICS;
  {$EXTERNALSYM PDH_STATISTICS}
  TPdhStatistics = PDH_STATISTICS;
  PPdhStatistics = PPDH_STATISTICS;

  PPDH_COUNTER_PATH_ELEMENTS_A = ^PDH_COUNTER_PATH_ELEMENTS_A;
  {$EXTERNALSYM PPDH_COUNTER_PATH_ELEMENTS_A}
  _PDH_COUNTER_PATH_ELEMENTS_A = record
    szMachineName: LPSTR;
    szObjectName: LPSTR;
    szInstanceName: LPSTR;
    szParentInstance: LPSTR;
    dwInstanceIndex: DWORD;
    szCounterName: LPSTR;
  end;
  {$EXTERNALSYM _PDH_COUNTER_PATH_ELEMENTS_A}
  PDH_COUNTER_PATH_ELEMENTS_A = _PDH_COUNTER_PATH_ELEMENTS_A;
  {$EXTERNALSYM PDH_COUNTER_PATH_ELEMENTS_A}
  TPdhCounterPathElementsA = PDH_COUNTER_PATH_ELEMENTS_A;
  PPdhCounterPathElementsA = PPDH_COUNTER_PATH_ELEMENTS_A;

  PPDH_COUNTER_PATH_ELEMENTS_W = ^PDH_COUNTER_PATH_ELEMENTS_W;
  {$EXTERNALSYM PPDH_COUNTER_PATH_ELEMENTS_W}
  _PDH_COUNTER_PATH_ELEMENTS_W = record
    szMachineName: LPWSTR;
    szObjectName: LPWSTR;
    szInstanceName: LPWSTR;
    szParentInstance: LPWSTR;
    dwInstanceIndex: DWORD;
    szCounterName: LPWSTR;
  end;
  {$EXTERNALSYM _PDH_COUNTER_PATH_ELEMENTS_W}
  PDH_COUNTER_PATH_ELEMENTS_W = _PDH_COUNTER_PATH_ELEMENTS_W;
  {$EXTERNALSYM PDH_COUNTER_PATH_ELEMENTS_W}
  TPdhCounterPathElementsW = PDH_COUNTER_PATH_ELEMENTS_W;
  PPdhCounterPathElementsW = PPDH_COUNTER_PATH_ELEMENTS_W;

  {$IFDEF UNICODE}
  PPdhCounterPathElements = PPdhCounterPathElementsW;
  PDH_COUNTER_PATH_ELEMENTS = _PDH_COUNTER_PATH_ELEMENTS_W;
  {$EXTERNALSYM PDH_COUNTER_PATH_ELEMENTS}
  PPDH_COUNTER_PATH_ELEMENTS = PPDH_COUNTER_PATH_ELEMENTS_W;
  {$EXTERNALSYM PPDH_COUNTER_PATH_ELEMENTS}
  TPdhCounterPathElements = _PDH_COUNTER_PATH_ELEMENTS_W;
  {$ELSE}
  PPdhCounterPathElements = PPdhCounterPathElementsA;
  PDH_COUNTER_PATH_ELEMENTS = _PDH_COUNTER_PATH_ELEMENTS_A;
  {$EXTERNALSYM PDH_COUNTER_PATH_ELEMENTS}
  PPDH_COUNTER_PATH_ELEMENTS = PPDH_COUNTER_PATH_ELEMENTS_A;
  {$EXTERNALSYM PPDH_COUNTER_PATH_ELEMENTS}
  TPdhCounterPathElements = _PDH_COUNTER_PATH_ELEMENTS_A;
  {$ENDIF UNICODE}

  PPDH_DATA_ITEM_PATH_ELEMENTS_A = ^PDH_DATA_ITEM_PATH_ELEMENTS_A;
  {$EXTERNALSYM PPDH_DATA_ITEM_PATH_ELEMENTS_A}
  _PDH_DATA_ITEM_PATH_ELEMENTS_A = record
    szMachineName: LPSTR;
    ObjectGUID: GUID;
    dwItemId: DWORD;
    szInstanceName: LPSTR;
  end;
  {$EXTERNALSYM _PDH_DATA_ITEM_PATH_ELEMENTS_A}
  PDH_DATA_ITEM_PATH_ELEMENTS_A = _PDH_DATA_ITEM_PATH_ELEMENTS_A;
  {$EXTERNALSYM PDH_DATA_ITEM_PATH_ELEMENTS_A}
  TPdhDataItemPathElementsA = PDH_DATA_ITEM_PATH_ELEMENTS_A;
  PPdhDataItemPathElementsA = PPDH_DATA_ITEM_PATH_ELEMENTS_A;

  PPDH_DATA_ITEM_PATH_ELEMENTS_W = ^PDH_DATA_ITEM_PATH_ELEMENTS_W;
  {$EXTERNALSYM PPDH_DATA_ITEM_PATH_ELEMENTS_W}
  _PDH_DATA_ITEM_PATH_ELEMENTS_W = record
    szMachineName: LPWSTR;
    ObjectGUID: GUID;
    dwItemId: DWORD;
    szInstanceName: LPWSTR;
  end;
  {$EXTERNALSYM _PDH_DATA_ITEM_PATH_ELEMENTS_W}
  PDH_DATA_ITEM_PATH_ELEMENTS_W = _PDH_DATA_ITEM_PATH_ELEMENTS_W;
  {$EXTERNALSYM PDH_DATA_ITEM_PATH_ELEMENTS_W}
  TPdhDataItemPathElementsW = PDH_DATA_ITEM_PATH_ELEMENTS_W;
  PPdhDataItemPathElementsW = PPDH_DATA_ITEM_PATH_ELEMENTS_W;

  {$IFDEF UNICODE}
  PPdhDataItemPathElements = PPdhDataItemPathElementsW;
  PDH_DATA_ITEM_PATH_ELEMENTS = _PDH_DATA_ITEM_PATH_ELEMENTS_W;
  {$EXTERNALSYM PDH_DATA_ITEM_PATH_ELEMENTS}
  PPDH_DATA_ITEM_PATH_ELEMENTS = PPDH_DATA_ITEM_PATH_ELEMENTS_W;
  {$EXTERNALSYM PPDH_DATA_ITEM_PATH_ELEMENTS}
  TPdhDataItemPathElements = _PDH_DATA_ITEM_PATH_ELEMENTS_W;
  {$ELSE}
  PPdhDataItemPathElements = PPdhDataItemPathElementsA;
  PDH_DATA_ITEM_PATH_ELEMENTS = _PDH_DATA_ITEM_PATH_ELEMENTS_A;
  {$EXTERNALSYM PDH_DATA_ITEM_PATH_ELEMENTS}
  PPDH_DATA_ITEM_PATH_ELEMENTS = PPDH_DATA_ITEM_PATH_ELEMENTS_A;
  {$EXTERNALSYM PPDH_DATA_ITEM_PATH_ELEMENTS}
  TPdhDataItemPathElements = _PDH_DATA_ITEM_PATH_ELEMENTS_A;
  {$ENDIF UNICODE}

  PPDH_COUNTER_INFO_A = ^PDH_COUNTER_INFO_A;
  {$EXTERNALSYM PPDH_COUNTER_INFO_A}
  _PDH_COUNTER_INFO_A = record
    dwLength: DWORD;
    dwType: DWORD;
    CVersion: DWORD;
    CStatus: DWORD;
    lScale: LONG;
    lDefaultScale: LONG;
    dwUserData: DWORD_PTR;
    dwQueryUserData: DWORD_PTR;
    szFullPath: LPSTR;
    Union: record
      case Longint of
        1: (DataItemPath: PDH_DATA_ITEM_PATH_ELEMENTS_A);
        2: (CounterPath: PDH_COUNTER_PATH_ELEMENTS_A);
        3: (szMachineName: LPSTR;
            szObjectName: LPSTR;
            szInstanceName: LPSTR;
            szParentInstance: LPSTR;
            dwInstanceIndex: DWORD;
            szCounterName: LPSTR);
    end;
    szExplainText: LPSTR;
    DataBuffer: array [0..0] of DWORD;
  end;
  {$EXTERNALSYM _PDH_COUNTER_INFO_A}
  PDH_COUNTER_INFO_A = _PDH_COUNTER_INFO_A;
  {$EXTERNALSYM PDH_COUNTER_INFO_A}
  TPdhCounterInfoA = PDH_COUNTER_INFO_A;
  PPdhCounterInfoA = PPDH_COUNTER_INFO_A;

  PPDH_COUNTER_INFO_W = ^PDH_COUNTER_INFO_W;
  {$EXTERNALSYM PPDH_COUNTER_INFO_W}
  _PDH_COUNTER_INFO_W = record
    dwLength: DWORD;
    dwType: DWORD;
    CVersion: DWORD;
    CStatus: DWORD;
    lScale: LONG;
    lDefaultScale: LONG;
    dwUserData: DWORD_PTR;
    dwQueryUserData: DWORD_PTR;
    szFullPath: LPWSTR;
    Union: record
      case Longint of
        1: (DataItemPath: PDH_DATA_ITEM_PATH_ELEMENTS_W);
        2: (CounterPath: PDH_COUNTER_PATH_ELEMENTS_W);
        3: (szMachineName: LPWSTR;
            szObjectName: LPWSTR;
            szInstanceName: LPWSTR;
            szParentInstance: LPWSTR;
            dwInstanceIndex: DWORD;
            szCounterName: LPWSTR);
    end;
    szExplainText: LPWSTR;
    DataBuffer: array [0..0] of DWORD;
  end;
  {$EXTERNALSYM _PDH_COUNTER_INFO_W}
  PDH_COUNTER_INFO_W = _PDH_COUNTER_INFO_W;
  {$EXTERNALSYM PDH_COUNTER_INFO_W}
  TPdhCounterInfoW = PDH_COUNTER_INFO_W;
  PPdhCounterInfoW = PPDH_COUNTER_INFO_W;

  {$IFDEF UNICODE}
  PPdhCounterInfo = PPdhCounterInfoW;
  PDH_COUNTER_INFO = _PDH_COUNTER_INFO_W;
  {$EXTERNALSYM PDH_COUNTER_INFO}
  PPDH_COUNTER_INFO = PPDH_COUNTER_INFO_W;
  {$EXTERNALSYM PPDH_COUNTER_INFO}
  TPdhCounterInfo = _PDH_COUNTER_INFO_W;
  {$ELSE}
  PPdhCounterInfo = PPdhCounterInfoA;
  PDH_COUNTER_INFO = _PDH_COUNTER_INFO_A;
  {$EXTERNALSYM PDH_COUNTER_INFO}
  PPDH_COUNTER_INFO = PPDH_COUNTER_INFO_A;
  {$EXTERNALSYM PPDH_COUNTER_INFO}
  TPdhCounterInfo = _PDH_COUNTER_INFO_A;
  {$ENDIF UNICODE}

  PPDH_TIME_INFO = ^PDH_TIME_INFO;
  {$EXTERNALSYM PPDH_TIME_INFO}
  _PDH_TIME_INFO = record
    StartTime: LONGLONG;
    EndTime: LONGLONG;
    SampleCount: DWORD;
  end;
  {$EXTERNALSYM _PDH_TIME_INFO}
  PDH_TIME_INFO = _PDH_TIME_INFO;
  {$EXTERNALSYM PDH_TIME_INFO}
  TPdhTimeInfo = PDH_TIME_INFO;
  PPdhTimeInfo = PPDH_TIME_INFO;

  PPDH_RAW_LOG_RECORD = ^PDH_RAW_LOG_RECORD;
  {$EXTERNALSYM PPDH_RAW_LOG_RECORD}
  _PDH_RAW_LOG_RECORD = record
    dwStructureSize: DWORD;
    dwRecordType: DWORD;
    dwItems: DWORD;
    RawBytes: array [0..0] of UCHAR;
  end;
  {$EXTERNALSYM _PDH_RAW_LOG_RECORD}
  PDH_RAW_LOG_RECORD = _PDH_RAW_LOG_RECORD;
  {$EXTERNALSYM PDH_RAW_LOG_RECORD}
  TPdhRawLogRecord = PDH_RAW_LOG_RECORD;
  PPdhRawLogRecord = PPDH_RAW_LOG_RECORD;

  PPDH_LOG_SERVICE_QUERY_INFO_A = ^PDH_LOG_SERVICE_QUERY_INFO_A;
  {$EXTERNALSYM PPDH_LOG_SERVICE_QUERY_INFO_A}
  _PDH_LOG_SERVICE_QUERY_INFO_A = record
    dwSize: DWORD;
    dwFlags: DWORD;
    dwLogQuota: DWORD;
    szLogFileCaption: LPSTR;
    szDefaultDir: LPSTR;
    szBaseFileName: LPSTR;
    dwFileType: DWORD;
    dwReserved: DWORD;
    Union: record
      case Longint of
      1: (PdlAutoNameInterval: DWORD;
          PdlAutoNameUnits: DWORD;
          PdlCommandFilename: LPSTR;
          PdlCounterList: LPSTR;
          PdlAutoNameFormat: DWORD;
          PdlSampleInterval: DWORD;
          PdlLogStartTime: FILETIME;
          PdlLogEndTime: FILETIME);
      2: (TlNumberOfBuffers: DWORD;
          TlMinimumBuffers: DWORD;
          TlMaximumBuffers: DWORD;
          TlFreeBuffers: DWORD;
          TlBufferSize: DWORD;
          TlEventsLost: DWORD;
          TlLoggerThreadId: DWORD;
          TlBuffersWritten: DWORD;
          TlLogHandle: DWORD;
          TlLogFileName: LPSTR);
    end;
  end;
  {$EXTERNALSYM _PDH_LOG_SERVICE_QUERY_INFO_A}
  PDH_LOG_SERVICE_QUERY_INFO_A = _PDH_LOG_SERVICE_QUERY_INFO_A;
  {$EXTERNALSYM _PDH_LOG_SERVICE_QUERY_INFO_A}
  TPdhLogServiceQueryInfoA = PDH_LOG_SERVICE_QUERY_INFO_A;
  PPdhLogServiceQueryInfoA = PPDH_LOG_SERVICE_QUERY_INFO_A;

  PPDH_LOG_SERVICE_QUERY_INFO_W = ^PDH_LOG_SERVICE_QUERY_INFO_W;
  {$EXTERNALSYM PPDH_LOG_SERVICE_QUERY_INFO_W}
  _PDH_LOG_SERVICE_QUERY_INFO_W = record
    dwSize: DWORD;
    dwFlags: DWORD;
    dwLogQuota: DWORD;
    szLogFileCaption: LPWSTR;
    szDefaultDir: LPWSTR;
    szBaseFileName: LPWSTR;
    dwFileType: DWORD;
    dwReserved: DWORD;
    Union: record
      case Longint of
      1: (PdlAutoNameInterval: DWORD;
          PdlAutoNameUnits: DWORD;
          PdlCommandFilename: LPWSTR;
          PdlCounterList: LPWSTR;
          PdlAutoNameFormat: DWORD;
          PdlSampleInterval: DWORD;
          PdlLogStartTime: FILETIME;
          PdlLogEndTime: FILETIME);
      2: (TlNumberOfBuffers: DWORD;
          TlMinimumBuffers: DWORD;
          TlMaximumBuffers: DWORD;
          TlFreeBuffers: DWORD;
          TlBufferSize: DWORD;
          TlEventsLost: DWORD;
          TlLoggerThreadId: DWORD;
          TlBuffersWritten: DWORD;
          TlLogHandle: DWORD;
          TlLogFileName: LPWSTR);
    end;
  end;
  {$EXTERNALSYM _PDH_LOG_SERVICE_QUERY_INFO_W}
  PDH_LOG_SERVICE_QUERY_INFO_W = _PDH_LOG_SERVICE_QUERY_INFO_W;
  {$EXTERNALSYM PDH_LOG_SERVICE_QUERY_INFO_W}
  TPdhLogServiceQueryInfoW = PDH_LOG_SERVICE_QUERY_INFO_W;
  PPdhLogServiceQueryInfoW = PPDH_LOG_SERVICE_QUERY_INFO_W;

  {$IFDEF UNICODE}
  PPdhLogServiceQueryInfo = PPdhLogServiceQueryInfoW;
  PDH_LOG_SERVICE_QUERY_INFO = _PDH_LOG_SERVICE_QUERY_INFO_W;
  {$EXTERNALSYM PDH_LOG_SERVICE_QUERY_INFO}
  PPDH_LOG_SERVICE_QUERY_INFO = PPDH_LOG_SERVICE_QUERY_INFO_W;
  {$EXTERNALSYM PPDH_LOG_SERVICE_QUERY_INFO}
  TPdhLogServiceQueryInfo = _PDH_LOG_SERVICE_QUERY_INFO_W;
  {$ELSE}
  PPdhLogServiceQueryInfo = PPdhLogServiceQueryInfoA;
  PDH_LOG_SERVICE_QUERY_INFO = _PDH_LOG_SERVICE_QUERY_INFO_A;
  {$EXTERNALSYM PDH_LOG_SERVICE_QUERY_INFO}
  PPDH_LOG_SERVICE_QUERY_INFO = PPDH_LOG_SERVICE_QUERY_INFO_A;
  {$EXTERNALSYM PPDH_LOG_SERVICE_QUERY_INFO}
  TPdhLogServiceQueryInfo = _PDH_LOG_SERVICE_QUERY_INFO_A;
  {$ENDIF UNICODE}

//
//  Time value constants
//

const
  MAX_TIME_VALUE = LONGLONG($7FFFFFFFFFFFFFFF);
  {$EXTERNALSYM MAX_TIME_VALUE}
  MIN_TIME_VALUE = LONGLONG(0);
  {$EXTERNALSYM MIN_TIME_VALUE}

// function definitions

function PdhGetDllVersion(var lpdwVersion: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDllVersion}

//
//  Query Functions
//

function PdhOpenQueryA(szDataSource: LPCSTR; dwUserData: DWORD_PTR;
  var phQuery: PDH_HQUERY): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhOpenQueryA}
function PdhOpenQueryW(szDataSource: LPCWSTR; dwUserData: DWORD_PTR;
  var phQuery: PDH_HQUERY): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhOpenQueryW}
function PdhOpenQuery(szDataSource: LPCTSTR; dwUserData: DWORD_PTR;
  var phQuery: PDH_HQUERY): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhOpenQuery}

function PdhAddCounterA(hQuery: PDH_HQUERY; szFullCounterPath: LPCSTR;
  dwUserData: DWORD_PTR; var phCounter: PDH_HCOUNTER): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhAddCounterA}
function PdhAddCounterW(hQuery: PDH_HQUERY; szFullCounterPath: LPCWSTR;
  dwUserData: DWORD_PTR; var phCounter: PDH_HCOUNTER): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhAddCounterW}
function PdhAddCounter(hQuery: PDH_HQUERY; szFullCounterPath: LPCTSTR;
  dwUserData: DWORD_PTR; var phCounter: PDH_HCOUNTER): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhAddCounter}

function PdhRemoveCounter(hCounter: PDH_HCOUNTER): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhRemoveCounter}

function PdhCollectQueryData(hQuery: PDH_HQUERY): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhCollectQueryData}

function PdhCloseQuery(hQuery: PDH_HQUERY): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhCloseQuery}

//
//  Counter Functions
//

function PdhGetFormattedCounterValue(hCounter: PDH_HCOUNTER; dwFormat: DWORD;
  lpdwType: LPDWORD; var pValue: PDH_FMT_COUNTERVALUE): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetFormattedCounterValue}

function PdhGetFormattedCounterArrayA(hCounter: PDH_HCOUNTER; dwFormat: DWORD;
  var lpdwBufferSize, lpdwItemCount: DWORD;
  var ItemBuffer: PDH_FMT_COUNTERVALUE_ITEM_A): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetFormattedCounterArrayA}
function PdhGetFormattedCounterArrayW(hCounter: PDH_HCOUNTER; dwFormat: DWORD;
  var lpdwBufferSize, lpdwItemCount: DWORD;
  var ItemBuffer: PDH_FMT_COUNTERVALUE_ITEM_W): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetFormattedCounterArrayW}
function PdhGetFormattedCounterArray(hCounter: PDH_HCOUNTER; dwFormat: DWORD;
  var lpdwBufferSize, lpdwItemCount: DWORD;
  var ItemBuffer: PDH_FMT_COUNTERVALUE_ITEM): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetFormattedCounterArray}

// dwFormat flag values

const
  PDH_FMT_RAW      = DWORD($00000010);
  {$EXTERNALSYM PDH_FMT_RAW}
  PDH_FMT_ANSI     = DWORD($00000020);
  {$EXTERNALSYM PDH_FMT_ANSI}
  PDH_FMT_UNICODE  = DWORD($00000040);
  {$EXTERNALSYM PDH_FMT_UNICODE}
  PDH_FMT_LONG     = DWORD($00000100);
  {$EXTERNALSYM PDH_FMT_LONG}
  PDH_FMT_DOUBLE   = DWORD($00000200);
  {$EXTERNALSYM PDH_FMT_DOUBLE}
  PDH_FMT_LARGE    = DWORD($00000400);
  {$EXTERNALSYM PDH_FMT_LARGE}
  PDH_FMT_NOSCALE  = DWORD($00001000);
  {$EXTERNALSYM PDH_FMT_NOSCALE}
  PDH_FMT_1000     = DWORD($00002000);
  {$EXTERNALSYM PDH_FMT_1000}
  PDH_FMT_NODATA   = DWORD($00004000);
  {$EXTERNALSYM PDH_FMT_NODATA}
  PDH_FMT_NOCAP100 = DWORD($00008000);
  {$EXTERNALSYM PDH_FMT_NODATA}

  PERF_DETAIL_COSTLY   = DWORD($00010000);
  {$EXTERNALSYM PERF_DETAIL_COSTLY}
  PERF_DETAIL_STANDARD = DWORD($0000FFFF);
  {$EXTERNALSYM PERF_DETAIL_STANDARD}

function PdhGetRawCounterValue(hCounter: PDH_HCOUNTER; lpdwType: LPDWORD;
  var pValue: PDH_RAW_COUNTER): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetRawCounterValue}

function PdhGetRawCounterArrayA(hCounter: PDH_HCOUNTER; var lpdwBufferSize,
  lpdwItemCount: DWORD; var ItemBuffer: PDH_RAW_COUNTER_ITEM_A): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetRawCounterArrayA}
function PdhGetRawCounterArrayW(hCounter: PDH_HCOUNTER; var lpdwBufferSize,
  lpdwItemCount: DWORD; var ItemBuffer: PDH_RAW_COUNTER_ITEM_W): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetRawCounterArrayW}
function PdhGetRawCounterArray(hCounter: PDH_HCOUNTER; var lpdwBufferSize,
  lpdwItemCount: DWORD; var ItemBuffer: PDH_RAW_COUNTER_ITEM): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetRawCounterArray}

function PdhCalculateCounterFromRawValue(hCounter: PDH_HCOUNTER; dwFormat: DWORD;
  rawValue1, rawValue2: PPDH_RAW_COUNTER; var fmtValue: PDH_FMT_COUNTERVALUE): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhCalculateCounterFromRawValue}

function PdhComputeCounterStatistics(hCounter: PDH_HCOUNTER; dwFormat, dwFirstEntry,
  dwNumEntries: DWORD; lpRawValueArray: PPDH_RAW_COUNTER; var data: PDH_STATISTICS): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhComputeCounterStatistics}

function PdhGetCounterInfoA(hCounter: PDH_HCOUNTER; bRetrieveExplainText: Boolean;
  var pdwBufferSize: DWORD; lpBuffer: PPDH_COUNTER_INFO_A): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetCounterInfoA}
function PdhGetCounterInfoW(hCounter: PDH_HCOUNTER; bRetrieveExplainText: Boolean;
  var pdwBufferSize: DWORD; lpBuffer: PPDH_COUNTER_INFO_W): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetCounterInfoW}
function PdhGetCounterInfo(hCounter: PDH_HCOUNTER; bRetrieveExplainText: Boolean;
  var pdwBufferSize: DWORD; lpBuffer: PPDH_COUNTER_INFO): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetCounterInfo}

const
  PDH_MAX_SCALE = Longint(7);
  {$EXTERNALSYM PDH_MAX_SCALE}
  PDH_MIN_SCALE = Longint(-7);
  {$EXTERNALSYM PDH_MIN_SCALE}

function PdhSetCounterScaleFactor(hCounter: PDH_HCOUNTER; lFactor: LONG): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhSetCounterScaleFactor}

//
//   Browsing and enumeration functions
//

function PdhConnectMachineA(szMachineName: LPCSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhConnectMachineA}
function PdhConnectMachineW(szMachineName: LPCWSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhConnectMachineW}
function PdhConnectMachine(szMachineName: LPCTSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhConnectMachine}

function PdhEnumMachinesA(szDataSource: LPCSTR; mszMachineList: LPSTR;
  pcchBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumMachinesA}
function PdhEnumMachinesW(szDataSource: LPCWSTR; mszMachineList: LPWSTR;
  pcchBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumMachinesW}
function PdhEnumMachines(szDataSource: LPCTSTR; mszMachineList: LPTSTR;
  pcchBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumMachines}

function PdhEnumObjectsA(szDataSource, szMachineName: LPCSTR; mszObjectList: LPSTR;
  var pcchBufferSize: DWORD; dwDetailLevel: DWORD; bRefresh: BOOL): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumObjectsA}
function PdhEnumObjectsW(szDataSource, szMachineName: LPCWSTR; mszObjectList: LPWSTR;
  var pcchBufferSize: DWORD; dwDetailLevel: DWORD; bRefresh: BOOL): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumObjectsW}
function PdhEnumObjects(szDataSource, szMachineName: LPCTSTR; mszObjectList: LPTSTR;
  var pcchBufferSize: DWORD; dwDetailLevel: DWORD; bRefresh: BOOL): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumObjects}

function PdhEnumObjectItemsA(szDataSource, szMachineName, szObjectName: LPCSTR;
  mszCounterList: LPSTR; var pcchCounterListLength: DWORD; mszInstanceList: LPSTR;
  var pcchInstanceListLength: DWORD; dwDetailLevel, dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumObjectItemsA}
function PdhEnumObjectItemsW(szDataSource, szMachineName, szObjectName: LPCWSTR;
  mszCounterList: LPWSTR; var pcchCounterListLength: DWORD; mszInstanceList: LPWSTR;
  var pcchInstanceListLength: DWORD; dwDetailLevel, dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumObjectItemsW}
function PdhEnumObjectItems(szDataSource, szMachineName, szObjectName: LPCTSTR;
  mszCounterList: LPTSTR; var pcchCounterListLength: DWORD; mszInstanceList: LPTSTR;
  var pcchInstanceListLength: DWORD; dwDetailLevel, dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumObjectItems}

const
  PDH_OBJECT_HAS_INSTANCES  = $00000001;
  {$EXTERNALSYM PDH_OBJECT_HAS_INSTANCES}

function PdhMakeCounterPathA(pCounterPathElements: PPDH_COUNTER_PATH_ELEMENTS_A;
  szFullPathBuffer: LPSTR; var pcchBufferSize: DWORD; dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhMakeCounterPathA}
function PdhMakeCounterPathW(pCounterPathElements: PPDH_COUNTER_PATH_ELEMENTS_W;
  szFullPathBuffer: LPWSTR; var pcchBufferSize: DWORD; dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhMakeCounterPathW}
function PdhMakeCounterPath(pCounterPathElements: PPDH_COUNTER_PATH_ELEMENTS;
  szFullPathBuffer: LPTSTR; var pcchBufferSize: DWORD; dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhMakeCounterPath}

// todo shouldn't pCounterPathElements be a pointer to ...?

function PdhParseCounterPathA(szFullPathBuffer: LPCSTR;
  pCounterPathElements: PPDH_COUNTER_PATH_ELEMENTS_A; var pdwBufferSize: DWORD;
  dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhParseCounterPathA}
function PdhParseCounterPathW(szFullPathBuffer: LPCWSTR;
  pCounterPathElements: PPDH_COUNTER_PATH_ELEMENTS_W; var pdwBufferSize: DWORD;
  dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhParseCounterPathW}
function PdhParseCounterPath(szFullPathBuffer: LPCTSTR;
  pCounterPathElements: PPDH_COUNTER_PATH_ELEMENTS; var pdwBufferSize: DWORD;
  dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhParseCounterPath}

const
  PDH_PATH_WBEM_RESULT       = DWORD($00000001);
  {$EXTERNALSYM PDH_PATH_WBEM_RESULT}
  PDH_PATH_WBEM_INPUT        = DWORD($00000002);
  {$EXTERNALSYM PDH_PATH_WBEM_INPUT}

function PDH_PATH_LANG_FLAGS(LangId, Flags: DWORD): DWORD;
{$EXTERNALSYM PDH_PATH_LANG_FLAGS}

function PdhParseInstanceNameA(szInstanceString: LPSTR; szInstanceName: LPCSTR;
  var pcchInstanceNameLength: DWORD; szParentName: LPSTR;
  var pcchParentNameLength: DWORD; lpIndex: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhParseInstanceNameA}
function PdhParseInstanceNameW(szInstanceString: LPWSTR; szInstanceName: LPCWSTR;
  var pcchInstanceNameLength: DWORD; szParentName: LPWSTR;
  var pcchParentNameLength: DWORD; lpIndex: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhParseInstanceNameW}
function PdhParseInstanceName(szInstanceString: LPTSTR; szInstanceName: LPCTSTR;
  var pcchInstanceNameLength: DWORD; szParentName: LPTSTR;
  var pcchParentNameLength: DWORD; lpIndex: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhParseInstanceName}

function PdhValidatePathA(szFullPathBuffer: LPCSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhValidatePathA}
function PdhValidatePathW(szFullPathBuffer: LPCWSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhValidatePathW}
function PdhValidatePath(szFullPathBuffer: LPCTSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhValidatePath}

function PdhGetDefaultPerfObjectA(szDataSource, szMachineName: LPCSTR;
  szDefaultObjectName: LPSTR; var pcchBufferSize: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfObjectA}
function PdhGetDefaultPerfObjectW(szDataSource, szMachineName: LPCWSTR;
  szDefaultObjectName: LPWSTR; var pcchBufferSize: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfObjectW}
function PdhGetDefaultPerfObject(szDataSource, szMachineName: LPCTSTR;
  szDefaultObjectName: LPTSTR; var pcchBufferSize: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfObject}

function PdhGetDefaultPerfCounterA(szDataSource, szMachineName, szObjectName: LPCSTR;
  szDefaultCounterName: LPSTR; var pcchBufferSize: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfCounterA}
function PdhGetDefaultPerfCounterW(szDataSource, szMachineName, szObjectName: LPCWSTR;
  szDefaultCounterName: LPWSTR; var pcchBufferSize: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfCounterW}
function PdhGetDefaultPerfCounter(szDataSource, szMachineName, szObjectName: LPCTSTR;
  szDefaultCounterName: LPTSTR; var pcchBufferSize: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfCounter}

type
  CounterPathCallBack = function(dwArg: DWORD_PTR): PDH_STATUS; stdcall;
  {$EXTERNALSYM CounterPathCallBack}

const
  PDH_CF_INCLUDEINSTANCEINDEX    = 1 shl 0;
  PDH_CF_SINGLECOUNTERPERADD     = 1 shl 1;
  PDH_CF_SINGLECOUNTERPERDIALOG  = 1 shl 2;
  PDH_CF_LOCALCOUNTERSONLY       = 1 shl 3;
  PDH_CF_WILDCARDINSTANCES       = 1 shl 4;
  PDH_CF_HIDEDETAILBOX           = 1 shl 5;
  PDH_CF_INITIALIZEPATH          = 1 shl 6;
  PDH_CF_DISABLEMACHINESELECTION = 1 shl 7;
  PDH_CF_INCLUDECOSTLYOBJECTS    = 1 shl 8;
  PDH_CF_SHOWOBJECTBROWSER       = 1 shl 9;
  PDH_CF_RESERVED                = DWORD($FFFFFD00);

type
  _BrowseDlgConfig_HW = record
    // Configuration flags
    dwConfigFlags: DWORD;
    hWndOwner: HWND;
    hDataSource: PDH_HLOG;
    szReturnPathBuffer: LPWSTR;
    cchReturnPathLength: DWORD;
    pCallBack: CounterPathCallBack;
    dwCallBackArg: DWORD_PTR;
    CallBackStatus: PDH_STATUS;
    dwDefaultDetailLevel: DWORD;
    szDialogBoxCaption: LPWSTR;
  end;
  {$EXTERNALSYM _BrowseDlgConfig_HW}
  PDH_BROWSE_DLG_CONFIG_HW = _BrowseDlgConfig_HW;
  {$EXTERNALSYM PDH_BROWSE_DLG_CONFIG_HW}
  PPDH_BROWSE_DLG_CONFIG_HW = ^PDH_BROWSE_DLG_CONFIG_HW;
  {$EXTERNALSYM PPDH_BROWSE_DLG_CONFIG_HW}
  TPdhBrowseDlgConfigHW = PDH_BROWSE_DLG_CONFIG_HW;
  PPdhBrowseDlgConfigHW = PPDH_BROWSE_DLG_CONFIG_HW;

  _BrowseDlgConfig_HA = record
    // Configuration flags
    dwConfigFlags: DWORD;
    hWndOwner: HWND;
    hDataSource: PDH_HLOG;
    szReturnPathBuffer: LPSTR;
    cchReturnPathLength: DWORD;
    pCallBack: CounterPathCallBack;
    dwCallBackArg: DWORD_PTR;
    CallBackStatus: PDH_STATUS;
    dwDefaultDetailLevel: DWORD;
    szDialogBoxCaption: LPSTR;
  end;
  {$EXTERNALSYM _BrowseDlgConfig_HA}
  PDH_BROWSE_DLG_CONFIG_HA = _BrowseDlgConfig_HA;
  {$EXTERNALSYM PDH_BROWSE_DLG_CONFIG_HA}
  PPDH_BROWSE_DLG_CONFIG_HA = ^PDH_BROWSE_DLG_CONFIG_HA;
  {$EXTERNALSYM PPDH_BROWSE_DLG_CONFIG_HA}
  TPdhBrowseDlgConfigHA = PDH_BROWSE_DLG_CONFIG_HA;
  PPdhBrowseDlgConfigHA = PPDH_BROWSE_DLG_CONFIG_HA;

  {$IFDEF UNICODE}
  PDH_BROWSE_DLG_CONFIG_H = PDH_BROWSE_DLG_CONFIG_HW;
  PPDH_BROWSE_DLG_CONFIG_H = PPDH_BROWSE_DLG_CONFIG_HW;
  {$ELSE}
  PDH_BROWSE_DLG_CONFIG_H = PDH_BROWSE_DLG_CONFIG_HA;
  PPDH_BROWSE_DLG_CONFIG_H = PPDH_BROWSE_DLG_CONFIG_HA;
  {$ENDIF UNICODE}

  PPDH_BROWSE_DLG_CONFIG_A = ^_BrowseDlgConfig_A;
  {$EXTERNALSYM PPDH_BROWSE_DLG_CONFIG_A}
  _BrowseDlgConfig_A = record
    dwConfigFlags: DWORD;
    hWndOwner: HWND;
    szDataSource: LPSTR;
    szReturnPathBuffer: LPSTR;
    cchReturnPathLength: DWORD;
    pCallBack: CounterPathCallBack;
    dwCallBackArg: DWORD_PTR;
    CallBackStatus: PDH_STATUS;
    dwDefaultDetailLevel: DWORD;
    szDialogBoxCaption: LPSTR;
  end;
  {$EXTERNALSYM _BrowseDlgConfig_A}
  PDH_BROWSE_DLG_CONFIG_A = _BrowseDlgConfig_A;
  {$EXTERNALSYM PDH_BROWSE_DLG_CONFIG_A}
  TPdhBrowseDlgConfigA = PDH_BROWSE_DLG_CONFIG_A;
  PPdhBrowseDlgConfigA = PPDH_BROWSE_DLG_CONFIG_A;

  PPDH_BROWSE_DLG_CONFIG_W = ^_BrowseDlgConfig_W;
  {$EXTERNALSYM PPDH_BROWSE_DLG_CONFIG_W}
  _BrowseDlgConfig_W = record
    dwConfigFlags: DWORD;
    hWndOwner: HWND;
    szDataSource: LPWSTR;
    szReturnPathBuffer: LPWSTR;
    cchReturnPathLength: DWORD;
    pCallBack: CounterPathCallBack;
    dwCallBackArg: DWORD_PTR;
    CallBackStatus: PDH_STATUS;
    dwDefaultDetailLevel: DWORD;
    szDialogBoxCaption: LPWSTR;
  end;
  {$EXTERNALSYM _BrowseDlgConfig_W}
  PDH_BROWSE_DLG_CONFIG_W = _BrowseDlgConfig_W;
  {$EXTERNALSYM PDH_BROWSE_DLG_CONFIG_W}
  TPdhBrowseDlgConfigW = PDH_BROWSE_DLG_CONFIG_W;
  PPdhBrowseDlgConfigW = PPDH_BROWSE_DLG_CONFIG_W;

  {$IFDEF UNICODE}
  PPdhBrowseDlgConfig = PPdhBrowseDlgConfigW;
  PDH_BROWSE_DLG_CONFIG = PDH_BROWSE_DLG_CONFIG_W;
  {$EXTERNALSYM PDH_BROWSE_DLG_CONFIG}
  PPDH_BROWSE_DLG_CONFIG = PPDH_BROWSE_DLG_CONFIG_W;
  {$EXTERNALSYM PPDH_BROWSE_DLG_CONFIG}
  TPdhBrowseDlgConfig = TPdhBrowseDlgConfigW;
  {$ELSE}
  PPdhBrowseDlgConfig = PPdhBrowseDlgConfigA;
  PDH_BROWSE_DLG_CONFIG = PDH_BROWSE_DLG_CONFIG_A;
  {$EXTERNALSYM PDH_BROWSE_DLG_CONFIG}
  PPDH_BROWSE_DLG_CONFIG = PPDH_BROWSE_DLG_CONFIG_A;
  {$EXTERNALSYM PPDH_BROWSE_DLG_CONFIG}
  TPdhBrowseDlgConfig = TPdhBrowseDlgConfigA;
  {$ENDIF UNICODE}

function PdhBrowseCountersA(const pBrowseDlgData: PDH_BROWSE_DLG_CONFIG_A): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhBrowseCountersA}
function PdhBrowseCountersW(const pBrowseDlgData: PDH_BROWSE_DLG_CONFIG_W): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhBrowseCountersW}
function PdhBrowseCounters(const pBrowseDlgData: PDH_BROWSE_DLG_CONFIG): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhBrowseCounters}

function PdhExpandCounterPathA(szWildCardPath: LPCSTR; mszExpandedPathList: LPSTR;
  var pcchPathListLength: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhExpandCounterPathA}
function PdhExpandCounterPathW(szWildCardPath: LPCWSTR; mszExpandedPathList: LPWSTR;
  var pcchPathListLength: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhExpandCounterPathW}
function PdhExpandCounterPath(szWildCardPath: LPCTSTR; mszExpandedPathList: LPTSTR;
  var pcchPathListLength: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhExpandCounterPath}

//
//  v2.0 functions
//

function PdhLookupPerfNameByIndexA(szMachineName: LPCSTR; dwNameIndex: DWORD;
  szNameBuffer: LPSTR; var pcchNameBufferSize: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhLookupPerfNameByIndexA}
function PdhLookupPerfNameByIndexW(szMachineName: LPCWSTR; dwNameIndex: DWORD;
  szNameBuffer: LPWSTR; var pcchNameBufferSize: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhLookupPerfNameByIndexW}
function PdhLookupPerfNameByIndex(szMachineName: LPCTSTR; dwNameIndex: DWORD;
  szNameBuffer: LPTSTR; var pcchNameBufferSize: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhLookupPerfNameByIndex}

function PdhLookupPerfIndexByNameA(szMachineName, szNameBuffer: LPCSTR;
  var pdwIndex: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhLookupPerfIndexByNameA}
function PdhLookupPerfIndexByNameW(szMachineName, szNameBuffer: LPCWSTR;
  var pdwIndex: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhLookupPerfIndexByNameW}
function PdhLookupPerfIndexByName(szMachineName, szNameBuffer: LPCTSTR;
  var pdwIndex: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhLookupPerfIndexByName}

const
  PDH_NOEXPANDCOUNTERS   = 1;
  {$EXTERNALSYM PDH_NOEXPANDCOUNTERS}
  PDH_NOEXPANDINSTANCES  = 2;
  {$EXTERNALSYM PDH_NOEXPANDINSTANCES}
  PDH_REFRESHCOUNTERS    = 4;
  {$EXTERNALSYM PDH_REFRESHCOUNTERS}

function PdhExpandWildCardPathA(szDataSource, szWildCardPath: LPCSTR;
  mszExpandedPathList: LPSTR; var pcchPathListLength: DWORD; dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhExpandWildCardPathA}
function PdhExpandWildCardPathW(szDataSource, szWildCardPath: LPCWSTR;
  mszExpandedPathList: LPWSTR; var pcchPathListLength: DWORD; dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhExpandWildCardPathW}
function PdhExpandWildCardPath(szDataSource, szWildCardPath: LPCTSTR;
  mszExpandedPathList: LPTSTR; var pcchPathListLength: DWORD; dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhExpandWildCardPath}

//
//   Logging Functions
//

const
  PDH_LOG_READ_ACCESS        = DWORD($00010000);
  {$EXTERNALSYM PDH_LOG_READ_ACCESS}
  PDH_LOG_WRITE_ACCESS       = DWORD($00020000);
  {$EXTERNALSYM PDH_LOG_WRITE_ACCESS}
  PDH_LOG_UPDATE_ACCESS      = DWORD($00040000);
  {$EXTERNALSYM PDH_LOG_UPDATE_ACCESS}
  PDH_LOG_ACCESS_MASK        = DWORD($000F0000);
  {$EXTERNALSYM PDH_LOG_ACCESS_MASK}

  PDH_LOG_CREATE_NEW         = DWORD($00000001);
  {$EXTERNALSYM PDH_LOG_CREATE_NEW}
  PDH_LOG_CREATE_ALWAYS      = DWORD($00000002);
  {$EXTERNALSYM PDH_LOG_CREATE_ALWAYS}
  PDH_LOG_OPEN_ALWAYS        = DWORD($00000003);
  {$EXTERNALSYM PDH_LOG_OPEN_ALWAYS}
  PDH_LOG_OPEN_EXISTING      = DWORD($00000004);
  {$EXTERNALSYM PDH_LOG_OPEN_EXISTING}
  PDH_LOG_CREATE_MASK        = DWORD($0000000F);
  {$EXTERNALSYM PDH_LOG_CREATE_MASK}

  PDH_LOG_OPT_USER_STRING    = DWORD($01000000);
  {$EXTERNALSYM PDH_LOG_OPT_USER_STRING}
  PDH_LOG_OPT_CIRCULAR       = DWORD($02000000);
  {$EXTERNALSYM PDH_LOG_OPT_CIRCULAR}
  PDH_LOG_OPT_MAX_IS_BYTES   = DWORD($04000000);
  {$EXTERNALSYM PDH_LOG_OPT_MAX_IS_BYTES}
  PDH_LOG_OPT_APPEND         = DWORD($08000000);
  {$EXTERNALSYM PDH_LOG_OPT_APPEND}
  PDH_LOG_OPT_MASK           = DWORD($0F000000);
  {$EXTERNALSYM PDH_LOG_OPT_MASK}

  PDH_LOG_TYPE_UNDEFINED     = 0;
  {$EXTERNALSYM PDH_LOG_TYPE_UNDEFINED}
  PDH_LOG_TYPE_CSV           = 1;
  {$EXTERNALSYM PDH_LOG_TYPE_CSV}
  PDH_LOG_TYPE_TSV           = 2;
  {$EXTERNALSYM PDH_LOG_TYPE_TSV}
  //PDH_LOG_TYPE_BINARY        = 3;  // this is the retired binary format
  //{$EXTERNALSYM PDH_LOG_TYPE_BINARY}
  PDH_LOG_TYPE_TRACE_KERNEL  = 4;
  {$EXTERNALSYM PDH_LOG_TYPE_TRACE_KERNEL}
  PDH_LOG_TYPE_TRACE_GENERIC = 5;
  {$EXTERNALSYM PDH_LOG_TYPE_TRACE_GENERIC}
  PDH_LOG_TYPE_PERFMON       = 6;
  {$EXTERNALSYM PDH_LOG_TYPE_PERFMON}
  PDH_LOG_TYPE_SQL           = 7;
  {$EXTERNALSYM PDH_LOG_TYPE_SQL}
  PDH_LOG_TYPE_BINARY        = 8;
  {$EXTERNALSYM PDH_LOG_TYPE_BINARY}

function PdhOpenLogA(szLogFileName: LPCSTR; dwAccessFlags: DWORD;
  lpdwLogType: LPDWORD; hQuery: PDH_HQUERY; dwMaxRecords: DWORD;
  szUserCaption: LPCSTR; var phLog: PDH_HLOG): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhOpenLogA}
function PdhOpenLogW(szLogFileName: LPCWSTR; dwAccessFlags: DWORD;
  lpdwLogType: LPDWORD; hQuery: PDH_HQUERY; dwMaxRecords: DWORD;
  szUserCaption: LPCWSTR; var phLog: PDH_HLOG): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhOpenLogW}
function PdhOpenLog(szLogFileName: LPCTSTR; dwAccessFlags: DWORD;
  lpdwLogType: LPDWORD; hQuery: PDH_HQUERY; dwMaxRecords: DWORD;
  szUserCaption: LPCTSTR; var phLog: PDH_HLOG): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhOpenLog}

function PdhUpdateLogA(hLog: PDH_HLOG; szUserString: LPCSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhUpdateLogA}
function PdhUpdateLogW(hLog: PDH_HLOG; szUserString: LPCWSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhUpdateLogW}
function PdhUpdateLog(hLog: PDH_HLOG; szUserString: LPCTSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhUpdateLog}

function PdhUpdateLogFileCatalog(hLog: PDH_HLOG): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhUpdateLogFileCatalog}

function PdhGetLogFileSize(hLog: PDH_HLOG; var llSize: LONGLONG): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetLogFileSize}

function PdhCloseLog(hLog: PDH_HLOG; dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhCloseLog}

const
  PDH_FLAGS_CLOSE_QUERY = DWORD($00000001);
  {$EXTERNALSYM PDH_FLAGS_CLOSE_QUERY}

//
//  Data source selection dialog
//

const
  PDH_FLAGS_FILE_BROWSER_ONLY = DWORD($00000001);
  {$EXTERNALSYM PDH_FLAGS_FILE_BROWSER_ONLY}

function PdhSelectDataSourceA(hWndOwner: HWND; dwFlags: DWORD;
  szDataSource: LPSTR; var pcchBufferLength: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhSelectDataSourceA}
function PdhSelectDataSourceW(hWndOwner: HWND; dwFlags: DWORD;
  szDataSource: LPWSTR; var pcchBufferLength: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhSelectDataSourceW}
function PdhSelectDataSource(hWndOwner: HWND; dwFlags: DWORD;
  szDataSource: LPTSTR; var pcchBufferLength: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhSelectDataSource}

function PdhIsRealTimeQuery(hQuery: PDH_HQUERY): BOOL; stdcall;
{$EXTERNALSYM PdhIsRealTimeQuery}

function PdhSetQueryTimeRange(hQuery: PDH_HQUERY; var pInfo: PDH_TIME_INFO): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhSetQueryTimeRange}

function PdhGetDataSourceTimeRangeA(szDataSource: LPCSTR; var pdwNumEntries: DWORD;
  var pInfo: PDH_TIME_INFO; pdwBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDataSourceTimeRangeA}
function PdhGetDataSourceTimeRangeW(szDataSource: LPCWSTR; var pdwNumEntries: DWORD;
  var pInfo: PDH_TIME_INFO; pdwBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDataSourceTimeRangeW}
function PdhGetDataSourceTimeRange(szDataSource: LPCTSTR; var pdwNumEntries: DWORD;
  var pInfo: PDH_TIME_INFO; pdwBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDataSourceTimeRange}

function PdhCollectQueryDataEx(hQuery: PDH_HQUERY; dwIntervalTime: DWORD;
  hNewDataEvent: HANDLE): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhCollectQueryDataEx}

function PdhFormatFromRawValue(dwCounterType, dwFormat: DWORD;
  var pTimeBase: LONGLONG; pRawValue1, pRawValue2: PPDH_RAW_COUNTER;
  var pFmtValue: PDH_FMT_COUNTERVALUE): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhFormatFromRawValue}

function PdhGetCounterTimeBase(hCounter: PDH_HCOUNTER; var pTimeBase: LONGLONG): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetCounterTimeBase}

function PdhReadRawLogRecord(hLog: PDH_HLOG; ftRecord: FILETIME;
  var pRawLogRecord: PDH_RAW_LOG_RECORD; pdwBufferLength: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhReadRawLogRecord}

const
  DATA_SOURCE_REGISTRY    = DWORD($00000001);
  {$EXTERNALSYM DATA_SOURCE_REGISTRY}
  DATA_SOURCE_LOGFILE     = DWORD($00000002);
  {$EXTERNALSYM DATA_SOURCE_LOGFILE}
  DATA_SOURCE_WBEM        = DWORD($00000004);
  {$EXTERNALSYM DATA_SOURCE_WBEM}

function PdhSetDefaultRealTimeDataSource(dwDataSourceId: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhSetDefaultRealTimeDataSource}

// Extended API for WMI event trace logfile format
//

function PdhBindInputDataSourceW(var phDataSource: PDH_HLOG; LogFileNameList: LPCWSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhBindInputDataSourceW}
function PdhBindInputDataSourceA(var phDataSource: PDH_HLOG; LogFileNameList: LPCSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhBindInputDataSourceA}
function PdhBindInputDataSource(var phDataSource: PDH_HLOG; LogFileNameList: LPCTSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhBindInputDataSource}

function PdhOpenQueryH(hDataSource: PDH_HLOG; dwUserData: DWORD_PTR; var phQuery: PDH_HQUERY): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhOpenQueryH}

function PdhEnumMachinesHW(hDataSource: PDH_HLOG; mszMachineList: LPWSTR; pcchBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumMachinesHW}
function PdhEnumMachinesHA(hDataSource: PDH_HLOG; mszMachineList: LPSTR; pcchBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumMachinesHA}
function PdhEnumMachinesH(hDataSource: PDH_HLOG; mszMachineList: LPTSTR; pcchBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumMachinesH}

function PdhEnumObjectsHA(hDataSource: PDH_HLOG; szMachineName: LPCSTR; mszObjectList: LPSTR; pcchBufferSize: LPDWORD;
  dwDetailLevel: DWORD; bRefresh: BOOL): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumObjectsHA}
function PdhEnumObjectsHW(hDataSource: PDH_HLOG; szMachineName: LPCWSTR; mszObjectList: LPWSTR; pcchBufferSize: LPDWORD;
  dwDetailLevel: DWORD; bRefresh: BOOL): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumObjectsHW}
function PdhEnumObjectsH(hDataSource: PDH_HLOG; szMachineName: LPCTSTR; mszObjectList: LPWSTR; pcchBufferSize: LPDWORD;
  dwDetailLevel: DWORD; bRefresh: BOOL): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumObjectsH}

function PdhEnumObjectItemsHA(hDataSource: PDH_HLOG; szMachineName, szObjectName: LPCSTR; mszCounterList: LPSTR;
  pcchCounterListLength: LPDWORD; mszInstanceList: LPSTR; pcchInstanceListLength: LPDWORD;
  dwDetailLevel, dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumObjectItemsHA}
function PdhEnumObjectItemsHW(hDataSource: PDH_HLOG; szMachineName, szObjectName: LPCWSTR; mszCounterList: LPWSTR;
  pcchCounterListLength: LPDWORD; mszInstanceList: LPWSTR; pcchInstanceListLength: LPDWORD;
  dwDetailLevel, dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumObjectItemsHW}
function PdhEnumObjectItemsH(hDataSource: PDH_HLOG; szMachineName, szObjectName: LPCTSTR; mszCounterList: LPTSTR;
  pcchCounterListLength: LPDWORD; mszInstanceList: LPTSTR; pcchInstanceListLength: LPDWORD;
  dwDetailLevel, dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumObjectItemsH}

function PdhExpandWildCardPathHA(hDataSource: PDH_HLOG; szWildCardPath: LPCSTR; mszExpandedPathList: LPSTR;
  pcchPathListLength: LPDWORD; dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhExpandWildCardPathHA}
function PdhExpandWildCardPathHW(hDataSource: PDH_HLOG; szWildCardPath: LPCWSTR; mszExpandedPathList: LPWSTR;
  pcchPathListLength: LPDWORD; dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhExpandWildCardPathHW}
function PdhExpandWildCardPathH(hDataSource: PDH_HLOG; szWildCardPath: LPCTSTR; mszExpandedPathList: LPTSTR;
  pcchPathListLength: LPDWORD; dwFlags: DWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhExpandWildCardPathH}

function PdhGetDataSourceTimeRangeH(hDataSource: PDH_HLOG; pdwNumEntries: LPDWORD; pInfo: PPDH_TIME_INFO;
  pdwBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDataSourceTimeRangeH}

function PdhGetDefaultPerfObjectHW(hDataSource: PDH_HLOG; szMachineName: LPCWSTR; szDefaultObjectName: LPWSTR;
  pcchBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfObjectHW}
function PdhGetDefaultPerfObjectHA(hDataSource: PDH_HLOG; szMachineName: LPCSTR; szDefaultObjectName: LPSTR;
  pcchBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfObjectHA}
function PdhGetDefaultPerfObjectH(hDataSource: PDH_HLOG; szMachineName: LPCTSTR; szDefaultObjectName: LPTSTR;
  pcchBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfObjectH}

function PdhGetDefaultPerfCounterHW(hDataSource: PDH_HLOG; szMachineName, szObjectName: LPCWSTR;
  szDefaultCounterName: LPWSTR; pcchBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfCounterHW}
function PdhGetDefaultPerfCounterHA(hDataSource: PDH_HLOG; szMachineName, szObjectName: LPCSTR;
  szDefaultCounterName: LPSTR; pcchBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfCounterHA}
function PdhGetDefaultPerfCounterH(hDataSource: PDH_HLOG; szMachineName, szObjectName: LPCTSTR;
  szDefaultCounterName: LPTSTR; pcchBufferSize: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetDefaultPerfCounterH}

function PdhBrowseCountersHW(const pBrowseDlgData: PDH_BROWSE_DLG_CONFIG_HW): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhBrowseCountersHW}
function PdhBrowseCountersHA(const pBrowseDlgData: PDH_BROWSE_DLG_CONFIG_HA): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhBrowseCountersHA}
function PdhBrowseCountersH(const pBrowseDlgData: PDH_BROWSE_DLG_CONFIG_H): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhBrowseCountersH}

//Check that a DSN points to a database that contains the correct Perfmon tables.

function PdhVerifySQLDBW(szDataSource: LPCWSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhVerifySQLDBW}
function PdhVerifySQLDBA(szDataSource: LPCSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhVerifySQLDBA}
function PdhVerifySQLDB(szDataSource: LPCTSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhVerifySQLDB}

//Create the correct perfmon tables in the database pointed to by a DSN.

function PdhCreateSQLTablesW(szDataSource: LPCWSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhCreateSQLTablesW}
function PdhCreateSQLTablesA(szDataSource: LPCSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhCreateSQLTablesA}
function PdhCreateSQLTables(szDataSource: LPCTSTR): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhCreateSQLTables}

//Return the list of Log set names in the database pointed to by the DSN.

function PdhEnumLogSetNamesW(szDataSource: LPCWSTR; mszDataSetNameList: LPWSTR; pcchBufferLength: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumLogSetNamesW}
function PdhEnumLogSetNamesA(szDataSource: LPCSTR; mszDataSetNameList: LPSTR; pcchBufferLength: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumLogSetNamesA}
function PdhEnumLogSetNames(szDataSource: LPCTSTR; mszDataSetNameList: LPTSTR; pcchBufferLength: LPDWORD): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhEnumLogSetNames}

//Retrieve the GUID for an open Log Set

function PdhGetLogSetGUID(hLog: PDH_HLOG; pGuid: LPGUID; pRunId: LPINT): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhGetLogSetGUID}

//Set the RunID for an open Log Set

function PdhSetLogSetRunID(hLog: PDH_HLOG; RunId: Integer): PDH_STATUS; stdcall;
{$EXTERNALSYM PdhSetLogSetRunID}

{$ENDIF JWA_IMPLEMENTATIONSECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
implementation
//uses ...
{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_INTERFACESECTION}

{$IFNDEF JWA_INCLUDEMODE}
const
  PdhLib = 'pdh.dll';
  {$IFDEF UNICODE}
  AWSuffix = 'W';
  {$ELSE}
  AWSuffix = 'A';
  {$ENDIF UNICODE}
{$ENDIF JWA_INCLUDEMODE}

function IsSuccessSeverity(ErrorCode: Longint): Boolean;
begin
  Result := (ErrorCode and $C0000000) = $00000000;
end;

function IsInformationalSeverity(ErrorCode: Longint): Boolean;
begin
  Result := (ErrorCode and $C0000000) = $40000000;
end;

function IsWarningSeverity(ErrorCode: Longint): Boolean;
begin
  Result := (ErrorCode and $C0000000) = $80000000;
end;

function IsErrorSeverity(ErrorCode: Longint): Boolean;
begin
  Result := (ErrorCode and $C0000000) = $C0000000;
end;

function PDH_PATH_LANG_FLAGS(LangId, Flags: DWORD): DWORD;
begin
  Result := DWORD(((LangId and $0000FFFF) shl 16) or (Flags and $0000FFFF));
end;


function PdhGetDllVersion; external PdhLib name 'PdhGetDllVersion' delayed;
function PdhOpenQueryA; external PdhLib name 'PdhOpenQueryA' delayed;
function PdhOpenQueryW; external PdhLib name 'PdhOpenQueryW' delayed;
function PdhOpenQuery; external PdhLib name 'PdhOpenQuery' + AWSuffix delayed;
function PdhAddCounterA; external PdhLib name 'PdhAddCounterA' delayed;
function PdhAddCounterW; external PdhLib name 'PdhAddCounterW' delayed;
function PdhAddCounter; external PdhLib name 'PdhAddCounter' + AWSuffix delayed;
function PdhRemoveCounter; external PdhLib name 'PdhRemoveCounter' delayed;
function PdhCollectQueryData; external PdhLib name 'PdhCollectQueryData' delayed;
function PdhCloseQuery; external PdhLib name 'PdhCloseQuery' delayed;
function PdhGetFormattedCounterValue; external PdhLib name 'PdhGetFormattedCounterValue' delayed;
function PdhGetFormattedCounterArrayA; external PdhLib name 'PdhGetFormattedCounterArrayA' delayed;
function PdhGetFormattedCounterArrayW; external PdhLib name 'PdhGetFormattedCounterArrayW' delayed;
function PdhGetFormattedCounterArray; external PdhLib name 'PdhGetFormattedCounterArray' + AWSuffix delayed;
function PdhGetRawCounterValue; external PdhLib name 'PdhGetRawCounterValue' delayed;
function PdhGetRawCounterArrayA; external PdhLib name 'PdhGetRawCounterArrayA' delayed;
function PdhGetRawCounterArrayW; external PdhLib name 'PdhGetRawCounterArrayW' delayed;
function PdhGetRawCounterArray; external PdhLib name 'PdhGetRawCounterArray' + AWSuffix delayed;
function PdhCalculateCounterFromRawValue; external PdhLib name 'PdhCalculateCounterFromRawValue' delayed;
function PdhComputeCounterStatistics; external PdhLib name 'PdhComputeCounterStatistics' delayed;
function PdhGetCounterInfoA; external PdhLib name 'PdhGetCounterInfoA' delayed;
function PdhGetCounterInfoW; external PdhLib name 'PdhGetCounterInfoW' delayed;
function PdhGetCounterInfo; external PdhLib name 'PdhGetCounterInfo' + AWSuffix delayed;
function PdhSetCounterScaleFactor; external PdhLib name 'PdhSetCounterScaleFactor' delayed;
function PdhConnectMachineA; external PdhLib name 'PdhConnectMachineA' delayed;
function PdhConnectMachineW; external PdhLib name 'PdhConnectMachineW' delayed;
function PdhConnectMachine; external PdhLib name 'PdhConnectMachine' + AWSuffix delayed;
function PdhEnumMachinesA; external PdhLib name 'PdhEnumMachinesA' delayed;
function PdhEnumMachinesW; external PdhLib name 'PdhEnumMachinesW' delayed;
function PdhEnumMachines; external PdhLib name 'PdhEnumMachines' + AWSuffix delayed;
function PdhEnumObjectsA; external PdhLib name 'PdhEnumObjectsA' delayed;
function PdhEnumObjectsW; external PdhLib name 'PdhEnumObjectsW' delayed;
function PdhEnumObjects; external PdhLib name 'PdhEnumObjects' + AWSuffix delayed;
function PdhEnumObjectItemsA; external PdhLib name 'PdhEnumObjectItemsA' delayed;
function PdhEnumObjectItemsW; external PdhLib name 'PdhEnumObjectItemsW' delayed;
function PdhEnumObjectItems; external PdhLib name 'PdhEnumObjectItems' + AWSuffix delayed;
function PdhMakeCounterPathA; external PdhLib name 'PdhMakeCounterPathA' delayed;
function PdhMakeCounterPathW; external PdhLib name 'PdhMakeCounterPathW' delayed;
function PdhMakeCounterPath; external PdhLib name 'PdhMakeCounterPath' + AWSuffix delayed;
function PdhParseCounterPathA; external PdhLib name 'PdhParseCounterPathA' delayed;
function PdhParseCounterPathW; external PdhLib name 'PdhParseCounterPathW' delayed;
function PdhParseCounterPath; external PdhLib name 'PdhParseCounterPath' + AWSuffix delayed;
function PdhParseInstanceNameA; external PdhLib name 'PdhParseInstanceNameA' delayed;
function PdhParseInstanceNameW; external PdhLib name 'PdhParseInstanceNameW' delayed;
function PdhParseInstanceName; external PdhLib name 'PdhParseInstanceName' + AWSuffix delayed;
function PdhValidatePathA; external PdhLib name 'PdhValidatePathA' delayed;
function PdhValidatePathW; external PdhLib name 'PdhValidatePathW' delayed;
function PdhValidatePath; external PdhLib name 'PdhValidatePath' + AWSuffix delayed;
function PdhGetDefaultPerfObjectA; external PdhLib name 'PdhGetDefaultPerfObjectA' delayed;
function PdhGetDefaultPerfObjectW; external PdhLib name 'PdhGetDefaultPerfObjectW' delayed;
function PdhGetDefaultPerfObject; external PdhLib name 'PdhGetDefaultPerfObject' + AWSuffix delayed;
function PdhGetDefaultPerfCounterA; external PdhLib name 'PdhGetDefaultPerfCounterA' delayed;
function PdhGetDefaultPerfCounterW; external PdhLib name 'PdhGetDefaultPerfCounterW' delayed;
function PdhGetDefaultPerfCounter; external PdhLib name 'PdhGetDefaultPerfCounter' + AWSuffix delayed;
function PdhBrowseCountersA; external PdhLib name 'PdhBrowseCountersA' delayed;
function PdhBrowseCountersW; external PdhLib name 'PdhBrowseCountersW' delayed;
function PdhBrowseCounters; external PdhLib name 'PdhBrowseCounters' + AWSuffix delayed;
function PdhExpandCounterPathA; external PdhLib name 'PdhExpandCounterPathA' delayed;
function PdhExpandCounterPathW; external PdhLib name 'PdhExpandCounterPathW' delayed;
function PdhExpandCounterPath; external PdhLib name 'PdhExpandCounterPath' + AWSuffix delayed;
function PdhLookupPerfNameByIndexA; external PdhLib name 'PdhLookupPerfNameByIndexA' delayed;
function PdhLookupPerfNameByIndexW; external PdhLib name 'PdhLookupPerfNameByIndexW' delayed;
function PdhLookupPerfNameByIndex; external PdhLib name 'PdhLookupPerfNameByIndex' + AWSuffix delayed;
function PdhLookupPerfIndexByNameA; external PdhLib name 'PdhLookupPerfIndexByNameA' delayed;
function PdhLookupPerfIndexByNameW; external PdhLib name 'PdhLookupPerfIndexByNameW' delayed;
function PdhLookupPerfIndexByName; external PdhLib name 'PdhLookupPerfIndexByName' + AWSuffix delayed;
function PdhExpandWildCardPathA; external PdhLib name 'PdhExpandWildCardPathA' delayed;
function PdhExpandWildCardPathW; external PdhLib name 'PdhExpandWildCardPathW' delayed;
function PdhExpandWildCardPath; external PdhLib name 'PdhExpandWildCardPath' + AWSuffix delayed;
function PdhOpenLogA; external PdhLib name 'PdhOpenLogA' delayed;
function PdhOpenLogW; external PdhLib name 'PdhOpenLogW' delayed;
function PdhOpenLog; external PdhLib name 'PdhOpenLog' + AWSuffix delayed;
function PdhUpdateLogA; external PdhLib name 'PdhUpdateLogA' delayed;
function PdhUpdateLogW; external PdhLib name 'PdhUpdateLogW' delayed;
function PdhUpdateLog; external PdhLib name 'PdhUpdateLog' + AWSuffix delayed;
function PdhUpdateLogFileCatalog; external PdhLib name 'PdhUpdateLogFileCatalog' delayed;
function PdhGetLogFileSize; external PdhLib name 'PdhGetLogFileSize' delayed;
function PdhCloseLog; external PdhLib name 'PdhCloseLog' delayed;
function PdhSelectDataSourceA; external PdhLib name 'PdhSelectDataSourceA' delayed;
function PdhSelectDataSourceW; external PdhLib name 'PdhSelectDataSourceW' delayed;
function PdhSelectDataSource; external PdhLib name 'PdhSelectDataSource' + AWSuffix delayed;
function PdhIsRealTimeQuery; external PdhLib name 'PdhIsRealTimeQuery' delayed;
function PdhSetQueryTimeRange; external PdhLib name 'PdhSetQueryTimeRange' delayed;
function PdhGetDataSourceTimeRangeA; external PdhLib name 'PdhGetDataSourceTimeRangeA' delayed;
function PdhGetDataSourceTimeRangeW; external PdhLib name 'PdhGetDataSourceTimeRangeW' delayed;
function PdhGetDataSourceTimeRange; external PdhLib name 'PdhGetDataSourceTimeRange' + AWSuffix delayed;
function PdhCollectQueryDataEx; external PdhLib name 'PdhCollectQueryDataEx' delayed;
function PdhFormatFromRawValue; external PdhLib name 'PdhFormatFromRawValue' delayed;
function PdhGetCounterTimeBase; external PdhLib name 'PdhGetCounterTimeBase' delayed;
function PdhReadRawLogRecord; external PdhLib name 'PdhReadRawLogRecord' delayed;
function PdhSetDefaultRealTimeDataSource; external PdhLib name 'PdhSetDefaultRealTimeDataSource' delayed;
function PdhBindInputDataSourceW; external PdhLib name 'PdhBindInputDataSourceW' delayed;
function PdhBindInputDataSourceA; external PdhLib name 'PdhBindInputDataSourceA' delayed;
function PdhBindInputDataSource; external PdhLib name 'PdhBindInputDataSource' + AWSuffix delayed;
function PdhOpenQueryH; external PdhLib name 'PdhOpenQueryH' delayed;
function PdhEnumMachinesHW; external PdhLib name 'PdhEnumMachinesHW' delayed;
function PdhEnumMachinesHA; external PdhLib name 'PdhEnumMachinesHA' delayed;
function PdhEnumMachinesH; external PdhLib name 'PdhEnumMachinesH' + AWSuffix delayed;
function PdhEnumObjectsHW; external PdhLib name 'PdhEnumObjectsHW' delayed;
function PdhEnumObjectsHA; external PdhLib name 'PdhEnumObjectsHA' delayed;
function PdhEnumObjectsH; external PdhLib name 'PdhEnumObjectsH' + AWSuffix delayed;
function PdhEnumObjectItemsHW; external PdhLib name 'PdhEnumObjectItemsHW' delayed;
function PdhEnumObjectItemsHA; external PdhLib name 'PdhEnumObjectItemsHA' delayed;
function PdhEnumObjectItemsH; external PdhLib name 'PdhEnumObjectItemsH' + AWSuffix delayed;
function PdhExpandWildCardPathHW; external PdhLib name 'PdhExpandWildCardPathHW' delayed;
function PdhExpandWildCardPathHA; external PdhLib name 'PdhExpandWildCardPathHA' delayed;
function PdhExpandWildCardPathH; external PdhLib name 'PdhExpandWildCardPathH' + AWSuffix delayed;
function PdhGetDataSourceTimeRangeH; external PdhLib name 'PdhGetDataSourceTimeRangeH' delayed;
function PdhGetDefaultPerfObjectHW; external PdhLib name 'PdhGetDefaultPerfObjectHW' delayed;
function PdhGetDefaultPerfObjectHA; external PdhLib name 'PdhGetDefaultPerfObjectHA' delayed;
function PdhGetDefaultPerfObjectH; external PdhLib name 'PdhGetDefaultPerfObjectH' + AWSuffix delayed;
function PdhGetDefaultPerfCounterHW; external PdhLib name 'PdhGetDefaultPerfCounterHW' delayed;
function PdhGetDefaultPerfCounterHA; external PdhLib name 'PdhGetDefaultPerfCounterHA' delayed;
function PdhGetDefaultPerfCounterH; external PdhLib name 'PdhGetDefaultPerfCounterH' + AWSuffix delayed;
function PdhBrowseCountersHW; external PdhLib name 'PdhBrowseCountersHW' delayed;
function PdhBrowseCountersHA; external PdhLib name 'PdhBrowseCountersHA' delayed;
function PdhBrowseCountersH; external PdhLib name 'PdhBrowseCountersH' + AWSuffix delayed;
function PdhVerifySQLDBW; external PdhLib name 'PdhVerifySQLDBW' delayed;
function PdhVerifySQLDBA; external PdhLib name 'PdhVerifySQLDBA' delayed;
function PdhVerifySQLDB; external PdhLib name 'PdhVerifySQLDB' + AWSuffix delayed;
function PdhCreateSQLTablesW; external PdhLib name 'PdhCreateSQLTablesW' delayed;
function PdhCreateSQLTablesA; external PdhLib name 'PdhCreateSQLTablesA' delayed;
function PdhCreateSQLTables; external PdhLib name 'PdhCreateSQLTables' + AWSuffix delayed;
function PdhEnumLogSetNamesW; external PdhLib name 'PdhEnumLogSetNamesW' delayed;
function PdhEnumLogSetNamesA; external PdhLib name 'PdhEnumLogSetNamesA' delayed;
function PdhEnumLogSetNames; external PdhLib name 'PdhEnumLogSetNames' + AWSuffix delayed;
function PdhGetLogSetGUID; external PdhLib name 'PdhGetLogSetGUID' delayed;
function PdhSetLogSetRunID; external PdhLib name 'PdhSetLogSetRunID' delayed;


{$ENDIF JWA_INTERFACESECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
end.
{$ENDIF JWA_OMIT_SECTIONS}
