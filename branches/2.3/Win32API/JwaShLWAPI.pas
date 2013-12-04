{******************************************************************************}
{                                                                              }
{ Shell Light Weight API Interface Unit for Object Pascal                      }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2005 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The initial developer of the original translation is Rudy Velthuis		       }
{                                                                              }
{ Portions created by Rudy Velthuis are Copyright (C) 2005-2008                }
{ All Rights Reserved.                                      				           }
{                                                                              }
{ Adapted for JEDI API Library by Christian Wimmer                             }
{                                                                              }
{ Obtained through: Joint Endeavour of Delphi Innovators (Project JEDI)        }
{ The original code is: shlwapi.h, released 2005.                			         }
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
unit JwaShLWAPI;
{$I ..\Includes\JediAPILib.inc}


interface



{$HPPEMIT '#include <shlwapi.h>'}
{$HPPEMIT ''}
{$HPPEMIT 'interface DECLSPEC_UUID("C46CA590-3C3F-11D2-BEE6-0000F805CA57") IQueryAssociations;'}
{$HPPEMIT 'typedef System::DelphiInterface<IQueryAssociations> _di_IQueryAssociations;'}

{$IFDEF DELPHI6_UP}
{$ALIGN 8}
{$ELSE}
{$A+}
//Warning: Record alignment 4
{$ENDIF DELPHI6_UP}

uses
  Windows, CommCtrl,ActiveX,
  {$IFDEF DELPHI6_UP}msxml,{$ENDIF DELPHI6_UP}
  JwaWinBase, JwaWinUser, JwaWinType,
  JwaShlObj, JwaActiveX, JwaWinReg;

{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_IMPLEMENTATIONSECTION}

{$EXTERNALSYM StrChrA}
function StrChrA(lpStart: PAnsiChar; wMatch: Word): PAnsiChar; stdcall;
{$EXTERNALSYM StrChrW}
function StrChrW(lpStart: PWideChar; wMatch: WideChar): PWideChar; stdcall;
{$EXTERNALSYM StrChr}
function StrChr(lpStart: PTSTR; wMatch: Word): PTSTR; stdcall;
{$EXTERNALSYM StrChrIA}
function StrChrIA(lpStart: PAnsiChar; wMatch: Word): PAnsiChar; stdcall;
{$EXTERNALSYM StrChrIW}
function StrChrIW(lpStart: PWideChar; wMatch: WideChar): PWideChar; stdcall;
{$EXTERNALSYM StrChrI}
function StrChrI(lpStart: PTSTR; wMatch: Word): PTSTR; stdcall;
{$EXTERNALSYM StrCmpNA}
function StrCmpNA(lpStr1, lpStr2: PAnsiChar; nChar: Integer): Integer; stdcall;
{$EXTERNALSYM StrCmpNW}
function StrCmpNW(lpStr1, lpStr2: PWideChar; nChar: Integer): Integer; stdcall;
{$EXTERNALSYM StrCmpN}
function StrCmpN(lpStr1, lpStr2: PTSTR; nChar: Integer): Integer; stdcall;
{$EXTERNALSYM StrCmpNIA}
function StrCmpNIA(lpStr1, lpStr2: PAnsiChar; nChar: Integer): Integer; stdcall;
{$EXTERNALSYM StrCmpNIW}
function StrCmpNIW(lpStr1, lpStr2: PWideChar; nChar: Integer): Integer; stdcall;
{$EXTERNALSYM StrCmpNI}
function StrCmpNI(lpStr1, lpStr2: PTSTR; nChar: Integer): Integer; stdcall;
{$EXTERNALSYM StrCSpnA}
function StrCSpnA(lpStr, lpSet: PAnsiChar): Integer; stdcall;
{$EXTERNALSYM StrCSpnW}
function StrCSpnW(lpStr, lpSet: PWideChar): Integer; stdcall;
{$EXTERNALSYM StrCSpn}
function StrCSpn(lpStr, lpSet: PTSTR): Integer; stdcall;
{$EXTERNALSYM StrCSpnIA}
function StrCSpnIA(lpStr, lpSet: PAnsiChar): Integer; stdcall;
{$EXTERNALSYM StrCSpnIW}
function StrCSpnIW(lpStr, lpSet: PWideChar): Integer; stdcall;
{$EXTERNALSYM StrCSpnI}
function StrCSpnI(lpStr, lpSet: PTSTR): Integer; stdcall;
{$EXTERNALSYM StrDupA}
function StrDupA(lpSrch: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM StrDupW}
function StrDupW(lpSrch: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM StrDup}
function StrDup(lpSrch: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM StrFormatByteSizeA}
function StrFormatByteSizeA(dw: DWORD; szBuf: PAnsiChar; uiBufSize: UINT): PAnsiChar; stdcall;
{$EXTERNALSYM StrFormatByteSize64A}
function StrFormatByteSize64A(qdw: LONGLONG; szBuf: PAnsiChar; uiBufSize: UINT): PAnsiChar; stdcall;
{$EXTERNALSYM StrFormatByteSizeW}
function StrFormatByteSizeW(qdw: LONGLONG; szBuf: PWideChar; uiBufSize: UINT): PWideChar; stdcall;
{$EXTERNALSYM StrFormatByteSize}
function StrFormatByteSize(dw: DWORD; szBuf: PTSTR; uiBufSize: UINT): PTSTR; stdcall;
{$EXTERNALSYM StrFormatByteSize64}
function StrFormatByteSize64(qdw: LONGLONG; szBuf: PTSTR; uiBufSize: UINT): PTSTR; stdcall;
{$EXTERNALSYM StrFormatKBSizeW}
function StrFormatKBSizeW(qdw: LONGLONG; szBuf: PWideChar; uiBufSize: UINT): PWideChar; stdcall;
{$EXTERNALSYM StrFormatKBSizeA}
function StrFormatKBSizeA(qdw: LONGLONG; szBuf: PAnsiChar; uiBufSize: UINT): PAnsiChar; stdcall;
{$EXTERNALSYM StrFormatKBSize}
function StrFormatKBSize(qdw: LONGLONG; szBuf: PTSTR; uiBufSize: UINT): PTSTR; stdcall;
{$EXTERNALSYM StrFromTimeIntervalA}
function StrFromTimeIntervalA(pszOut: PAnsiChar; cchMax: UINT; dwTimeMS: DWORD; digits: Integer): Integer; stdcall;
{$EXTERNALSYM StrFromTimeIntervalW}
function StrFromTimeIntervalW(pszOut: PWideChar; cchMax: UINT; dwTimeMS: DWORD; digits: Integer): Integer; stdcall;
{$EXTERNALSYM StrFromTimeInterval}
function StrFromTimeInterval(pszOut: PTSTR; cchMax: UINT; dwTimeMS: DWORD; digits: Integer): Integer; stdcall;
{$EXTERNALSYM StrIsIntlEqualA}
function StrIsIntlEqualA(fCaseSens: BOOL; lpString1, lpString2: PAnsiChar; nChar: Integer): BOOL; stdcall;
{$EXTERNALSYM StrIsIntlEqualW}
function StrIsIntlEqualW(fCaseSens: BOOL; lpString1, lpString2: PWideChar; nChar: Integer): BOOL; stdcall;
{$EXTERNALSYM StrIsIntlEqual}
function StrIsIntlEqual(fCaseSens: BOOL; lpString1, lpString2: PTSTR; nChar: Integer): BOOL; stdcall;
{$EXTERNALSYM StrNCatA}
function StrNCatA(psz1, psz2: PAnsiChar; cchMax: Integer): PAnsiChar; stdcall;
{$EXTERNALSYM StrNCatW}
function StrNCatW(psz1, psz2: PWideChar; cchMax: Integer): PWideChar; stdcall;
{$EXTERNALSYM StrNCat}
function StrNCat(psz1, psz2: PTSTR; cchMax: Integer): PTSTR; stdcall;
{$EXTERNALSYM StrPBrkA}
function StrPBrkA(psz, pszSet: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM StrPBrkW}
function StrPBrkW(psz, pszSet: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM StrPBrk}
function StrPBrk(psz, pszSet: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM StrRChrA}
function StrRChrA(lpStart, lpEnd: PAnsiChar; wMatch: Word): PAnsiChar; stdcall;
{$EXTERNALSYM StrRChrW}
function StrRChrW(lpStart, lpEnd: PWideChar; wMatch: WideChar): PWideChar; stdcall;
{$EXTERNALSYM StrRChr}
function StrRChr(lpStart, lpEnd: PTSTR; wMatch: Word): PTSTR; stdcall;
{$EXTERNALSYM StrRChrIA}
function StrRChrIA(lpStart, lpEnd: PAnsiChar; wMatch: Word): PAnsiChar; stdcall;
{$EXTERNALSYM StrRChrIW}
function StrRChrIW(lpStart, lpEnd: PWideChar; wMatch: WideChar): PWideChar; stdcall;
{$EXTERNALSYM StrRChrI}
function StrRChrI(lpStart, lpEnd: PTSTR; wMatch: Word): PTSTR; stdcall;
{$EXTERNALSYM StrRStrIA}
function StrRStrIA(lpSource, lpLast, lpSrch: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM StrRStrIW}
function StrRStrIW(lpSource, lpLast, lpSrch: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM StrRStrI}
function StrRStrI(lpSource, lpLast, lpSrch: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM StrSpnA}
function StrSpnA(psz, pszSet: PAnsiChar): Integer; stdcall;
{$EXTERNALSYM StrSpnW}
function StrSpnW(psz, pszSet: PWideChar): Integer; stdcall;
{$EXTERNALSYM StrSpn}
function StrSpn(psz, pszSet: PTSTR): Integer; stdcall;
{$EXTERNALSYM StrStrA}
function StrStrA(lpFirst, lpSrch: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM StrStrW}
function StrStrW(lpFirst, lpSrch: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM StrStr}
function StrStr(lpFirst, lpSrch: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM StrStrIA}
function StrStrIA(lpFirst, lpSrch: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM StrStrIW}
function StrStrIW(lpFirst, lpSrch: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM StrStrI}
function StrStrI(lpFirst, lpSrch: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM StrToIntA}
function StrToIntA(lpSrc: PAnsiChar): Integer; stdcall;
{$EXTERNALSYM StrToIntW}
function StrToIntW(lpSrc: PWideChar): Integer; stdcall;
{$EXTERNALSYM StrToInt}
function StrToInt(lpSrc: PTSTR): Integer; stdcall;
{$EXTERNALSYM StrToIntExA}
function StrToIntExA(pszString: PAnsiChar; dwFlags: DWORD; var piRet: Integer): BOOL; stdcall;
{$EXTERNALSYM StrToIntExW}
function StrToIntExW(pszString: PWideChar; dwFlags: DWORD; var piRet: Integer): BOOL; stdcall;
{$EXTERNALSYM StrToIntEx}
function StrToIntEx(pszString: PTSTR; dwFlags: DWORD; var piRet: Integer): BOOL; stdcall;

 {$EXTERNALSYM StrToInt64ExA}
function StrToInt64ExA(pszString: PAnsiChar; dwFlags: DWORD; var pllRet: LONGLONG): BOOL stdcall;
{$EXTERNALSYM StrToInt64ExW}
function StrToInt64ExW(pszString: PWideChar; dwFlags: DWORD; var pllRet: LONGLONG): BOOL stdcall;
{$EXTERNALSYM StrToInt64Ex}
function StrToInt64Ex(pszString: PTSTR; dwFlags: DWORD; var pllRet: LONGLONG): BOOL stdcall;

{$EXTERNALSYM StrTrimA}
function StrTrimA(psz, pszTrimChars: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM StrTrimW}
function StrTrimW(psz, pszTrimChars: PWideChar): BOOL; stdcall;
{$EXTERNALSYM StrTrim}
function StrTrim(psz, pszTrimChars: PTSTR): BOOL; stdcall;

{$EXTERNALSYM StrCatW}
function StrCatW(psz1, psz2: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM StrCmpW}
function StrCmpW(psz1, psz2: PWideChar): Integer; stdcall;
{$EXTERNALSYM StrCmpIW}
function StrCmpIW(psz1, psz2: PWideChar): Integer; stdcall;
{$EXTERNALSYM StrCpyW}
function StrCpyW(psz1, psz2: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM StrCpyNW}
function StrCpyNW(psz1, psz2: PWideChar; cchMax: Integer): PWideChar; stdcall;

{$EXTERNALSYM StrCatBuffW}
function StrCatBuffW(pszDest, pszSrc: PWideChar; cchDestBuffSize: Integer): PWideChar; stdcall;
{$EXTERNALSYM StrCatBuffA}
function StrCatBuffA(pszDest, pszSrc: PAnsiChar; cchDestBuffSize: Integer): PAnsiChar; stdcall;
{$EXTERNALSYM StrCatBuff}
function StrCatBuff(pszDest, pszSrc: PTSTR; cchDestBuffSize: Integer): PTSTR; stdcall;

{$EXTERNALSYM ChrCmpIA}
function ChrCmpIA(w1, w2: Word): BOOL; stdcall;
{$EXTERNALSYM ChrCmpIW}
function ChrCmpIW(w1, w2: WideChar): BOOL; stdcall;
{$EXTERNALSYM ChrCmpI}
function ChrCmpI(w1, w2: Word): BOOL; stdcall;

{$EXTERNALSYM wvnsprintfA}
function wvnsprintfA(lpOut: PAnsiChar; cchLimitIn: Integer; lpFmt: PAnsiChar; arglist: Pointer): Integer; stdcall;
{$EXTERNALSYM wvnsprintfW}
function wvnsprintfW(lpOut: PWideChar; cchLimitIn: Integer; lpFmt: PWideChar; arglist: Pointer): Integer; stdcall;
{$EXTERNALSYM wvnsprintf}
function wvnsprintf(lpOut: PTSTR; cchLimitIn: Integer; lpFmt: PTSTR; arglist: Pointer): Integer; stdcall;
{$IFDEF DELPHI6_UP}
{$EXTERNALSYM wnsprintfA}
function wnsprintfA(lpOut: PAnsiChar; cchLimitIn: Integer; lpFmt: PAnsiChar): Integer; cdecl; varargs;
{$EXTERNALSYM wnsprintfW}
function wnsprintfW(lpOut: PWideChar; cchLimitIn: Integer; lpFmt: PWideChar): Integer; cdecl; varargs;
{$EXTERNALSYM wnsprintf}
function wnsprintf(lpOut: PTSTR; cchLimitIn: Integer; lpFmt: PTSTR): Integer; cdecl; varargs;
{$ENDIF DELPHI6_UP}

{$EXTERNALSYM StrIntlEqNA}
function StrIntlEqNA(s1, s2: PAnsiChar; nChar: Integer): BOOL;
{$EXTERNALSYM StrIntlEqNW}
function StrIntlEqNW(s1, s2: PWideChar; nChar: Integer): BOOL;
{$EXTERNALSYM StrIntlEqN}
function StrIntlEqN(s1, s2: PTSTR; nChar: Integer): BOOL;
{$EXTERNALSYM StrIntlEqNIA}
function StrIntlEqNIA(s1, s2: PAnsiChar; nChar: Integer): BOOL;
{$EXTERNALSYM StrIntlEqNIW}
function StrIntlEqNIW(s1, s2: PWideChar; nChar: Integer): BOOL;
{$EXTERNALSYM StrIntlEqNI}
function StrIntlEqNI(s1, s2: PTSTR; nChar: Integer): BOOL;

{$EXTERNALSYM StrRetToStrA}
function StrRetToStrA(var pstr: TStrRet; pidl: PItemIDList; var ppsz: PAnsiChar): HResult; stdcall;
{$EXTERNALSYM StrRetToStrW}
function StrRetToStrW(var pstr: TStrRet; pidl: PItemIDList; var ppsz: PWideChar): HResult; stdcall;
{$EXTERNALSYM StrRetToStr}
function StrRetToStr(var pstr: TStrRet; pidl: PItemIDList; var ppsz: PTSTR): HResult; stdcall;
{$EXTERNALSYM StrRetToBufA}
function StrRetToBufA(var pstr: TStrRet; pidl: PItemIDList; pszBuf: PAnsiChar; cchBuf: UINT): HResult; stdcall;
{$EXTERNALSYM StrRetToBufW}
function StrRetToBufW(var pstr: TStrRet; pidl: PItemIDList; pszBuf: PWideChar; cchBuf: UINT): HResult; stdcall;
{$EXTERNALSYM StrRetToBuf}
function StrRetToBuf(var pstr: TStrRet; pidl: PItemIDList; pszBuf: PTSTR; cchBuf: UINT): HResult; stdcall;
{$EXTERNALSYM StrRetToBSTR}
function StrRetToBSTR(var pstr: TStrRet; pidl: PItemIDList; var pbstr: TBStr): HResult; stdcall;

// helper to duplicate a string using the task allocator

{$EXTERNALSYM SHStrDupA}
function SHStrDupA(psz: PAnsiChar; var pwsz: PWideChar): HResult; stdcall;
{$EXTERNALSYM SHStrDupW}
function SHStrDupW(psz: PWideChar; var pwsz: PWideChar): HResult; stdcall;
{$EXTERNALSYM SHStrDup}
function SHStrDup(psz: PTSTR; var pwsz: PTSTR): HResult; stdcall;

{$EXTERNALSYM StrCmpLogicalW}
function StrCmpLogicalW(psz1, psz2: PWideChar): Integer; stdcall;
{$EXTERNALSYM StrCatChainW}
function StrCatChainW(pszDst: PWideChar; cchDst, ichAt: DWORD; pszSrc: PWideChar): DWORD; stdcall;

{$EXTERNALSYM SHLoadIndirectString}
function SHLoadIndirectString(pszSource, pszOutBuf: PWideChar; cchOutBuf: UINT; var ppvReserved: Pointer): HResult; stdcall;

  {$EXTERNALSYM IsCharSpaceA}
  function IsCharSpaceA(wch: AnsiChar): BOOL stdcall;
  {$EXTERNALSYM IsCharSpaceW}
  function IsCharSpaceW(wch: WideChar): BOOL stdcall;
  {$EXTERNALSYM IsCharSpace}
  function IsCharSpace(wch: AnsiChar): BOOL; stdcall;

  {$EXTERNALSYM StrCmpCA}
  function StrCmpCA(pszStr1, pszStr2: PAnsiChar): Integer stdcall;
  {$EXTERNALSYM StrCmpCW}
  function StrCmpCW(pszStr1, pszStr2: PWideChar): Integer stdcall;
  {$EXTERNALSYM StrCmpC}
  function StrCmpC(pszStr1, pszStr2: PTSTR): Integer; stdcall;

  {$EXTERNALSYM StrCmpICA}
  function StrCmpICA(pszStr1, pszStr2: PAnsiChar): Integer stdcall;
  {$EXTERNALSYM StrCmpICW}
  function StrCmpICW(pszStr1, pszStr2: PWideChar): Integer stdcall;
  {$EXTERNALSYM StrCmpIC}
  function StrCmpIC(pszStr1, pszStr2: PTSTR): Integer; stdcall;


// Backward compatible to NT's non-standard naming (strictly
// for comctl32)
//
{$EXTERNALSYM IntlStrEqWorkerA}
function IntlStrEqWorkerA(fCaseSens: BOOL; lpString1, lpString2: PAnsiChar; nChar: Integer): BOOL; stdcall;
{$EXTERNALSYM IntlStrEqWorkerW}
function IntlStrEqWorkerW(fCaseSens: BOOL; lpString1, lpString2: PWideChar; nChar: Integer): BOOL; stdcall;

{$EXTERNALSYM IntlStrEqNA}
function IntlStrEqNA(s1, s2: PAnsiChar; nChar: Integer): BOOL;
{$EXTERNALSYM IntlStrEqNW}
function IntlStrEqNW(s1, s2: PWideChar; nChar: Integer): BOOL;
{$EXTERNALSYM IntlStrEqN}
function IntlStrEqN(s1, s2: PTSTR; nChar: Integer): BOOL;
{$EXTERNALSYM IntlStrEqNIA}
function IntlStrEqNIA(s1, s2: PAnsiChar; nChar: Integer): BOOL;
{$EXTERNALSYM IntlStrEqNIW}
function IntlStrEqNIW(s1, s2: PWideChar; nChar: Integer): BOOL;
{$EXTERNALSYM IntlStrEqNI}
function IntlStrEqNI(s1, s2: PTSTR; nChar: Integer): BOOL;

const
  {$EXTERNALSYM SZ_CONTENTTYPE_HTMLA}
  SZ_CONTENTTYPE_HTMLA       = 'text/html';
  {$EXTERNALSYM SZ_CONTENTTYPE_HTMLW}
  SZ_CONTENTTYPE_HTMLW       = 'text/html';
  {$EXTERNALSYM SZ_CONTENTTYPE_HTML}
  SZ_CONTENTTYPE_HTML        = 'text/html';
  {$EXTERNALSYM SZ_CONTENTTYPE_CDFA}
  SZ_CONTENTTYPE_CDFA        = 'application/x-cdf';
  {$EXTERNALSYM SZ_CONTENTTYPE_CDFW}
  SZ_CONTENTTYPE_CDFW        = 'application/x-cdf';
  {$EXTERNALSYM SZ_CONTENTTYPE_CDFA}
  SZ_CONTENTTYPE_CDF         = 'application/x-cdf';

