{******************************************************************************}
{                                                                              }
{ Lan Manager Buffer API interface Unit for Object Pascal                      }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2001 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The original file is: lmapibuf.h, released November 2001. The original       }
{ Pascal code is: LmApiBuf.pas, released Februari 2002. The initial developer  }
{ of the Pascal code is Marcel van Brakel (brakelm att chello dott nl).        }
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

// $Id: JwaLmApiBuf.pas,v 1.11 2007/09/05 11:58:50 dezipaitor Exp $

{$IFNDEF JWA_OMIT_SECTIONS_LM}
unit JwaLmApiBuf;

{$WEAKPACKAGEUNIT}
{$ENDIF JWA_OMIT_SECTIONS_LM}

{$HPPEMIT ''}
{$HPPEMIT '#include "lmapibuf.h"'}
{$HPPEMIT ''}

{$IFNDEF JWA_OMIT_SECTIONS_LM}
{$I ..\Includes\JediAPILib.inc}

interface

uses
  JwaLmCons, JwaWinType;
{$ENDIF JWA_OMIT_SECTIONS_LM}

{$IFNDEF JWA_IMPLEMENTATIONSECTION}
//
// Function Prototypes
//

function NetApiBufferAllocate(ByteCount: DWORD; var Buffer: LPVOID): NET_API_STATUS; stdcall;
{$EXTERNALSYM NetApiBufferAllocate}
function NetApiBufferFree(Buffer: LPVOID): NET_API_STATUS; stdcall;
{$EXTERNALSYM NetApiBufferFree}
function NetApiBufferReallocate(OldBuffer: LPVOID; NewByteCount: DWORD; var NewBuffer: LPVOID): NET_API_STATUS; stdcall;
{$EXTERNALSYM NetApiBufferReallocate}
function NetApiBufferSize(Buffer: LPVOID; var ByteCount: DWORD): NET_API_STATUS; stdcall;
{$EXTERNALSYM NetApiBufferSize}

//
// The following private function will go away eventually.
// Call NetApiBufferAllocate instead.
//

function NetapipBufferAllocate(ByteCount: DWORD; var Buffer: LPVOID): NET_API_STATUS; stdcall;
{$EXTERNALSYM NetapipBufferAllocate}

{$ENDIF JWA_IMPLEMENTATIONSECTION}

{$IFNDEF JWA_OMIT_SECTIONS_LM}
implementation
//uses ...
{$ENDIF JWA_OMIT_SECTIONS_LM}

{$IFNDEF JWA_INTERFACESECTION}

function NetApiBufferAllocate; external netapi32 name 'NetApiBufferAllocate' delayed;
function NetApiBufferFree; external netapi32 name 'NetApiBufferFree' delayed;
function NetApiBufferReallocate; external netapi32 name 'NetApiBufferReallocate' delayed;
function NetApiBufferSize; external netapi32 name 'NetApiBufferSize' delayed;
function NetapipBufferAllocate; external netapi32 name 'NetapipBufferAllocate' delayed;


{$ENDIF JWA_INTERFACESECTION}
                             
{$IFNDEF JWA_OMIT_SECTIONS_LM}
end.
{$ENDIF JWA_OMIT_SECTIONS_LM}
