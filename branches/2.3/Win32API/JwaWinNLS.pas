{******************************************************************************}
{                                                                              }
{ National Language Support API interface Unit for Object Pascal               }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2001 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The original file is: winnls.h, released June 2000. The original Pascal      }
{ code is: WinNLS.pas, released December 2000. The initial developer of the    }
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

// $Id: JwaWinNLS.pas,v 1.12 2007/09/05 11:58:54 dezipaitor Exp $

{$IFNDEF JWA_OMIT_SECTIONS}
unit JwaWinNLS;

{$WEAKPACKAGEUNIT}
{$ENDIF JWA_OMIT_SECTIONS}

{$HPPEMIT ''}
{$HPPEMIT '#include "WinNls.h"'}
{$HPPEMIT ''}

{$IFNDEF JWA_OMIT_SECTIONS}

{$I ..\Includes\JediAPILib.inc}

interface

uses
  JwaWinType, JwaWinBase;
{$ENDIF JWA_OMIT_SECTIONS}
{$IFNDEF JWA_IMPLEMENTATIONSECTION}

////////////////////////////////////////////////////////////////////////////
//
//  Constants
//
//  Define all constants for the NLS component here.
//
////////////////////////////////////////////////////////////////////////////

//
//  String Length Maximums.
//

const

  MAX_LEADBYTES   = 12; // 5 ranges, 2 bytes ea., 0 term.
  {$EXTERNALSYM MAX_LEADBYTES}
  MAX_DEFAULTCHAR = 2; // single or double byte
  {$EXTERNALSYM MAX_DEFAULTCHAR}

//
//  MBCS and Unicode Translation Flags.
//

  MB_PRECOMPOSED       = $00000001; // use precomposed chars
  {$EXTERNALSYM MB_PRECOMPOSED}
  MB_COMPOSITE         = $00000002; // use composite chars
  {$EXTERNALSYM MB_COMPOSITE}
  MB_USEGLYPHCHARS     = $00000004; // use glyph chars, not ctrl chars
  {$EXTERNALSYM MB_USEGLYPHCHARS}
  MB_ERR_INVALID_CHARS = $00000008; // error for invalid chars
  {$EXTERNALSYM MB_ERR_INVALID_CHARS}

  WC_COMPOSITECHECK = $00000200; // convert composite to precomposed
  {$EXTERNALSYM WC_COMPOSITECHECK}
  WC_DISCARDNS      = $00000010; // discard non-spacing chars
  {$EXTERNALSYM WC_DISCARDNS}
  WC_SEPCHARS       = $00000020; // generate separate chars
  {$EXTERNALSYM WC_SEPCHARS}
  WC_DEFAULTCHAR    = $00000040; // replace w/ default AnsiChar
  {$EXTERNALSYM WC_DEFAULTCHAR}

  WC_NO_BEST_FIT_CHARS = $00000400; // do not use best fit chars
  {$EXTERNALSYM WC_NO_BEST_FIT_CHARS}

//
//  Character Type Flags.
//

  CT_CTYPE1 = $00000001; // ctype 1 information
  {$EXTERNALSYM CT_CTYPE1}
  CT_CTYPE2 = $00000002; // ctype 2 information
  {$EXTERNALSYM CT_CTYPE2}
  CT_CTYPE3 = $00000004; // ctype 3 information
  {$EXTERNALSYM CT_CTYPE3}

//
//  CType 1 Flag Bits.
//

  C1_UPPER  = $0001; // upper case
  {$EXTERNALSYM C1_UPPER}
  C1_LOWER  = $0002; // lower case
  {$EXTERNALSYM C1_LOWER}
  C1_DIGIT  = $0004; // decimal digits
  {$EXTERNALSYM C1_DIGIT}
  C1_SPACE  = $0008; // spacing characters
  {$EXTERNALSYM C1_SPACE}
  C1_PUNCT  = $0010; // punctuation characters
  {$EXTERNALSYM C1_PUNCT}
  C1_CNTRL  = $0020; // control characters
  {$EXTERNALSYM C1_CNTRL}
  C1_BLANK  = $0040; // blank characters
  {$EXTERNALSYM C1_BLANK}
  C1_XDIGIT = $0080; // other digits
  {$EXTERNALSYM C1_XDIGIT}
  C1_ALPHA  = $0100; // any linguistic character
  {$EXTERNALSYM C1_ALPHA}
  C1_DEFINED = $0200; // defined character
  {$EXTERNALSYM C1_DEFINED}

//
//  CType 2 Flag Bits.
//

  C2_LEFTTORIGHT = $0001; // left to right
  {$EXTERNALSYM C2_LEFTTORIGHT}
  C2_RIGHTTOLEFT = $0002; // right to left
  {$EXTERNALSYM C2_RIGHTTOLEFT}

  C2_EUROPENUMBER     = $0003; // European number, digit
  {$EXTERNALSYM C2_EUROPENUMBER}
  C2_EUROPESEPARATOR  = $0004; // European numeric separator
  {$EXTERNALSYM C2_EUROPESEPARATOR}
  C2_EUROPETERMINATOR = $0005; // European numeric terminator
  {$EXTERNALSYM C2_EUROPETERMINATOR}
  C2_ARABICNUMBER     = $0006; // Arabic number
  {$EXTERNALSYM C2_ARABICNUMBER}
  C2_COMMONSEPARATOR  = $0007; // common numeric separator
  {$EXTERNALSYM C2_COMMONSEPARATOR}

  C2_BLOCKSEPARATOR   = $0008; // block separator
  {$EXTERNALSYM C2_BLOCKSEPARATOR}
  C2_SEGMENTSEPARATOR = $0009; // segment separator
  {$EXTERNALSYM C2_SEGMENTSEPARATOR}
  C2_WHITESPACE       = $000A; // white space
  {$EXTERNALSYM C2_WHITESPACE}
  C2_OTHERNEUTRAL     = $000B; // other neutrals
  {$EXTERNALSYM C2_OTHERNEUTRAL}

  C2_NOTAPPLICABLE = $0000; // no implicit directionality
  {$EXTERNALSYM C2_NOTAPPLICABLE}

//
//  CType 3 Flag Bits.
//

  C3_NONSPACING = $0001; // nonspacing character
  {$EXTERNALSYM C3_NONSPACING}
  C3_DIACRITIC  = $0002; // diacritic mark
  {$EXTERNALSYM C3_DIACRITIC}
  C3_VOWELMARK  = $0004; // vowel mark
  {$EXTERNALSYM C3_VOWELMARK}
  C3_SYMBOL     = $0008; // symbols
  {$EXTERNALSYM C3_SYMBOL}

  C3_KATAKANA  = $0010; // katakana character
  {$EXTERNALSYM C3_KATAKANA}
  C3_HIRAGANA  = $0020; // hiragana character
  {$EXTERNALSYM C3_HIRAGANA}
  C3_HALFWIDTH = $0040; // half width character
  {$EXTERNALSYM C3_HALFWIDTH}
  C3_FULLWIDTH = $0080; // full width character
  {$EXTERNALSYM C3_FULLWIDTH}
  C3_IDEOGRAPH = $0100; // ideographic character
  {$EXTERNALSYM C3_IDEOGRAPH}
  C3_KASHIDA   = $0200; // Arabic kashida character
  {$EXTERNALSYM C3_KASHIDA}
  C3_LEXICAL   = $0400; // lexical character
  {$EXTERNALSYM C3_LEXICAL}

  C3_ALPHA = $8000; // any linguistic AnsiChar (C1_ALPHA)
  {$EXTERNALSYM C3_ALPHA}

  C3_NOTAPPLICABLE = $0000; // ctype 3 is not applicable
  {$EXTERNALSYM C3_NOTAPPLICABLE}

//
//  String Flags.
//

  NORM_IGNORECASE     = $00000001; // ignore case
  {$EXTERNALSYM NORM_IGNORECASE}
  NORM_IGNORENONSPACE = $00000002; // ignore nonspacing chars
  {$EXTERNALSYM NORM_IGNORENONSPACE}
  NORM_IGNORESYMBOLS  = $00000004; // ignore symbols
  {$EXTERNALSYM NORM_IGNORESYMBOLS}

  NORM_IGNOREKANATYPE = $00010000; // ignore kanatype
  {$EXTERNALSYM NORM_IGNOREKANATYPE}
  NORM_IGNOREWIDTH    = $00020000; // ignore width
  {$EXTERNALSYM NORM_IGNOREWIDTH}

//
//  Locale Independent Mapping Flags.
//

  MAP_FOLDCZONE   = $00000010; // fold compatibility zone chars
  {$EXTERNALSYM MAP_FOLDCZONE}
  MAP_PRECOMPOSED = $00000020; // convert to precomposed chars
  {$EXTERNALSYM MAP_PRECOMPOSED}
  MAP_COMPOSITE   = $00000040; // convert to composite chars
  {$EXTERNALSYM MAP_COMPOSITE}
  MAP_FOLDDIGITS  = $00000080; // all digits to ASCII 0-9
  {$EXTERNALSYM MAP_FOLDDIGITS}

  MAP_EXPAND_LIGATURES = $00002000; // expand all ligatures
  {$EXTERNALSYM MAP_EXPAND_LIGATURES}

//
//  Locale Dependent Mapping Flags.
//

  LCMAP_LOWERCASE = $00000100; // lower case letters
  {$EXTERNALSYM LCMAP_LOWERCASE}
  LCMAP_UPPERCASE = $00000200; // upper case letters
  {$EXTERNALSYM LCMAP_UPPERCASE}
  LCMAP_SORTKEY   = $00000400; // WC sort key (normalize)
  {$EXTERNALSYM LCMAP_SORTKEY}
  LCMAP_BYTEREV   = $00000800; // byte reversal
  {$EXTERNALSYM LCMAP_BYTEREV}

  LCMAP_HIRAGANA  = $00100000; // map katakana to hiragana
  {$EXTERNALSYM LCMAP_HIRAGANA}
  LCMAP_KATAKANA  = $00200000; // map hiragana to katakana
  {$EXTERNALSYM LCMAP_KATAKANA}
  LCMAP_HALFWIDTH = $00400000; // map double byte to single byte
  {$EXTERNALSYM LCMAP_HALFWIDTH}
  LCMAP_FULLWIDTH = $00800000; // map single byte to double byte
  {$EXTERNALSYM LCMAP_FULLWIDTH}

  LCMAP_LINGUISTIC_CASING = $01000000; // use linguistic rules for casing
  {$EXTERNALSYM LCMAP_LINGUISTIC_CASING}

  LCMAP_SIMPLIFIED_CHINESE  = $02000000; // map traditional chinese to simplified chinese
  {$EXTERNALSYM LCMAP_SIMPLIFIED_CHINESE}
  LCMAP_TRADITIONAL_CHINESE = $04000000; // map simplified chinese to traditional chinese
  {$EXTERNALSYM LCMAP_TRADITIONAL_CHINESE}

//
//  Language Group Enumeration Flags.
//

  LGRPID_INSTALLED = $00000001; // installed language group ids
  {$EXTERNALSYM LGRPID_INSTALLED}
  LGRPID_SUPPORTED = $00000002; // supported language group ids
  {$EXTERNALSYM LGRPID_SUPPORTED}


//
//  Locale Enumeration Flags.
//

  LCID_INSTALLED       = $00000001; // installed locale ids
  {$EXTERNALSYM LCID_INSTALLED}
  LCID_SUPPORTED       = $00000002; // supported locale ids
  {$EXTERNALSYM LCID_SUPPORTED}
  LCID_ALTERNATE_SORTS = $00000004; // alternate sort locale ids
  {$EXTERNALSYM LCID_ALTERNATE_SORTS}

//
//  Code Page Enumeration Flags.
//

  CP_INSTALLED = $00000001; // installed code page ids
  {$EXTERNALSYM CP_INSTALLED}
  CP_SUPPORTED = $00000002; // supported code page ids
  {$EXTERNALSYM CP_SUPPORTED}

//
//  Sorting Flags.
//
//    WORD Sort:    culturally correct sort
//                  hyphen and apostrophe are special cased
//                  example: "coop" and "co-op" will sort together in a list
//
//                        co_op     <-------  underscore (symbol)
//                        coat
//                        comb
//                        coop
//                        co-op     <-------  hyphen (punctuation)
//                        cork
//                        went
//                        were
//                        we're     <-------  apostrophe (punctuation)
//
//
//    STRING Sort:  hyphen and apostrophe will sort with all other symbols
//
//                        co-op     <-------  hyphen (punctuation)
//                        co_op     <-------  underscore (symbol)
//                        coat
//                        comb
//                        coop
//                        cork
//                        we're     <-------  apostrophe (punctuation)
//                        went
//                        were
//

  SORT_STRINGSORT = $00001000; // use string sort method
  {$EXTERNALSYM SORT_STRINGSORT}

//
//  Compare String Return Values.
//

  CSTR_LESS_THAN    = 1; // string 1 less than string 2
  {$EXTERNALSYM CSTR_LESS_THAN}
  CSTR_EQUAL        = 2; // string 1 equal to string 2
  {$EXTERNALSYM CSTR_EQUAL}
  CSTR_GREATER_THAN = 3; // string 1 greater than string 2
  {$EXTERNALSYM CSTR_GREATER_THAN}

//
//  Code Page Default Values.
//

  CP_ACP        = 0; // default to ANSI code page
  {$EXTERNALSYM CP_ACP}
  CP_OEMCP      = 1; // default to OEM  code page
  {$EXTERNALSYM CP_OEMCP}
  CP_MACCP      = 2; // default to MAC  code page
  {$EXTERNALSYM CP_MACCP}
  CP_THREAD_ACP = 3; // current thread's ANSI code page
  {$EXTERNALSYM CP_THREAD_ACP}
  CP_SYMBOL     = 42; // SYMBOL translations
  {$EXTERNALSYM CP_SYMBOL}

  CP_UTF7 = 65000; // UTF-7 translation
  {$EXTERNALSYM CP_UTF7}
  CP_UTF8 = 65001; // UTF-8 translation
  {$EXTERNALSYM CP_UTF8}