{$EXTERNALSYM PathIsHTMLFileA}
function PathIsHTMLFileA(pszPath: PAnsiChar): BOOL;
{$EXTERNALSYM PathIsHTMLFileW}
function PathIsHTMLFileW(pszPath: PWideChar): BOOL;
{$EXTERNALSYM PathIsHTMLFile}
function PathIsHTMLFile(pszPath: PTSTR): BOOL;

// Flags for StrToIntEx
const
  {$EXTERNALSYM STIF_DEFAULT}
  STIF_DEFAULT        = $00000000;
  {$EXTERNALSYM STIF_SUPPORT_HEX}
  STIF_SUPPORT_HEX    = $00000001;

{$EXTERNALSYM StrCatA}
function StrCatA(lpString1, lpString2: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM StrCmpA}
function StrCmpA(lpString1, lpString2: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM StrCmpIA}
function StrCmpIA(lpString1, lpString2: PAnsiChar): Integer; stdcall;
{$EXTERNALSYM StrCpyA}
function StrCpyA(lpString1, lpString2: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM StrCpyNA}
function StrCpyNA(lpString1, lpString2: PAnsiChar; iMaxLength: Integer): PAnsiChar; stdcall;

{$EXTERNALSYM StrToLong}
function StrToLong(lpSrc: PTSTR): Integer; stdcall;
{.$EXTERNALSYM StrNCmp}
//function StrNCmp(lpStr1, lpStr2: PTSTR; nChar: Integer): Integer; stdcall;
{.$EXTERNALSYM StrNCmpI}
//function StrNCmpI(lpStr1, lpStr2: PTSTR; nChar: Integer): Integer; stdcall;
{$EXTERNALSYM StrNCpy}
function StrNCpy(lpString1, lpString2: PTSTR; iMaxLength: Integer): PTSTR; stdcall;

{.$EXTERNALSYM StrCatN}
//function StrCatN(psz1, psz2: PTSTR; cchMax: Integer): PTSTR; stdcall;

{$EXTERNALSYM StrCat}
function StrCat(lpString1, lpString2: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM StrCmp}
function StrCmp(lpString1, lpString2: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM StrCmpI}
function StrCmpI(lpString1, lpString2: PTSTR): Integer; stdcall;
{$EXTERNALSYM StrCpy}
function StrCpy(lpString1, lpString2: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM StrCpyN}
function StrCpyN(lpString1, lpString2: PTSTR; iMaxLength: Integer): PTSTR; stdcall;

//
//=============== Path Routines ===================================
//

{$EXTERNALSYM PathAddBackslashA}
function PathAddBackslashA(pszPath: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM PathAddBackslashW}
function PathAddBackslashW(pszPath: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM PathAddBackslash}
function PathAddBackslash(pszPath: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM PathAddExtensionA}
function PathAddExtensionA(pszPath, pszExt: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathAddExtensionW}
function PathAddExtensionW(pszPath, pszExt: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathAddExtension}
function PathAddExtension(pszPath, pszExt: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathAppendA}
function PathAppendA(pszPath, pMore: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathAppendW}
function PathAppendW(pszPath, pMore: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathAppend}
function PathAppend(pszPath, pMore: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathBuildRootA}
function PathBuildRootA(pszRoot: PAnsiChar; iDrive: Integer): PAnsiChar; stdcall;
{$EXTERNALSYM PathBuildRootW}
function PathBuildRootW(pszRoot: PWideChar; iDrive: Integer): PWideChar; stdcall;
{$EXTERNALSYM PathBuildRoot}
function PathBuildRoot(pszRoot: PTSTR; iDrive: Integer): PTSTR; stdcall;
{$EXTERNALSYM PathCanonicalizeA}
function PathCanonicalizeA(pszBuf, pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathCanonicalizeW}
function PathCanonicalizeW(pszBuf, pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathCanonicalize}
function PathCanonicalize(pszBuf, pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathCombineA}
function PathCombineA(pszDest, pszDir, pszFile: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM PathCombineW}
function PathCombineW(pszDest, pszDir, pszFile: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM PathCombine}
function PathCombine(pszDest, pszDir, pszFile: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM PathCompactPathA}
function PathCompactPathA(hDC: HDC; pszPath: PAnsiChar; dx: UINT): BOOL; stdcall;
{$EXTERNALSYM PathCompactPathW}
function PathCompactPathW(hDC: HDC; pszPath: PWideChar; dx: UINT): BOOL; stdcall;
{$EXTERNALSYM PathCompactPath}
function PathCompactPath(hDC: HDC; pszPath: PTSTR; dx: UINT): BOOL; stdcall;
{$EXTERNALSYM PathCompactPathExA}
function PathCompactPathExA(pszOut, pszSrc: PAnsiChar; cchMax: UINT; dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM PathCompactPathExW}
function PathCompactPathExW(pszOut, pszSrc: PWideChar; cchMax: UINT; dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM PathCompactPathEx}
function PathCompactPathEx(pszOut, pszSrc: PTSTR; cchMax: UINT; dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM PathCommonPrefixA}
function PathCommonPrefixA(pszFile1, pszFile2, achPath: PAnsiChar): Integer; stdcall;
{$EXTERNALSYM PathCommonPrefixW}
function PathCommonPrefixW(pszFile1, pszFile2, achPath: PWideChar): Integer; stdcall;
{$EXTERNALSYM PathCommonPrefix}
function PathCommonPrefix(pszFile1, pszFile2, achPath: PTSTR): Integer; stdcall;
{$EXTERNALSYM PathFileExistsA}
function PathFileExistsA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathFileExistsW}
function PathFileExistsW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathFileExists}
function PathFileExists(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathFindExtensionA}
function PathFindExtensionA(pszPath: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM PathFindExtensionW}
function PathFindExtensionW(pszPath: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM PathFindExtension}
function PathFindExtension(pszPath: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM PathFindFileNameA}
function PathFindFileNameA(pszPath: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM PathFindFileNameW}
function PathFindFileNameW(pszPath: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM PathFindFileName}
function PathFindFileName(pszPath: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM PathFindNextComponentA}
function PathFindNextComponentA(pszPath: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM PathFindNextComponentW}
function PathFindNextComponentW(pszPath: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM PathFindNextComponent}
function PathFindNextComponent(pszPath: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM PathFindOnPathA}
function PathFindOnPathA(pszPath: PAnsiChar; ppszOtherDirs: PPAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathFindOnPathW}
function PathFindOnPathW(pszPath: PWideChar; ppszOtherDirs: PPWideChar): BOOL; stdcall;
{$EXTERNALSYM PathFindOnPath}
function PathFindOnPath(pszPath: PTSTR; ppszOtherDirs: PPTSTR): BOOL; stdcall;
{$EXTERNALSYM PathGetArgsA}
function PathGetArgsA(pszPath: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM PathGetArgsW}
function PathGetArgsW(pszPath: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM PathGetArgs}
function PathGetArgs(pszPath: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM PathFindSuffixArrayA}
function PathFindSuffixArrayA(pszPath: PAnsiChar; apszSuffix: PPAnsiChar; iArraySize: Integer): PAnsiChar; stdcall;
{$EXTERNALSYM PathFindSuffixArrayW}
function PathFindSuffixArrayW(pszPath: PWideChar; apszSuffix: PPWideChar; iArraySize: Integer): PWideChar; stdcall;
{$EXTERNALSYM PathFindSuffixArray}
function PathFindSuffixArray(pszPath: PTSTR; apszSuffix: PPTSTR; iArraySize: Integer): PTSTR; stdcall;
{$EXTERNALSYM PathIsLFNFileSpecA}
function PathIsLFNFileSpecA(lpName: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathIsLFNFileSpecW}
function PathIsLFNFileSpecW(lpName: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathIsLFNFileSpec}
function PathIsLFNFileSpec(lpName: PTSTR): BOOL; stdcall;

{$EXTERNALSYM PathGetCharTypeA}
function PathGetCharTypeA(ch: Byte): UINT; stdcall;
{$EXTERNALSYM PathGetCharTypeW}
function PathGetCharTypeW(ch: WideChar): UINT; stdcall;
{$EXTERNALSYM PathGetCharType}
function PathGetCharType(ch: Byte): UINT; stdcall;

// Return flags for PathGetCharType
const
  {$EXTERNALSYM GCT_INVALID}
  GCT_INVALID             = $0000;
  {$EXTERNALSYM GCT_LFNCHAR}
  GCT_LFNCHAR             = $0001;
  {$EXTERNALSYM GCT_SHORTCHAR}
  GCT_SHORTCHAR           = $0002;
  {$EXTERNALSYM GCT_WILD}
  GCT_WILD                = $0004;
  {$EXTERNALSYM GCT_SEPARATOR}
  GCT_SEPARATOR           = $0008;

{$EXTERNALSYM PathGetDriveNumberA}
function PathGetDriveNumberA(pszPath: PAnsiChar): Integer; stdcall;
{$EXTERNALSYM PathGetDriveNumberW}
function PathGetDriveNumberW(pszPath: PWideChar): Integer; stdcall;
{$EXTERNALSYM PathGetDriveNumber}
function PathGetDriveNumber(pszPath: PTSTR): Integer; stdcall;
{$EXTERNALSYM PathIsDirectoryA}
function PathIsDirectoryA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathIsDirectoryW}
function PathIsDirectoryW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathIsDirectory}
function PathIsDirectory(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathIsDirectoryEmptyA}
function PathIsDirectoryEmptyA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathIsDirectoryEmptyW}
function PathIsDirectoryEmptyW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathIsDirectoryEmpty}
function PathIsDirectoryEmpty(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathIsFileSpecA}
function PathIsFileSpecA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathIsFileSpecW}
function PathIsFileSpecW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathIsFileSpec}
function PathIsFileSpec(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathIsPrefixA}
function PathIsPrefixA(pszPrefix, pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathIsPrefixW}
function PathIsPrefixW(pszPrefix, pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathIsPrefix}
function PathIsPrefix(pszPrefix, pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathIsRelativeA}
function PathIsRelativeA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathIsRelativeW}
function PathIsRelativeW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathIsRelative}
function PathIsRelative(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathIsRootA}
function PathIsRootA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathIsRootW}
function PathIsRootW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathIsRoot}
function PathIsRoot(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathIsSameRootA}
function PathIsSameRootA(pszPath1, pszPath2: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathIsSameRootW}
function PathIsSameRootW(pszPath1, pszPath2: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathIsSameRoot}
function PathIsSameRoot(pszPath1, pszPath2: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathIsUNCA}
function PathIsUNCA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathIsUNCW}
function PathIsUNCW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathIsUNC}
function PathIsUNC(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathIsNetworkPathA}
function PathIsNetworkPathA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathIsNetworkPathW}
function PathIsNetworkPathW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathIsNetworkPath}
function PathIsNetworkPath(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathIsUNCServerA}
function PathIsUNCServerA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathIsUNCServerW}
function PathIsUNCServerW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathIsUNCServer}
function PathIsUNCServer(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathIsUNCServerShareA}
function PathIsUNCServerShareA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathIsUNCServerShareW}
function PathIsUNCServerShareW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathIsUNCServerShare}
function PathIsUNCServerShare(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathIsContentTypeA}
function PathIsContentTypeA(pszPath, pszContentType: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathIsContentTypeW}
function PathIsContentTypeW(pszPath, pszContentType: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathIsContentType}
function PathIsContentType(pszPath, pszContentType: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathIsURLA}
function PathIsURLA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathIsURLW}
function PathIsURLW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathIsURL}
function PathIsURL(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathMakePrettyA}
function PathMakePrettyA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathMakePrettyW}
function PathMakePrettyW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathMakePretty}
function PathMakePretty(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathMatchSpecA}
function PathMatchSpecA(pszFile, pszSpec: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathMatchSpecW}
function PathMatchSpecW(pszFile, pszSpec: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathMatchSpec}
function PathMatchSpec(pszFile, pszSpec: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathParseIconLocationA}
function PathParseIconLocationA(pszIconFile: PAnsiChar): Integer; stdcall;
{$EXTERNALSYM PathParseIconLocationW}
function PathParseIconLocationW(pszIconFile: PWideChar): Integer; stdcall;
{$EXTERNALSYM PathParseIconLocation}
function PathParseIconLocation(pszIconFile: PTSTR): Integer; stdcall;
{$EXTERNALSYM PathQuoteSpacesA}
procedure PathQuoteSpacesA(lpsz: PAnsiChar); stdcall;
{$EXTERNALSYM PathQuoteSpacesW}
procedure PathQuoteSpacesW(lpsz: PWideChar); stdcall;
{$EXTERNALSYM PathQuoteSpaces}
procedure PathQuoteSpaces(lpsz: PTSTR); stdcall;
{$EXTERNALSYM PathRelativePathToA}
function PathRelativePathToA(pszPath, pszFrom: PAnsiChar; dwAttrFrom: DWORD; pszTo: PAnsiChar; dwAttrTo: DWORD): BOOL; stdcall;
{$EXTERNALSYM PathRelativePathToW}
function PathRelativePathToW(pszPath, pszFrom: PWideChar; dwAttrFrom: DWORD; pszTo: PWideChar; dwAttrTo: DWORD): BOOL; stdcall;
{$EXTERNALSYM PathRelativePathTo}
function PathRelativePathTo(pszPath, pszFrom: PTSTR; dwAttrFrom: DWORD; pszTo: PTSTR; dwAttrTo: DWORD): BOOL; stdcall;
{$EXTERNALSYM PathRemoveArgsA}
procedure PathRemoveArgsA(pszPath: PAnsiChar); stdcall;
{$EXTERNALSYM PathRemoveArgsW}
procedure PathRemoveArgsW(pszPath: PWideChar); stdcall;
{$EXTERNALSYM PathRemoveArgs}
procedure PathRemoveArgs(pszPath: PTSTR); stdcall;
{$EXTERNALSYM PathRemoveBackslashA}
function PathRemoveBackslashA(pszPath: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM PathRemoveBackslashW}
function PathRemoveBackslashW(pszPath: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM PathRemoveBackslash}
function PathRemoveBackslash(pszPath: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM PathRemoveBlanksA}
procedure PathRemoveBlanksA(pszPath: PAnsiChar); stdcall;
{$EXTERNALSYM PathRemoveBlanksW}
procedure PathRemoveBlanksW(pszPath: PWideChar); stdcall;
{$EXTERNALSYM PathRemoveBlanks}
procedure PathRemoveBlanks(pszPath: PTSTR); stdcall;
{$EXTERNALSYM PathRemoveExtensionA}
procedure PathRemoveExtensionA(pszPath: PAnsiChar); stdcall;
{$EXTERNALSYM PathRemoveExtensionW}
procedure PathRemoveExtensionW(pszPath: PWideChar); stdcall;
{$EXTERNALSYM PathRemoveExtension}
procedure PathRemoveExtension(pszPath: PTSTR); stdcall;
{$EXTERNALSYM PathRemoveFileSpecA}
function PathRemoveFileSpecA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathRemoveFileSpecW}
function PathRemoveFileSpecW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathRemoveFileSpec}
function PathRemoveFileSpec(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathRenameExtensionA}
function PathRenameExtensionA(pszPath, pszExt: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathRenameExtensionW}
function PathRenameExtensionW(pszPath, pszExt: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathRenameExtension}
function PathRenameExtension(pszPath, pszExt: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathSearchAndQualifyA}
function PathSearchAndQualifyA(pszPath, pszBuf: PAnsiChar; cchBuf: UINT): BOOL; stdcall;
{$EXTERNALSYM PathSearchAndQualifyW}
function PathSearchAndQualifyW(pszPath, pszBuf: PWideChar; cchBuf: UINT): BOOL; stdcall;
{$EXTERNALSYM PathSearchAndQualify}
function PathSearchAndQualify(pszPath, pszBuf: PTSTR; cchBuf: UINT): BOOL; stdcall;
{$EXTERNALSYM PathSetDlgItemPathA}
procedure PathSetDlgItemPathA(hDlg: HWND; id: Integer; pszPath: PAnsiChar); stdcall;
{$EXTERNALSYM PathSetDlgItemPathW}
procedure PathSetDlgItemPathW(hDlg: HWND; id: Integer; pszPath: PWideChar); stdcall;
{$EXTERNALSYM PathSetDlgItemPath}
procedure PathSetDlgItemPath(hDlg: HWND; id: Integer; pszPath: PTSTR); stdcall;
{$EXTERNALSYM PathSkipRootA}
function PathSkipRootA(pszPath: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM PathSkipRootW}
function PathSkipRootW(pszPath: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM PathSkipRoot}
function PathSkipRoot(pszPath: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM PathStripPathA}
procedure PathStripPathA(pszPath: PAnsiChar); stdcall;
{$EXTERNALSYM PathStripPathW}
procedure PathStripPathW(pszPath: PWideChar); stdcall;
{$EXTERNALSYM PathStripPath}
procedure PathStripPath(pszPath: PTSTR); stdcall;
{$EXTERNALSYM PathStripToRootA}
function PathStripToRootA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathStripToRootW}
function PathStripToRootW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathStripToRoot}
function PathStripToRoot(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathUnquoteSpacesA}
procedure PathUnquoteSpacesA(lpsz: PAnsiChar); stdcall;
{$EXTERNALSYM PathUnquoteSpacesW}
procedure PathUnquoteSpacesW(lpsz: PWideChar); stdcall;
{$EXTERNALSYM PathUnquoteSpaces}
procedure PathUnquoteSpaces(lpsz: PTSTR); stdcall;
{$EXTERNALSYM PathMakeSystemFolderA}
function PathMakeSystemFolderA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathMakeSystemFolderW}
function PathMakeSystemFolderW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathMakeSystemFolder}
function PathMakeSystemFolder(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathUnmakeSystemFolderA}
function PathUnmakeSystemFolderA(pszPath: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM PathUnmakeSystemFolderW}
function PathUnmakeSystemFolderW(pszPath: PWideChar): BOOL; stdcall;
{$EXTERNALSYM PathUnmakeSystemFolder}
function PathUnmakeSystemFolder(pszPath: PTSTR): BOOL; stdcall;
{$EXTERNALSYM PathIsSystemFolderA}
function PathIsSystemFolderA(pszPath: PAnsiChar; dwAttrb: DWORD): BOOL; stdcall;
{$EXTERNALSYM PathIsSystemFolderW}
function PathIsSystemFolderW(pszPath: PWideChar; dwAttrb: DWORD): BOOL; stdcall;
{$EXTERNALSYM PathIsSystemFolder}
function PathIsSystemFolder(pszPath: PTSTR; dwAttrb: DWORD): BOOL; stdcall;
{$EXTERNALSYM PathUndecorateA}
procedure PathUndecorateA(pszPath: PAnsiChar); stdcall;
{$EXTERNALSYM PathUndecorateW}
procedure PathUndecorateW(pszPath: PWideChar); stdcall;
{$EXTERNALSYM PathUndecorate}
procedure PathUndecorate(pszPath: PTSTR); stdcall;
{$EXTERNALSYM PathUnExpandEnvStringsA}
function PathUnExpandEnvStringsA(pszPath, pszBuf: PAnsiChar; cchBuf: UINT): BOOL; stdcall;
{$EXTERNALSYM PathUnExpandEnvStringsW}
function PathUnExpandEnvStringsW(pszPath, pszBuf: PWideChar; cchBuf: UINT): BOOL; stdcall;
{$EXTERNALSYM PathUnExpandEnvStrings}
function PathUnExpandEnvStrings(pszPath, pszBuf: PTSTR; cchBuf: UINT): BOOL; stdcall;

type
  {$EXTERNALSYM URL_SCHEME}
  URL_SCHEME = DWORD;
  TUrlScheme = DWORD;