//
//  Country/Region Codes.
//

  CTRY_DEFAULT = 0;
  {$EXTERNALSYM CTRY_DEFAULT}

  CTRY_ALBANIA            = 355; // Albania
  {$EXTERNALSYM CTRY_ALBANIA}
  CTRY_ALGERIA            = 213; // Algeria
  {$EXTERNALSYM CTRY_ALGERIA}
  CTRY_ARGENTINA          = 54; // Argentina
  {$EXTERNALSYM CTRY_ARGENTINA}
  CTRY_ARMENIA            = 374; // Armenia
  {$EXTERNALSYM CTRY_ARMENIA}
  CTRY_AUSTRALIA          = 61; // Australia
  {$EXTERNALSYM CTRY_AUSTRALIA}
  CTRY_AUSTRIA            = 43; // Austria
  {$EXTERNALSYM CTRY_AUSTRIA}
  CTRY_AZERBAIJAN         = 994; // Azerbaijan
  {$EXTERNALSYM CTRY_AZERBAIJAN}
  CTRY_BAHRAIN            = 973; // Bahrain
  {$EXTERNALSYM CTRY_BAHRAIN}
  CTRY_BELARUS            = 375; // Belarus
  {$EXTERNALSYM CTRY_BELARUS}
  CTRY_BELGIUM            = 32; // Belgium
  {$EXTERNALSYM CTRY_BELGIUM}
  CTRY_BELIZE             = 501; // Belize
  {$EXTERNALSYM CTRY_BELIZE}
  CTRY_BOLIVIA            = 591; // Bolivia
  {$EXTERNALSYM CTRY_BOLIVIA}
  CTRY_BRAZIL             = 55; // Brazil
  {$EXTERNALSYM CTRY_BRAZIL}
  CTRY_BRUNEI_DARUSSALAM  = 673; // Brunei Darussalam
  {$EXTERNALSYM CTRY_BRUNEI_DARUSSALAM}
  CTRY_BULGARIA           = 359; // Bulgaria
  {$EXTERNALSYM CTRY_BULGARIA}
  CTRY_CANADA             = 2; // Canada
  {$EXTERNALSYM CTRY_CANADA}
  CTRY_CARIBBEAN          = 1; // Caribbean
  {$EXTERNALSYM CTRY_CARIBBEAN}
  CTRY_CHILE              = 56; // Chile
  {$EXTERNALSYM CTRY_CHILE}
  CTRY_COLOMBIA           = 57; // Colombia
  {$EXTERNALSYM CTRY_COLOMBIA}
  CTRY_COSTA_RICA         = 506; // Costa Rica
  {$EXTERNALSYM CTRY_COSTA_RICA}
  CTRY_CROATIA            = 385; // Croatia
  {$EXTERNALSYM CTRY_CROATIA}
  CTRY_CZECH              = 420; // Czech Republic
  {$EXTERNALSYM CTRY_CZECH}
  CTRY_DENMARK            = 45; // Denmark
  {$EXTERNALSYM CTRY_DENMARK}
  CTRY_DOMINICAN_REPUBLIC = 1; // Dominican Republic
  {$EXTERNALSYM CTRY_DOMINICAN_REPUBLIC}
  CTRY_ECUADOR            = 593; // Ecuador
  {$EXTERNALSYM CTRY_ECUADOR}
  CTRY_EGYPT              = 20; // Egypt
  {$EXTERNALSYM CTRY_EGYPT}
  CTRY_EL_SALVADOR        = 503; // El Salvador
  {$EXTERNALSYM CTRY_EL_SALVADOR}
  CTRY_ESTONIA            = 372; // Estonia
  {$EXTERNALSYM CTRY_ESTONIA}
  CTRY_FAEROE_ISLANDS     = 298; // Faeroe Islands
  {$EXTERNALSYM CTRY_FAEROE_ISLANDS}
  CTRY_FINLAND            = 358; // Finland
  {$EXTERNALSYM CTRY_FINLAND}
  CTRY_FRANCE             = 33; // France
  {$EXTERNALSYM CTRY_FRANCE}
  CTRY_GEORGIA            = 995; // Georgia
  {$EXTERNALSYM CTRY_GEORGIA}
  CTRY_GERMANY            = 49; // Germany
  {$EXTERNALSYM CTRY_GERMANY}
  CTRY_GREECE             = 30; // Greece
  {$EXTERNALSYM CTRY_GREECE}
  CTRY_GUATEMALA          = 502; // Guatemala
  {$EXTERNALSYM CTRY_GUATEMALA}
  CTRY_HONDURAS           = 504; // Honduras
  {$EXTERNALSYM CTRY_HONDURAS}
  CTRY_HONG_KONG          = 852; // Hong Kong S.A.R., P.R.C.
  {$EXTERNALSYM CTRY_HONG_KONG}
  CTRY_HUNGARY            = 36; // Hungary
  {$EXTERNALSYM CTRY_HUNGARY}
  CTRY_ICELAND            = 354; // Iceland
  {$EXTERNALSYM CTRY_ICELAND}
  CTRY_INDIA              = 91; // India
  {$EXTERNALSYM CTRY_INDIA}
  CTRY_INDONESIA          = 62; // Indonesia
  {$EXTERNALSYM CTRY_INDONESIA}
  CTRY_IRAN               = 981; // Iran
  {$EXTERNALSYM CTRY_IRAN}
  CTRY_IRAQ               = 964; // Iraq
  {$EXTERNALSYM CTRY_IRAQ}
  CTRY_IRELAND            = 353; // Ireland
  {$EXTERNALSYM CTRY_IRELAND}
  CTRY_ISRAEL             = 972; // Israel
  {$EXTERNALSYM CTRY_ISRAEL}
  CTRY_ITALY              = 39; // Italy
  {$EXTERNALSYM CTRY_ITALY}
  CTRY_JAMAICA            = 1; // Jamaica
  {$EXTERNALSYM CTRY_JAMAICA}
  CTRY_JAPAN              = 81; // Japan
  {$EXTERNALSYM CTRY_JAPAN}
  CTRY_JORDAN             = 962; // Jordan
  {$EXTERNALSYM CTRY_JORDAN}
  CTRY_KAZAKSTAN          = 7; // Kazakstan
  {$EXTERNALSYM CTRY_KAZAKSTAN}
  CTRY_KENYA              = 254; // Kenya
  {$EXTERNALSYM CTRY_KENYA}
  CTRY_KUWAIT             = 965; // Kuwait
  {$EXTERNALSYM CTRY_KUWAIT}
  CTRY_KYRGYZSTAN         = 996; // Kyrgyzstan
  {$EXTERNALSYM CTRY_KYRGYZSTAN}
  CTRY_LATVIA             = 371; // Latvia
  {$EXTERNALSYM CTRY_LATVIA}
  CTRY_LEBANON            = 961; // Lebanon
  {$EXTERNALSYM CTRY_LEBANON}
  CTRY_LIBYA              = 218; // Libya
  {$EXTERNALSYM CTRY_LIBYA}
  CTRY_LIECHTENSTEIN      = 41; // Liechtenstein
  {$EXTERNALSYM CTRY_LIECHTENSTEIN}
  CTRY_LITHUANIA          = 370; // Lithuania
  {$EXTERNALSYM CTRY_LITHUANIA}
  CTRY_LUXEMBOURG         = 352; // Luxembourg
  {$EXTERNALSYM CTRY_LUXEMBOURG}
  CTRY_MACAU              = 853; // Macau S.A.R., PRC
  {$EXTERNALSYM CTRY_MACAU}
  CTRY_MACEDONIA          = 389; // Former Yugoslav Republic of Macedonia
  {$EXTERNALSYM CTRY_MACEDONIA}
  CTRY_MALAYSIA           = 60; // Malaysia
  {$EXTERNALSYM CTRY_MALAYSIA}
  CTRY_MALDIVES           = 960; // Maldives
  {$EXTERNALSYM CTRY_MALDIVES}
  CTRY_MEXICO             = 52; // Mexico
  {$EXTERNALSYM CTRY_MEXICO}
  CTRY_MONACO             = 33; // Principality of Monaco
  {$EXTERNALSYM CTRY_MONACO}
  CTRY_MONGOLIA           = 976; // Mongolia
  {$EXTERNALSYM CTRY_MONGOLIA}
  CTRY_MOROCCO            = 212; // Morocco
  {$EXTERNALSYM CTRY_MOROCCO}
  CTRY_NETHERLANDS        = 31; // Netherlands
  {$EXTERNALSYM CTRY_NETHERLANDS}
  CTRY_NEW_ZEALAND        = 64; // New Zealand
  {$EXTERNALSYM CTRY_NEW_ZEALAND}
  CTRY_NICARAGUA          = 505; // Nicaragua
  {$EXTERNALSYM CTRY_NICARAGUA}
  CTRY_NORWAY             = 47; // Norway
  {$EXTERNALSYM CTRY_NORWAY}
  CTRY_OMAN               = 968; // Oman
  {$EXTERNALSYM CTRY_OMAN}
  CTRY_PAKISTAN           = 92; // Islamic Republic of Pakistan
  {$EXTERNALSYM CTRY_PAKISTAN}
  CTRY_PANAMA             = 507; // Panama
  {$EXTERNALSYM CTRY_PANAMA}
  CTRY_PARAGUAY           = 595; // Paraguay
  {$EXTERNALSYM CTRY_PARAGUAY}
  CTRY_PERU               = 51; // Peru
  {$EXTERNALSYM CTRY_PERU}
  CTRY_PHILIPPINES        = 63; // Republic of the Philippines
  {$EXTERNALSYM CTRY_PHILIPPINES}
  CTRY_POLAND             = 48; // Poland
  {$EXTERNALSYM CTRY_POLAND}
  CTRY_PORTUGAL           = 351; // Portugal
  {$EXTERNALSYM CTRY_PORTUGAL}
  CTRY_PRCHINA            = 86; // People's Republic of China
  {$EXTERNALSYM CTRY_PRCHINA}
  CTRY_PUERTO_RICO        = 1; // Puerto Rico
  {$EXTERNALSYM CTRY_PUERTO_RICO}
  CTRY_QATAR              = 974; // Qatar
  {$EXTERNALSYM CTRY_QATAR}
  CTRY_ROMANIA            = 40; // Romania
  {$EXTERNALSYM CTRY_ROMANIA}
  CTRY_RUSSIA             = 7; // Russia
  {$EXTERNALSYM CTRY_RUSSIA}
  CTRY_SAUDI_ARABIA       = 966; // Saudi Arabia
  {$EXTERNALSYM CTRY_SAUDI_ARABIA}
  CTRY_SERBIA             = 381; // Serbia
  {$EXTERNALSYM CTRY_SERBIA}
  CTRY_SINGAPORE          = 65; // Singapore
  {$EXTERNALSYM CTRY_SINGAPORE}
  CTRY_SLOVAK             = 421; // Slovak Republic
  {$EXTERNALSYM CTRY_SLOVAK}
  CTRY_SLOVENIA           = 386; // Slovenia
  {$EXTERNALSYM CTRY_SLOVENIA}
  CTRY_SOUTH_AFRICA       = 27; // South Africa
  {$EXTERNALSYM CTRY_SOUTH_AFRICA}
  CTRY_SOUTH_KOREA        = 82; // Korea
  {$EXTERNALSYM CTRY_SOUTH_KOREA}
  CTRY_SPAIN              = 34; // Spain
  {$EXTERNALSYM CTRY_SPAIN}
  CTRY_SWEDEN             = 46; // Sweden
  {$EXTERNALSYM CTRY_SWEDEN}
  CTRY_SWITZERLAND        = 41; // Switzerland
  {$EXTERNALSYM CTRY_SWITZERLAND}
  CTRY_SYRIA              = 963; // Syria
  {$EXTERNALSYM CTRY_SYRIA}
  CTRY_TAIWAN             = 886; // Taiwan
  {$EXTERNALSYM CTRY_TAIWAN}
  CTRY_TATARSTAN          = 7; // Tatarstan
  {$EXTERNALSYM CTRY_TATARSTAN}
  CTRY_THAILAND           = 66; // Thailand
  {$EXTERNALSYM CTRY_THAILAND}
  CTRY_TRINIDAD_Y_TOBAGO  = 1; // Trinidad y Tobago
  {$EXTERNALSYM CTRY_TRINIDAD_Y_TOBAGO}
  CTRY_TUNISIA            = 216; // Tunisia
  {$EXTERNALSYM CTRY_TUNISIA}
  CTRY_TURKEY             = 90; // Turkey
  {$EXTERNALSYM CTRY_TURKEY}
  CTRY_UAE                = 971; // U.A.E.
  {$EXTERNALSYM CTRY_UAE}
  CTRY_UKRAINE            = 380; // Ukraine
  {$EXTERNALSYM CTRY_UKRAINE}
  CTRY_UNITED_KINGDOM     = 44; // United Kingdom
  {$EXTERNALSYM CTRY_UNITED_KINGDOM}
  CTRY_UNITED_STATES      = 1; // United States
  {$EXTERNALSYM CTRY_UNITED_STATES}
  CTRY_URUGUAY            = 598; // Uruguay
  {$EXTERNALSYM CTRY_URUGUAY}
  CTRY_UZBEKISTAN         = 7; // Uzbekistan
  {$EXTERNALSYM CTRY_UZBEKISTAN}
  CTRY_VENEZUELA          = 58; // Venezuela
  {$EXTERNALSYM CTRY_VENEZUELA}
  CTRY_VIET_NAM           = 84; // Viet Nam
  {$EXTERNALSYM CTRY_VIET_NAM}
  CTRY_YEMEN              = 967; // Yemen
  {$EXTERNALSYM CTRY_YEMEN}
  CTRY_ZIMBABWE           = 263; // Zimbabwe
  {$EXTERNALSYM CTRY_ZIMBABWE}