const
  {$EXTERNALSYM URL_SCHEME_INVALID}
  URL_SCHEME_INVALID       = -1;
  {$EXTERNALSYM URL_SCHEME_UNKNOWN}
  URL_SCHEME_UNKNOWN       = 0;
  {$EXTERNALSYM URL_SCHEME_FTP}
  URL_SCHEME_FTP           = 1;
  {$EXTERNALSYM URL_SCHEME_HTTP}
  URL_SCHEME_HTTP          = 2;
  {$EXTERNALSYM URL_SCHEME_GOPHER}
  URL_SCHEME_GOPHER        = 3;
  {$EXTERNALSYM URL_SCHEME_MAILTO}
  URL_SCHEME_MAILTO        = 4;
  {$EXTERNALSYM URL_SCHEME_NEWS}
  URL_SCHEME_NEWS          = 5;
  {$EXTERNALSYM URL_SCHEME_NNTP}
  URL_SCHEME_NNTP          = 6;
  {$EXTERNALSYM URL_SCHEME_TELNET}
  URL_SCHEME_TELNET        = 7;
  {$EXTERNALSYM URL_SCHEME_WAIS}
  URL_SCHEME_WAIS          = 8;
  {$EXTERNALSYM URL_SCHEME_FILE}
  URL_SCHEME_FILE          = 9;
  {$EXTERNALSYM URL_SCHEME_MK}
  URL_SCHEME_MK            = 10;
  {$EXTERNALSYM URL_SCHEME_HTTPS}
  URL_SCHEME_HTTPS         = 11;
  {$EXTERNALSYM URL_SCHEME_SHELL}
  URL_SCHEME_SHELL         = 12;
  {$EXTERNALSYM URL_SCHEME_SNEWS}
  URL_SCHEME_SNEWS         = 13;
  {$EXTERNALSYM URL_SCHEME_LOCAL}
  URL_SCHEME_LOCAL         = 14;
  {$EXTERNALSYM URL_SCHEME_JAVASCRIPT}
  URL_SCHEME_JAVASCRIPT    = 15;
  {$EXTERNALSYM URL_SCHEME_VBSCRIPT}
  URL_SCHEME_VBSCRIPT      = 16;
  {$EXTERNALSYM URL_SCHEME_ABOUT}
  URL_SCHEME_ABOUT         = 17;
  {$EXTERNALSYM URL_SCHEME_RES}
  URL_SCHEME_RES           = 18;
  {$EXTERNALSYM URL_SCHEME_MSSHELLROOTED}
  URL_SCHEME_MSSHELLROOTED = 19;
  {$EXTERNALSYM URL_SCHEME_MSSHELLIDLIST}
  URL_SCHEME_MSSHELLIDLIST = 20;
  {$EXTERNALSYM URL_SCHEME_MSHELP}
  URL_SCHEME_MSHELP        = 21;
  {$EXTERNALSYM URL_SCHEME_MAXVALUE}
  URL_SCHEME_MAXVALUE      = 22;

type
  {$EXTERNALSYM URL_PART}
  URL_PART = DWORD;
  TUrlPart = DWORD;

const
  {$EXTERNALSYM URL_PART_NONE}
  URL_PART_NONE     = 0;
  {$EXTERNALSYM URL_PART_SCHEME}
  URL_PART_SCHEME   = 1;
  {$EXTERNALSYM URL_PART_HOSTNAME}
  URL_PART_HOSTNAME = 2;
  {$EXTERNALSYM URL_PART_USERNAME}
  URL_PART_USERNAME = 3;
  {$EXTERNALSYM URL_PART_PASSWORD}
  URL_PART_PASSWORD = 4;
  {$EXTERNALSYM URL_PART_PORT}
  URL_PART_PORT     = 5;
  {$EXTERNALSYM URL_PART_QUERY}
  URL_PART_QUERY    = 6;

  // Cannot declare this type as URLIS, since that is the name of a function as well.
  // This is not a problem in case sensitive C, but it is one in Delphi.

const
  {$EXTERNALSYM URLIS_URL}
  URLIS_URL        = 0;
  {$EXTERNALSYM URLIS_OPAQUE}
  URLIS_OPAQUE     = 1;
  {$EXTERNALSYM URLIS_NOHISTORY}
  URLIS_NOHISTORY  = 2;
  {$EXTERNALSYM URLIS_FILEURL}
  URLIS_FILEURL    = 3;
  {$EXTERNALSYM URLIS_APPLIABLE}
  URLIS_APPLIABLE  = 4;
  {$EXTERNALSYM URLIS_DIRECTORY}
  URLIS_DIRECTORY  = 5;
  {$EXTERNALSYM URLIS_HASQUERY}
  URLIS_HASQUERY   = 6;

  {$EXTERNALSYM URL_UNESCAPE}
  URL_UNESCAPE                    = $10000000;
  {$EXTERNALSYM URL_ESCAPE_UNSAFE}
  URL_ESCAPE_UNSAFE               = $20000000;
  {$EXTERNALSYM URL_PLUGGABLE_PROTOCOL}
  URL_PLUGGABLE_PROTOCOL          = $40000000;
  {$EXTERNALSYM URL_WININET_COMPATIBILITY}
  URL_WININET_COMPATIBILITY       = $80000000;
  {$EXTERNALSYM URL_DONT_ESCAPE_EXTRA_INFO}
  URL_DONT_ESCAPE_EXTRA_INFO      = $02000000;
  {$EXTERNALSYM URL_DONT_UNESCAPE_EXTRA_INFO}
  URL_DONT_UNESCAPE_EXTRA_INFO    = URL_DONT_ESCAPE_EXTRA_INFO;
  {$EXTERNALSYM URL_BROWSER_MODE}
  URL_BROWSER_MODE                = URL_DONT_ESCAPE_EXTRA_INFO;
  {$EXTERNALSYM URL_ESCAPE_SPACES_ONLY}
  URL_ESCAPE_SPACES_ONLY          = $04000000;
  {$EXTERNALSYM URL_DONT_SIMPLIFY}
  URL_DONT_SIMPLIFY               = $08000000;
  {$EXTERNALSYM URL_NO_META}
  URL_NO_META                     = URL_DONT_SIMPLIFY;
  {$EXTERNALSYM URL_UNESCAPE_INPLACE}
  URL_UNESCAPE_INPLACE            = $00100000;
  {$EXTERNALSYM URL_CONVERT_IF_DOSPATH}
  URL_CONVERT_IF_DOSPATH          = $00200000;
  {$EXTERNALSYM URL_UNESCAPE_HIGH_ANSI_ONLY}
  URL_UNESCAPE_HIGH_ANSI_ONLY     = $00400000;
  {$EXTERNALSYM URL_INTERNAL_PATH}
  URL_INTERNAL_PATH               = $00800000;  // Will escape #'s in paths
  {$EXTERNALSYM URL_FILE_USE_PATHURL}
  URL_FILE_USE_PATHURL            = $00010000;
  {$EXTERNALSYM URL_DONT_UNESCAPE}
  URL_DONT_UNESCAPE               = $00020000;  // Do not unescape the path/url at all
  {$EXTERNALSYM URL_ESCAPE_PERCENT}
  URL_ESCAPE_PERCENT              = $00001000;
  {$EXTERNALSYM URL_ESCAPE_SEGMENT_ONLY}
  URL_ESCAPE_SEGMENT_ONLY         = $00002000;  // Treat the entire URL param as one URL segment.

  {$EXTERNALSYM URL_PARTFLAG_KEEPSCHEME}
  URL_PARTFLAG_KEEPSCHEME         = $00000001;

  {$EXTERNALSYM URL_APPLY_DEFAULT}
  URL_APPLY_DEFAULT               = $00000001;
  {$EXTERNALSYM URL_APPLY_GUESSSCHEME}
  URL_APPLY_GUESSSCHEME           = $00000002;
  {$EXTERNALSYM URL_APPLY_GUESSFILE}
  URL_APPLY_GUESSFILE             = $00000004;
  {$EXTERNALSYM URL_APPLY_FORCEAPPLY}
  URL_APPLY_FORCEAPPLY            = $00000008;


{$EXTERNALSYM UrlCompareA}
function UrlCompareA(psz1, psz2: PAnsiChar; fIgnoreSlash: BOOL): Integer; stdcall;
{$EXTERNALSYM UrlCompareW}
function UrlCompareW(psz1, psz2: PWideChar; fIgnoreSlash: BOOL): Integer; stdcall;
{$EXTERNALSYM UrlCompare}
function UrlCompare(psz1, psz2: PTSTR; fIgnoreSlash: BOOL): Integer; stdcall;
{$EXTERNALSYM UrlCombineA}
function UrlCombineA(pszBase, pszRelative, pszCombined: PAnsiChar; var pcchCombined: DWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlCombineW}
function UrlCombineW(pszBase, pszRelative, pszCombined: PWideChar; var pcchCombined: DWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlCombine}
function UrlCombine(pszBase, pszRelative, pszCombined: PTSTR; var pcchCombined: DWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlCanonicalizeA}
function UrlCanonicalizeA(pszUrl, pszCanonicalized: PAnsiChar; var pcchCanonicalized: DWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlCanonicalizeW}
function UrlCanonicalizeW(pszUrl, pszCanonicalized: PWideChar; var pcchCanonicalized: DWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlCanonicalize}
function UrlCanonicalize(pszUrl, pszCanonicalized: PTSTR; var pcchCanonicalized: DWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlIsOpaqueA}
function UrlIsOpaqueA(pszURL: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM UrlIsOpaqueW}
function UrlIsOpaqueW(pszURL: PWideChar): BOOL; stdcall;
{$EXTERNALSYM UrlIsOpaque}
function UrlIsOpaque(pszURL: PTSTR): BOOL; stdcall;
{$EXTERNALSYM UrlIsNoHistoryA}
function UrlIsNoHistoryA(pszURL: PAnsiChar): BOOL; stdcall;
{$EXTERNALSYM UrlIsNoHistoryW}
function UrlIsNoHistoryW(pszURL: PWideChar): BOOL; stdcall;
{$EXTERNALSYM UrlIsNoHistory}
function UrlIsNoHistory(pszURL: PTSTR): BOOL; stdcall;
{$EXTERNALSYM UrlIsFileUrlA}
function UrlIsFileUrlA(pszURL: PAnsiChar): BOOL;
{$EXTERNALSYM UrlIsFileUrlW}
function UrlIsFileUrlW(pszURL: PWideChar): BOOL;
{$EXTERNALSYM UrlIsFileUrl}
function UrlIsFileUrl(pszURL: PTSTR): BOOL;
{$EXTERNALSYM UrlIsA}
function UrlIsA(pszUrl: PAnsiChar; UrlIs: DWORD): BOOL; stdcall;
{$EXTERNALSYM UrlIsW}
function UrlIsW(pszUrl: PWideChar; UrlIs: DWORD): BOOL; stdcall;
{$EXTERNALSYM UrlIs}
function UrlIs(pszUrl: PTSTR; UrlIs: DWORD): BOOL; stdcall;
{$EXTERNALSYM UrlGetLocationA}
function UrlGetLocationA(psz1: PAnsiChar): PAnsiChar; stdcall;
{$EXTERNALSYM UrlGetLocationW}
function UrlGetLocationW(psz1: PWideChar): PWideChar; stdcall;
{$EXTERNALSYM UrlGetLocation}
function UrlGetLocation(psz1: PTSTR): PTSTR; stdcall;
{$EXTERNALSYM UrlUnescapeA}
function UrlUnescapeA(pszUrl, pszUnescaped: PAnsiChar; pcchUnescaped: PDWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlUnescapeW}
function UrlUnescapeW(pszUrl, pszUnescaped: PWideChar; pcchUnescaped: PDWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlUnescape}
function UrlUnescape(pszUrl, pszUnescaped: PTSTR; pcchUnescaped: PDWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlEscapeA}
function UrlEscapeA(pszUrl, pszEscaped: PAnsiChar; pcchEscaped: PDWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlEscapeW}
function UrlEscapeW(pszUrl, pszEscaped: PWideChar; pcchEscaped: PDWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlEscape}
function UrlEscape(pszUrl, pszEscaped: PTSTR; pcchEscaped: PDWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlCreateFromPathA}
function UrlCreateFromPathA(pszPath, pszUrl: PAnsiChar; var pcchUrl: DWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlCreateFromPathW}
function UrlCreateFromPathW(pszPath, pszUrl: PWideChar; var pcchUrl: DWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlCreateFromPath}
function UrlCreateFromPath(pszPath, pszUrl: PTSTR; var pcchUrl: DWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM PathCreateFromUrlA}
function PathCreateFromUrlA(pszUrl, pszPath: PAnsiChar; var pcchPath: DWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM PathCreateFromUrlW}
function PathCreateFromUrlW(pszUrl, pszPath: PWideChar; var pcchPath: DWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM PathCreateFromUrl}
function PathCreateFromUrl(pszUrl, pszPath: PTSTR; var pcchPath: DWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlHashA}
function UrlHashA(pszUrl: PAnsiChar; var pbHash: Byte; cbHash: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlHashW}
function UrlHashW(pszUrl: PWideChar; var pbHash: Byte; cbHash: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlHash}
function UrlHash(pszUrl: PTSTR; var pbHash: Byte; cbHash: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlGetPartW}
function UrlGetPartW(pszIn, pszOut: PWideChar; var pcchOut: DWORD; dwPart, dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlGetPartA}
function UrlGetPartA(pszIn, pszOut: PAnsiChar; var pcchOut: DWORD; dwPart, dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlGetPart}
function UrlGetPart(pszIn, pszOut: PTSTR; var pcchOut: DWORD; dwPart, dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlApplySchemeA}
function UrlApplySchemeA(pszIn, pszOut: PAnsiChar; var pcchOut: DWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlApplySchemeW}
function UrlApplySchemeW(pszIn, pszOut: PWideChar; var pcchOut: DWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM UrlApplyScheme}
function UrlApplyScheme(pszIn, pszOut: PTSTR; var pcchOut: DWORD; dwFlags: DWORD): HResult; stdcall;
{$EXTERNALSYM HashData}
function HashData(pbData: PByte; cbData: DWORD; pbHash: PByte; cbHash: DWORD): HResult; stdcall;

{$EXTERNALSYM UrlEscapeSpaces}
function UrlEscapeSpaces(pszUrl, pszEscaped: PTSTR; var pcchEscaped: DWORD): HResult;
{$EXTERNALSYM UrlUnescapeInPlace}
function UrlUnescapeInPlace(pszUrl: PTSTR; dwFlags: DWORD): HResult;

//
//=============== Registry Routines ===================================
//


// SHDeleteEmptyKey mimics RegDeleteKey as it behaves on NT.
// SHDeleteKey mimics RegDeleteKey as it behaves on Win95.

{$EXTERNALSYM SHDeleteEmptyKeyA}
function SHDeleteEmptyKeyA(hkey: HKEY; pszSubKey: PAnsiChar): DWORD; stdcall;
{$EXTERNALSYM SHDeleteEmptyKeyW}
function SHDeleteEmptyKeyW(hkey: HKEY; pszSubKey: PWideChar): DWORD; stdcall;
{$EXTERNALSYM SHDeleteEmptyKey}
function SHDeleteEmptyKey(hkey: HKEY; pszSubKey: PTSTR): DWORD; stdcall;
{$EXTERNALSYM SHDeleteKeyA}
function SHDeleteKeyA(hkey: HKEY; pszSubKey: PAnsiChar): DWORD; stdcall;
{$EXTERNALSYM SHDeleteKeyW}
function SHDeleteKeyW(hkey: HKEY; pszSubKey: PWideChar): DWORD; stdcall;
{$EXTERNALSYM SHDeleteKey}
function SHDeleteKey(hkey: HKEY; pszSubKey: PTSTR): DWORD; stdcall;
{$EXTERNALSYM SHRegDuplicateHKey}
function SHRegDuplicateHKey(hkey: HKEY): HKEY; stdcall;


// These functions open the key, get/set/delete the value, then close
// the key.

{$EXTERNALSYM SHDeleteValueA}
function SHDeleteValueA(hkey: HKEY; pszSubKey, pszValue: PAnsiChar): DWORD; stdcall;
{$EXTERNALSYM SHDeleteValueW}
function SHDeleteValueW(hkey: HKEY; pszSubKey, pszValue: PWideChar): DWORD; stdcall;
{$EXTERNALSYM SHDeleteValue}
function SHDeleteValue(hkey: HKEY; pszSubKey, pszValue: PTSTR): DWORD; stdcall;
{$EXTERNALSYM SHGetValueA}
function SHGetValueA(hkey: HKEY; pszSubKey, pszValue: PAnsiChar; var pdwType: DWORD; pvData: Pointer; var pcbData: DWORD): DWORD; stdcall;
{$EXTERNALSYM SHGetValueW}
function SHGetValueW(hkey: HKEY; pszSubKey, pszValue: PWideChar; var pdwType: DWORD; pvData: Pointer; var pcbData: DWORD): DWORD; stdcall;
{$EXTERNALSYM SHGetValue}
function SHGetValue(hkey: HKEY; pszSubKey, pszValue: PTSTR; var pdwType: DWORD; pvData: Pointer; var pcbData: DWORD): DWORD; stdcall;
{$EXTERNALSYM SHSetValueA}
function SHSetValueA(hkey: HKEY; pszSubKey: PAnsiChar; pszValue: PAnsiChar; dwType: DWORD; pvData: Pointer; cbData: DWORD): DWORD; stdcall;
{$EXTERNALSYM SHSetValueW}
function SHSetValueW(hkey: HKEY; pszSubKey: PWideChar; pszValue: PWideChar; dwType: DWORD; pvData: Pointer; cbData: DWORD): DWORD; stdcall;
{$EXTERNALSYM SHSetValue}
function SHSetValue(hkey: HKEY; pszSubKey: PTSTR; pszValue: PAnsiChar; dwType: DWORD; pvData: Pointer; cbData: DWORD): DWORD; stdcall;


//
// SRRF - Shell Registry Routine Flags (for SHRegGetValue)
//

type
  {$EXTERNALSYM SRRF}
  SRRF = DWORD;
  TSRRF = DWORD;

const
  {$EXTERNALSYM SRRF_RT_REG_NONE}
  SRRF_RT_REG_NONE        = $00000001;  // restrict type to REG_NONE      (other data types will not return ERROR_SUCCESS)
  {$EXTERNALSYM SRRF_RT_REG_SZ}
  SRRF_RT_REG_SZ          = $00000002;  // restrict type to REG_SZ        (other data types will not return ERROR_SUCCESS)
  {$EXTERNALSYM SRRF_RT_REG_EXPAND_SZ}
  SRRF_RT_REG_EXPAND_SZ   = $00000004;  // restrict type to REG_EXPAND_SZ (other data types will not return ERROR_SUCCESS)
  {$EXTERNALSYM SRRF_RT_REG_BINARY}
  SRRF_RT_REG_BINARY      = $00000008;  // restrict type to REG_BINARY    (other data types will not return ERROR_SUCCESS)
  {$EXTERNALSYM SRRF_RT_REG_DWORD}
  SRRF_RT_REG_DWORD       = $00000010;  // restrict type to REG_DWORD     (other data types will not return ERROR_SUCCESS)
  {$EXTERNALSYM SRRF_RT_REG_MULTI_SZ}
  SRRF_RT_REG_MULTI_SZ    = $00000020;  // restrict type to REG_MULTI_SZ  (other data types will not return ERROR_SUCCESS)
  {$EXTERNALSYM SRRF_RT_REG_QWORD}
  SRRF_RT_REG_QWORD       = $00000040;  // restrict type to REG_QWORD     (other data types will not return ERROR_SUCCESS)

  {$EXTERNALSYM SRRF_RT_DWORD}
  SRRF_RT_DWORD           = SRRF_RT_REG_BINARY or SRRF_RT_REG_DWORD; // restrict type to *32-bit* SRRF_RT_REG_BINARY or SRRF_RT_REG_DWORD (other data types will not return ERROR_SUCCESS)
  {$EXTERNALSYM SRRF_RT_QWORD}
  SRRF_RT_QWORD           = SRRF_RT_REG_BINARY or SRRF_RT_REG_QWORD; // restrict type to *64-bit* SRRF_RT_REG_BINARY or SRRF_RT_REG_DWORD (other data types will not return ERROR_SUCCESS)
  {$EXTERNALSYM SRRF_RT_ANY}
  SRRF_RT_ANY             = $0000FFFF;                               // no type restriction

  {$EXTERNALSYM SRRF_RM_ANY}
  SRRF_RM_ANY             = $00000000;  // no mode restriction (default is to allow any mode)
  {$EXTERNALSYM SRRF_RM_NORMAL}
  SRRF_RM_NORMAL          = $00010000;  // restrict system startup mode to "normal boot"               (other startup modes will not return ERROR_SUCCESS)
  {$EXTERNALSYM SRRF_RM_SAFE}
  SRRF_RM_SAFE            = $00020000;  // restrict system startup mode to "safe mode"                 (other startup modes will not return ERROR_SUCCESS)
  {$EXTERNALSYM SRRF_RM_SAFENETWORK}
  SRRF_RM_SAFENETWORK     = $00040000;  // restrict system startup mode to "safe mode with networking" (other startup modes will not return ERROR_SUCCESS)

  {$EXTERNALSYM SRRF_NOEXPAND}
  SRRF_NOEXPAND           = $10000000;  // do not automatically expand environment strings if value is of type REG_EXPAND_SZ
  {$EXTERNALSYM SRRF_ZEROONFAILURE}
  SRRF_ZEROONFAILURE      = $20000000;  // if pvData is not NULL, set content to all zeros on failure
  