//
//  Locale Types.
//
//  These types are used for the GetLocaleInfo NLS API routine.
//  Some of these types are also used for the SetLocaleInfo NLS API routine.
//

//
//  The following LCTypes may be used in combination with any other LCTypes.
//
//    LOCALE_NOUSEROVERRIDE is also used in GetTimeFormat and
//    GetDateFormat.
//
//    LOCALE_USE_CP_ACP is used in many of the A (Ansi) apis that need
//    to do string translation.
//
//    LOCALE_RETURN_NUMBER will return the result from GetLocaleInfo as a
//    number instead of a string.  This flag is only valid for the LCTypes
//    beginning with LOCALE_I.
//

  LOCALE_NOUSEROVERRIDE = DWORD($80000000); // do not use user overrides
  {$EXTERNALSYM LOCALE_NOUSEROVERRIDE}
  LOCALE_USE_CP_ACP     = $40000000; // use the system ACP
  {$EXTERNALSYM LOCALE_USE_CP_ACP}



  LOCALE_RETURN_NUMBER = $20000000; // return number instead of string
  {$EXTERNALSYM LOCALE_RETURN_NUMBER}



//
//  The following LCTypes are mutually exclusive in that they may NOT
//  be used in combination with each other.
//

  LOCALE_ILANGUAGE       = $00000001; // language id
  {$EXTERNALSYM LOCALE_ILANGUAGE}
  LOCALE_SLANGUAGE       = $00000002; // localized name of language
  {$EXTERNALSYM LOCALE_SLANGUAGE}
  LOCALE_SENGLANGUAGE    = $00001001; // English name of language
  {$EXTERNALSYM LOCALE_SENGLANGUAGE}
  LOCALE_SABBREVLANGNAME = $00000003; // abbreviated language name
  {$EXTERNALSYM LOCALE_SABBREVLANGNAME}
  LOCALE_SNATIVELANGNAME = $00000004; // native name of language
  {$EXTERNALSYM LOCALE_SNATIVELANGNAME}

  LOCALE_ICOUNTRY        = $00000005; // country code
  {$EXTERNALSYM LOCALE_ICOUNTRY}
  LOCALE_SCOUNTRY        = $00000006; // localized name of country
  {$EXTERNALSYM LOCALE_SCOUNTRY}
  LOCALE_SENGCOUNTRY     = $00001002; // English name of country
  {$EXTERNALSYM LOCALE_SENGCOUNTRY}
  LOCALE_SABBREVCTRYNAME = $00000007; // abbreviated country name
  {$EXTERNALSYM LOCALE_SABBREVCTRYNAME}
  LOCALE_SNATIVECTRYNAME = $00000008; // native name of country
  {$EXTERNALSYM LOCALE_SNATIVECTRYNAME}

  LOCALE_IDEFAULTLANGUAGE     = $00000009; // default language id
  {$EXTERNALSYM LOCALE_IDEFAULTLANGUAGE}
  LOCALE_IDEFAULTCOUNTRY      = $0000000A; // default country code
  {$EXTERNALSYM LOCALE_IDEFAULTCOUNTRY}
  LOCALE_IDEFAULTCODEPAGE     = $0000000B; // default oem code page
  {$EXTERNALSYM LOCALE_IDEFAULTCODEPAGE}
  LOCALE_IDEFAULTANSICODEPAGE = $00001004; // default ansi code page
  {$EXTERNALSYM LOCALE_IDEFAULTANSICODEPAGE}
  LOCALE_IDEFAULTMACCODEPAGE  = $00001011; // default mac code page
  {$EXTERNALSYM LOCALE_IDEFAULTMACCODEPAGE}

  LOCALE_SLIST    = $0000000C; // list item separator
  {$EXTERNALSYM LOCALE_SLIST}
  LOCALE_IMEASURE = $0000000D; // 0 = metric, 1 = US
  {$EXTERNALSYM LOCALE_IMEASURE}

  LOCALE_SDECIMAL      = $0000000E; // decimal separator
  {$EXTERNALSYM LOCALE_SDECIMAL}
  LOCALE_STHOUSAND     = $0000000F; // thousand separator
  {$EXTERNALSYM LOCALE_STHOUSAND}
  LOCALE_SGROUPING     = $00000010; // digit grouping
  {$EXTERNALSYM LOCALE_SGROUPING}
  LOCALE_IDIGITS       = $00000011; // number of fractional digits
  {$EXTERNALSYM LOCALE_IDIGITS}
  LOCALE_ILZERO        = $00000012; // leading zeros for decimal
  {$EXTERNALSYM LOCALE_ILZERO}
  LOCALE_INEGNUMBER    = $00001010; // negative number mode
  {$EXTERNALSYM LOCALE_INEGNUMBER}
  LOCALE_SNATIVEDIGITS = $00000013; // native ascii 0-9
  {$EXTERNALSYM LOCALE_SNATIVEDIGITS}

  LOCALE_SCURRENCY       = $00000014; // local monetary symbol
  {$EXTERNALSYM LOCALE_SCURRENCY}
  LOCALE_SINTLSYMBOL     = $00000015; // intl monetary symbol
  {$EXTERNALSYM LOCALE_SINTLSYMBOL}
  LOCALE_SMONDECIMALSEP  = $00000016; // monetary decimal separator
  {$EXTERNALSYM LOCALE_SMONDECIMALSEP}
  LOCALE_SMONTHOUSANDSEP = $00000017; // monetary thousand separator
  {$EXTERNALSYM LOCALE_SMONTHOUSANDSEP}
  LOCALE_SMONGROUPING    = $00000018; // monetary grouping
  {$EXTERNALSYM LOCALE_SMONGROUPING}
  LOCALE_ICURRDIGITS     = $00000019; // # local monetary digits
  {$EXTERNALSYM LOCALE_ICURRDIGITS}
  LOCALE_IINTLCURRDIGITS = $0000001A; // # intl monetary digits
  {$EXTERNALSYM LOCALE_IINTLCURRDIGITS}
  LOCALE_ICURRENCY       = $0000001B; // positive currency mode
  {$EXTERNALSYM LOCALE_ICURRENCY}
  LOCALE_INEGCURR        = $0000001C; // negative currency mode
  {$EXTERNALSYM LOCALE_INEGCURR}

  LOCALE_SDATE         = $0000001D; // date separator
  {$EXTERNALSYM LOCALE_SDATE}
  LOCALE_STIME         = $0000001E; // time separator
  {$EXTERNALSYM LOCALE_STIME}
  LOCALE_SSHORTDATE    = $0000001F; // short date format string
  {$EXTERNALSYM LOCALE_SSHORTDATE}
  LOCALE_SLONGDATE     = $00000020; // long date format string
  {$EXTERNALSYM LOCALE_SLONGDATE}
  LOCALE_STIMEFORMAT   = $00001003; // time format string
  {$EXTERNALSYM LOCALE_STIMEFORMAT}
  LOCALE_IDATE         = $00000021; // short date format ordering
  {$EXTERNALSYM LOCALE_IDATE}
  LOCALE_ILDATE        = $00000022; // long date format ordering
  {$EXTERNALSYM LOCALE_ILDATE}
  LOCALE_ITIME         = $00000023; // time format specifier
  {$EXTERNALSYM LOCALE_ITIME}
  LOCALE_ITIMEMARKPOSN = $00001005; // time marker position
  {$EXTERNALSYM LOCALE_ITIMEMARKPOSN}
  LOCALE_ICENTURY      = $00000024; // century format specifier (short date)
  {$EXTERNALSYM LOCALE_ICENTURY}
  LOCALE_ITLZERO       = $00000025; // leading zeros in time field
  {$EXTERNALSYM LOCALE_ITLZERO}
  LOCALE_IDAYLZERO     = $00000026; // leading zeros in day field (short date)
  {$EXTERNALSYM LOCALE_IDAYLZERO}
  LOCALE_IMONLZERO     = $00000027; // leading zeros in month field (short date)
  {$EXTERNALSYM LOCALE_IMONLZERO}
  LOCALE_S1159         = $00000028; // AM designator
  {$EXTERNALSYM LOCALE_S1159}
  LOCALE_S2359         = $00000029; // PM designator
  {$EXTERNALSYM LOCALE_S2359}

  LOCALE_ICALENDARTYPE     = $00001009; // type of calendar specifier
  {$EXTERNALSYM LOCALE_ICALENDARTYPE}
  LOCALE_IOPTIONALCALENDAR = $0000100B; // additional calendar types specifier
  {$EXTERNALSYM LOCALE_IOPTIONALCALENDAR}
  LOCALE_IFIRSTDAYOFWEEK   = $0000100C; // first day of week specifier
  {$EXTERNALSYM LOCALE_IFIRSTDAYOFWEEK}
  LOCALE_IFIRSTWEEKOFYEAR  = $0000100D; // first week of year specifier
  {$EXTERNALSYM LOCALE_IFIRSTWEEKOFYEAR}

  LOCALE_SDAYNAME1          = $0000002A; // long name for Monday
  {$EXTERNALSYM LOCALE_SDAYNAME1}
  LOCALE_SDAYNAME2          = $0000002B; // long name for Tuesday
  {$EXTERNALSYM LOCALE_SDAYNAME2}
  LOCALE_SDAYNAME3          = $0000002C; // long name for Wednesday
  {$EXTERNALSYM LOCALE_SDAYNAME3}
  LOCALE_SDAYNAME4          = $0000002D; // long name for Thursday
  {$EXTERNALSYM LOCALE_SDAYNAME4}
  LOCALE_SDAYNAME5          = $0000002E; // long name for Friday
  {$EXTERNALSYM LOCALE_SDAYNAME5}
  LOCALE_SDAYNAME6          = $0000002F; // long name for Saturday
  {$EXTERNALSYM LOCALE_SDAYNAME6}
  LOCALE_SDAYNAME7          = $00000030; // long name for Sunday
  {$EXTERNALSYM LOCALE_SDAYNAME7}
  LOCALE_SABBREVDAYNAME1    = $00000031; // abbreviated name for Monday
  {$EXTERNALSYM LOCALE_SABBREVDAYNAME1}
  LOCALE_SABBREVDAYNAME2    = $00000032; // abbreviated name for Tuesday
  {$EXTERNALSYM LOCALE_SABBREVDAYNAME2}
  LOCALE_SABBREVDAYNAME3    = $00000033; // abbreviated name for Wednesday
  {$EXTERNALSYM LOCALE_SABBREVDAYNAME3}
  LOCALE_SABBREVDAYNAME4    = $00000034; // abbreviated name for Thursday
  {$EXTERNALSYM LOCALE_SABBREVDAYNAME4}
  LOCALE_SABBREVDAYNAME5    = $00000035; // abbreviated name for Friday
  {$EXTERNALSYM LOCALE_SABBREVDAYNAME5}
  LOCALE_SABBREVDAYNAME6    = $00000036; // abbreviated name for Saturday
  {$EXTERNALSYM LOCALE_SABBREVDAYNAME6}
  LOCALE_SABBREVDAYNAME7    = $00000037; // abbreviated name for Sunday
  {$EXTERNALSYM LOCALE_SABBREVDAYNAME7}
  LOCALE_SMONTHNAME1        = $00000038; // long name for January
  {$EXTERNALSYM LOCALE_SMONTHNAME1}
  LOCALE_SMONTHNAME2        = $00000039; // long name for February
  {$EXTERNALSYM LOCALE_SMONTHNAME2}
  LOCALE_SMONTHNAME3        = $0000003A; // long name for March
  {$EXTERNALSYM LOCALE_SMONTHNAME3}
  LOCALE_SMONTHNAME4        = $0000003B; // long name for April
  {$EXTERNALSYM LOCALE_SMONTHNAME4}
  LOCALE_SMONTHNAME5        = $0000003C; // long name for May
  {$EXTERNALSYM LOCALE_SMONTHNAME5}
  LOCALE_SMONTHNAME6        = $0000003D; // long name for June
  {$EXTERNALSYM LOCALE_SMONTHNAME6}
  LOCALE_SMONTHNAME7        = $0000003E; // long name for July
  {$EXTERNALSYM LOCALE_SMONTHNAME7}
  LOCALE_SMONTHNAME8        = $0000003F; // long name for August
  {$EXTERNALSYM LOCALE_SMONTHNAME8}
  LOCALE_SMONTHNAME9        = $00000040; // long name for September
  {$EXTERNALSYM LOCALE_SMONTHNAME9}
  LOCALE_SMONTHNAME10       = $00000041; // long name for October
  {$EXTERNALSYM LOCALE_SMONTHNAME10}
  LOCALE_SMONTHNAME11       = $00000042; // long name for November
  {$EXTERNALSYM LOCALE_SMONTHNAME11}
  LOCALE_SMONTHNAME12       = $00000043; // long name for December
  {$EXTERNALSYM LOCALE_SMONTHNAME12}
  LOCALE_SMONTHNAME13       = $0000100E; // long name for 13th month (if exists)
  {$EXTERNALSYM LOCALE_SMONTHNAME13}
  LOCALE_SABBREVMONTHNAME1  = $00000044; // abbreviated name for January
  {$EXTERNALSYM LOCALE_SABBREVMONTHNAME1}
  LOCALE_SABBREVMONTHNAME2  = $00000045; // abbreviated name for February
  {$EXTERNALSYM LOCALE_SABBREVMONTHNAME2}
  LOCALE_SABBREVMONTHNAME3  = $00000046; // abbreviated name for March
  {$EXTERNALSYM LOCALE_SABBREVMONTHNAME3}
  LOCALE_SABBREVMONTHNAME4  = $00000047; // abbreviated name for April
  {$EXTERNALSYM LOCALE_SABBREVMONTHNAME4}
  LOCALE_SABBREVMONTHNAME5  = $00000048; // abbreviated name for May
  {$EXTERNALSYM LOCALE_SABBREVMONTHNAME5}
  LOCALE_SABBREVMONTHNAME6  = $00000049; // abbreviated name for June
  {$EXTERNALSYM LOCALE_SABBREVMONTHNAME6}
  LOCALE_SABBREVMONTHNAME7  = $0000004A; // abbreviated name for July
  {$EXTERNALSYM LOCALE_SABBREVMONTHNAME7}
  LOCALE_SABBREVMONTHNAME8  = $0000004B; // abbreviated name for August
  {$EXTERNALSYM LOCALE_SABBREVMONTHNAME8}
  LOCALE_SABBREVMONTHNAME9  = $0000004C; // abbreviated name for September
  {$EXTERNALSYM LOCALE_SABBREVMONTHNAME9}
  LOCALE_SABBREVMONTHNAME10 = $0000004D; // abbreviated name for October
  {$EXTERNALSYM LOCALE_SABBREVMONTHNAME10}
  LOCALE_SABBREVMONTHNAME11 = $0000004E; // abbreviated name for November
  {$EXTERNALSYM LOCALE_SABBREVMONTHNAME11}
  LOCALE_SABBREVMONTHNAME12 = $0000004F; // abbreviated name for December
  {$EXTERNALSYM LOCALE_SABBREVMONTHNAME12}
  LOCALE_SABBREVMONTHNAME13 = $0000100F; // abbreviated name for 13th month (if exists)
  {$EXTERNALSYM LOCALE_SABBREVMONTHNAME13}

  LOCALE_SPOSITIVESIGN   = $00000050; // positive sign
  {$EXTERNALSYM LOCALE_SPOSITIVESIGN}
  LOCALE_SNEGATIVESIGN   = $00000051; // negative sign
  {$EXTERNALSYM LOCALE_SNEGATIVESIGN}
  LOCALE_IPOSSIGNPOSN    = $00000052; // positive sign position
  {$EXTERNALSYM LOCALE_IPOSSIGNPOSN}
  LOCALE_INEGSIGNPOSN    = $00000053; // negative sign position
  {$EXTERNALSYM LOCALE_INEGSIGNPOSN}
  LOCALE_IPOSSYMPRECEDES = $00000054; // mon sym precedes pos amt
  {$EXTERNALSYM LOCALE_IPOSSYMPRECEDES}
  LOCALE_IPOSSEPBYSPACE  = $00000055; // mon sym sep by space from pos amt
  {$EXTERNALSYM LOCALE_IPOSSEPBYSPACE}
  LOCALE_INEGSYMPRECEDES = $00000056; // mon sym precedes neg amt
  {$EXTERNALSYM LOCALE_INEGSYMPRECEDES}
  LOCALE_INEGSEPBYSPACE  = $00000057; // mon sym sep by space from neg amt
  {$EXTERNALSYM LOCALE_INEGSEPBYSPACE}

  LOCALE_FONTSIGNATURE    = $00000058; // font signature
  {$EXTERNALSYM LOCALE_FONTSIGNATURE}
  LOCALE_SISO639LANGNAME  = $00000059; // ISO abbreviated language name
  {$EXTERNALSYM LOCALE_SISO639LANGNAME}
  LOCALE_SISO3166CTRYNAME = $0000005A; // ISO abbreviated country name
  {$EXTERNALSYM LOCALE_SISO3166CTRYNAME}

  LOCALE_IDEFAULTEBCDICCODEPAGE = $00001012; // default ebcdic code page
  {$EXTERNALSYM LOCALE_IDEFAULTEBCDICCODEPAGE}
  LOCALE_IPAPERSIZE             = $0000100A; // 1 = letter, 5 = legal, 8 = a3, 9 = a4
  {$EXTERNALSYM LOCALE_IPAPERSIZE}
  LOCALE_SENGCURRNAME           = $00001007; // english name of currency
  {$EXTERNALSYM LOCALE_SENGCURRNAME}
  LOCALE_SNATIVECURRNAME        = $00001008; // native name of currency
  {$EXTERNALSYM LOCALE_SNATIVECURRNAME}
  LOCALE_SYEARMONTH             = $00001006; // year month format string
  {$EXTERNALSYM LOCALE_SYEARMONTH}
  LOCALE_SSORTNAME              = $00001013; // sort name
  {$EXTERNALSYM LOCALE_SSORTNAME}
  LOCALE_IDIGITSUBSTITUTION     = $00001014; // 0 = context, 1 = none, 2 = national
  {$EXTERNALSYM LOCALE_IDIGITSUBSTITUTION}