// Function:
//
//  SHRegGetValue()
//
// Purpose:
//
//  Gets a registry value.  SHRegGetValue() provides the following benefits:
//
//  - data type checking
//  - boot mode checking
//  - auto-expansion of REG_EXPAND_SZ data
//  - guaranteed NULL termination of REG_SZ, REG_EXPAND_SZ, REG_MULTI_SZ data
//
// Parameters:
//
//  hkey        - handle to a currently open key.
//
//  pszSubKey   - pointer to a null-terminated string specifying the relative
//                path from hkey to one of its subkeys from which the data is
//                to be retrieved.  this will be opened with KEY_READ sam.
//
//                Note1: pszSubKey can be NULL or "".  In either of these two
//                       cases, the data is retrieved from the hkey itself.
//                Note2: *** PERF ***
//                       If pszSubKey is not NULL or "", the subkey will be
//                       automatically be opened and closed by this routine
//                       in order to obtain the data.  If you are retrieving
//                       multiple values from the same subkey, it is better
//                       for perf to open the subkey via RegOpenKeyEx() prior
//                       to calling this method, and using this opened key as
//                       hkey with pszSubKey set to NULL.
//
//  pszValue    - pointer to a null-terminated string specifying the name of
//                the value to query for data
//
//                Note1: pszValue can be NULL or "".  In either of these two
//                       cases, the data is retrieved from the unnamed or
//                       default value.
//
//  dwFlags     - bitwise or of SRRF_ flags, which cannot be 0:  at least one
//                type restriction must be specified (SRRF_RT_...), or if any
//                type is desired then SRRF_RT_ANY can be specified
//
//                Note1: SRRF_RT_ANY will allow any data type to be returned.
//                Note2: The following two type restrictions have special
//                       handling semantics:
//
//                         SRRF_RT_DWORD == SRRF_RT_REG_BINARY | SRRF_RT_REG_DWORD
//                         SRRF_RT_QWORD == SRRF_RT_REG_BINARY | SRRF_RT_REG_QWORD
//
//                       If either of these are specified, with no other type
//                       restrictions, then in the prior case the restriction
//                       will limit "valid" returned data to either REG_DWORD
//                       or 32-bit REG_BINARY data, and in the latter case
//                       the restriction will limit "valid" returned data to
//                       either REG_QWORD or 64-bit REG_BINARY.
//
//  pdwType     - pointer to a dword which receives a code indicating the
//                type of data stored in the specified value
//
//                Note1: pdwType can be NULL if no type information is wanted
//                Note2: If pdwType is not NULL, and the SRRF_NOEXPAND flag
//                       has not been set, data types of REG_EXPAND_SZ will
//                       be returned as REG_SZ since they are automatically
//                       expanded in this method.
//
//  pvData      - pointer to a buffer that receives the value's data
//
//                Note1: pvData can be NULL if the data is not required.
//                       pvData is usually NULL if doing either a simple
//                       existence test, or if interested in the size only.
//                Note2: *** PERF ***
//                       Reference 'perf' note for pcbData.
//
//  pcbData     - when pvData is NULL:
//                  optional pointer to a dword that receives a size in bytes
//                  which would be sufficient to hold the registry data (note
//                  this size is not guaranteed to be exact, merely sufficient)
//                when pvData is not NULL:
//                  required pointer to a dword that specifies the size in
//                  bytes of the buffer pointed to by the pvData parameter
//                  and receives a size in bytes of:
//                  a) the number of bytes read into pvData on ERROR_SUCCESS
//                     (note this size is guaranteed to be exact)
//                  b) the number of bytes which would be sufficient to hold
//                     the registry data on ERROR_MORE_DATA -- pvData was of
//                     insufficient size (note this size is not guaranteed to
//                     be exact, merely sufficient)
//
//                Note1: pcbData can be NULL only if pvData is NULL.
//                Note2: *** PERF ***
//                       The potential for an 'extra' call to the registry to
//                       read (or re-read) in the data exists when the data
//                       type is REG_EXPAND_SZ and the SRRF_NOEXPAND flag has
//                       not been set.  The following conditions will result
//                       in this 'extra' read operation:
//                       i)  when pvData is NULL and pcbData is not NULL
//                           we must read in the data from the registry
//                           anyway in order to obtain the string and perform
//                           an expand on it to obtain and return the total
//                           required size in pcbData
//                       ii) when pvData is not NULL but is of insufficient
//                           size we must re-read in the data from the
//                           registry in order to obtain the entire string
//                           and perform an expand on it to obtain and return
//                           the total required size in pcbData
//
// Remarks:
//
//  The key identified by hkey must have been opened with KEY_QUERY_VALUE
//  access.  If pszSubKey is not NULL or "", it must be able to be opened
//  with KEY_QUERY_VALUE access in the current calling context.
//
//  If the data type is REG_SZ, REG_EXPAND_SZ or REG_MULTI_SZ then any
//  returned data is guaranteed to take into account proper null termination.
//  For example:  if pcbData is not NULL, its returned size will include the
//  bytes for a null terminator  if pvData is not NULL, its returned data
//  will be properly null terminated.
//
//  If the data type is REG_EXPAND_SZ, then unless the SRRF_NOEXPAND flag
//  is set the data will be automatically expanded prior to being returned.
//  For example:  if pdwType is not NULL, its returned type will be changed
//  to REG_SZ,  if pcbData is not NULL, its returned size will include the
//  bytes for a properly expanded string.  if pvData is not NULL, its
//  returned data will be the expanded version of the string.
//
//  Reference MSDN documentation for RegQueryValueEx() for more information
//  of the behaviour when pdwType, pvData, and/or pcbData are equal to NULL.
//
// Return Values:
//
//  If the function succeeds, the return value is ERROR_SUCCESS and all out
//  parameters requested (pdwType, pvData, pcbData) are valid.
//
//  If the function fails due to insufficient space in a provided non-NULL
//  pvData, the return value is ERROR_MORE_DATA and only pdwType and pcbData
//  can contain valid data.  The content of pvData in this case is undefined.
//
// Examples:
//
//  1) read REG_SZ (or REG_EXPAND_SZ as REG_SZ) "string" data from the (default) value of an open hkey
//
//      TCHAR szData[128]
//      DWORD cbData = sizeof(pszData)
//      if (ERROR_SUCCESS == SHRegGetValue(hkey, NULL, NULL, SRRF_RT_REG_SZ, NULL, szData, &cbData))
//      {
//          // use sz (successful read)
//      }
//
//  2) read REG_SZ (or REG_EXPAND_SZ as REG_SZ) "string" data of unknown size from the "MyValue" value of an open hkey
//
//      DWORD cbData
//      if (ERROR_SUCCESS == SHRegGetValue(hkey, NULL, TEXT("MyValue"), SRRF_RT_REG_SZ, NULL, NULL, &cbData))
//      {
//          TCHAR *pszData = new TCHAR[cbData/sizeof(TCHAR)]
//          if (pszData)
//          {
//              if (ERROR_SUCCESS == SHRegGetValue(hkey, NULL, TEXT("MyValue"), SRRF_RT_REG_SZ, NULL, pszData, &cbData))
//              {
//                  // use pszData (successful read)
//              }
//              delete[] pszData
//          }
//      }
//
//  3) read "dword" data from the "MyValue" value of the "MySubKey" subkey of an open hkey
//
//      DWORD dwData
//      DWORD cbData = sizeof(dwData)
//      if (ERROR_SUCCESS == SHRegGetValue(hkey, TEXT("MySubKey"), TEXT("MyValue"), SRRF_RT_REG_DWORD, NULL, &dwData, &cbData))
//      {
//          // use dwData (successful read)
//      }
//
//  4) read "dword" data from the "MyValue" value of the "MySubKey" subkey of an open hkey (32-bit binary data also ok)
//
//      DWORD dwData
//      DWORD cbData = sizeof(dwData)
//      if (ERROR_SUCCESS == SHRegGetValue(hkey, TEXT("MySubKey"), TEXT("MyValue"), SRRF_RT_DWORD, NULL, &dwData, &cbData))
//      {
//          // use dwData (successful read)
//      }
//
//  5) determine existence of "MyValue" value of an open hkey
//
//      BOOL bExists = ERROR_SUCCESS == SHRegGetValue(hkey, NULL, TEXT("MyValue"), SRRF_RT_ANY, NULL, NULL, NULL)

{$EXTERNALSYM SHRegGetValueA}
function SHRegGetValueA(hkey: HKEY; pszSubKey, pszValue: PAnsiChar; dwFlags: TSRRF; var pdwType: DWORD; pvData: Pointer; var pcbData: DWORD): Longint stdcall;
{$EXTERNALSYM SHRegGetValueW}
function SHRegGetValueW(hkey: HKEY; pszSubKey, pszValue: PWideChar; dwFlags: TSRRF; var pdwType: DWORD; pvData: Pointer; var pcbData: DWORD): Longint stdcall;
{$EXTERNALSYM SHRegGetValue}
function SHRegGetValue(hkey: HKEY; pszSubKey, pszValue: PTSTR; dwFlags: TSRRF; var pdwType: DWORD; pvData: Pointer; var pcbData: DWORD): Longint stdcall;

// These functions behave just like RegQueryValueEx(), except if the data
// type is REG_SZ, REG_EXPAND_SZ or REG_MULTI_SZ then the string is
// guaranteed to be properly null terminated.
//
// Additionally, if the data type is REG_EXPAND_SZ these functions will
// go ahead and expand out the string, and "massage" the returned *pdwType
// to be REG_SZ.

{$EXTERNALSYM SHQueryValueExA}
function SHQueryValueExA(hkey: HKEY; pszValue: PAnsiChar; var pdwReserved, pdwType: DWORD; pvData: Pointer; var pcbData: DWORD): DWORD; stdcall;
{$EXTERNALSYM SHQueryValueExW}
function SHQueryValueExW(hkey: HKEY; pszValue: PWideChar; var pdwReserved, pdwType: DWORD; pvData: Pointer; var pcbData: DWORD): DWORD; stdcall;
{$EXTERNALSYM SHQueryValueEx}
function SHQueryValueEx(hkey: HKEY; pszValue: PTSTR; var pdwReserved, pdwType: DWORD; pvData: Pointer; var pcbData: DWORD): DWORD; stdcall;

// Enumeration functions support.

{$EXTERNALSYM SHEnumKeyExA}
function SHEnumKeyExA(hkey: HKEY; dwIndex: DWORD; pszName: PAnsiChar; var pcchName: DWORD): Longint; stdcall;
{$EXTERNALSYM SHEnumKeyExW}
function SHEnumKeyExW(hkey: HKEY; dwIndex: DWORD; pszName: PWideChar; var pcchName: DWORD): Longint; stdcall;
{$EXTERNALSYM SHEnumKeyEx}
function SHEnumKeyEx(hkey: HKEY; dwIndex: DWORD; pszName: PTSTR; var pcchName: DWORD): Longint; stdcall;
{$EXTERNALSYM SHEnumValueA}
function SHEnumValueA(hkey: HKEY; dwIndex: DWORD; pszValueName: PAnsiChar; var pcchValueName, pdwType: DWORD; pvData: Pointer; var pcbData: DWORD): Longint; stdcall;
{$EXTERNALSYM SHEnumValueW}
function SHEnumValueW(hkey: HKEY; dwIndex: DWORD; pszValueName: PWideChar; var pcchValueName, pdwType: DWORD; pvData: Pointer; var pcbData: DWORD): Longint; stdcall;
{$EXTERNALSYM SHEnumValue}
function SHEnumValue(hkey: HKEY; dwIndex: DWORD; pszValueName: PTSTR; var pcchValueName, pdwType: DWORD; pvData: Pointer; var pcbData: DWORD): Longint; stdcall;
{$EXTERNALSYM SHQueryInfoKeyA}
function SHQueryInfoKeyA(hkey: HKEY; var pcSubKeys, pcchMaxSubKeyLen, pcValues, pcchMaxValueNameLen: DWORD): Longint; stdcall;
{$EXTERNALSYM SHQueryInfoKeyW}
function SHQueryInfoKeyW(hkey: HKEY; var pcSubKeys, pcchMaxSubKeyLen, pcValues, pcchMaxValueNameLen: DWORD): Longint; stdcall;
{$EXTERNALSYM SHQueryInfoKey}
function SHQueryInfoKey(hkey: HKEY; var pcSubKeys, pcchMaxSubKeyLen, pcValues, pcchMaxValueNameLen: DWORD): Longint; stdcall;

// recursive key copy
{$EXTERNALSYM SHCopyKeyA}
function SHCopyKeyA(hkeySrc: HKEY; szSrcSubKey: PAnsiChar; hkeyDest: HKEY; fReserved: DWORD): DWORD; stdcall;
{$EXTERNALSYM SHCopyKeyW}
function SHCopyKeyW(hkeySrc: HKEY; wszSrcSubKey: PWideChar; hkeyDest: HKEY; fReserved: DWORD): DWORD; stdcall;
{$EXTERNALSYM SHCopyKey}
function SHCopyKey(hkeySrc: HKEY; szSrcSubKey: PTSTR; hkeyDest: HKEY; fReserved: DWORD): DWORD; stdcall;

// Getting and setting file system paths with environment variables

{$EXTERNALSYM SHRegGetPathA}
function SHRegGetPathA(hKey: HKEY; pcszSubKey, pcszValue, pszPath: PAnsiChar; dwFlags: DWORD): DWORD; stdcall;
{$EXTERNALSYM SHRegGetPathW}
function SHRegGetPathW(hKey: HKEY; pcszSubKey, pcszValue, pszPath: PWideChar; dwFlags: DWORD): DWORD; stdcall;
{$EXTERNALSYM SHRegGetPath}
function SHRegGetPath(hKey: HKEY; pcszSubKey, pcszValue, pszPath: PTSTR; dwFlags: DWORD): DWORD; stdcall;
{$EXTERNALSYM SHRegSetPathA}
function SHRegSetPathA(hKey: HKEY; pcszSubKey, pcszValue, pcszPath: PAnsiChar; dwFlags: DWORD): DWORD; stdcall;
{$EXTERNALSYM SHRegSetPathW}
function SHRegSetPathW(hKey: HKEY; pcszSubKey, pcszValue, pcszPath: PWideChar; dwFlags: DWORD): DWORD; stdcall;
{$EXTERNALSYM SHRegSetPath}
function SHRegSetPath(hKey: HKEY; pcszSubKey, pcszValue, pcszPath: PTSTR; dwFlags: DWORD): DWORD; stdcall;


//////////////////////////////////////////////
// User Specific Registry Access Functions
//////////////////////////////////////////////

//
// Type definitions.
//

type
  {$EXTERNALSYM SHREGDEL_FLAGS}
  SHREGDEL_FLAGS = DWORD;
  TSHRegDelFlags = DWORD;

const
  {$EXTERNALSYM SHREGDEL_DEFAULT}
  SHREGDEL_DEFAULT = $00000000;   // Delete's HKCU ;  or HKLM if HKCU is not found.
  {$EXTERNALSYM SHREGDEL_HKCU}
  SHREGDEL_HKCU    = $00000001;   // Delete HKCU only
  {$EXTERNALSYM SHREGDEL_HKLM}
  SHREGDEL_HKLM    = $00000010;   // Delete HKLM only.
  {$EXTERNALSYM SHREGDEL_BOTH}
  SHREGDEL_BOTH    = $00000011;   // Delete both HKCU and HKLM.

type
  {$EXTERNALSYM SHREGENUM_FLAGS}
  SHREGENUM_FLAGS = DWORD;
  TSHRegEnumFlags = DWORD;

const
  {$EXTERNALSYM SHREGENUM_DEFAULT}
  SHREGENUM_DEFAULT = $00000000;   // Enumerates HKCU or HKLM if not found.
  {$EXTERNALSYM SHREGENUM_HKCU}
  SHREGENUM_HKCU    = $00000001;   // Enumerates HKCU only
  {$EXTERNALSYM SHREGENUM_HKLM}
  SHREGENUM_HKLM    = $00000010;   // Enumerates HKLM only.
  {$EXTERNALSYM SHREGENUM_BOTH}
  SHREGENUM_BOTH    = $00000011;   // Enumerates both HKCU and HKLM without duplicates.
                                   // This option is NYI.

  {$EXTERNALSYM SHREGSET_HKCU}
  SHREGSET_HKCU           = $00000001;       // Write to HKCU if empty.
  {$EXTERNALSYM SHREGSET_FORCE_HKCU}
  SHREGSET_FORCE_HKCU     = $00000002;       // Write to HKCU.
  {$EXTERNALSYM SHREGSET_HKLM}
  SHREGSET_HKLM           = $00000004;       // Write to HKLM if empty.
  {$EXTERNALSYM SHREGSET_FORCE_HKLM}
  SHREGSET_FORCE_HKLM     = $00000008;       // Write to HKLM.
  {$EXTERNALSYM SHREGSET_DEFAULT}
  SHREGSET_DEFAULT        = SHREGSET_FORCE_HKCU or SHREGSET_HKLM; // Default is SHREGSET_FORCE_HKCU or SHREGSET_HKLM.

type
  // HUSKEY is a Handle to a User Specific KEY.
  PHUSkey = ^THUSKey;
  {$EXTERNALSYM HUSKEY}
  HUSKEY = THandle;
  THUSKey = HUSKEY;

{$EXTERNALSYM SHRegCreateUSKeyA}
function SHRegCreateUSKeyA(pszPath: PAnsiChar; samDesired: REGSAM; hRelativeUSKey: THUSKey; var phNewUSKey: THUSKey; dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM SHRegCreateUSKeyW}
function SHRegCreateUSKeyW(pwzPath: PWideChar; samDesired: REGSAM; hRelativeUSKey: THUSKey; var phNewUSKey: THUSKey; dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM SHRegCreateUSKey}
function SHRegCreateUSKey(pszPath: PTSTR; samDesired: REGSAM; hRelativeUSKey: THUSKey; var phNewUSKey: THUSKey; dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM SHRegOpenUSKeyA}
function SHRegOpenUSKeyA(pszPath: PAnsiChar; samDesired: REGSAM; hRelativeUSKey: THUSKey; var phNewUSKey: THUSKey; fIgnoreHKCU: BOOL): Longint; stdcall;
{$EXTERNALSYM SHRegOpenUSKeyW}
function SHRegOpenUSKeyW(pwzPath: PWideChar; samDesired: REGSAM; hRelativeUSKey: THUSKey; var phNewUSKey: THUSKey; fIgnoreHKCU: BOOL): Longint; stdcall;
{$EXTERNALSYM SHRegOpenUSKey}
function SHRegOpenUSKey(pszPath: PTSTR; samDesired: REGSAM; hRelativeUSKey: THUSKey; var phNewUSKey: THUSKey; fIgnoreHKCU: BOOL): Longint; stdcall;
{$EXTERNALSYM SHRegQueryUSValueA}
function SHRegQueryUSValueA(hUSKey: THUSKey; pszValue: PAnsiChar; var pdwType: DWORD; pvData: Pointer; var pcbData: DWORD; fIgnoreHKCU: BOOL; pvDefaultData: Pointer; dwDefaultDataSize: DWORD): Longint; stdcall;
{$EXTERNALSYM SHRegQueryUSValueW}
function SHRegQueryUSValueW(hUSKey: THUSKey; pwzValue: PWideChar; var pdwType: DWORD; pvData: Pointer; var pcbData: DWORD; fIgnoreHKCU: BOOL; pvDefaultData: Pointer; dwDefaultDataSize: DWORD): Longint; stdcall;
{$EXTERNALSYM SHRegQueryUSValue}
function SHRegQueryUSValue(hUSKey: THUSKey; pszValue: PTSTR; var pdwType: DWORD; pvData: Pointer; var pcbData: DWORD; fIgnoreHKCU: BOOL; pvDefaultData: Pointer; dwDefaultDataSize: DWORD): Longint; stdcall;
{$EXTERNALSYM SHRegWriteUSValueA}
function SHRegWriteUSValueA(hUSKey: THUSKey; pszValue: PAnsiChar; dwType: DWORD; pvData: Pointer; cbData, dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM SHRegWriteUSValueW}
function SHRegWriteUSValueW(hUSKey: THUSKey; pwzValue: PWideChar; dwType: DWORD; pvData: Pointer; cbData, dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM SHRegWriteUSValue}
function SHRegWriteUSValue(hUSKey: THUSKey; pszValue: PTSTR; dwType: DWORD; pvData: Pointer; cbData, dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM SHRegDeleteUSValueA}
function SHRegDeleteUSValueA(hUSKey: THUSKey; pszValue: PAnsiChar; delRegFlags: TSHRegDelFlags): Longint; stdcall;
{$EXTERNALSYM SHRegDeleteUSValueW}
function SHRegDeleteUSValueW(hUSKey: THUSKey; pwzValue: PWideChar; delRegFlags: TSHRegDelFlags): Longint; stdcall;
{$EXTERNALSYM SHRegDeleteUSValue}
function SHRegDeleteUSValue(hUSKey: THUSKey; pszValue: PTSTR; delRegFlags: TSHRegDelFlags): Longint; stdcall;
{$EXTERNALSYM SHRegDeleteEmptyUSKeyW}
function SHRegDeleteEmptyUSKeyW(hUSKey: THUSKey; pwzSubKey: PWideChar; delRegFlags: TSHRegDelFlags): Longint; stdcall;
{$EXTERNALSYM SHRegDeleteEmptyUSKeyA}
function SHRegDeleteEmptyUSKeyA(hUSKey: THUSKey; pszSubKey: PAnsiChar; delRegFlags: TSHRegDelFlags): Longint; stdcall;
{$EXTERNALSYM SHRegDeleteEmptyUSKey}
function SHRegDeleteEmptyUSKey(hUSKey: THUSKey; pszSubKey: PTSTR; delRegFlags: TSHRegDelFlags): Longint; stdcall;
{$EXTERNALSYM SHRegEnumUSKeyA}
function SHRegEnumUSKeyA(hUSKey: THUSKey; dwIndex: DWORD; pszName: PAnsiChar; var pcchName: DWORD; enumRegFlags: TSHRegEnumFlags): Longint; stdcall;
{$EXTERNALSYM SHRegEnumUSKeyW}
function SHRegEnumUSKeyW(hUSKey: THUSKey; dwIndex: DWORD; pwzName: PWideChar; var pcchName: DWORD; enumRegFlags: TSHRegEnumFlags): Longint; stdcall;
{$EXTERNALSYM SHRegEnumUSKey}
function SHRegEnumUSKey(hUSKey: THUSKey; dwIndex: DWORD; pszName: PTSTR; var pcchName: DWORD; enumRegFlags: TSHRegEnumFlags): Longint; stdcall;
{$EXTERNALSYM SHRegEnumUSValueA}
function SHRegEnumUSValueA(hUSkey: THUSKey; dwIndex: DWORD; pszValueName: PAnsiChar; var pcchValueName, pdwType: DWORD; pvData: Pointer; var pcbData: DWORD; enumRegFlags: TSHRegEnumFlags): Longint; stdcall;
{$EXTERNALSYM SHRegEnumUSValueW}
function SHRegEnumUSValueW(hUSkey: THUSKey; dwIndex: DWORD; pszValueName: PWideChar; var pcchValueName, pdwType: DWORD; pvData: Pointer; var pcbData: DWORD; enumRegFlags: TSHRegEnumFlags): Longint; stdcall;
{$EXTERNALSYM SHRegEnumUSValue}
function SHRegEnumUSValue(hUSkey: THUSKey; dwIndex: DWORD; pszValueName: PTSTR; var pcchValueName, pdwType: DWORD; pvData: Pointer; var pcbData: DWORD; enumRegFlags: TSHRegEnumFlags): Longint; stdcall;
{$EXTERNALSYM SHRegQueryInfoUSKeyA}
function SHRegQueryInfoUSKeyA(hUSKey: THUSKey; var pcSubKeys, pcchMaxSubKeyLen, pcValues, pcchMaxValueNameLen: DWORD; enumRegFlags: TSHRegEnumFlags): Longint; stdcall;
{$EXTERNALSYM SHRegQueryInfoUSKeyW}
function SHRegQueryInfoUSKeyW(hUSKey: THUSKey; var pcSubKeys, pcchMaxSubKeyLen, pcValues, pcchMaxValueNameLen: DWORD; enumRegFlags: TSHRegEnumFlags): Longint; stdcall;
{$EXTERNALSYM SHRegQueryInfoUSKey}
function SHRegQueryInfoUSKey(hUSKey: THUSKey; var pcSubKeys, pcchMaxSubKeyLen, pcValues, pcchMaxValueNameLen: DWORD; enumRegFlags: TSHRegEnumFlags): Longint; stdcall;
{$EXTERNALSYM SHRegCloseUSKey}
function SHRegCloseUSKey(hUSKey: THUSKey): Longint; stdcall;