//
//  Time Flags for GetTimeFormat.
//

  TIME_NOMINUTESORSECONDS = $00000001; // do not use minutes or seconds
  {$EXTERNALSYM TIME_NOMINUTESORSECONDS}
  TIME_NOSECONDS          = $00000002; // do not use seconds
  {$EXTERNALSYM TIME_NOSECONDS}
  TIME_NOTIMEMARKER       = $00000004; // do not use time marker
  {$EXTERNALSYM TIME_NOTIMEMARKER}
  TIME_FORCE24HOURFORMAT  = $00000008; // always use 24 hour format
  {$EXTERNALSYM TIME_FORCE24HOURFORMAT}

//
//  Date Flags for GetDateFormat.
//

  DATE_SHORTDATE        = $00000001; // use short date picture
  {$EXTERNALSYM DATE_SHORTDATE}
  DATE_LONGDATE         = $00000002; // use long date picture
  {$EXTERNALSYM DATE_LONGDATE}
  DATE_USE_ALT_CALENDAR = $00000004; // use alternate calendar (if any)
  {$EXTERNALSYM DATE_USE_ALT_CALENDAR}

  DATE_YEARMONTH  = $00000008; // use year month picture
  {$EXTERNALSYM DATE_YEARMONTH}
  DATE_LTRREADING = $00000010; // add marks for left to right reading order layout
  {$EXTERNALSYM DATE_LTRREADING}
  DATE_RTLREADING = $00000020; // add marks for right to left reading order layout
  {$EXTERNALSYM DATE_RTLREADING}

//
//  Calendar Types.
//
//  These types are used for the EnumCalendarInfo and GetCalendarInfo
//  NLS API routines.
//  Some of these types are also used for the SetCalendarInfo NLS API
//  routine.
//

//
//  The following CalTypes may be used in combination with any other CalTypes.
//
//    CAL_NOUSEROVERRIDE
//
//    CAL_USE_CP_ACP is used in the A (Ansi) apis that need to do string
//    translation.
//
//    CAL_RETURN_NUMBER will return the result from GetCalendarInfo as a
//    number instead of a string.  This flag is only valid for the CalTypes
//    beginning with CAL_I.
//

  CAL_NOUSEROVERRIDE = LOCALE_NOUSEROVERRIDE; // do not use user overrides
  {$EXTERNALSYM CAL_NOUSEROVERRIDE}
  CAL_USE_CP_ACP     = LOCALE_USE_CP_ACP; // use the system ACP
  {$EXTERNALSYM CAL_USE_CP_ACP}
  CAL_RETURN_NUMBER  = LOCALE_RETURN_NUMBER; // return number instead of string
  {$EXTERNALSYM CAL_RETURN_NUMBER}

//
//  The following CalTypes are mutually exclusive in that they may NOT
//  be used in combination with each other.
//

  CAL_ICALINTVALUE       = $00000001; // calendar type
  {$EXTERNALSYM CAL_ICALINTVALUE}
  CAL_SCALNAME           = $00000002; // native name of calendar
  {$EXTERNALSYM CAL_SCALNAME}
  CAL_IYEAROFFSETRANGE   = $00000003; // starting years of eras
  {$EXTERNALSYM CAL_IYEAROFFSETRANGE}
  CAL_SERASTRING         = $00000004; // era name for IYearOffsetRanges
  {$EXTERNALSYM CAL_SERASTRING}
  CAL_SSHORTDATE         = $00000005; // short date format string
  {$EXTERNALSYM CAL_SSHORTDATE}
  CAL_SLONGDATE          = $00000006; // long date format string
  {$EXTERNALSYM CAL_SLONGDATE}
  CAL_SDAYNAME1          = $00000007; // native name for Monday
  {$EXTERNALSYM CAL_SDAYNAME1}
  CAL_SDAYNAME2          = $00000008; // native name for Tuesday
  {$EXTERNALSYM CAL_SDAYNAME2}
  CAL_SDAYNAME3          = $00000009; // native name for Wednesday
  {$EXTERNALSYM CAL_SDAYNAME3}
  CAL_SDAYNAME4          = $0000000a; // native name for Thursday
  {$EXTERNALSYM CAL_SDAYNAME4}
  CAL_SDAYNAME5          = $0000000b; // native name for Friday
  {$EXTERNALSYM CAL_SDAYNAME5}
  CAL_SDAYNAME6          = $0000000c; // native name for Saturday
  {$EXTERNALSYM CAL_SDAYNAME6}
  CAL_SDAYNAME7          = $0000000d; // native name for Sunday
  {$EXTERNALSYM CAL_SDAYNAME7}
  CAL_SABBREVDAYNAME1    = $0000000e; // abbreviated name for Monday
  {$EXTERNALSYM CAL_SABBREVDAYNAME1}
  CAL_SABBREVDAYNAME2    = $0000000f; // abbreviated name for Tuesday
  {$EXTERNALSYM CAL_SABBREVDAYNAME2}
  CAL_SABBREVDAYNAME3    = $00000010; // abbreviated name for Wednesday
  {$EXTERNALSYM CAL_SABBREVDAYNAME3}
  CAL_SABBREVDAYNAME4    = $00000011; // abbreviated name for Thursday
  {$EXTERNALSYM CAL_SABBREVDAYNAME4}
  CAL_SABBREVDAYNAME5    = $00000012; // abbreviated name for Friday
  {$EXTERNALSYM CAL_SABBREVDAYNAME5}
  CAL_SABBREVDAYNAME6    = $00000013; // abbreviated name for Saturday
  {$EXTERNALSYM CAL_SABBREVDAYNAME6}
  CAL_SABBREVDAYNAME7    = $00000014; // abbreviated name for Sunday
  {$EXTERNALSYM CAL_SABBREVDAYNAME7}
  CAL_SMONTHNAME1        = $00000015; // native name for January
  {$EXTERNALSYM CAL_SMONTHNAME1}
  CAL_SMONTHNAME2        = $00000016; // native name for February
  {$EXTERNALSYM CAL_SMONTHNAME2}
  CAL_SMONTHNAME3        = $00000017; // native name for March
  {$EXTERNALSYM CAL_SMONTHNAME3}
  CAL_SMONTHNAME4        = $00000018; // native name for April
  {$EXTERNALSYM CAL_SMONTHNAME4}
  CAL_SMONTHNAME5        = $00000019; // native name for May
  {$EXTERNALSYM CAL_SMONTHNAME5}
  CAL_SMONTHNAME6        = $0000001a; // native name for June
  {$EXTERNALSYM CAL_SMONTHNAME6}
  CAL_SMONTHNAME7        = $0000001b; // native name for July
  {$EXTERNALSYM CAL_SMONTHNAME7}
  CAL_SMONTHNAME8        = $0000001c; // native name for August
  {$EXTERNALSYM CAL_SMONTHNAME8}
  CAL_SMONTHNAME9        = $0000001d; // native name for September
  {$EXTERNALSYM CAL_SMONTHNAME9}
  CAL_SMONTHNAME10       = $0000001e; // native name for October
  {$EXTERNALSYM CAL_SMONTHNAME10}
  CAL_SMONTHNAME11       = $0000001f; // native name for November
  {$EXTERNALSYM CAL_SMONTHNAME11}
  CAL_SMONTHNAME12       = $00000020; // native name for December
  {$EXTERNALSYM CAL_SMONTHNAME12}
  CAL_SMONTHNAME13       = $00000021; // native name for 13th month (if any)
  {$EXTERNALSYM CAL_SMONTHNAME13}
  CAL_SABBREVMONTHNAME1  = $00000022; // abbreviated name for January
  {$EXTERNALSYM CAL_SABBREVMONTHNAME1}
  CAL_SABBREVMONTHNAME2  = $00000023; // abbreviated name for February
  {$EXTERNALSYM CAL_SABBREVMONTHNAME2}
  CAL_SABBREVMONTHNAME3  = $00000024; // abbreviated name for March
  {$EXTERNALSYM CAL_SABBREVMONTHNAME3}
  CAL_SABBREVMONTHNAME4  = $00000025; // abbreviated name for April
  {$EXTERNALSYM CAL_SABBREVMONTHNAME4}
  CAL_SABBREVMONTHNAME5  = $00000026; // abbreviated name for May
  {$EXTERNALSYM CAL_SABBREVMONTHNAME5}
  CAL_SABBREVMONTHNAME6  = $00000027; // abbreviated name for June
  {$EXTERNALSYM CAL_SABBREVMONTHNAME6}
  CAL_SABBREVMONTHNAME7  = $00000028; // abbreviated name for July
  {$EXTERNALSYM CAL_SABBREVMONTHNAME7}
  CAL_SABBREVMONTHNAME8  = $00000029; // abbreviated name for August
  {$EXTERNALSYM CAL_SABBREVMONTHNAME8}
  CAL_SABBREVMONTHNAME9  = $0000002a; // abbreviated name for September
  {$EXTERNALSYM CAL_SABBREVMONTHNAME9}
  CAL_SABBREVMONTHNAME10 = $0000002b; // abbreviated name for October
  {$EXTERNALSYM CAL_SABBREVMONTHNAME10}
  CAL_SABBREVMONTHNAME11 = $0000002c; // abbreviated name for November
  {$EXTERNALSYM CAL_SABBREVMONTHNAME11}
  CAL_SABBREVMONTHNAME12 = $0000002d; // abbreviated name for December
  {$EXTERNALSYM CAL_SABBREVMONTHNAME12}
  CAL_SABBREVMONTHNAME13 = $0000002e; // abbreviated name for 13th month (if any)
  {$EXTERNALSYM CAL_SABBREVMONTHNAME13}

  CAL_SYEARMONTH       = $0000002f; // year month format string
  {$EXTERNALSYM CAL_SYEARMONTH}
  CAL_ITWODIGITYEARMAX = $00000030; // two digit year max
  {$EXTERNALSYM CAL_ITWODIGITYEARMAX}