// These calls are equal to an SHRegOpenUSKey, SHRegQueryUSValue, and then a SHRegCloseUSKey.
{$EXTERNALSYM SHRegGetUSValueA}
function SHRegGetUSValueA(pszSubKey, pszValue: PAnsiChar; var pdwType: DWORD; pvData: Pointer; var pcbData: DWORD; fIgnoreHKCU: BOOL; pvDefaultData: Pointer; dwDefaultDataSize: DWORD): Longint; stdcall;
{$EXTERNALSYM SHRegGetUSValueW}
function SHRegGetUSValueW(pwzSubKey, pwzValue: PWideChar; var pdwType: DWORD; pvData: Pointer; var pcbData: DWORD; fIgnoreHKCU: BOOL; pvDefaultData: Pointer; dwDefaultDataSize: DWORD): Longint; stdcall;
{$EXTERNALSYM SHRegGetUSValue}
function SHRegGetUSValue(pszSubKey, pszValue: PTSTR; var pdwType: DWORD; pvData: Pointer; var pcbData: DWORD; fIgnoreHKCU: BOOL; pvDefaultData: Pointer; dwDefaultDataSize: DWORD): Longint; stdcall;
{$EXTERNALSYM SHRegSetUSValueA}
function SHRegSetUSValueA(pszSubKey, pszValue: PAnsiChar; dwType: DWORD; pvData: Pointer; cbData, dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM SHRegSetUSValueW}
function SHRegSetUSValueW(pwzSubKey, pwzValue: PWideChar; dwType: DWORD; pvData: Pointer; cbData, dwFlags: DWORD): Longint; stdcall;
{$EXTERNALSYM SHRegSetUSValue}
function SHRegSetUSValue(pszSubKey, pszValue: PTSTR; dwType: DWORD; pvData: Pointer; cbData, dwFlags: DWORD): Longint; stdcall;


{$EXTERNALSYM SHRegGetIntW}
function SHRegGetIntW(hk: HKEY; pwzKey: PWideChar; iDefault: Integer): Integer stdcall;
{$EXTERNALSYM SHRegGetInt}
function SHRegGetInt(hk: HKEY; pwzKey: PWideChar; iDefault: Integer): Integer stdcall;

{$EXTERNALSYM SHRegGetBoolUSValueA}
function SHRegGetBoolUSValueA(pszSubKey, pszValue: PAnsiChar; fIgnoreHKCU, fDefault: BOOL): BOOL; stdcall;
{$EXTERNALSYM SHRegGetBoolUSValueW}
function SHRegGetBoolUSValueW(pszSubKey, pszValue: PWideChar; fIgnoreHKCU, fDefault: BOOL): BOOL; stdcall;
{$EXTERNALSYM SHRegGetBoolUSValue}
function SHRegGetBoolUSValue(pszSubKey, pszValue: PTSTR; fIgnoreHKCU, fDefault: BOOL): BOOL; stdcall;

//
//  Association APIs
//
//  these APIs are to assist in accessing the data in HKCR
//  getting the Command strings and exe paths
//  for different verbs and extensions are simplified this way
//

const
  {$EXTERNALSYM ASSOCF_INIT_NOREMAPCLSID}
  ASSOCF_INIT_NOREMAPCLSID    = $00000001;   //  do not remap clsids to progids
  {$EXTERNALSYM ASSOCF_INIT_BYEXENAME}
  ASSOCF_INIT_BYEXENAME       = $00000002;   //  executable is being passed in
  {$EXTERNALSYM ASSOCF_OPEN_BYEXENAME}
  ASSOCF_OPEN_BYEXENAME       = $00000002;   //  executable is being passed in
  {$EXTERNALSYM ASSOCF_INIT_DEFAULTTOSTAR}
  ASSOCF_INIT_DEFAULTTOSTAR   = $00000004;   //  treat "*" as the BaseClass
  {$EXTERNALSYM ASSOCF_INIT_DEFAULTTOFOLDER}
  ASSOCF_INIT_DEFAULTTOFOLDER = $00000008;   //  treat "Folder" as the BaseClass
  {$EXTERNALSYM ASSOCF_NOUSERSETTINGS}
  ASSOCF_NOUSERSETTINGS       = $00000010;   //  dont use HKCU
  {$EXTERNALSYM ASSOCF_NOTRUNCATE}
  ASSOCF_NOTRUNCATE           = $00000020;   //  dont truncate the return string
  {$EXTERNALSYM ASSOCF_VERIFY}
  ASSOCF_VERIFY               = $00000040;   //  verify data is accurate (DISK HITS)
  {$EXTERNALSYM ASSOCF_REMAPRUNDLL}
  ASSOCF_REMAPRUNDLL          = $00000080;   //  actually gets info about rundlls target if applicable
  {$EXTERNALSYM ASSOCF_NOFIXUPS}
  ASSOCF_NOFIXUPS             = $00000100;   //  attempt to fix errors if found
  {$EXTERNALSYM ASSOCF_IGNOREBASECLASS}
  ASSOCF_IGNOREBASECLASS      = $00000200;   //  dont recurse into the baseclass

type
  {$EXTERNALSYM ASSOCF}
  ASSOCF = DWORD;
  TAssocF = ASSOCF;

  {$EXTERNALSYM ASSOCSTR}
  ASSOCSTR = DWORD;
  TAssocStr = DWORD;

const
  {$EXTERNALSYM ASSOCSTR_COMMAND}
  ASSOCSTR_COMMAND         = 1;  //  shell\verb\command string
  {$EXTERNALSYM ASSOCSTR_EXECUTABLE}
  ASSOCSTR_EXECUTABLE      = 2;  //  the executable part of command string
  {$EXTERNALSYM ASSOCSTR_FRIENDLYDOCNAME}
  ASSOCSTR_FRIENDLYDOCNAME = 3;  //  friendly name of the document type
  {$EXTERNALSYM ASSOCSTR_FRIENDLYAPPNAME}
  ASSOCSTR_FRIENDLYAPPNAME = 4;  //  friendly name of executable
  {$EXTERNALSYM ASSOCSTR_NOOPEN}
  ASSOCSTR_NOOPEN          = 5;  //  noopen value
  {$EXTERNALSYM ASSOCSTR_SHELLNEWVALUE}
  ASSOCSTR_SHELLNEWVALUE   = 6;  //  query values under the shellnew key
  {$EXTERNALSYM ASSOCSTR_DDECOMMAND}
  ASSOCSTR_DDECOMMAND      = 7;  //  template for DDE commands
  {$EXTERNALSYM ASSOCSTR_DDEIFEXEC}
  ASSOCSTR_DDEIFEXEC       = 8;  //  DDECOMMAND to use if just create a process
  {$EXTERNALSYM ASSOCSTR_DDEAPPLICATION}
  ASSOCSTR_DDEAPPLICATION  = 9;  //  Application name in DDE broadcast
  {$EXTERNALSYM ASSOCSTR_DDETOPIC}
  ASSOCSTR_DDETOPIC        = 10; //  Topic Name in DDE broadcast
  {$EXTERNALSYM ASSOCSTR_INFOTIP}
  ASSOCSTR_INFOTIP         = 11; //  info tip for an item or list of properties to create info tip from
  {$EXTERNALSYM ASSOCSTR_QUICKTIP}
  ASSOCSTR_QUICKTIP        = 12; //  same as ASSOCSTR_INFOTIP except this list contains only quickly retrievable properties
  {$EXTERNALSYM ASSOCSTR_TILEINFO}
  ASSOCSTR_TILEINFO        = 13; //  similar to ASSOCSTR_INFOTIP - lists important properties for tileview
  {$EXTERNALSYM ASSOCSTR_CONTENTTYPE}
  ASSOCSTR_CONTENTTYPE     = 14; //  MIME Content type
  {$EXTERNALSYM ASSOCSTR_DEFAULTICON}
  ASSOCSTR_DEFAULTICON     = 15; //  Default icon source
  {$EXTERNALSYM ASSOCSTR_SHELLEXTENSION}
  ASSOCSTR_SHELLEXTENSION  = 16; //  Guid string pointing to the Shellex\Shellextensionhandler value.
  {$EXTERNALSYM ASSOCSTR_MAX}
  ASSOCSTR_MAX             = 17;

type
  {$EXTERNALSYM ASSOCKEY}
  ASSOCKEY = DWORD;
  TAssocKey = DWORD;

const
  {$EXTERNALSYM ASSOCKEY_SHELLEXECCLASS}
  ASSOCKEY_SHELLEXECCLASS = 1;  //  the key that should be passed to ShellExec(hkeyClass)
  {$EXTERNALSYM ASSOCKEY_APP}
  ASSOCKEY_APP            = 2;  //  the "Application" key for the association
  {$EXTERNALSYM ASSOCKEY_CLASS}
  ASSOCKEY_CLASS          = 3;  //  the progid or class key
  {$EXTERNALSYM ASSOCKEY_BASECLASS}
  ASSOCKEY_BASECLASS      = 4; //  the BaseClass key
  {$EXTERNALSYM ASSOCKEY_MAX}
  ASSOCKEY_MAX            = 5;

type
  {$EXTERNALSYM ASSOCDATA}
  ASSOCDATA = DWORD;
  TAssocData = DWORD;

const
  {$EXTERNALSYM ASSOCDATA_MSIDESCRIPTOR}
  ASSOCDATA_MSIDESCRIPTOR     = 1;  //  Component Descriptor to pass to MSI APIs
  {$EXTERNALSYM ASSOCDATA_NOACTIVATEHANDLER}
  ASSOCDATA_NOACTIVATEHANDLER = 2;  //  restrict attempts to activate window
  {$EXTERNALSYM ASSOCDATA_QUERYCLASSSTORE}
  ASSOCDATA_QUERYCLASSSTORE   = 3;  //  should check with the NT Class Store
  {$EXTERNALSYM ASSOCDATA_HASPERUSERASSOC}
  ASSOCDATA_HASPERUSERASSOC   = 4;  //  defaults to user specified association
  {$EXTERNALSYM ASSOCDATA_EDITFLAGS}
  ASSOCDATA_EDITFLAGS         = 5;  //  Edit flags.
  {$EXTERNALSYM ASSOCDATA_VALUE}
  ASSOCDATA_VALUE             = 6; //  use pszExtra as the Value name
  {$EXTERNALSYM ASSOCDATA_MAX}
  ASSOCDATA_MAX               = 7;

type
  {$EXTERNALSYM ASSOCENUM}
  ASSOCENUM = DWORD;
  TAssocEnum = DWORD;

const
  {$EXTERNALSYM ASSOCENUM_NONE}
  ASSOCENUM_NONE = 0;

type
  {$EXTERNALSYM IQueryAssociations}
  IQueryAssociations = interface(IUnknown)
  ['{C46CA590-3C3F-11D2-BEE6-0000F805CA57}']
    function Init(flags: TAssocF; pszAssoc: PWideChar; hkProgid: HKEY; hwnd: HWND): HResult; stdcall;
    function GetString(flags: TAssocF; str: TAssocStr; pszExtra, pszOut: PWideChar; out pcchOut: DWORD): HResult; stdcall;
    function GetKey(flags: TAssocF; key: TAssocKey; pszExtra: PWideChar; out phkeyOut: HKEY): HResult; stdcall;
    function GetData(flags: TAssocF; data: TAssocData; pszExtra: PWideChar; pvOut: Pointer; var pcbOut: DWORD): HResult; stdcall;
    function GetEnum(flags: TAssocF; assocenum: TAssocEnum; pszExtra: PWideChar; riid: TIID; out ppvOut: Pointer): HResult; stdcall;
  end;

{$EXTERNALSYM AssocCreate}
function AssocCreate(clsid: TCLSID; riid: TIID; out ppv: Pointer): HResult; stdcall;

//  wrappers for the interface
{$EXTERNALSYM AssocQueryStringA}
function AssocQueryStringA(flags: TAssocF; str: TAssocStr; pszAssoc, pszExtra, pszOut: PAnsiChar; var pcchOut: DWORD): HResult; stdcall;
{$EXTERNALSYM AssocQueryStringW}
function AssocQueryStringW(flags: TAssocF; str: TAssocStr; pszAssoc, pszExtra, pszOut: PWideChar; var pcchOut: DWORD): HResult; stdcall;
{$EXTERNALSYM AssocQueryString}
function AssocQueryString(flags: TAssocF; str: TAssocStr; pszAssoc, pszExtra, pszOut: PTSTR; var pcchOut: DWORD): HResult; stdcall;
{$EXTERNALSYM AssocQueryStringByKeyA}
function AssocQueryStringByKeyA(flags: TAssocF; str: TAssocStr; hkAssoc: HKEY; pszExtra, pszOut: PAnsiChar; var pcchOut: DWORD): HResult; stdcall;
{$EXTERNALSYM AssocQueryStringByKeyW}
function AssocQueryStringByKeyW(flags: TAssocF; str: TAssocStr; hkAssoc: HKEY; pszExtra, pszOut: PWideChar; var pcchOut: DWORD): HResult; stdcall;
{$EXTERNALSYM AssocQueryStringByKey}
function AssocQueryStringByKey(flags: TAssocF; str: TAssocStr; hkAssoc: HKEY; pszExtra, pszOut: PTSTR; var pcchOut: DWORD): HResult; stdcall;
{$EXTERNALSYM AssocQueryKeyA}
function AssocQueryKeyA(flags: TAssocF; key: TAssocKey; pszAssoc, pszExtra: PAnsiChar; var phkeyOut: HKEY): HResult; stdcall;
{$EXTERNALSYM AssocQueryKeyW}
function AssocQueryKeyW(flags: TAssocF; key: TAssocKey; pszAssoc, pszExtra: PWideChar; var phkeyOut: HKEY): HResult; stdcall;
{$EXTERNALSYM AssocQueryKey}
function AssocQueryKey(flags: TAssocF; key: TAssocKey; pszAssoc, pszExtra: PTSTR; var phkeyOut: HKEY): HResult; stdcall;

//  AssocIsDangerous() checks a file type to determine whether it is "Dangerous"
//      this maps to the IE download dialog's forcing a prompt to open or save.
//      dangerous file types should be handled more carefully than other file types.
//
//  Parameter:  pszAssoc - type to check.  may be an extension or progid.  (".exe" or "exefile" would both be valid)
//
//  Returns: TRUE if the file type is dangerous.
//
//  NOTES:
//
//      this API first checks a hardcoded list of known dangerous types.
//      then it checks the editflags for the file type looking for the FTA_AlwaysUnsafe bit.
//      then it checks Safer policies.
//

{$EXTERNALSYM AssocIsDangerous}
function AssocIsDangerous(pszAssoc: PWideChar): BOOL stdcall;

//  PERCEIVED types:

type
  {$EXTERNALSYM PERCEIVED}
  PERCEIVED = DWORD;
  TPerceived = DWORD;

const
  {$EXTERNALSYM PERCEIVED_TYPE_CUSTOM}
  PERCEIVED_TYPE_CUSTOM      = -3;
  {$EXTERNALSYM PERCEIVED_TYPE_UNSPECIFIED}
  PERCEIVED_TYPE_UNSPECIFIED = -2;
  {$EXTERNALSYM PERCEIVED_TYPE_FOLDER}
  PERCEIVED_TYPE_FOLDER      = -1;
  {$EXTERNALSYM PERCEIVED_TYPE_UNKNOWN}
  PERCEIVED_TYPE_UNKNOWN     = 0;
  {$EXTERNALSYM PERCEIVED_TYPE_TEXT}
  PERCEIVED_TYPE_TEXT        = 1;
  {$EXTERNALSYM PERCEIVED_TYPE_IMAGE}
  PERCEIVED_TYPE_IMAGE       = 2;
  {$EXTERNALSYM PERCEIVED_TYPE_AUDIO}
  PERCEIVED_TYPE_AUDIO       = 3;
  {$EXTERNALSYM PERCEIVED_TYPE_VIDEO}
  PERCEIVED_TYPE_VIDEO       = 4;
  {$EXTERNALSYM PERCEIVED_TYPE_COMPRESSED}
  PERCEIVED_TYPE_COMPRESSED  = 5;
  {$EXTERNALSYM PERCEIVED_TYPE_DOCUMENT}
  PERCEIVED_TYPE_DOCUMENT    = 6;
  {$EXTERNALSYM PERCEIVED_TYPE_SYSTEM}
  PERCEIVED_TYPE_SYSTEM      = 7;
  {$EXTERNALSYM PERCEIVED_TYPE_APPLICATION}
  PERCEIVED_TYPE_APPLICATION = 8;

type
  {$EXTERNALSYM PERCEIVEDFLAG}
  PERCEIVEDFLAG = DWORD;
  TPerceivedFlag = PERCEIVEDFLAG;

const
  {$EXTERNALSYM PERCEIVEDFLAG_UNDEFINED}
  PERCEIVEDFLAG_UNDEFINED     = $0000;
  {$EXTERNALSYM PERCEIVEDFLAG_SOFTCODED}
  PERCEIVEDFLAG_SOFTCODED     = $0001;
  {$EXTERNALSYM PERCEIVEDFLAG_HARDCODED}
  PERCEIVEDFLAG_HARDCODED     = $0002;
  {$EXTERNALSYM PERCEIVEDFLAG_NATIVESUPPORT}
  PERCEIVEDFLAG_NATIVESUPPORT = $0004;
  {$EXTERNALSYM PERCEIVEDFLAG_GDIPLUS}
  PERCEIVEDFLAG_GDIPLUS       = $0010;
  {$EXTERNALSYM PERCEIVEDFLAG_WMSDK}
  PERCEIVEDFLAG_WMSDK         = $0020;
  {$EXTERNALSYM PERCEIVEDFLAG_ZIPFOLDER}
  PERCEIVEDFLAG_ZIPFOLDER     = $0040;

  {$EXTERNALSYM AssocGetPerceivedType}
function AssocGetPerceivedType(pszExt: PWideChar; out ptype: TPerceived; out pflag: TPerceivedFlag; ppszType: PPWideChar): HResult stdcall;

//
//=============== Stream Routines ===================================
//

{$EXTERNALSYM SHOpenRegStreamA}
function SHOpenRegStreamA(hkey: HKEY; pszSubkey, pszValue: PAnsiChar; grfMode: DWORD): IStream; stdcall;
{$EXTERNALSYM SHOpenRegStreamW}
function SHOpenRegStreamW(hkey: HKEY; pszSubkey, pszValue: PWideChar; grfMode: DWORD): IStream; stdcall;
{$EXTERNALSYM SHOpenRegStream}
function SHOpenRegStream(hkey: HKEY; pszSubkey, pszValue: PTSTR; grfMode: DWORD): IStream; stdcall;
{$EXTERNALSYM SHOpenRegStream2A}
function SHOpenRegStream2A(hkey: HKEY; pszSubkey, pszValue: PAnsiChar; grfMode: DWORD): IStream; stdcall;
{$EXTERNALSYM SHOpenRegStream2W}
function SHOpenRegStream2W(hkey: HKEY; pszSubkey, pszValue: PWideChar; grfMode: DWORD): IStream; stdcall;
{$EXTERNALSYM SHOpenRegStream2}
function SHOpenRegStream2(hkey: HKEY; pszSubkey, pszValue: PTSTR; grfMode: DWORD): IStream; stdcall;

{$EXTERNALSYM SHCreateStreamOnFileA}
function SHCreateStreamOnFileA(pszFile: PAnsiChar; grfMode: DWORD; out ppstm: IStream): HResult; stdcall;
{$EXTERNALSYM SHCreateStreamOnFileW}
function SHCreateStreamOnFileW(pszFile: PWideChar; grfMode: DWORD; out ppstm: IStream): HResult; stdcall;
{$EXTERNALSYM SHCreateStreamOnFile}
function SHCreateStreamOnFile(pszFile: PTSTR; grfMode: DWORD; out ppstm: IStream): HResult; stdcall;

  {$EXTERNALSYM SHCreateStreamOnFileEx}
function SHCreateStreamOnFileEx(pszFile: PWideChar; grfMode, dwAttributes: DWORD; fCreate: BOOL; pstmTemplate: IStream; out ppstm: IStream): HResult stdcall;


//
//=============== HTTP helper Routines ===================================
//

{$EXTERNALSYM GetAcceptLanguagesA}
function GetAcceptLanguagesA(psz: PAnsiChar; var pcch: DWORD): HResult; stdcall;
{$EXTERNALSYM GetAcceptLanguagesW}
function GetAcceptLanguagesW(psz: PWideChar; var pcch: DWORD): HResult; stdcall;
{$EXTERNALSYM GetAcceptLanguages}
function GetAcceptLanguages(psz: PTSTR; var pcch: DWORD): HResult; stdcall;

const
  {$EXTERNALSYM SHGVSPB_PERUSER}
  SHGVSPB_PERUSER             = $00000001; // must have one of PERUSER or ALLUSERS
  {$EXTERNALSYM SHGVSPB_ALLUSERS}
  SHGVSPB_ALLUSERS            = $00000002;
  {$EXTERNALSYM SHGVSPB_PERFOLDER}
  SHGVSPB_PERFOLDER           = $00000004; // must have one of PERFOLDER ALLFOLDERS or INHERIT
  {$EXTERNALSYM SHGVSPB_ALLFOLDERS}
  SHGVSPB_ALLFOLDERS          = $00000008;
  {$EXTERNALSYM SHGVSPB_INHERIT}
  SHGVSPB_INHERIT             = $00000010;
  {$EXTERNALSYM SHGVSPB_ROAM}
  SHGVSPB_ROAM                = $00000020; // modifies the above
  {$EXTERNALSYM SHGVSPB_NOAUTODEFAULTS}
  SHGVSPB_NOAUTODEFAULTS      = $80000000; // turns off read delegation to more general property bags

  {$EXTERNALSYM SHGVSPB_FOLDER}
  SHGVSPB_FOLDER              = SHGVSPB_PERUSER or  SHGVSPB_PERFOLDER;
  {$EXTERNALSYM SHGVSPB_FOLDERNODEFAULTS}
  SHGVSPB_FOLDERNODEFAULTS    = SHGVSPB_PERUSER or SHGVSPB_PERFOLDER or SHGVSPB_NOAUTODEFAULTS;
  {$EXTERNALSYM SHGVSPB_USERDEFAULTS}
  SHGVSPB_USERDEFAULTS        = SHGVSPB_PERUSER or SHGVSPB_ALLFOLDERS;
  {$EXTERNALSYM SHGVSPB_GLOBALDEAFAULTS}
  SHGVSPB_GLOBALDEAFAULTS     = SHGVSPB_ALLUSERS or SHGVSPB_ALLFOLDERS;

  {$EXTERNALSYM SHGetViewStatePropertyBag}
function SHGetViewStatePropertyBag(pidl: PItemIDList; pszBagName: PWideChar; dwFlags: DWORD; riid: TIID; out ppv: Pointer): HResult; stdcall;

// Shared memory apis

{$EXTERNALSYM SHAllocShared}
function SHAllocShared(pvData: Pointer; dwSize, dwProcessId: DWORD): THandle; stdcall;
{$EXTERNALSYM SHFreeShared}
function SHFreeShared(hData: THandle; dwProcessId: DWORD): BOOL; stdcall;
{$EXTERNALSYM SHLockShared}
function SHLockShared(hData: THandle; dwProcessId: DWORD): Pointer; stdcall;
{$EXTERNALSYM SHUnlockShared}
function SHUnlockShared(pvData: Pointer): BOOL; stdcall;


// SHAutoComplete
//      hwndEdit - HWND of editbox, ComboBox or ComboBoxEx.
//      dwFlags - Flags to indicate what to AutoAppend or AutoSuggest for the editbox.
//
// WARNING:
//    Caller needs to have called CoInitialize() or OleInitialize()
//    and cannot call CoUninit/OleUninit until after
//    WM_DESTROY on hwndEdit.
//
//  dwFlags values:
const
  {$EXTERNALSYM SHACF_DEFAULT}
  SHACF_DEFAULT                   = $00000000;  // Currently (SHACF_FILESYSTEM | SHACF_URLALL)
  {$EXTERNALSYM SHACF_FILESYSTEM}
  SHACF_FILESYSTEM                = $00000001;  // This includes the File System as well as the rest of the shell (Desktop\My Computer\Control Panel\)
  {$EXTERNALSYM SHACF_URLHISTORY}
  SHACF_URLHISTORY                = $00000002;  // URLs in the User's History
  {$EXTERNALSYM SHACF_URLMRU}
  SHACF_URLMRU                    = $00000004;  // URLs in the User's Recently Used list.
  {$EXTERNALSYM SHACF_URLALL}
  SHACF_URLALL                    = SHACF_URLHISTORY or SHACF_URLMRU;
  {$EXTERNALSYM SHACF_USETAB}
  SHACF_USETAB                    = $00000008;  // Use the tab to move thru the autocomplete possibilities instead of to the next dialog/window control.
  {$EXTERNALSYM SHACF_FILESYS_ONLY}
  SHACF_FILESYS_ONLY              = $00000010;  // This includes the File System

  {$EXTERNALSYM SHACF_FILESYS_DIRS}
  SHACF_FILESYS_DIRS              = $00000020;  // Same as SHACF_FILESYS_ONLY except it only includes directories, UNC servers, and UNC server shares.

  {$EXTERNALSYM SHACF_AUTOSUGGEST_FORCE_ON}
  SHACF_AUTOSUGGEST_FORCE_ON      = $10000000;  // Ignore the registry default and force the feature on.
  {$EXTERNALSYM SHACF_AUTOSUGGEST_FORCE_OFF}
  SHACF_AUTOSUGGEST_FORCE_OFF     = $20000000;  // Ignore the registry default and force the feature off.
  {$EXTERNALSYM SHACF_AUTOAPPEND_FORCE_ON}
  SHACF_AUTOAPPEND_FORCE_ON       = $40000000;  // Ignore the registry default and force the feature on. (Also know as AutoComplete)
  {$EXTERNALSYM SHACF_AUTOAPPEND_FORCE_OFF}
  SHACF_AUTOAPPEND_FORCE_OFF      = $80000000;  // Ignore the registry default and force the feature off. (Also know as AutoComplete)

{$EXTERNALSYM SHAutoComplete}
function SHAutoComplete(hwndEdit: HWND; dwFlags: DWORD): HResult; stdcall;

{$EXTERNALSYM SHSetThreadRef}
function SHSetThreadRef(punk: IUnknown): HResult; stdcall;
{$EXTERNALSYM SHGetThreadRef}
function SHGetThreadRef(out ppunk: IUnknown): HResult; stdcall;

{$EXTERNALSYM SHSkipJunction}
function SHSkipJunction(pbc: IBindCtx; var pclsid: TCLSID): BOOL; stdcall;

 {$EXTERNALSYM SHCreateThreadRef}
function SHCreateThreadRef(var pcRef: Longint; out punk: IUnknown): HResult; stdcall;

const
  {$EXTERNALSYM CTF_INSIST}
  CTF_INSIST          = $00000001;      // SHCreateThread() dwFlags - call pfnThreadProc synchronously if CreateThread() fails
  {$EXTERNALSYM CTF_THREAD_REF}
  CTF_THREAD_REF      = $00000002;      // hold a reference to the creating thread
  {$EXTERNALSYM CTF_PROCESS_REF}
  CTF_PROCESS_REF     = $00000004;      // hold a reference to the creating process
  {$EXTERNALSYM CTF_COINIT}
  CTF_COINIT          = $00000008;      // init COM for the created thread
  {$EXTERNALSYM CTF_FREELIBANDEXIT}
  CTF_FREELIBANDEXIT  = $00000010;      // hold a ref to the DLL and call FreeLibraryAndExitThread() when done
  {$EXTERNALSYM CTF_REF_COUNTED}
  CTF_REF_COUNTED     = $00000020;      // thread supports ref counting via SHGetThreadRef() or CTF_THREAD_REF so that child threads can keep this thread alive
  {$EXTERNALSYM CTF_WAIT_ALLOWCOM}
  CTF_WAIT_ALLOWCOM   = $00000040;      // while waiting for pfnCallback, allow COM marshaling to the blocked calling thread

{$EXTERNALSYM SHCreateThread}
function SHCreateThread(pfnThreadProc: TThreadStartRoutine; pData: Pointer; dwFlags: DWORD; pfnCallback: TThreadStartRoutine): BOOL; stdcall;

{$EXTERNALSYM SHReleaseThreadRef}
function SHReleaseThreadRef: HResult; stdcall; // release a CTF_THREAD_REF reference earlier than the return of pfnThreadProc

//
//====== GDI helper functions  ================================================
//

{$EXTERNALSYM SHCreateShellPalette}
function SHCreateShellPalette(hdc: HDC): HPALETTE; stdcall;

{$EXTERNALSYM ColorRGBToHLS}
procedure ColorRGBToHLS(clrRGB: TColorRef; var pwHue, pwLuminance, pwSaturation: Word); stdcall;
{$EXTERNALSYM ColorHLSToRGB}
function ColorHLSToRGB(wHue, wLuminance, wSaturation: Word): TColorRef; stdcall;
{$EXTERNALSYM ColorAdjustLuma}
function ColorAdjustLuma(clrRGB: TColorRef; n: Integer; fScale: BOOL): TColorRef; stdcall;


//
//====== DllGetVersion  =======================================================
//

type
  PDLLVersionInfo = ^TDLLVersionInfo;
  {$EXTERNALSYM _DLLVERSIONINFO}
  _DLLVERSIONINFO = record
    cbSize: DWORD;
    dwMajorVersion: DWORD;                   // Major version
    dwMinorVersion: DWORD;                   // Minor version
    dwBuildNumber: DWORD;                    // Build number
    dwPlatformID: DWORD;                     // DLLVER_PLATFORM_*
  end;
  {$EXTERNALSYM DLLVERSIONINFO}
  DLLVERSIONINFO = _DLLVERSIONINFO;
  TDLLVersionInfo = _DLLVERSIONINFO;

// Platform IDs for DLLVERSIONINFO
const
  {$EXTERNALSYM DLLVER_PLATFORM_WINDOWS}
  DLLVER_PLATFORM_WINDOWS         = $00000001;      // Windows 95
  {$EXTERNALSYM DLLVER_PLATFORM_NT}
  DLLVER_PLATFORM_NT              = $00000002;      // Windows NT

type
  PDLLVersionInfo2 = ^TDLLVersionInfo2;
  {$EXTERNALSYM _DLLVERSIONINFO2}
  _DLLVERSIONINFO2 = record
    info1: TDLLVersionInfo;
    dwFlags: DWORD;                          // No flags currently defined
    ullVersion: Int64;                   // Encoded as:
                                             // Major 0xFFFF 0000 0000 0000
                                             // Minor 0x0000 FFFF 0000 0000
                                             // Build 0x0000 0000 FFFF 0000
                                             // QFE   0x0000 0000 0000 FFFF
  end;
  {$EXTERNALSYM DLLVERSIONINFO2}
  DLLVERSIONINFO2 = _DLLVERSIONINFO2;
  TDLLVersionInfo2 = _DLLVERSIONINFO2;

const
  {$EXTERNALSYM DLLVER_MAJOR_MASK}
  DLLVER_MAJOR_MASK                    = $FFFF000000000000;
  {$EXTERNALSYM DLLVER_MINOR_MASK}
  DLLVER_MINOR_MASK                    = $0000FFFF00000000;
  {$EXTERNALSYM DLLVER_BUILD_MASK}
  DLLVER_BUILD_MASK                    = $00000000FFFF0000;
  {$EXTERNALSYM DLLVER_QFE_MASK}
  DLLVER_QFE_MASK                      = $000000000000FFFF;

{$EXTERNALSYM MakeDLLVerULL}
function MakeDLLVerULL(major, minor, build, qfe: Word): Int64;


type
  // The caller should always GetProcAddress("DllGetVersion"), not
  // implicitly link to it.
  TDLLGetVersionProc = function(var DLLVersionInfo: TDLLVersionInfo): HResult stdcall;

  // DllInstall (to be implemented by self-installing DLLs)
  TDllInstall = function(bInstall: BOOL; pszCmdLine: PWideChar): HResult stdcall;

{$EXTERNALSYM IsInternetESCEnabled}
function IsInternetESCEnabled: BOOL stdcall;

{$IFDEF WINXP_UP}

//stOrM!------------------------------------------------------------------------------------------------------------------------------------------------

const
  MB_TIMEDOUT = 32000; 

function MessageBoxTimeOut(
      hWnd: HWND; lpText: PTSTR; lpCaption: PTSTR;
      uType: UINT; wLanguageId: WORD; dwMilliseconds: DWORD): Integer; stdcall;

function MessageBoxTimeOutA(
      hWnd: HWND; lpText: PAnsiChar; lpCaption: PAnsiChar;
      uType: UINT; wLanguageId: WORD; dwMilliseconds: DWORD): Integer; stdcall;

function MessageBoxTimeOutW(
      hWnd: HWND; lpText: PWideChar; lpCaption: PWideChar;
      uType: UINT; wLanguageId: WORD; dwMilliseconds: DWORD): Integer; stdcall;

//-------------------------------------------------------------------------------------------------------------------------------------------stOrM!
{$ENDIF WINXP_UP}

//stOrM!------------------------------------------------------------------------------------------------------------------------------------------

{$IFDEF WIN2000_UP}

function MessageBoxCheck(
      hWnd: HWND; lpText: PTSTR; lpCaption: PTSTR;
      uType: UINT;  Default: Integer; RegVal: PTSTR) : Integer; stdcall;

function MessageBoxCheckA(
      hWnd: HWND; lpText: PAnsiChar; lpCaption: PAnsiChar;
      uType: UINT;  Default: Integer; RegVal: PAnsiChar) : Integer; stdcall;


function MessageBoxCheckW(
      hWnd: HWND; lpText: PWideChar; lpCaption: PWideChar;
      uType: UINT;  Default: Integer; RegVal: PWideChar) : Integer; stdcall;

{$ENDIF WIN2000_UP}

//------------------------------------------------------------------------------------------------------------------------------------------stOrM!

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


// Macro functions
function StrIntlEqNA(s1, s2: PAnsiChar; nChar: Integer): BOOL;
begin
  Result := StrIsIntlEqualA(True, s1, s2, nChar);
end;

function StrIntlEqNW(s1, s2: PWideChar; nChar: Integer): BOOL;
begin
  Result := StrIsIntlEqualW(True, s1, s2, nChar);
end;

function StrIntlEqN(s1, s2: PTSTR; nChar: Integer): BOOL;
begin
  Result := {$IFDEF UNICODE}StrIsIntlEqualW{$ELSE}StrIsIntlEqualA{$ENDIF}(True, s1, s2, nChar);
end;

function StrIntlEqNIA(s1, s2: PAnsiChar; nChar: Integer): BOOL;
begin
  Result := StrIsIntlEqualA(False, s1, s2, nChar);
end;

function StrIntlEqNIW(s1, s2: PWideChar; nChar: Integer): BOOL;
begin
  Result := StrIsIntlEqualW(False, s1, s2, nChar);
end;

function StrIntlEqNI(s1, s2: PTSTR; nChar: Integer): BOOL;
begin
  Result := {$IFDEF UNICODE}StrIsIntlEqualW{$ELSE}StrIsIntlEqualA{$ENDIF}(False, s1, s2, nChar);
end;

function IntlStrEqNA(s1, s2: PAnsiChar; nChar: Integer): BOOL;
begin
  Result := IntlStrEqWorkerA(True, s1, s2, nChar);
end;

function IntlStrEqNW(s1, s2: PWideChar; nChar: Integer): BOOL;
begin
  Result := IntlStrEqWorkerW(True, s1, s2, nChar);
end;

function IntlStrEqN(s1, s2: PTSTR; nChar: Integer): BOOL;
begin
  Result := {$IFDEF UNICODE}IntlStrEqWorkerW{$ELSE}IntlStrEqWorkerA{$ENDIF}(True, s1, s2, nChar);
end;

function IntlStrEqNIA(s1, s2: PAnsiChar; nChar: Integer): BOOL;
begin
  Result := IntlStrEqWorkerA(False, s1, s2, nChar);
end;

function IntlStrEqNIW(s1, s2: PWideChar; nChar: Integer): BOOL;
begin
  Result := IntlStrEqWorkerW(False, s1, s2, nChar);
end;

function IntlStrEqNI(s1, s2: PTSTR; nChar: Integer): BOOL;
begin
  Result := {$IFDEF UNICODE}IntlStrEqWorkerW{$ELSE}IntlStrEqWorkerA{$ENDIF}(False, s1, s2, nChar);
end;

function PathIsHTMLFileA(pszPath: PAnsiChar): BOOL;
begin
  Result := PathIsContentTypeA(pszPath, SZ_CONTENTTYPE_HTMLA);
end;

function PathIsHTMLFileW(pszPath: PWideChar): BOOL;
begin
  Result := PathIsContentTypeW(pszPath, SZ_CONTENTTYPE_HTMLW);
end;

function PathIsHTMLFile(pszPath: PTSTR): BOOL;
begin
  Result := PathIsContentType(pszPath, SZ_CONTENTTYPE_HTML);
end;

function UrlIsFileUrlA(pszURL: PAnsiChar): BOOL;
begin
  Result := UrlIsA(pszURL, URLIS_FILEURL);
end;

function UrlIsFileUrlW(pszURL: PWideChar): BOOL;
begin
  Result := UrlIsW(pszURL, URLIS_FILEURL);
end;

function UrlIsFileUrl(pszURL: PTSTR): BOOL;
begin
  Result := {$IFDEF UNICODE}UrlIsW{$ELSE}UrlIsA{$ENDIF}(pszURL, URLIS_FILEURL);
end;

function UrlEscapeSpaces(pszUrl, pszEscaped: PTSTR; var pcchEscaped: DWORD): HResult;
begin
  Result := UrlCanonicalize(pszUrl, pszEscaped, pcchEscaped, URL_ESCAPE_SPACES_ONLY or URL_DONT_ESCAPE_EXTRA_INFO);
end;

function UrlUnescapeInPlace(pszUrl: PTSTR; dwFlags: DWORD): HResult;
begin
  Result := UrlUnescape(pszUrl, nil, nil, dwFlags or URL_UNESCAPE_INPLACE);
end;

function MakeDLLVerULL(major, minor, build, qfe: Word): Int64;
begin
  Result := Int64(major) shl 48 or
            Int64(minor) shl 32 or
            Int64(build) shl 16 or
            Int64(qfe);
end;


{$IFDEF DELPHI6_UP}
//only available as static
function wnsprintfA; external shlwapidll name 'wnsprintfA' delayed;
function wnsprintfW; external shlwapidll name 'wnsprintfW' delayed;
function wnsprintf; external shlwapidll name 'wnsprintf'+AWSuffix delayed;
{$ENDIF DELPHI6_UP}