//
//  Calendar Enumeration Value.
//

  ENUM_ALL_CALENDARS = DWORD($ffffffff); // enumerate all calendars
  {$EXTERNALSYM ENUM_ALL_CALENDARS}

//
//  Calendar ID Values.
//

  CAL_GREGORIAN              = 1; // Gregorian (localized) calendar
  {$EXTERNALSYM CAL_GREGORIAN}
  CAL_GREGORIAN_US           = 2; // Gregorian (U.S.) calendar
  {$EXTERNALSYM CAL_GREGORIAN_US}
  CAL_JAPAN                  = 3; // Japanese Emperor Era calendar
  {$EXTERNALSYM CAL_JAPAN}
  CAL_TAIWAN                 = 4; // Taiwan Era calendar
  {$EXTERNALSYM CAL_TAIWAN}
  CAL_KOREA                  = 5; // Korean Tangun calendar
  {$EXTERNALSYM CAL_KOREA}
  CAL_HIJRI                  = 6; // Hijri (Arabic Lunar) calendar
  {$EXTERNALSYM CAL_HIJRI}
  CAL_THAI                   = 7; // Thai calendar
  {$EXTERNALSYM CAL_THAI}
  CAL_HEBREW                 = 8; // Hebrew (Lunar) calendar
  {$EXTERNALSYM CAL_HEBREW}
  CAL_GREGORIAN_ME_FRENCH    = 9; // Gregorian Middle East French calendar
  {$EXTERNALSYM CAL_GREGORIAN_ME_FRENCH}
  CAL_GREGORIAN_ARABIC       = 10; // Gregorian Arabic calendar
  {$EXTERNALSYM CAL_GREGORIAN_ARABIC}
  CAL_GREGORIAN_XLIT_ENGLISH = 11; // Gregorian Transliterated English calendar
  {$EXTERNALSYM CAL_GREGORIAN_XLIT_ENGLISH}
  CAL_GREGORIAN_XLIT_FRENCH  = 12; // Gregorian Transliterated French calendar
  {$EXTERNALSYM CAL_GREGORIAN_XLIT_FRENCH}

//
//  Language Group ID Values.
//

  LGRPID_WESTERN_EUROPE      = $0001; // Western Europe & U.S.
  {$EXTERNALSYM LGRPID_WESTERN_EUROPE}
  LGRPID_CENTRAL_EUROPE      = $0002; // Central Europe
  {$EXTERNALSYM LGRPID_CENTRAL_EUROPE}
  LGRPID_BALTIC              = $0003; // Baltic
  {$EXTERNALSYM LGRPID_BALTIC}
  LGRPID_GREEK               = $0004; // Greek
  {$EXTERNALSYM LGRPID_GREEK}
  LGRPID_CYRILLIC            = $0005; // Cyrillic
  {$EXTERNALSYM LGRPID_CYRILLIC}
  LGRPID_TURKISH             = $0006; // Turkish
  {$EXTERNALSYM LGRPID_TURKISH}
  LGRPID_JAPANESE            = $0007; // Japanese
  {$EXTERNALSYM LGRPID_JAPANESE}
  LGRPID_KOREAN              = $0008; // Korean
  {$EXTERNALSYM LGRPID_KOREAN}
  LGRPID_TRADITIONAL_CHINESE = $0009; // Traditional Chinese
  {$EXTERNALSYM LGRPID_TRADITIONAL_CHINESE}
  LGRPID_SIMPLIFIED_CHINESE  = $000a; // Simplified Chinese
  {$EXTERNALSYM LGRPID_SIMPLIFIED_CHINESE}
  LGRPID_THAI                = $000b; // Thai
  {$EXTERNALSYM LGRPID_THAI}
  LGRPID_HEBREW              = $000c; // Hebrew
  {$EXTERNALSYM LGRPID_HEBREW}
  LGRPID_ARABIC              = $000d; // Arabic
  {$EXTERNALSYM LGRPID_ARABIC}
  LGRPID_VIETNAMESE          = $000e; // Vietnamese
  {$EXTERNALSYM LGRPID_VIETNAMESE}
  LGRPID_INDIC               = $000f; // Indic
  {$EXTERNALSYM LGRPID_INDIC}
  LGRPID_GEORGIAN            = $0010; // Georgian
  {$EXTERNALSYM LGRPID_GEORGIAN}
  LGRPID_ARMENIAN            = $0011; // Armenian
  {$EXTERNALSYM LGRPID_ARMENIAN}

////////////////////////////////////////////////////////////////////////////
//
//  Typedefs
//
//  Define all types for the NLS component here.
//
////////////////////////////////////////////////////////////////////////////

//
//  Language Group ID.
//

type
  LGRPID = DWORD;
  {$EXTERNALSYM LGRPID}

//
//  Locale type constant.
//

  LCTYPE = DWORD;
  {$EXTERNALSYM LCTYPE}

//
//  Calendar type constant.
//

  CALTYPE = DWORD;
  {$EXTERNALSYM CALTYPE}

//
//  Calendar ID.
//

  CALID = DWORD;
  {$EXTERNALSYM CALID}

//
//  CP Info.
//

  LPCPINFO = ^CPINFO;
  {$EXTERNALSYM LPCPINFO}
  _cpinfo = record
    MaxCharSize: UINT; // max length (in bytes) of a AnsiChar
    DefaultChar: array [0..MAX_DEFAULTCHAR - 1] of BYTE; // default character
    LeadByte: array [0..MAX_LEADBYTES - 1] of BYTE; // lead byte ranges
  end;
  {$EXTERNALSYM _cpinfo}
  CPINFO = _cpinfo;
  {$EXTERNALSYM CPINFO}
  TCpInfo = CPINFO;
  PCpInfo = LPCPINFO;

  {$EXTERNALSYM CPINFOEXA}
  LPCPINFOEXA = ^CPINFOEXA;
  _cpinfoexA = record
    MaxCharSize: UINT; // max length (in bytes) of a AnsiChar
    DefaultChar: array [0..MAX_DEFAULTCHAR - 1] of BYTE; // default character (MB)
    LeadByte: array [0..MAX_LEADBYTES - 1] of BYTE; // lead byte ranges
    UnicodeDefaultChar: WCHAR; // default character (Unicode)
    CodePage: UINT; // code page id
    CodePageName: array [0..MAX_PATH - 1] of AnsiChar; // code page name (Unicode)
  end;
  {$EXTERNALSYM _cpinfoexA}
  CPINFOEXA = _cpinfoexA;
  {$EXTERNALSYM LPCPINFOEXA}
  TCpInfoExA = CPINFOEXA;
  PCpInfoExA = LPCPINFOEXA;

  LPCPINFOEXW = ^CPINFOEXW;
  {$EXTERNALSYM LPCPINFOEXW}
  _cpinfoexW = record
    MaxCharSize: UINT; // max length (in bytes) of a AnsiChar
    DefaultChar: array [0..MAX_DEFAULTCHAR - 1] of BYTE; // default character (MB)
    LeadByte: array [0..MAX_LEADBYTES - 1] of BYTE; // lead byte ranges
    UnicodeDefaultChar: WCHAR; // default character (Unicode)
    CodePage: UINT; // code page id
    CodePageName: array [0..MAX_PATH - 1] of WCHAR; // code page name (Unicode)
  end;
  {$EXTERNALSYM _cpinfoexW}
  CPINFOEXW = _cpinfoexW;
  {$EXTERNALSYM CPINFOEXW}
  TCpInfoExW = CPINFOEXW;
  PCpInfoExW = LPCPINFOEXW;

  {$IFDEF UNICODE}
  CPINFOEX = CPINFOEXW;
  {$EXTERNALSYM CPINFOEX}
  LPCPINFOEX = LPCPINFOEXW;
  {$EXTERNALSYM LPCPINFOEX}
  TCpInfoEx = TCpInfoExW;
  PCpInfoEx = PCpInfoExW;
  {$ELSE}
  CPINFOEX = CPINFOEXA;
  {$EXTERNALSYM CPINFOEX}
  LPCPINFOEX = LPCPINFOEXA;
  {$EXTERNALSYM LPCPINFOEX}
  TCpInfoEx = TCpInfoExA;
  PCpInfoEx = PCpInfoExA;
  {$ENDIF UNICODE}

//
//  Number format.
//

  LPNUMBERFMTA = ^NUMBERFMTA;
  {$EXTERNALSYM LPNUMBERFMTA}
  _numberfmtA = record
    NumDigits: UINT; // number of decimal digits
    LeadingZero: UINT; // if leading zero in decimal fields
    Grouping: UINT; // group size left of decimal
    lpDecimalSep: LPSTR; // ptr to decimal separator string
    lpThousandSep: LPSTR; // ptr to thousand separator string
    NegativeOrder: UINT; // negative number ordering
  end;
  {$EXTERNALSYM _numberfmtA}
  NUMBERFMTA = _numberfmtA;
  {$EXTERNALSYM NUMBERFMTA}
  TNumberFmtA = NUMBERFMTA;
  PNumberFmtA = LPNUMBERFMTA;

  LPNUMBERFMTW = ^NUMBERFMTW;
  {$EXTERNALSYM LPNUMBERFMTW}
  _numberfmtW = record
    NumDigits: UINT; // number of decimal digits
    LeadingZero: UINT; // if leading zero in decimal fields
    Grouping: UINT; // group size left of decimal
    lpDecimalSep: LPWSTR; // ptr to decimal separator string
    lpThousandSep: LPWSTR; // ptr to thousand separator string
    NegativeOrder: UINT; // negative number ordering
  end;
  {$EXTERNALSYM _numberfmtW}
  NUMBERFMTW = _numberfmtW;
  {$EXTERNALSYM NUMBERFMTW}
  TNumberFmtW = NUMBERFMTW;
  PNumberFmtW = LPNUMBERFMTW;

  {$IFDEF UNICODE}
  NUMBERFMT = NUMBERFMTW;
  {$EXTERNALSYM NUMBERFMT}
  LPNUMBERFMT = LPNUMBERFMTW;
  {$EXTERNALSYM LPNUMBERFMT}
  TNumberFmt = TNumberFmtW;
  PNumberFmt = TNumberFmtW;
  {$ELSE}
  NUMBERFMT = NUMBERFMTA;
  {$EXTERNALSYM NUMBERFMT}
  LPNUMBERFMT = LPNUMBERFMTA;
  {$EXTERNALSYM LPNUMBERFMT}
  TNumberFmt = TNumberFmtA;
  PNumberFmt = TNumberFmtA;
  {$ENDIF UNICODE}

//
//  Currency format.
//

  LPCURRENCYFMTA = ^CURRENCYFMTA;
  {$EXTERNALSYM LPCURRENCYFMTA}
  _currencyfmtA = record
    NumDigits: UINT; // number of decimal digits
    LeadingZero: UINT; // if leading zero in decimal fields
    Grouping: UINT; // group size left of decimal
    lpDecimalSep: LPSTR; // ptr to decimal separator string
    lpThousandSep: LPSTR; // ptr to thousand separator string
    NegativeOrder: UINT; // negative currency ordering
    PositiveOrder: UINT; // positive currency ordering
    lpCurrencySymbol: LPSTR; // ptr to currency symbol string
  end;
  {$EXTERNALSYM _currencyfmtA}
  CURRENCYFMTA = _currencyfmtA;
  {$EXTERNALSYM CURRENCYFMTA}
  TCurrencyFmtA = CURRENCYFMTA;
  PCurrencyFmtA = LPCURRENCYFMTA;

  LPCURRENCYFMTW = ^CURRENCYFMTW;
  {$EXTERNALSYM LPCURRENCYFMTW}
  _currencyfmtW = record
    NumDigits: UINT; // number of decimal digits
    LeadingZero: UINT; // if leading zero in decimal fields
    Grouping: UINT; // group size left of decimal
    lpDecimalSep: LPWSTR; // ptr to decimal separator string
    lpThousandSep: LPWSTR; // ptr to thousand separator string
    NegativeOrder: UINT; // negative currency ordering
    PositiveOrder: UINT; // positive currency ordering
    lpCurrencySymbol: LPWSTR; // ptr to currency symbol string
  end;
  {$EXTERNALSYM _currencyfmtW}
  CURRENCYFMTW = _currencyfmtW;
  {$EXTERNALSYM CURRENCYFMTW}
  TCurrencyFmtW = CURRENCYFMTW;
  PCurrencyFmtW = LPCURRENCYFMTW;

  {$IFDEF UNICODE}
  CURRENCYFMT = CURRENCYFMTW;
  {$EXTERNALSYM CURRENCYFMT}
  LPCURRENCYFMT = LPCURRENCYFMTW;
  {$EXTERNALSYM LPCURRENCYFMT}
  TCurrencyFmt = TCurrencyFmtW;
  PCurrencyFmt = PCurrencyFmtW;
  {$ELSE}
  CURRENCYFMT = CURRENCYFMTA;
  {$EXTERNALSYM CURRENCYFMT}
  LPCURRENCYFMT = LPCURRENCYFMTA;
  {$EXTERNALSYM LPCURRENCYFMT}
  TCurrencyFmt = TCurrencyFmtA;
  PCurrencyFmt = PCurrencyFmtA;
  {$ENDIF UNICODE}

//
//  NLS function capabilities
//

const
  COMPARE_STRING    =  $0001;
  {$EXTERNALSYM COMPARE_STRING}