function StrChrA; external shlwapidll name 'StrChrA' delayed;
function StrChrW; external shlwapidll name 'StrChrW' delayed;
function StrChr; external shlwapidll name 'StrChr'+AWSuffix;
function StrChrIA; external shlwapidll name 'StrChrIA' delayed;
function StrChrIW; external shlwapidll name 'StrChrIW' delayed;
function StrChrI; external shlwapidll name 'StrChrI'+AWSuffix;
function StrCmpNA; external shlwapidll name 'StrCmpNA' delayed;
function StrCmpNW; external shlwapidll name 'StrCmpNW' delayed;
function StrCmpN; external shlwapidll name 'StrCmpN'+AWSuffix;
function StrCmpNIA; external shlwapidll name 'StrCmpNIA' delayed;
function StrCmpNIW; external shlwapidll name 'StrCmpNIW' delayed;
function StrCmpNI; external shlwapidll name 'StrCmpNI'+AWSuffix;
function StrCSpnA; external shlwapidll name 'StrCSpnA' delayed;
function StrCSpnW; external shlwapidll name 'StrCSpnW' delayed;
function StrCSpn; external shlwapidll name 'StrCSpn'+AWSuffix;
function StrCSpnIA; external shlwapidll name 'StrCSpnIA' delayed;
function StrCSpnIW; external shlwapidll name 'StrCSpnIW' delayed;
function StrCSpnI; external shlwapidll name 'StrCSpnI'+AWSuffix;
function StrDupA; external shlwapidll name 'StrDupA' delayed;
function StrDupW; external shlwapidll name 'StrDupW' delayed;
function StrDup; external shlwapidll name 'StrDup'+AWSuffix;
function StrFormatByteSizeA; external shlwapidll name 'StrFormatByteSizeA' delayed;
function StrFormatByteSize64A; external shlwapidll name 'StrFormatByteSize64A' delayed;
function StrFormatByteSizeW; external shlwapidll name 'StrFormatByteSizeW' delayed;
function StrFormatByteSize; external shlwapidll name 'StrFormatByteSize'+AWSuffix;
function StrFormatByteSize64; external shlwapidll name 'StrFormatByteSize64A' delayed;
function StrFormatKBSizeW; external shlwapidll name 'StrFormatKBSizeW' delayed;
function StrFormatKBSizeA; external shlwapidll name 'StrFormatKBSizeA' delayed;
function StrFormatKBSize; external shlwapidll name 'StrFormatKBSize'+AWSuffix;
function StrFromTimeIntervalA; external shlwapidll name 'StrFromTimeIntervalA' delayed;
function StrFromTimeIntervalW; external shlwapidll name 'StrFromTimeIntervalW' delayed;
function StrFromTimeInterval; external shlwapidll name 'StrFromTimeInterval'+AWSuffix;
function StrIsIntlEqualA; external shlwapidll name 'StrIsIntlEqualA' delayed;
function StrIsIntlEqualW; external shlwapidll name 'StrIsIntlEqualW' delayed;
function StrIsIntlEqual; external shlwapidll name 'StrIsIntlEqual'+AWSuffix;
function StrNCatA; external shlwapidll name 'StrNCatA' delayed;
function StrNCatW; external shlwapidll name 'StrNCatW' delayed;
function StrNCat; external shlwapidll name 'StrNCat'+AWSuffix;
function StrPBrkA; external shlwapidll name 'StrPBrkA' delayed;
function StrPBrkW; external shlwapidll name 'StrPBrkW' delayed;
function StrPBrk; external shlwapidll name 'StrPBrk'+AWSuffix;
function StrRChrA; external shlwapidll name 'StrRChrA' delayed;
function StrRChrW; external shlwapidll name 'StrRChrW' delayed;
function StrRChr; external shlwapidll name 'StrRChr'+AWSuffix;
function StrRChrIA; external shlwapidll name 'StrRChrIA' delayed;
function StrRChrIW; external shlwapidll name 'StrRChrIW' delayed;
function StrRChrI; external shlwapidll name 'StrRChrI'+AWSuffix;
function StrRStrIA; external shlwapidll name 'StrRStrIA' delayed;
function StrRStrIW; external shlwapidll name 'StrRStrIW' delayed;
function StrRStrI; external shlwapidll name 'StrRStrI'+AWSuffix;
function StrSpnA; external shlwapidll name 'StrSpnA' delayed;
function StrSpnW; external shlwapidll name 'StrSpnW' delayed;
function StrSpn; external shlwapidll name 'StrSpn'+AWSuffix;
function StrStrA; external shlwapidll name 'StrStrA' delayed;
function StrStrW; external shlwapidll name 'StrStrW' delayed;
function StrStr; external shlwapidll name 'StrStr'+AWSuffix;
function StrStrIA; external shlwapidll name 'StrStrIA' delayed;
function StrStrIW; external shlwapidll name 'StrStrIW' delayed;
function StrStrI; external shlwapidll name 'StrStrI'+AWSuffix;
function StrToIntA; external shlwapidll name 'StrToIntA' delayed;
function StrToIntW; external shlwapidll name 'StrToIntW' delayed;
function StrToInt; external shlwapidll name 'StrToInt'+AWSuffix;
function StrToIntExA; external shlwapidll name 'StrToIntExA' delayed;
function StrToIntExW; external shlwapidll name 'StrToIntExW' delayed;
function StrToIntEx; external shlwapidll name 'StrToIntEx'+AWSuffix;
function StrTrimA; external shlwapidll name 'StrTrimA' delayed;
function StrTrimW; external shlwapidll name 'StrTrimW' delayed;
function StrTrim; external shlwapidll name 'StrTrim'+AWSuffix;
function StrCatW; external shlwapidll name 'StrCatW' delayed;
function StrCmpW; external shlwapidll name 'StrCmpW' delayed;
function StrCmpIW; external shlwapidll name 'StrCmpIW' delayed;
function StrCpyW; external shlwapidll name 'StrCpyW' delayed;
function StrCpyNW; external shlwapidll name 'StrCpyNW' delayed;
function StrCatBuffW; external shlwapidll name 'StrCatBuffW' delayed;
function StrCatBuffA; external shlwapidll name 'StrCatBuffA' delayed;
function StrCatBuff; external shlwapidll name 'StrCatBuff'+AWSuffix;
function ChrCmpIA; external shlwapidll name 'ChrCmpIA' delayed;
function ChrCmpIW; external shlwapidll name 'ChrCmpIW' delayed;
function ChrCmpI; external shlwapidll name 'ChrCmpI'+AWSuffix;
function wvnsprintfA; external shlwapidll name 'wvnsprintfA' delayed;
function wvnsprintfW; external shlwapidll name 'wvnsprintfW' delayed;
function wvnsprintf; external shlwapidll name 'wvnsprintf'+AWSuffix;
function StrRetToStrA; external shlwapidll name 'StrRetToStrA' delayed;
function StrRetToStrW; external shlwapidll name 'StrRetToStrW' delayed;
function StrRetToStr; external shlwapidll name 'StrRetToStr'+AWSuffix;
function StrRetToBufA; external shlwapidll name 'StrRetToBufA' delayed;
function StrRetToBufW; external shlwapidll name 'StrRetToBufW' delayed;
function StrRetToBuf; external shlwapidll name 'StrRetToBuf'+AWSuffix;
function StrRetToBSTR; external shlwapidll name 'StrRetToBSTR' delayed;
function SHStrDupA; external shlwapidll name 'SHStrDupA' delayed;
function SHStrDupW; external shlwapidll name 'SHStrDupW' delayed;
function SHStrDup; external shlwapidll name 'SHStrDup'+AWSuffix;
function StrCmpLogicalW; external shlwapidll name 'StrCmpLogicalW' delayed;
function StrCatChainW; external shlwapidll name 'StrCatChainW' delayed;
function SHLoadIndirectString; external shlwapidll name 'SHLoadIndirectString' delayed;
function IntlStrEqWorkerA; external shlwapidll name 'IntlStrEqWorkerA' delayed;
function IntlStrEqWorkerW; external shlwapidll name 'IntlStrEqWorkerW' delayed;

function StrToLong; external shlwapidll name 'StrToInt'+AWSuffix;

function StrCatA; external kernel32dll name 'lstrcatA' delayed;
function StrCmpA; external kernel32dll name 'lstrcmpA' delayed;
function StrCmpIA; external kernel32dll name 'lstrcmpiA' delayed;

function StrCpyA; external kernel32dll name 'lstrcpyA' delayed;
function StrCpyNA; external kernel32dll name 'lstrcpynA' delayed;

//function StrNCmp; external shlwapidll name 'lstrcmp'+AWSuffix;
//function StrNCmpI; external shlwapidll name 'lstrcmpi'+AWSuffix;
function StrNCpy; external kernel32dll name 'lstrcpyn'+AWSuffix;
//function StrCatN; external shlwapidll name 'lStrNCat'+AWSuffix;
function StrCat; external kernel32dll name 'lstrcat'+AWSuffix;
function StrCmp; external kernel32dll name 'lstrcmp'+AWSuffix;
function StrCmpI; external kernel32dll name 'lstrcmpi'+AWSuffix;
function StrCpy; external kernel32dll name 'lstrcpy'+AWSuffix;
function StrCpyN; external kernel32dll name 'lstrcpyn'+AWSuffix;