type
  SYSNLS_FUNCTION = DWORD;
  {$EXTERNALSYM SYSNLS_FUNCTION}
  NLS_FUNCTION = DWORD;
  {$EXTERNALSYM NLS_FUNCTION}
  TSysNlsFunction = SYSNLS_FUNCTION;
  TNlsFunction = NLS_FUNCTION;
 
//
//  NLS version structure.
//

  _nlsversioninfo = record
    dwNLSVersionInfoSize: DWORD;
    dwNLSVersion: DWORD;
    dwDefinedVersion: DWORD;
  end;
  {$EXTERNALSYM _nlsversioninfo}
  NLSVERSIONINFO = _nlsversioninfo;
  {$EXTERNALSYM NLSVERSIONINFO}
  LPNLSVERSIONINFO = ^NLSVERSIONINFO;
  {$EXTERNALSYM LPNLSVERSIONINFO}
  TNlsVersionInfo = NLSVERSIONINFO;
  PNlsVersionInfo = LPNLSVERSIONINFO;

//
//  GEO defines
//

type
  GEOID = LONG;
  {$EXTERNALSYM GEOID}
  GEOTYPE = DWORD;
  {$EXTERNALSYM GEOTYPE}
  GEOCLASS = DWORD;
  {$EXTERNALSYM GEOCLASS}

const
  GEOID_NOT_AVAILABLE = -1;
  {$EXTERNALSYM GEOID_NOT_AVAILABLE}

//
//  GEO information types for clients to query
//

const
  GEO_NATION       = $0001;
  {$EXTERNALSYM GEO_NATION}
  GEO_LATITUDE     = $0002;
  {$EXTERNALSYM GEO_LATITUDE}
  GEO_LONGITUDE    = $0003;
  {$EXTERNALSYM GEO_LONGITUDE}
  GEO_ISO2         = $0004;
  {$EXTERNALSYM GEO_ISO2}
  GEO_ISO3         = $0005;
  {$EXTERNALSYM GEO_ISO3}
  GEO_RFC1766      = $0006;
  {$EXTERNALSYM GEO_RFC1766}
  GEO_LCID         = $0007;
  {$EXTERNALSYM GEO_LCID}
  GEO_FRIENDLYNAME = $0008;
  {$EXTERNALSYM GEO_FRIENDLYNAME}
  GEO_OFFICIALNAME = $0009;
  {$EXTERNALSYM GEO_OFFICIALNAME}
  GEO_TIMEZONES    = $000A;
  {$EXTERNALSYM GEO_TIMEZONES}
  GEO_OFFICIALLANGUAGES = $000B;
  {$EXTERNALSYM GEO_OFFICIALLANGUAGES}

type
  SYSGEOTYPE = DWORD;
  {$EXTERNALSYM SYSGEOTYPE}

//
//  More GEOCLASS defines will be listed here
//

const
  GEOCLASS_NATION = 16;
  {$EXTERNALSYM GEOCLASS_NATION}
  GEOCLASS_REGION = 14;
  {$EXTERNALSYM GEOCLASS_REGION}

type
  SYSGEOCLASS = DWORD;
  {$EXTERNALSYM SYSGEOCLASS}

//
//  Enumeration function constants.
//

type
  LANGUAGEGROUP_ENUMPROCA = function(LanguageGroup: LGRPID; lpLanguageGroupString,
    lpLanguageGroupNameSting: LPSTR; dwFlags: DWORD; lParam: LONG_PTR): BOOL; stdcall;
  {$EXTERNALSYM LANGUAGEGROUP_ENUMPROCA}
  LANGGROUPLOCALE_ENUMPROCA = function(LanguageGroup: LGRPID; Locale: LCID;
    lpLocaleString: LPSTR; lParam: LONG_PTR): BOOL; stdcall;
  {$EXTERNALSYM LANGGROUPLOCALE_ENUMPROCA}
  UILANGUAGE_ENUMPROCA = function(lpUILanguageString: LPSTR; lParam: LONG_PTR): BOOL; stdcall;
  {$EXTERNALSYM UILANGUAGE_ENUMPROCA}
  LOCALE_ENUMPROCA = function(lpLocaleString: LPSTR): BOOL; stdcall;
  {$EXTERNALSYM LOCALE_ENUMPROCA}
  CODEPAGE_ENUMPROCA = function(lpCodePAgeString: LPSTR): BOOL; stdcall;
  {$EXTERNALSYM CODEPAGE_ENUMPROCA}
  DATEFMT_ENUMPROCA = function(lpDateFormatString: LPSTR): BOOL; stdcall;
  {$EXTERNALSYM DATEFMT_ENUMPROCA}
  DATEFMT_ENUMPROCEXA = function(lpDateFormatString: LPSTR; CalenderId: CALID): BOOL; stdcall;
  {$EXTERNALSYM DATEFMT_ENUMPROCEXA}
  TIMEFMT_ENUMPROCA = function(lpTimeFormatString: LPSTR): BOOL; stdcall;
  {$EXTERNALSYM TIMEFMT_ENUMPROCA}
  CALINFO_ENUMPROCA = function(lpCalendarInfoString: LPSTR): BOOL; stdcall;
  {$EXTERNALSYM CALINFO_ENUMPROCA}
  CALINFO_ENUMPROCEXA = function(lpCalendarInfoString: LPSTR; Calendar: CALID): BOOL; stdcall;
  {$EXTERNALSYM CALINFO_ENUMPROCEXA}

  LANGUAGEGROUP_ENUMPROCW = function(LanguageGroup: LGRPID; lpLanguageGroupString,
    lpLanguageGroupNameSting: LPWSTR; dwFlags: DWORD; lParam: LONG_PTR): BOOL; stdcall;
  {$EXTERNALSYM LANGUAGEGROUP_ENUMPROCW}
  LANGGROUPLOCALE_ENUMPROCW = function(LanguageGroup: LGRPID; Locale: LCID;
    lpLocaleString: LPWSTR; lParam: LONG_PTR): BOOL; stdcall;
  {$EXTERNALSYM LANGGROUPLOCALE_ENUMPROCW}
  UILANGUAGE_ENUMPROCW = function(lpUILanguageString: LPWSTR; lParam: LONG_PTR): BOOL; stdcall;
  {$EXTERNALSYM UILANGUAGE_ENUMPROCW}
  LOCALE_ENUMPROCW = function(lpLocaleString: LPWSTR): BOOL; stdcall;
  {$EXTERNALSYM LOCALE_ENUMPROCW}
  CODEPAGE_ENUMPROCW = function(lpCodePAgeString: LPWSTR): BOOL; stdcall;
  {$EXTERNALSYM CODEPAGE_ENUMPROCW}
  DATEFMT_ENUMPROCW = function(lpDateFormatString: LPWSTR): BOOL; stdcall;
  {$EXTERNALSYM DATEFMT_ENUMPROCW}
  DATEFMT_ENUMPROCEXW = function(lpDateFormatString: LPWSTR; CalenderId: CALID): BOOL; stdcall;
  {$EXTERNALSYM DATEFMT_ENUMPROCEXW}
  TIMEFMT_ENUMPROCW = function(lpTimeFormatString: LPWSTR): BOOL; stdcall;
  {$EXTERNALSYM TIMEFMT_ENUMPROCW}
  CALINFO_ENUMPROCW = function(lpCalendarInfoString: LPWSTR): BOOL; stdcall;
  {$EXTERNALSYM CALINFO_ENUMPROCW}
  CALINFO_ENUMPROCEXW = function(lpCalendarInfoString: LPWSTR; Calendar: CALID): BOOL; stdcall;
  {$EXTERNALSYM CALINFO_ENUMPROCEXW}
  GEO_ENUMPROC = function(geo: GEOID): BOOL; stdcall;
  {$EXTERNALSYM GEO_ENUMPROC}

  LANGUAGEGROUP_ENUMPROC = function(LanguageGroup: LGRPID; lpLanguageGroupString,
    lpLanguageGroupNameSting: LPTSTR; dwFlags: DWORD; lParam: LONG_PTR): BOOL; stdcall;
  {$EXTERNALSYM LANGUAGEGROUP_ENUMPROC}
  LANGGROUPLOCALE_ENUMPROC = function(LanguageGroup: LGRPID; Locale: LCID;
    lpLocaleString: LPTSTR; lParam: LONG_PTR): BOOL; stdcall;
  {$EXTERNALSYM LANGGROUPLOCALE_ENUMPROC}
  UILANGUAGE_ENUMPROC = function(lpUILanguageString: LPTSTR; lParam: LONG_PTR): BOOL; stdcall;
  {$EXTERNALSYM UILANGUAGE_ENUMPROC}
  LOCALE_ENUMPROC = function(lpLocaleString: LPTSTR): BOOL; stdcall;
  {$EXTERNALSYM LOCALE_ENUMPROC}
  CODEPAGE_ENUMPROC = function(lpCodePAgeString: LPTSTR): BOOL; stdcall;
  {$EXTERNALSYM CODEPAGE_ENUMPROC}
  DATEFMT_ENUMPROC = function(lpDateFormatString: LPTSTR): BOOL; stdcall;
  {$EXTERNALSYM DATEFMT_ENUMPROC}
  DATEFMT_ENUMPROCEX = function(lpDateFormatString: LPTSTR; CalenderId: CALID): BOOL; stdcall;
  {$EXTERNALSYM DATEFMT_ENUMPROCEX}
  TIMEFMT_ENUMPROC = function(lpTimeFormatString: LPTSTR): BOOL; stdcall;
  {$EXTERNALSYM TIMEFMT_ENUMPROC}
  CALINFO_ENUMPROC = function(lpCalendarInfoString: LPTSTR): BOOL; stdcall;
  {$EXTERNALSYM CALINFO_ENUMPROC}
  CALINFO_ENUMPROCEX = function(lpCalendarInfoString: LPTSTR; Calendar: CALID): BOOL; stdcall;
  {$EXTERNALSYM CALINFO_ENUMPROCEX}

////////////////////////////////////////////////////////////////////////////
//
//  Macros
//
//  Define all macros for the NLS component here.
//
////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////
//
//  Function Prototypes
//
//  Only prototypes for the NLS APIs should go here.
//
////////////////////////////////////////////////////////////////////////////

//
//  Code Page Dependent APIs.
//

function IsValidCodePage(CodePage: UINT): BOOL; stdcall;
{$EXTERNALSYM IsValidCodePage}

function GetACP: UINT; stdcall;
{$EXTERNALSYM GetACP}

function GetOEMCP: UINT; stdcall;
{$EXTERNALSYM GetOEMCP}

function GetCPInfo(CodePage: UINT; var lpCPInfo: CPINFO): BOOL; stdcall;
{$EXTERNALSYM GetCPInfo}

function GetCPInfoExA(CodePage: UINT; dwFlags: DWORD; var lpCPInfoEx: CPINFOEXA): BOOL; stdcall;
{$EXTERNALSYM GetCPInfoExA}
function GetCPInfoExW(CodePage: UINT; dwFlags: DWORD; var lpCPInfoEx: CPINFOEXW): BOOL; stdcall;
{$EXTERNALSYM GetCPInfoExW}
function GetCPInfoEx(CodePage: UINT; dwFlags: DWORD; var lpCPInfoEx: CPINFOEX): BOOL; stdcall;
{$EXTERNALSYM GetCPInfoEx}

function IsDBCSLeadByte(TestChar: BYTE): BOOL; stdcall;
{$EXTERNALSYM IsDBCSLeadByte}

function IsDBCSLeadByteEx(CodePage: UINT; TestChar: BYTE): BOOL; stdcall;
{$EXTERNALSYM IsDBCSLeadByteEx}

function MultiByteToWideChar(CodePage: UINT; dwFlags: DWORD; lpMultiByteStr: LPCSTR;
  cbMultiByte: Integer; lpWideCharStr: LPWSTR; cchWideChar: Integer): Integer; stdcall;
{$EXTERNALSYM MultiByteToWideChar}

function WideCharToMultiByte(CodePage: UINT; dwFlags: DWORD; lpWideCharStr: LPCWSTR;
  cchWideChar: Integer; lpMultiByteStr: LPSTR; cbMultiByte: Integer;
  lpDefaultChar: LPCSTR; lpUsedDefaultChar: LPBOOL): Integer; stdcall;
{$EXTERNALSYM WideCharToMultiByte}

//
//  Locale Dependent APIs.
//

function CompareStringA(Locale: LCID; dwCmpFlags: DWORD; lpString1: LPCSTR;
  cchCount1: Integer; lpString2: LPCSTR; cchCount2: Integer): Integer; stdcall;
{$EXTERNALSYM CompareStringA}
function CompareStringW(Locale: LCID; dwCmpFlags: DWORD; lpString1: LPCWSTR;
  cchCount1: Integer; lpString2: LPCWSTR; cchCount2: Integer): Integer; stdcall;
{$EXTERNALSYM CompareStringW}
function CompareString(Locale: LCID; dwCmpFlags: DWORD; lpString1: LPCTSTR;
  cchCount1: Integer; lpString2: LPCTSTR; cchCount2: Integer): Integer; stdcall;
{$EXTERNALSYM CompareString}

function LCMapStringA(Locale: LCID; dwMapFlags: DWORD; lpSrcStr: LPCSTR;
  cchSrc: Integer; lpDestStr: LPSTR; cchDest: Integer): Integer; stdcall;
{$EXTERNALSYM LCMapStringA}
function LCMapStringW(Locale: LCID; dwMapFlags: DWORD; lpSrcStr: LPCWSTR;
  cchSrc: Integer; lpDestStr: LPWSTR; cchDest: Integer): Integer; stdcall;
{$EXTERNALSYM LCMapStringW}
function LCMapString(Locale: LCID; dwMapFlags: DWORD; lpSrcStr: LPCTSTR;
  cchSrc: Integer; lpDestStr: LPTSTR; cchDest: Integer): Integer; stdcall;
{$EXTERNALSYM LCMapString}

function GetLocaleInfoA(Locale: LCID; LCType: LCTYPE; lpLCData: LPSTR;
  cchData: Integer): Integer; stdcall;
{$EXTERNALSYM GetLocaleInfoA}
function GetLocaleInfoW(Locale: LCID; LCType: LCTYPE; lpLCData: LPWSTR;
  cchData: Integer): Integer; stdcall;
{$EXTERNALSYM GetLocaleInfoW}
function GetLocaleInfo(Locale: LCID; LCType: LCTYPE; lpLCData: LPTSTR;
  cchData: Integer): Integer; stdcall;
{$EXTERNALSYM GetLocaleInfo}

function SetLocaleInfoA(Locale: LCID; LCType: LCTYPE; lpLCData: LPCSTR): BOOL; stdcall;
{$EXTERNALSYM SetLocaleInfoA}
function SetLocaleInfoW(Locale: LCID; LCType: LCTYPE; lpLCData: LPCWSTR): BOOL; stdcall;
{$EXTERNALSYM SetLocaleInfoW}
function SetLocaleInfo(Locale: LCID; LCType: LCTYPE; lpLCData: LPCTSTR): BOOL; stdcall;
{$EXTERNALSYM SetLocaleInfo}

function GetCalendarInfoA(Locale: LCID; Calendar: CALID; CalType: CALTYPE;
  lpCalData: LPSTR; cchData: Integer; lpValue: LPDWORD): Integer; stdcall;
{$EXTERNALSYM GetCalendarInfoA}
function GetCalendarInfoW(Locale: LCID; Calendar: CALID; CalType: CALTYPE;
  lpCalData: LPWSTR; cchData: Integer; lpValue: LPDWORD): Integer; stdcall;
{$EXTERNALSYM GetCalendarInfoW}
function GetCalendarInfo(Locale: LCID; Calendar: CALID; CalType: CALTYPE;
  lpCalData: LPTSTR; cchData: Integer; lpValue: LPDWORD): Integer; stdcall;
{$EXTERNALSYM GetCalendarInfo}

function SetCalendarInfoA(Locale: LCID; Calendar: CALID; CalType: CALTYPE;
  lpCalData: LPCSTR): BOOL; stdcall;
{$EXTERNALSYM SetCalendarInfoA}
function SetCalendarInfoW(Locale: LCID; Calendar: CALID; CalType: CALTYPE;
  lpCalData: LPCWSTR): BOOL; stdcall;
{$EXTERNALSYM SetCalendarInfoW}
function SetCalendarInfo(Locale: LCID; Calendar: CALID; CalType: CALTYPE;
  lpCalData: LPCTSTR): BOOL; stdcall;
{$EXTERNALSYM SetCalendarInfo}

function GetTimeFormatA(Locale: LCID; dwFlags: DWORD; lpTime: LPSYSTEMTIME;
  lpFormat: LPCSTR; lpTimeStr: LPSTR; cchTime: Integer): Integer; stdcall;
{$EXTERNALSYM GetTimeFormatA}
function GetTimeFormatW(Locale: LCID; dwFlags: DWORD; lpTime: LPSYSTEMTIME;
  lpFormat: LPCWSTR; lpTimeStr: LPWSTR; cchTime: Integer): Integer; stdcall;
{$EXTERNALSYM GetTimeFormatW}
function GetTimeFormat(Locale: LCID; dwFlags: DWORD; lpTime: LPSYSTEMTIME;
  lpFormat: LPCTSTR; lpTimeStr: LPTSTR; cchTime: Integer): Integer; stdcall;
{$EXTERNALSYM GetTimeFormat}

function GetDateFormatA(Locale: LCID; dwFlags: DWORD; lpDate: LPSYSTEMTIME;
  lpFormat: LPCSTR; lpDateStr: LPSTR; cchDate: Integer): Integer; stdcall;
{$EXTERNALSYM GetDateFormatA}
function GetDateFormatW(Locale: LCID; dwFlags: DWORD; lpDate: LPSYSTEMTIME;
  lpFormat: LPCWSTR; lpDateStr: LPWSTR; cchDate: Integer): Integer; stdcall;
{$EXTERNALSYM GetDateFormatW}
function GetDateFormat(Locale: LCID; dwFlags: DWORD; lpDate: LPSYSTEMTIME;
  lpFormat: LPCTSTR; lpDateStr: LPTSTR; cchDate: Integer): Integer; stdcall;
{$EXTERNALSYM GetDateFormat}

function GetNumberFormatA(Locale: LCID; dwFlags: DWORD; lpValue: LPCSTR;
  lpFormat: LPNUMBERFMTA; lpNumberStr: LPSTR; cchNumber: Integer): Integer; stdcall;
{$EXTERNALSYM GetNumberFormatA}
function GetNumberFormatW(Locale: LCID; dwFlags: DWORD; lpValue: LPCWSTR;
  lpFormat: LPNUMBERFMTW; lpNumberStr: LPWSTR; cchNumber: Integer): Integer; stdcall;
{$EXTERNALSYM GetNumberFormatW}
function GetNumberFormat(Locale: LCID; dwFlags: DWORD; lpValue: LPCTSTR;
  lpFormat: LPNUMBERFMT; lpNumberStr: LPTSTR; cchNumber: Integer): Integer; stdcall;
{$EXTERNALSYM GetNumberFormat}

function GetCurrencyFormatA(Locale: LCID; dwFlags: DWORD; lpValue: LPCSTR;
  lpFormat: LPCURRENCYFMTA; lpCurrencyStr: LPSTR; cchCurrency: Integer): Integer; stdcall;
{$EXTERNALSYM GetCurrencyFormatA}
function GetCurrencyFormatW(Locale: LCID; dwFlags: DWORD; lpValue: LPCWSTR;
  lpFormat: LPCURRENCYFMTW; lpCurrencyStr: LPWSTR; cchCurrency: Integer): Integer; stdcall;
{$EXTERNALSYM GetCurrencyFormatW}
function GetCurrencyFormat(Locale: LCID; dwFlags: DWORD; lpValue: LPCTSTR;
  lpFormat: LPCURRENCYFMT; lpCurrencyStr: LPTSTR; cchCurrency: Integer): Integer; stdcall;
{$EXTERNALSYM GetCurrencyFormat}

function EnumCalendarInfoA(lpCalInfoEnumProc: CALINFO_ENUMPROCA; Locale: LCID;
  Calendar: CALID; CalType: CALTYPE): BOOL; stdcall;
{$EXTERNALSYM EnumCalendarInfoA}
function EnumCalendarInfoW(lpCalInfoEnumProc: CALINFO_ENUMPROCW; Locale: LCID;
  Calendar: CALID; CalType: CALTYPE): BOOL; stdcall;
{$EXTERNALSYM EnumCalendarInfoW}
function EnumCalendarInfo(lpCalInfoEnumProc: CALINFO_ENUMPROC; Locale: LCID;
  Calendar: CALID; CalType: CALTYPE): BOOL; stdcall;
{$EXTERNALSYM EnumCalendarInfo}

function EnumCalendarInfoExA(lpCalInfoEnumProcEx: CALINFO_ENUMPROCEXA;
  Locale: LCID; Calendar: CALID; CalType: CALTYPE): BOOL; stdcall;
{$EXTERNALSYM EnumCalendarInfoExA}
function EnumCalendarInfoExW(lpCalInfoEnumProcEx: CALINFO_ENUMPROCEXW;
  Locale: LCID; Calendar: CALID; CalType: CALTYPE): BOOL; stdcall;
{$EXTERNALSYM EnumCalendarInfoExW}
function EnumCalendarInfoEx(lpCalInfoEnumProcEx: CALINFO_ENUMPROCEX;
  Locale: LCID; Calendar: CALID; CalType: CALTYPE): BOOL; stdcall;
{$EXTERNALSYM EnumCalendarInfoEx}

function EnumTimeFormatsA(lpTimeFmtEnumProc: TIMEFMT_ENUMPROCA; Locale:
  LCID; dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumTimeFormatsA}
function EnumTimeFormatsW(lpTimeFmtEnumProc: TIMEFMT_ENUMPROCW; Locale:
  LCID; dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumTimeFormatsW}
function EnumTimeFormats(lpTimeFmtEnumProc: TIMEFMT_ENUMPROC; Locale: LCID;
  dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumTimeFormats}

function EnumDateFormatsA(lpDateFmtEnumProc: DATEFMT_ENUMPROCA; Locale: LCID;
  dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumDateFormatsA}
function EnumDateFormatsW(lpDateFmtEnumProc: DATEFMT_ENUMPROCW; Locale: LCID;
  dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumDateFormatsW}
function EnumDateFormats(lpDateFmtEnumProc: DATEFMT_ENUMPROC; Locale: LCID;
  dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumDateFormats}

function EnumDateFormatsExA(lpDateFmtEnumProcEx: DATEFMT_ENUMPROCEXA;
  Locale: LCID; dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumDateFormatsExA}
function EnumDateFormatsExW(lpDateFmtEnumProcEx: DATEFMT_ENUMPROCEXW;
  Locale: LCID; dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumDateFormatsExW}
function EnumDateFormatsEx(lpDateFmtEnumProcEx: DATEFMT_ENUMPROCEX;
  Locale: LCID; dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumDateFormatsEx}

function IsValidLanguageGroup(LanguageGroup: LGRPID; dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM IsValidLanguageGroup}

function GetNLSVersion(Function_: NLS_FUNCTION; Locale: LCID; lpVersionInformation: LPNLSVERSIONINFO): BOOL; stdcall;
{$EXTERNALSYM GetNLSVersion}

function IsNLSDefinedString(Function_: NLS_FUNCTION; dwFlags: DWORD; lpVersionInformation: LPNLSVERSIONINFO;
  lpString: LPCWSTR; cchStr: Integer): BOOL; stdcall;
{$EXTERNALSYM IsNLSDefinedString}

function IsValidLocale(Locale: LCID; dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM IsValidLocale}

function GetGeoInfoA(Location: GEOID; GeoType: GEOTYPE; lpGeoData: LPSTR;
  cchData: Integer; LangId: LANGID): Integer; stdcall;
{$EXTERNALSYM GetGeoInfoA}
function GetGeoInfoW(Location: GEOID; GeoType: GEOTYPE; lpGeoData: LPWSTR;
  cchData: Integer; LangId: LANGID): Integer; stdcall;
{$EXTERNALSYM GetGeoInfoW}
function GetGeoInfo(Location: GEOID; GeoType: GEOTYPE; lpGeoData: LPTSTR;
  cchData: Integer; LangId: LANGID): Integer; stdcall;
{$EXTERNALSYM GetGeoInfo}

function EnumSystemGeoID(GeoClass: GEOCLASS; ParentGeoId: GEOID; lpGeoEnumProc: GEO_ENUMPROC): BOOL; stdcall;
{$EXTERNALSYM EnumSystemGeoID}

function GetUserGeoID(GeoClass: GEOCLASS): GEOID; stdcall;
{$EXTERNALSYM GetUserGeoID}

function SetUserGeoID(GeoId: GEOID): BOOL; stdcall;
{$EXTERNALSYM SetUserGeoID}

function ConvertDefaultLocale(Locale: LCID): LCID; stdcall;
{$EXTERNALSYM ConvertDefaultLocale}

function GetThreadLocale: LCID; stdcall;
{$EXTERNALSYM GetThreadLocale}

function SetThreadLocale(Locale: LCID): BOOL; stdcall;
{$EXTERNALSYM SetThreadLocale}

function GetSystemDefaultUILanguage: LANGID; stdcall;
{$EXTERNALSYM GetSystemDefaultUILanguage}

function GetUserDefaultUILanguage: LANGID; stdcall;
{$EXTERNALSYM GetUserDefaultUILanguage}

function GetSystemDefaultLangID: LANGID; stdcall;
{$EXTERNALSYM GetSystemDefaultLangID}

function GetUserDefaultLangID: LANGID; stdcall;
{$EXTERNALSYM GetUserDefaultLangID}

function GetSystemDefaultLCID: LCID; stdcall;
{$EXTERNALSYM GetSystemDefaultLCID}

function GetUserDefaultLCID: LCID; stdcall;
{$EXTERNALSYM GetUserDefaultLCID}

//
//  Locale Independent APIs.
//

function GetStringTypeExA(Locale: LCID; dwInfoType: DWORD; lpSrcStr: LPCSTR;
  cchSrc: Integer; lpCharType: LPWORD): BOOL; stdcall;
{$EXTERNALSYM GetStringTypeExA}
function GetStringTypeExW(Locale: LCID; dwInfoType: DWORD; lpSrcStr: LPCWSTR;
  cchSrc: Integer; lpCharType: LPWORD): BOOL; stdcall;
{$EXTERNALSYM GetStringTypeExW}
function GetStringTypeEx(Locale: LCID; dwInfoType: DWORD; lpSrcStr: LPCTSTR;
  cchSrc: Integer; lpCharType: LPWORD): BOOL; stdcall;
{$EXTERNALSYM GetStringTypeEx}

//
//  NOTE: The parameters for GetStringTypeA and GetStringTypeW are
//        NOT the same.  The W version was shipped in NT 3.1.  The
//        A version was then shipped in 16-bit OLE with the wrong
//        parameters (ported from Win95).  To be compatible, we
//        must break the relationship between the A and W versions
//        of GetStringType.  There will be NO function call for the
//        generic GetStringType.
//
//        GetStringTypeEx (above) should be used instead.
//

function GetStringTypeA(Locale: LCID; dwInfoType: DWORD; lpSrcStr: LPCSTR;
  cchSrc: Integer; lpCharType: LPWORD): BOOL; stdcall;
{$EXTERNALSYM GetStringTypeA}
function GetStringTypeW(dwInfoType: DWORD; lpSrcStr: LPCWSTR; cchSrc: Integer;
  lpCharType: LPWORD): BOOL; stdcall;
{$EXTERNALSYM GetStringTypeW}