function PathAddBackslashA; external shlwapidll name 'PathAddBackslashA' delayed;
function PathAddBackslashW; external shlwapidll name 'PathAddBackslashW' delayed;
function PathAddBackslash; external shlwapidll name 'PathAddBackslash'+AWSuffix;
function PathAddExtensionA; external shlwapidll name 'PathAddExtensionA' delayed;
function PathAddExtensionW; external shlwapidll name 'PathAddExtensionW' delayed;
function PathAddExtension; external shlwapidll name 'PathAddExtension'+AWSuffix;
function PathAppendA; external shlwapidll name 'PathAppendA' delayed;
function PathAppendW; external shlwapidll name 'PathAppendW' delayed;
function PathAppend; external shlwapidll name 'PathAppend'+AWSuffix;
function PathBuildRootA; external shlwapidll name 'PathBuildRootA' delayed;
function PathBuildRootW; external shlwapidll name 'PathBuildRootW' delayed;
function PathBuildRoot; external shlwapidll name 'PathBuildRoot'+AWSuffix;
function PathCanonicalizeA; external shlwapidll name 'PathCanonicalizeA' delayed;
function PathCanonicalizeW; external shlwapidll name 'PathCanonicalizeW' delayed;
function PathCanonicalize; external shlwapidll name 'PathCanonicalize'+AWSuffix;
function PathCombineA; external shlwapidll name 'PathCombineA' delayed;
function PathCombineW; external shlwapidll name 'PathCombineW' delayed;
function PathCombine; external shlwapidll name 'PathCombine'+AWSuffix;
function PathCompactPathA; external shlwapidll name 'PathCompactPathA' delayed;
function PathCompactPathW; external shlwapidll name 'PathCompactPathW' delayed;
function PathCompactPath; external shlwapidll name 'PathCompactPath'+AWSuffix;
function PathCompactPathExA; external shlwapidll name 'PathCompactPathExA' delayed;
function PathCompactPathExW; external shlwapidll name 'PathCompactPathExW' delayed;
function PathCompactPathEx; external shlwapidll name 'PathCompactPathEx'+AWSuffix;
function PathCommonPrefixA; external shlwapidll name 'PathCommonPrefixA' delayed;
function PathCommonPrefixW; external shlwapidll name 'PathCommonPrefixW' delayed;
function PathCommonPrefix; external shlwapidll name 'PathCommonPrefix'+AWSuffix;
function PathFileExistsA; external shlwapidll name 'PathFileExistsA' delayed;
function PathFileExistsW; external shlwapidll name 'PathFileExistsW' delayed;
function PathFileExists; external shlwapidll name 'PathFileExists'+AWSuffix;
function PathFindExtensionA; external shlwapidll name 'PathFindExtensionA' delayed;
function PathFindExtensionW; external shlwapidll name 'PathFindExtensionW' delayed;
function PathFindExtension; external shlwapidll name 'PathFindExtension'+AWSuffix;
function PathFindFileNameA; external shlwapidll name 'PathFindFileNameA' delayed;
function PathFindFileNameW; external shlwapidll name 'PathFindFileNameW' delayed;
function PathFindFileName; external shlwapidll name 'PathFindFileName'+AWSuffix;
function PathFindNextComponentA; external shlwapidll name 'PathFindNextComponentA' delayed;
function PathFindNextComponentW; external shlwapidll name 'PathFindNextComponentW' delayed;
function PathFindNextComponent; external shlwapidll name 'PathFindNextComponent'+AWSuffix;
function PathFindOnPathA; external shlwapidll name 'PathFindOnPathA' delayed;
function PathFindOnPathW; external shlwapidll name 'PathFindOnPathW' delayed;
function PathFindOnPath; external shlwapidll name 'PathFindOnPath'+AWSuffix;
function PathGetArgsA; external shlwapidll name 'PathGetArgsA' delayed;
function PathGetArgsW; external shlwapidll name 'PathGetArgsW' delayed;
function PathGetArgs; external shlwapidll name 'PathGetArgs'+AWSuffix;
function PathFindSuffixArrayA; external shlwapidll name 'PathFindSuffixArrayA' delayed;
function PathFindSuffixArrayW; external shlwapidll name 'PathFindSuffixArrayW' delayed;
function PathFindSuffixArray; external shlwapidll name 'PathFindSuffixArray'+AWSuffix;
function PathIsLFNFileSpecA; external shlwapidll name 'PathIsLFNFileSpecA' delayed;
function PathIsLFNFileSpecW; external shlwapidll name 'PathIsLFNFileSpecW' delayed;
function PathIsLFNFileSpec; external shlwapidll name 'PathIsLFNFileSpec'+AWSuffix;
function PathGetCharTypeA; external shlwapidll name 'PathGetCharTypeA' delayed;
function PathGetCharTypeW; external shlwapidll name 'PathGetCharTypeW' delayed;
function PathGetCharType; external shlwapidll name 'PathGetCharType'+AWSuffix;
function PathGetDriveNumberA; external shlwapidll name 'PathGetDriveNumberA' delayed;
function PathGetDriveNumberW; external shlwapidll name 'PathGetDriveNumberW' delayed;
function PathGetDriveNumber; external shlwapidll name 'PathGetDriveNumber'+AWSuffix;
function PathIsDirectoryA; external shlwapidll name 'PathIsDirectoryA' delayed;
function PathIsDirectoryW; external shlwapidll name 'PathIsDirectoryW' delayed;
function PathIsDirectory; external shlwapidll name 'PathIsDirectory'+AWSuffix;
function PathIsDirectoryEmptyA; external shlwapidll name 'PathIsDirectoryEmptyA' delayed;
function PathIsDirectoryEmptyW; external shlwapidll name 'PathIsDirectoryEmptyW' delayed;
function PathIsDirectoryEmpty; external shlwapidll name 'PathIsDirectoryEmpty'+AWSuffix;
function PathIsFileSpecA; external shlwapidll name 'PathIsFileSpecA' delayed;
function PathIsFileSpecW; external shlwapidll name 'PathIsFileSpecW' delayed;
function PathIsFileSpec; external shlwapidll name 'PathIsFileSpec'+AWSuffix;
function PathIsPrefixA; external shlwapidll name 'PathIsPrefixA' delayed;
function PathIsPrefixW; external shlwapidll name 'PathIsPrefixW' delayed;
function PathIsPrefix; external shlwapidll name 'PathIsPrefix'+AWSuffix;
function PathIsRelativeA; external shlwapidll name 'PathIsRelativeA' delayed;
function PathIsRelativeW; external shlwapidll name 'PathIsRelativeW' delayed;
function PathIsRelative; external shlwapidll name 'PathIsRelative'+AWSuffix;
function PathIsRootA; external shlwapidll name 'PathIsRootA' delayed;
function PathIsRootW; external shlwapidll name 'PathIsRootW' delayed;
function PathIsRoot; external shlwapidll name 'PathIsRoot'+AWSuffix;
function PathIsSameRootA; external shlwapidll name 'PathIsSameRootA' delayed;
function PathIsSameRootW; external shlwapidll name 'PathIsSameRootW' delayed;
function PathIsSameRoot; external shlwapidll name 'PathIsSameRoot'+AWSuffix;
function PathIsUNCA; external shlwapidll name 'PathIsUNCA' delayed;
function PathIsUNCW; external shlwapidll name 'PathIsUNCW' delayed;
function PathIsUNC; external shlwapidll name 'PathIsUNC'+AWSuffix;
function PathIsNetworkPathA; external shlwapidll name 'PathIsNetworkPathA' delayed;
function PathIsNetworkPathW; external shlwapidll name 'PathIsNetworkPathW' delayed;
function PathIsNetworkPath; external shlwapidll name 'PathIsNetworkPath'+AWSuffix;
function PathIsUNCServerA; external shlwapidll name 'PathIsUNCServerA' delayed;
function PathIsUNCServerW; external shlwapidll name 'PathIsUNCServerW' delayed;
function PathIsUNCServer; external shlwapidll name 'PathIsUNCServer'+AWSuffix;
function PathIsUNCServerShareA; external shlwapidll name 'PathIsUNCServerShareA' delayed;
function PathIsUNCServerShareW; external shlwapidll name 'PathIsUNCServerShareW' delayed;
function PathIsUNCServerShare; external shlwapidll name 'PathIsUNCServerShare'+AWSuffix;
function PathIsContentTypeA; external shlwapidll name 'PathIsContentTypeA' delayed;
function PathIsContentTypeW; external shlwapidll name 'PathIsContentTypeW' delayed;
function PathIsContentType; external shlwapidll name 'PathIsContentType'+AWSuffix;
function PathIsURLA; external shlwapidll name 'PathIsURLA' delayed;
function PathIsURLW; external shlwapidll name 'PathIsURLW' delayed;
function PathIsURL; external shlwapidll name 'PathIsURL'+AWSuffix;
function PathMakePrettyA; external shlwapidll name 'PathMakePrettyA' delayed;
function PathMakePrettyW; external shlwapidll name 'PathMakePrettyW' delayed;
function PathMakePretty; external shlwapidll name 'PathMakePretty'+AWSuffix;
function PathMatchSpecA; external shlwapidll name 'PathMatchSpecA' delayed;
function PathMatchSpecW; external shlwapidll name 'PathMatchSpecW' delayed;
function PathMatchSpec; external shlwapidll name 'PathMatchSpec'+AWSuffix;
function PathParseIconLocationA; external shlwapidll name 'PathParseIconLocationA' delayed;
function PathParseIconLocationW; external shlwapidll name 'PathParseIconLocationW' delayed;
function PathParseIconLocation; external shlwapidll name 'PathParseIconLocation'+AWSuffix;
procedure PathQuoteSpacesA; external shlwapidll name 'PathQuoteSpacesA' delayed;
procedure PathQuoteSpacesW; external shlwapidll name 'PathQuoteSpacesW' delayed;
procedure PathQuoteSpaces; external shlwapidll name 'PathQuoteSpaces'+AWSuffix;
function PathRelativePathToA; external shlwapidll name 'PathRelativePathToA' delayed;
function PathRelativePathToW; external shlwapidll name 'PathRelativePathToW' delayed;
function PathRelativePathTo; external shlwapidll name 'PathRelativePathTo'+AWSuffix;
procedure PathRemoveArgsA; external shlwapidll name 'PathRemoveArgsA' delayed;
procedure PathRemoveArgsW; external shlwapidll name 'PathRemoveArgsW' delayed;
procedure PathRemoveArgs; external shlwapidll name 'PathRemoveArgs'+AWSuffix;
function PathRemoveBackslashA; external shlwapidll name 'PathRemoveBackslashA' delayed;
function PathRemoveBackslashW; external shlwapidll name 'PathRemoveBackslashW' delayed;
function PathRemoveBackslash; external shlwapidll name 'PathRemoveBackslash'+AWSuffix;
procedure PathRemoveBlanksA; external shlwapidll name 'PathRemoveBlanksA' delayed;
procedure PathRemoveBlanksW; external shlwapidll name 'PathRemoveBlanksW' delayed;
procedure PathRemoveBlanks; external shlwapidll name 'PathRemoveBlanks'+AWSuffix;
procedure PathRemoveExtensionA; external shlwapidll name 'PathRemoveExtensionA' delayed;
procedure PathRemoveExtensionW; external shlwapidll name 'PathRemoveExtensionW' delayed;
procedure PathRemoveExtension; external shlwapidll name 'PathRemoveExtension'+AWSuffix;
function PathRemoveFileSpecA; external shlwapidll name 'PathRemoveFileSpecA' delayed;
function PathRemoveFileSpecW; external shlwapidll name 'PathRemoveFileSpecW' delayed;
function PathRemoveFileSpec; external shlwapidll name 'PathRemoveFileSpec'+AWSuffix;
function PathRenameExtensionA; external shlwapidll name 'PathRenameExtensionA' delayed;
function PathRenameExtensionW; external shlwapidll name 'PathRenameExtensionW' delayed;
function PathRenameExtension; external shlwapidll name 'PathRenameExtension'+AWSuffix;
function PathSearchAndQualifyA; external shlwapidll name 'PathSearchAndQualifyA' delayed;
function PathSearchAndQualifyW; external shlwapidll name 'PathSearchAndQualifyW' delayed;
function PathSearchAndQualify; external shlwapidll name 'PathSearchAndQualify'+AWSuffix;
procedure PathSetDlgItemPathA; external shlwapidll name 'PathSetDlgItemPathA' delayed;
procedure PathSetDlgItemPathW; external shlwapidll name 'PathSetDlgItemPathW' delayed;
procedure PathSetDlgItemPath; external shlwapidll name 'PathSetDlgItemPath'+AWSuffix;
function PathSkipRootA; external shlwapidll name 'PathSkipRootA' delayed;
function PathSkipRootW; external shlwapidll name 'PathSkipRootW' delayed;
function PathSkipRoot; external shlwapidll name 'PathSkipRoot'+AWSuffix;
procedure PathStripPathA; external shlwapidll name 'PathStripPathA' delayed;
procedure PathStripPathW; external shlwapidll name 'PathStripPathW' delayed;
procedure PathStripPath; external shlwapidll name 'PathStripPath'+AWSuffix;
function PathStripToRootA; external shlwapidll name 'PathStripToRootA' delayed;
function PathStripToRootW; external shlwapidll name 'PathStripToRootW' delayed;
function PathStripToRoot; external shlwapidll name 'PathStripToRoot'+AWSuffix;
procedure PathUnquoteSpacesA; external shlwapidll name 'PathUnquoteSpacesA' delayed;
procedure PathUnquoteSpacesW; external shlwapidll name 'PathUnquoteSpacesW' delayed;
procedure PathUnquoteSpaces; external shlwapidll name 'PathUnquoteSpaces'+AWSuffix;
function PathMakeSystemFolderA; external shlwapidll name 'PathMakeSystemFolderA' delayed;
function PathMakeSystemFolderW; external shlwapidll name 'PathMakeSystemFolderW' delayed;
function PathMakeSystemFolder; external shlwapidll name 'PathMakeSystemFolder'+AWSuffix;
function PathUnmakeSystemFolderA; external shlwapidll name 'PathUnmakeSystemFolderA' delayed;
function PathUnmakeSystemFolderW; external shlwapidll name 'PathUnmakeSystemFolderW' delayed;
function PathUnmakeSystemFolder; external shlwapidll name 'PathUnmakeSystemFolder'+AWSuffix;
function PathIsSystemFolderA; external shlwapidll name 'PathIsSystemFolderA' delayed;
function PathIsSystemFolderW; external shlwapidll name 'PathIsSystemFolderW' delayed;
function PathIsSystemFolder; external shlwapidll name 'PathIsSystemFolder'+AWSuffix;
procedure PathUndecorateA; external shlwapidll name 'PathUndecorateA' delayed;
procedure PathUndecorateW; external shlwapidll name 'PathUndecorateW' delayed;
procedure PathUndecorate; external shlwapidll name 'PathUndecorate'+AWSuffix;
function PathUnExpandEnvStringsA; external shlwapidll name 'PathUnExpandEnvStringsA' delayed;
function PathUnExpandEnvStringsW; external shlwapidll name 'PathUnExpandEnvStringsW' delayed;
function PathUnExpandEnvStrings; external shlwapidll name 'PathUnExpandEnvStrings'+AWSuffix;
function UrlCompareA; external shlwapidll name 'UrlCompareA' delayed;
function UrlCompareW; external shlwapidll name 'UrlCompareW' delayed;
function UrlCompare; external shlwapidll name 'UrlCompare'+AWSuffix;
function UrlCombineA; external shlwapidll name 'UrlCombineA' delayed;
function UrlCombineW; external shlwapidll name 'UrlCombineW' delayed;
function UrlCombine; external shlwapidll name 'UrlCombine'+AWSuffix;
function UrlCanonicalizeA; external shlwapidll name 'UrlCanonicalizeA' delayed;
function UrlCanonicalizeW; external shlwapidll name 'UrlCanonicalizeW' delayed;
function UrlCanonicalize; external shlwapidll name 'UrlCanonicalize'+AWSuffix;
function UrlIsOpaqueA; external shlwapidll name 'UrlIsOpaqueA' delayed;
function UrlIsOpaqueW; external shlwapidll name 'UrlIsOpaqueW' delayed;
function UrlIsOpaque; external shlwapidll name 'UrlIsOpaque'+AWSuffix;
function UrlIsNoHistoryA; external shlwapidll name 'UrlIsNoHistoryA' delayed;
function UrlIsNoHistoryW; external shlwapidll name 'UrlIsNoHistoryW' delayed;
function UrlIsNoHistory; external shlwapidll name 'UrlIsNoHistory'+AWSuffix;
function UrlIsA; external shlwapidll name 'UrlIsA' delayed;
function UrlIsW; external shlwapidll name 'UrlIsW' delayed;
function UrlIs; external shlwapidll name 'UrlIs'+AWSuffix;
function UrlGetLocationA; external shlwapidll name 'UrlGetLocationA' delayed;
function UrlGetLocationW; external shlwapidll name 'UrlGetLocationW' delayed;
function UrlGetLocation; external shlwapidll name 'UrlGetLocation'+AWSuffix;
function UrlUnescapeA; external shlwapidll name 'UrlUnescapeA' delayed;
function UrlUnescapeW; external shlwapidll name 'UrlUnescapeW' delayed;
function UrlUnescape; external shlwapidll name 'UrlUnescape'+AWSuffix;
function UrlEscapeA; external shlwapidll name 'UrlEscapeA' delayed;
function UrlEscapeW; external shlwapidll name 'UrlEscapeW' delayed;
function UrlEscape; external shlwapidll name 'UrlEscape'+AWSuffix;
function UrlCreateFromPathA; external shlwapidll name 'UrlCreateFromPathA' delayed;
function UrlCreateFromPathW; external shlwapidll name 'UrlCreateFromPathW' delayed;
function UrlCreateFromPath; external shlwapidll name 'UrlCreateFromPath'+AWSuffix;
function PathCreateFromUrlA; external shlwapidll name 'PathCreateFromUrlA' delayed;
function PathCreateFromUrlW; external shlwapidll name 'PathCreateFromUrlW' delayed;
function PathCreateFromUrl; external shlwapidll name 'PathCreateFromUrl'+AWSuffix;
function UrlHashA; external shlwapidll name 'UrlHashA' delayed;
function UrlHashW; external shlwapidll name 'UrlHashW' delayed;
function UrlHash; external shlwapidll name 'UrlHash'+AWSuffix;
function UrlGetPartW; external shlwapidll name 'UrlGetPartW' delayed;
function UrlGetPartA; external shlwapidll name 'UrlGetPartA' delayed;
function UrlGetPart; external shlwapidll name 'UrlGetPart'+AWSuffix;
function UrlApplySchemeA; external shlwapidll name 'UrlApplySchemeA' delayed;
function UrlApplySchemeW; external shlwapidll name 'UrlApplySchemeW' delayed;
function UrlApplyScheme; external shlwapidll name 'UrlApplyScheme'+AWSuffix;
function HashData; external shlwapidll name 'HashData' delayed;
function SHDeleteEmptyKeyA; external shlwapidll name 'SHDeleteEmptyKeyA' delayed;
function SHDeleteEmptyKeyW; external shlwapidll name 'SHDeleteEmptyKeyW' delayed;
function SHDeleteEmptyKey; external shlwapidll name 'SHDeleteEmptyKey'+AWSuffix;
function SHDeleteKeyA; external shlwapidll name 'SHDeleteKeyA' delayed;
function SHDeleteKeyW; external shlwapidll name 'SHDeleteKeyW' delayed;
function SHDeleteKey; external shlwapidll name 'SHDeleteKey'+AWSuffix;
function SHRegDuplicateHKey; external shlwapidll name 'SHRegDuplicateHKey' delayed;
function SHDeleteValueA; external shlwapidll name 'SHDeleteValueA' delayed;
function SHDeleteValueW; external shlwapidll name 'SHDeleteValueW' delayed;
function SHDeleteValue; external shlwapidll name 'SHDeleteValue'+AWSuffix;
function SHGetValueA; external shlwapidll name 'SHGetValueA' delayed;
function SHGetValueW; external shlwapidll name 'SHGetValueW' delayed;
function SHGetValue; external shlwapidll name 'SHGetValue'+AWSuffix;
function SHSetValueA; external shlwapidll name 'SHSetValueA' delayed;
function SHSetValueW; external shlwapidll name 'SHSetValueW' delayed;
function SHSetValue; external shlwapidll name 'SHSetValue'+AWSuffix;
function SHQueryValueExA; external shlwapidll name 'SHQueryValueExA' delayed;
function SHQueryValueExW; external shlwapidll name 'SHQueryValueExW' delayed;
function SHQueryValueEx; external shlwapidll name 'SHQueryValueEx'+AWSuffix;
function SHEnumKeyExA; external shlwapidll name 'SHEnumKeyExA' delayed;
function SHEnumKeyExW; external shlwapidll name 'SHEnumKeyExW' delayed;
function SHEnumKeyEx; external shlwapidll name 'SHEnumKeyEx'+AWSuffix;
function SHEnumValueA; external shlwapidll name 'SHEnumValueA' delayed;
function SHEnumValueW; external shlwapidll name 'SHEnumValueW' delayed;
function SHEnumValue; external shlwapidll name 'SHEnumValue'+AWSuffix;
function SHQueryInfoKeyA; external shlwapidll name 'SHQueryInfoKeyA' delayed;
function SHQueryInfoKeyW; external shlwapidll name 'SHQueryInfoKeyW' delayed;
function SHQueryInfoKey; external shlwapidll name 'SHQueryInfoKey'+AWSuffix;
function SHCopyKeyA; external shlwapidll name 'SHCopyKeyA' delayed;
function SHCopyKeyW; external shlwapidll name 'SHCopyKeyW' delayed;
function SHCopyKey; external shlwapidll name 'SHCopyKey'+AWSuffix;
function SHRegGetPathA; external shlwapidll name 'SHRegGetPathA' delayed;
function SHRegGetPathW; external shlwapidll name 'SHRegGetPathW' delayed;
function SHRegGetPath; external shlwapidll name 'SHRegGetPath'+AWSuffix;
function SHRegSetPathA; external shlwapidll name 'SHRegSetPathA' delayed;
function SHRegSetPathW; external shlwapidll name 'SHRegSetPathW' delayed;
function SHRegSetPath; external shlwapidll name 'SHRegSetPath'+AWSuffix;
function SHRegCreateUSKeyA; external shlwapidll name 'SHRegCreateUSKeyA' delayed;
function SHRegCreateUSKeyW; external shlwapidll name 'SHRegCreateUSKeyW' delayed;
function SHRegCreateUSKey; external shlwapidll name 'SHRegCreateUSKey'+AWSuffix;
function SHRegOpenUSKeyA; external shlwapidll name 'SHRegOpenUSKeyA' delayed;
function SHRegOpenUSKeyW; external shlwapidll name 'SHRegOpenUSKeyW' delayed;
function SHRegOpenUSKey; external shlwapidll name 'SHRegOpenUSKey'+AWSuffix;
function SHRegQueryUSValueA; external shlwapidll name 'SHRegQueryUSValueA' delayed;
function SHRegQueryUSValueW; external shlwapidll name 'SHRegQueryUSValueW' delayed;
function SHRegQueryUSValue; external shlwapidll name 'SHRegQueryUSValue'+AWSuffix;
function SHRegWriteUSValueA; external shlwapidll name 'SHRegWriteUSValueA' delayed;
function SHRegWriteUSValueW; external shlwapidll name 'SHRegWriteUSValueW' delayed;
function SHRegWriteUSValue; external shlwapidll name 'SHRegWriteUSValue'+AWSuffix;
function SHRegDeleteUSValueA; external shlwapidll name 'SHRegDeleteUSValueA' delayed;
function SHRegDeleteUSValueW; external shlwapidll name 'SHRegDeleteUSValueW' delayed;
function SHRegDeleteUSValue; external shlwapidll name 'SHRegDeleteUSValue'+AWSuffix;
function SHRegDeleteEmptyUSKeyW; external shlwapidll name 'SHRegDeleteEmptyUSKeyW' delayed;
function SHRegDeleteEmptyUSKeyA; external shlwapidll name 'SHRegDeleteEmptyUSKeyA' delayed;
function SHRegDeleteEmptyUSKey; external shlwapidll name 'SHRegDeleteEmptyUSKey'+AWSuffix;
function SHRegEnumUSKeyA; external shlwapidll name 'SHRegEnumUSKeyA' delayed;
function SHRegEnumUSKeyW; external shlwapidll name 'SHRegEnumUSKeyW' delayed;
function SHRegEnumUSKey; external shlwapidll name 'SHRegEnumUSKey'+AWSuffix;
function SHRegEnumUSValueA; external shlwapidll name 'SHRegEnumUSValueA' delayed;
function SHRegEnumUSValueW; external shlwapidll name 'SHRegEnumUSValueW' delayed;
function SHRegEnumUSValue; external shlwapidll name 'SHRegEnumUSValue'+AWSuffix;
function SHRegQueryInfoUSKeyA; external shlwapidll name 'SHRegQueryInfoUSKeyA' delayed;
function SHRegQueryInfoUSKeyW; external shlwapidll name 'SHRegQueryInfoUSKeyW' delayed;
function SHRegQueryInfoUSKey; external shlwapidll name 'SHRegQueryInfoUSKey'+AWSuffix;
function SHRegCloseUSKey; external shlwapidll name 'SHRegCloseUSKey' delayed;
function SHRegGetUSValueA; external shlwapidll name 'SHRegGetUSValueA' delayed;
function SHRegGetUSValueW; external shlwapidll name 'SHRegGetUSValueW' delayed;
function SHRegGetUSValue; external shlwapidll name 'SHRegGetUSValue'+AWSuffix;
function SHRegSetUSValueA; external shlwapidll name 'SHRegSetUSValueA' delayed;
function SHRegSetUSValueW; external shlwapidll name 'SHRegSetUSValueW' delayed;
function SHRegSetUSValue; external shlwapidll name 'SHRegSetUSValue'+AWSuffix;
function SHRegGetBoolUSValueA; external shlwapidll name 'SHRegGetBoolUSValueA' delayed;
function SHRegGetBoolUSValueW; external shlwapidll name 'SHRegGetBoolUSValueW' delayed;
function SHRegGetBoolUSValue; external shlwapidll name 'SHRegGetBoolUSValue'+AWSuffix;
function AssocCreate; external shlwapidll name 'AssocCreate' delayed;
function AssocQueryStringA; external shlwapidll name 'AssocQueryStringA' delayed;
function AssocQueryStringW; external shlwapidll name 'AssocQueryStringW' delayed;
function AssocQueryString; external shlwapidll name 'AssocQueryString'+AWSuffix;
function AssocQueryStringByKeyA; external shlwapidll name 'AssocQueryStringByKeyA' delayed;
function AssocQueryStringByKeyW; external shlwapidll name 'AssocQueryStringByKeyW' delayed;
function AssocQueryStringByKey; external shlwapidll name 'AssocQueryStringByKey'+AWSuffix;
function AssocQueryKeyA; external shlwapidll name 'AssocQueryKeyA' delayed;
function AssocQueryKeyW; external shlwapidll name 'AssocQueryKeyW' delayed;
function AssocQueryKey; external shlwapidll name 'AssocQueryKey'+AWSuffix;
function SHOpenRegStreamA; external shlwapidll name 'SHOpenRegStream2A' delayed;
function SHOpenRegStreamW; external shlwapidll name 'SHOpenRegStream2W' delayed;
function SHOpenRegStream; external shlwapidll name 'SHOpenRegStream2'+AWSuffix;
function SHOpenRegStream2A; external shlwapidll name 'SHOpenRegStream2A' delayed;
function SHOpenRegStream2W; external shlwapidll name 'SHOpenRegStream2W' delayed;
function SHOpenRegStream2; external shlwapidll name 'SHOpenRegStream2'+AWSuffix;
function SHCreateStreamOnFileA; external shlwapidll name 'SHCreateStreamOnFileA' delayed;
function SHCreateStreamOnFileW; external shlwapidll name 'SHCreateStreamOnFileW' delayed;
function SHCreateStreamOnFile; external shlwapidll name 'SHCreateStreamOnFile'+AWSuffix;
function SHAutoComplete; external shlwapidll name 'SHAutoComplete' delayed;
function SHSetThreadRef; external shlwapidll name 'SHSetThreadRef' delayed;
function SHGetThreadRef; external shlwapidll name 'SHGetThreadRef' delayed;
function SHSkipJunction; external shlwapidll name 'SHSkipJunction' delayed;
function SHCreateThread; external shlwapidll name 'SHCreateThread' delayed;
function SHReleaseThreadRef; external shlwapidll name 'SHReleaseThreadRef' delayed;
function SHCreateShellPalette; external shlwapidll name 'SHCreateShellPalette' delayed;
procedure ColorRGBToHLS; external shlwapidll name 'ColorRGBToHLS' delayed;
function ColorHLSToRGB; external shlwapidll name 'ColorHLSToRGB' delayed;
function ColorAdjustLuma; external shlwapidll name 'ColorAdjustLuma' delayed;

function StrToInt64ExA; external shlwapidll name 'StrToInt64ExA' delayed;
function StrToInt64ExW; external shlwapidll name 'StrToInt64ExW' delayed;
function StrToInt64Ex; external shlwapidll name 'StrToInt64Ex'+AWSuffix;
function IsCharSpaceA; external shlwapidll name 'IsCharSpaceA' delayed;
function IsCharSpaceW; external shlwapidll name 'IsCharSpaceW' delayed;
function IsCharSpace; external shlwapidll name 'IsCharSpace'+AWSuffix;
function StrCmpCA; external shlwapidll name 'StrCmpCA' delayed;
function StrCmpCW; external shlwapidll name 'StrCmpCW' delayed;
function StrCmpC; external shlwapidll name 'StrCmpC'+AWSuffix;
function StrCmpICA; external shlwapidll name 'StrCmpICA' delayed;
function StrCmpICW; external shlwapidll name 'StrCmpICW' delayed;
function StrCmpIC; external shlwapidll name 'StrCmpIC'+AWSuffix;
function SHRegGetValueA; external shlwapidll name 'SHRegGetValueA' delayed;
function SHRegGetValueW; external shlwapidll name 'SHRegGetValueW' delayed;
function SHRegGetValue; external shlwapidll name 'SHRegGetValue'+AWSuffix;
function SHRegGetIntW; external shlwapidll name 'SHRegGetIntW' delayed;
function SHRegGetInt; external shlwapidll name 'SHRegGetIntW' delayed;
function AssocIsDangerous; external shlwapidll name 'AssocIsDangerous' delayed;
function AssocGetPerceivedType; external shlwapidll name 'AssocGetPerceivedType' delayed;
function SHCreateStreamOnFileEx; external shlwapidll name 'SHCreateStreamOnFileEx' delayed;
function GetAcceptLanguagesA; external shlwapidll name 'GetAcceptLanguagesA' delayed;
function GetAcceptLanguagesW; external shlwapidll name 'GetAcceptLanguagesW' delayed;
function GetAcceptLanguages; external shlwapidll name 'GetAcceptLanguages'+AWSuffix;
function SHGetViewStatePropertyBag; external shlwapidll name 'SHGetViewStatePropertyBag' delayed;
function SHAllocShared; external shlwapidll name 'SHAllocShared' delayed;
function SHFreeShared; external shlwapidll name 'SHFreeShared' delayed;
function SHLockShared; external shlwapidll name 'SHLockShared' delayed;
function SHUnlockShared; external shlwapidll name 'SHUnlockShared' delayed;
function SHCreateThreadRef; external shlwapidll name 'SHCreateThreadRef' delayed;
function IsInternetESCEnabled; external shlwapidll name 'IsInternetESCEnabled' delayed;

{$IFDEF WINXP_UP}
//stOrM!------------------------------------------------------------------------------------------------------------------------------------------

function MessageBoxTimeOut;  external user32 name 'MessageBoxTimeout'+AWSuffix;
function MessageBoxTimeOutA; external user32 name 'MessageBoxTimeoutA' delayed;
function MessageBoxTimeOutW; external user32 name 'MessageBoxTimeoutW' delayed;

//------------------------------------------------------------------------------------------------------------------------------------------stOrM!
{$ENDIF WINXP_UP}

//stOrM!------------------------------------------------------------------------------------------------------------------------------------------

{$IFDEF WIN2000_UP}

//function MessageBoxCheck, function MessageBoxCheckA, function MessageBoxCheckW

function MessageBoxCheck; external shlwapidll Index {$IFDEF UNICODE}191{$ELSE}185{$ENDIF UNICODE};
function MessageBoxCheckA; external shlwapidll Index 185; //'SHMessageBoxCheckA'
function MessageBoxCheckW; external shlwapidll Index 191; //'SHMessageBoxCheckW'

{$ENDIF WIN2000_UP}

//------------------------------------------------------------------------------------------------------------------------------------------stOrM!

{$ENDIF JWA_INTERFACESECTION}

{$IFNDEF JWA_OMIT_SECTIONS}

end.
{$ENDIF JWA_OMIT_SECTIONS}