function FoldStringA(dwMapFlags: DWORD; lpSrcStr: LPCSTR; cchSrc: Integer;
  lpDestStr: LPSTR; cchDest: Integer): Integer; stdcall;
{$EXTERNALSYM FoldStringA}
function FoldStringW(dwMapFlags: DWORD; lpSrcStr: LPCWSTR; cchSrc: Integer;
  lpDestStr: LPWSTR; cchDest: Integer): Integer; stdcall;
{$EXTERNALSYM FoldStringW}
function FoldString(dwMapFlags: DWORD; lpSrcStr: LPCTSTR; cchSrc: Integer;
  lpDestStr: LPTSTR; cchDest: Integer): Integer; stdcall;
{$EXTERNALSYM FoldString}

function EnumSystemLanguageGroupsA(lpLanguageGroupEnumProc: LANGUAGEGROUP_ENUMPROCA;
  dwFlags: DWORD; lParam: LONG_PTR): BOOL; stdcall;
{$EXTERNALSYM EnumSystemLanguageGroupsA}
function EnumSystemLanguageGroupsW(lpLanguageGroupEnumProc: LANGUAGEGROUP_ENUMPROCW;
  dwFlags: DWORD; lParam: LONG_PTR): BOOL; stdcall;
{$EXTERNALSYM EnumSystemLanguageGroupsW}
function EnumSystemLanguageGroups(lpLanguageGroupEnumProc: LANGUAGEGROUP_ENUMPROC;
  dwFlags: DWORD; lParam: LONG_PTR): BOOL; stdcall;
{$EXTERNALSYM EnumSystemLanguageGroups}

function EnumLanguageGroupLocalesA(lpLangGroupLocaleEnumProc: LANGGROUPLOCALE_ENUMPROCA;
  LanguageGroup: LGRPID; dwFlags: DWORD; lParam: LONG_PTR): BOOL; stdcall;
{$EXTERNALSYM EnumLanguageGroupLocalesA}
function EnumLanguageGroupLocalesW(lpLangGroupLocaleEnumProc: LANGGROUPLOCALE_ENUMPROCW;
  LanguageGroup: LGRPID; dwFlags: DWORD; lParam: LONG_PTR): BOOL; stdcall;
{$EXTERNALSYM EnumLanguageGroupLocalesW}
function EnumLanguageGroupLocales(lpLangGroupLocaleEnumProc: LANGGROUPLOCALE_ENUMPROC;
  LanguageGroup: LGRPID; dwFlags: DWORD; lParam: LONG_PTR): BOOL; stdcall;
{$EXTERNALSYM EnumLanguageGroupLocales}

function EnumUILanguagesA(lpUILanguageEnumProc: UILANGUAGE_ENUMPROCA;
  dwFlags: DWORD; lParam: LONG_PTR): BOOL; stdcall;
{$EXTERNALSYM EnumUILanguagesA}
function EnumUILanguagesW(lpUILanguageEnumProc: UILANGUAGE_ENUMPROCW;
  dwFlags: DWORD; lParam: LONG_PTR): BOOL; stdcall;
{$EXTERNALSYM EnumUILanguagesW}
function EnumUILanguages(lpUILanguageEnumProc: UILANGUAGE_ENUMPROC;
  dwFlags: DWORD; lParam: LONG_PTR): BOOL; stdcall;
{$EXTERNALSYM EnumUILanguages}

function EnumSystemLocalesA(lpLocaleEnumProc: LOCALE_ENUMPROCA;
  dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumSystemLocalesA}
function EnumSystemLocalesW(lpLocaleEnumProc: LOCALE_ENUMPROCW;
  dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumSystemLocalesW}
function EnumSystemLocales(lpLocaleEnumProc: LOCALE_ENUMPROC;
  dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumSystemLocales}

function EnumSystemCodePagesA(lpCodePageEnumProc: CODEPAGE_ENUMPROCA;
  dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumSystemCodePagesA}
function EnumSystemCodePagesW(lpCodePageEnumProc: CODEPAGE_ENUMPROCW;
  dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumSystemCodePagesW}
function EnumSystemCodePages(lpCodePageEnumProc: CODEPAGE_ENUMPROC;
  dwFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM EnumSystemCodePages}

{$ENDIF JWA_IMPLEMENTATIONSECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
implementation
//uses ...
{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_INTERFACESECTION}

{$IFNDEF JWA_INCLUDEMODE}
const
  kernel32 = 'kernel32.dll';

  {$IFDEF UNICODE}
  AWSuffix = 'W';
  {$ELSE}
  AWSuffix = 'A';
  {$ENDIF UNICODE}
{$ENDIF JWA_INCLUDEMODE}


function IsValidCodePage; external kernel32 name 'IsValidCodePage' delayed;
function GetACP; external kernel32 name 'GetACP' delayed;
function GetOEMCP; external kernel32 name 'GetOEMCP' delayed;
function GetCPInfo; external kernel32 name 'GetCPInfo' delayed;
function GetCPInfoExA; external kernel32 name 'GetCPInfoExA' delayed;
function GetCPInfoExW; external kernel32 name 'GetCPInfoExW' delayed;
function GetCPInfoEx; external kernel32 name 'GetCPInfoEx' + AWSuffix delayed;
function IsDBCSLeadByte; external kernel32 name 'IsDBCSLeadByte' delayed;
function IsDBCSLeadByteEx; external kernel32 name 'IsDBCSLeadByteEx' delayed;
function MultiByteToWideChar; external kernel32 name 'MultiByteToWideChar' delayed;
function WideCharToMultiByte; external kernel32 name 'WideCharToMultiByte' delayed;
function CompareStringA; external kernel32 name 'CompareStringA' delayed;
function CompareStringW; external kernel32 name 'CompareStringW' delayed;
function CompareString; external kernel32 name 'CompareString' + AWSuffix delayed;
function LCMapStringA; external kernel32 name 'LCMapStringA' delayed;
function LCMapStringW; external kernel32 name 'LCMapStringW' delayed;
function LCMapString; external kernel32 name 'LCMapString' + AWSuffix delayed;
function GetLocaleInfoA; external kernel32 name 'GetLocaleInfoA' delayed;
function GetLocaleInfoW; external kernel32 name 'GetLocaleInfoW' delayed;
function GetLocaleInfo; external kernel32 name 'GetLocaleInfo' + AWSuffix delayed;
function SetLocaleInfoA; external kernel32 name 'SetLocaleInfoA' delayed;
function SetLocaleInfoW; external kernel32 name 'SetLocaleInfoW' delayed;
function SetLocaleInfo; external kernel32 name 'SetLocaleInfo' + AWSuffix delayed;
function GetCalendarInfoA; external kernel32 name 'GetCalendarInfoA' delayed;
function GetCalendarInfoW; external kernel32 name 'GetCalendarInfoW' delayed;
function GetCalendarInfo; external kernel32 name 'GetCalendarInfo' + AWSuffix delayed;
function SetCalendarInfoA; external kernel32 name 'SetCalendarInfoA' delayed;
function SetCalendarInfoW; external kernel32 name 'SetCalendarInfoW' delayed;
function SetCalendarInfo; external kernel32 name 'SetCalendarInfo' + AWSuffix delayed;
function GetTimeFormatA; external kernel32 name 'GetTimeFormatA' delayed;
function GetTimeFormatW; external kernel32 name 'GetTimeFormatW' delayed;
function GetTimeFormat; external kernel32 name 'GetTimeFormat' + AWSuffix delayed;
function GetDateFormatA; external kernel32 name 'GetDateFormatA' delayed;
function GetDateFormatW; external kernel32 name 'GetDateFormatW' delayed;
function GetDateFormat; external kernel32 name 'GetDateFormat' + AWSuffix delayed;
function GetNumberFormatA; external kernel32 name 'GetNumberFormatA' delayed;
function GetNumberFormatW; external kernel32 name 'GetNumberFormatW' delayed;
function GetNumberFormat; external kernel32 name 'GetNumberFormat' + AWSuffix delayed;
function GetCurrencyFormatA; external kernel32 name 'GetCurrencyFormatA' delayed;
function GetCurrencyFormatW; external kernel32 name 'GetCurrencyFormatW' delayed;
function GetCurrencyFormat; external kernel32 name 'GetCurrencyFormat' + AWSuffix delayed;
function EnumCalendarInfoA; external kernel32 name 'EnumCalendarInfoA' delayed;
function EnumCalendarInfoW; external kernel32 name 'EnumCalendarInfoW' delayed;
function EnumCalendarInfo; external kernel32 name 'EnumCalendarInfo' + AWSuffix delayed;
function EnumCalendarInfoExA; external kernel32 name 'EnumCalendarInfoExA' delayed;
function EnumCalendarInfoExW; external kernel32 name 'EnumCalendarInfoExW' delayed;
function EnumCalendarInfoEx; external kernel32 name 'EnumCalendarInfoEx' + AWSuffix delayed;
function EnumTimeFormatsA; external kernel32 name 'EnumTimeFormatsA' delayed;
function EnumTimeFormatsW; external kernel32 name 'EnumTimeFormatsW' delayed;
function EnumTimeFormats; external kernel32 name 'EnumTimeFormats' + AWSuffix delayed;
function EnumDateFormatsA; external kernel32 name 'EnumDateFormatsA' delayed;
function EnumDateFormatsW; external kernel32 name 'EnumDateFormatsW' delayed;
function EnumDateFormats; external kernel32 name 'EnumDateFormats' + AWSuffix delayed;
function EnumDateFormatsExA; external kernel32 name 'EnumDateFormatsExA' delayed;
function EnumDateFormatsExW; external kernel32 name 'EnumDateFormatsExW' delayed;
function EnumDateFormatsEx; external kernel32 name 'EnumDateFormatsEx' + AWSuffix delayed;
function IsValidLanguageGroup; external kernel32 name 'IsValidLanguageGroup' delayed;
function GetNLSVersion; external kernel32 name 'GetNLSVersion' delayed;
function IsNLSDefinedString; external kernel32 name 'IsNLSDefinedString' delayed;
function IsValidLocale; external kernel32 name 'IsValidLocale' delayed;
function GetGeoInfoA; external kernel32 name 'GetGeoInfoA' delayed;
function GetGeoInfoW; external kernel32 name 'GetGeoInfoW' delayed;
function GetGeoInfo; external kernel32 name 'GetGeoInfo' delayed;
function EnumSystemGeoID; external kernel32 name 'EnumSystemGeoID' delayed;
function GetUserGeoID; external kernel32 name 'GetUserGeoID' delayed;
function SetUserGeoID; external kernel32 name 'SetUserGeoID' delayed;
function ConvertDefaultLocale; external kernel32 name 'ConvertDefaultLocale' delayed;
function GetThreadLocale; external kernel32 name 'GetThreadLocale' delayed;
function SetThreadLocale; external kernel32 name 'SetThreadLocale' delayed;
function GetSystemDefaultUILanguage; external kernel32 name 'GetSystemDefaultUILanguage' delayed;
function GetUserDefaultUILanguage; external kernel32 name 'GetUserDefaultUILanguage' delayed;
function GetSystemDefaultLangID; external kernel32 name 'GetSystemDefaultLangID' delayed;
function GetUserDefaultLangID; external kernel32 name 'GetUserDefaultLangID' delayed;
function GetSystemDefaultLCID; external kernel32 name 'GetSystemDefaultLCID' delayed;
function GetUserDefaultLCID; external kernel32 name 'GetUserDefaultLCID' delayed;
function GetStringTypeExA; external kernel32 name 'GetStringTypeExA' delayed;
function GetStringTypeExW; external kernel32 name 'GetStringTypeExW' delayed;
function GetStringTypeEx; external kernel32 name 'GetStringTypeEx' + AWSuffix delayed;
function GetStringTypeA; external kernel32 name 'GetStringTypeA' delayed;
function GetStringTypeW; external kernel32 name 'GetStringTypeW' delayed;
function FoldStringA; external kernel32 name 'FoldStringA' delayed;
function FoldStringW; external kernel32 name 'FoldStringW' delayed;
function FoldString; external kernel32 name 'FoldString' + AWSuffix delayed;
function EnumSystemLanguageGroupsA; external kernel32 name 'EnumSystemLanguageGroupsA' delayed;
function EnumSystemLanguageGroupsW; external kernel32 name 'EnumSystemLanguageGroupsW' delayed;
function EnumSystemLanguageGroups; external kernel32 name 'EnumSystemLanguageGroups' + AWSuffix delayed;
function EnumLanguageGroupLocalesA; external kernel32 name 'EnumLanguageGroupLocalesA' delayed;
function EnumLanguageGroupLocalesW; external kernel32 name 'EnumLanguageGroupLocalesW' delayed;
function EnumLanguageGroupLocales; external kernel32 name 'EnumLanguageGroupLocales' + AWSuffix delayed;
function EnumUILanguagesA; external kernel32 name 'EnumUILanguagesA' delayed;
function EnumUILanguagesW; external kernel32 name 'EnumUILanguagesW' delayed;
function EnumUILanguages; external kernel32 name 'EnumUILanguages' + AWSuffix delayed;
function EnumSystemLocalesA; external kernel32 name 'EnumSystemLocalesA' delayed;
function EnumSystemLocalesW; external kernel32 name 'EnumSystemLocalesW' delayed;
function EnumSystemLocales; external kernel32 name 'EnumSystemLocales' + AWSuffix delayed;
function EnumSystemCodePagesA; external kernel32 name 'EnumSystemCodePagesA' delayed;
function EnumSystemCodePagesW; external kernel32 name 'EnumSystemCodePagesW' delayed;
function EnumSystemCodePages; external kernel32 name 'EnumSystemCodePages' + AWSuffix delayed;

{$ENDIF JWA_INTERFACESECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
end.
{$ENDIF JWA_OMIT_SECTIONS}
