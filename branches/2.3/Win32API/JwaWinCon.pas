{******************************************************************************}
{                                                                              }
{ Console Applications API interface Unit for Object Pascal                    }
{                                                                              }
{ Portions created by Microsoft are Copyright (C) 1995-2001 Microsoft          }
{ Corporation. All Rights Reserved.                                            }
{                                                                              }
{ The original file is: wincon.h, released June 2000. The original Pascal      }
{ code is: WinCon.pas, released December 2000. The initial developer of the    }
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

// $Id: JwaWinCon.pas,v 1.12 2007/09/05 11:58:53 dezipaitor Exp $

{$IFNDEF JWA_OMIT_SECTIONS}
unit JwaWinCon;

{$WEAKPACKAGEUNIT}


{$ENDIF JWA_OMIT_SECTIONS}

{$HPPEMIT ''}
{$HPPEMIT '#include "WinCon.h"'}
{$HPPEMIT ''}

{$IFNDEF JWA_OMIT_SECTIONS}

{$I ..\Includes\JediAPILib.inc}

interface

uses
  JwaWinBase, JwaWinType;

{$ENDIF JWA_OMIT_SECTIONS}

{$IFNDEF JWA_IMPLEMENTATIONSECTION}


type
  PCOORD = ^COORD;
  {$EXTERNALSYM PCOORD}
  _COORD = record
    X: SHORT;
    Y: SHORT;
  end;
  {$EXTERNALSYM _COORD}
  COORD = _COORD;
  {$EXTERNALSYM COORD}
  TCoord = _COORD;

  PSMALL_RECT = ^SMALL_RECT;
  {$EXTERNALSYM PSMALL_RECT}
  _SMALL_RECT = record
    Left: SHORT;
    Top: SHORT;
    Right: SHORT;
    Bottom: SHORT;
  end;
  {$EXTERNALSYM _SMALL_RECT}
  SMALL_RECT = _SMALL_RECT;
  {$EXTERNALSYM SMALL_RECT}
  TSmallRect = SMALL_RECT;
  PSmallRect = PSMALL_RECT;

  TCharUnion = record
    case Integer of
      0: (UnicodeChar: WCHAR);
      1: (AsciiChar: AnsiChar);
  end;

  PKEY_EVENT_RECORD = ^KEY_EVENT_RECORD;
  {$EXTERNALSYM PKEY_EVENT_RECORD}
  _KEY_EVENT_RECORD = record
    bKeyDown: BOOL;
    wRepeatCount: WORD;
    wVirtualKeyCode: WORD;
    wVirtualScanCode: WORD;
    uChar: TCharUnion;
    dwControlKeyState: DWORD;
  end;
  {$EXTERNALSYM _KEY_EVENT_RECORD}
  KEY_EVENT_RECORD = _KEY_EVENT_RECORD;
  {$EXTERNALSYM KEY_EVENT_RECORD}
  TKeyEventRecord = KEY_EVENT_RECORD;
  PKeyEventRecord = PKEY_EVENT_RECORD;

//
// ControlKeyState flags
//

const
  RIGHT_ALT_PRESSED  = $0001; // the right alt key is pressed.
  {$EXTERNALSYM RIGHT_ALT_PRESSED}
  LEFT_ALT_PRESSED   = $0002; // the left alt key is pressed.
  {$EXTERNALSYM LEFT_ALT_PRESSED}
  RIGHT_CTRL_PRESSED = $0004; // the right ctrl key is pressed.
  {$EXTERNALSYM RIGHT_CTRL_PRESSED}
  LEFT_CTRL_PRESSED  = $0008; // the left ctrl key is pressed.
  {$EXTERNALSYM LEFT_CTRL_PRESSED}
  SHIFT_PRESSED      = $0010; // the shift key is pressed.
  {$EXTERNALSYM SHIFT_PRESSED}
  NUMLOCK_ON         = $0020; // the numlock light is on.
  {$EXTERNALSYM NUMLOCK_ON}
  SCROLLLOCK_ON      = $0040; // the scrolllock light is on.
  {$EXTERNALSYM SCROLLLOCK_ON}
  CAPSLOCK_ON        = $0080; // the capslock light is on.
  {$EXTERNALSYM CAPSLOCK_ON}
  ENHANCED_KEY       = $0100; // the key is enhanced.
  {$EXTERNALSYM ENHANCED_KEY}
  NLS_DBCSCHAR       = $00010000; // DBCS for JPN: SBCS/DBCS mode.
  {$EXTERNALSYM NLS_DBCSCHAR}
  NLS_ALPHANUMERIC   = $00000000; // DBCS for JPN: Alphanumeric mode.
  {$EXTERNALSYM NLS_ALPHANUMERIC}
  NLS_KATAKANA       = $00020000; // DBCS for JPN: Katakana mode.
  {$EXTERNALSYM NLS_KATAKANA}
  NLS_HIRAGANA       = $00040000; // DBCS for JPN: Hiragana mode.
  {$EXTERNALSYM NLS_HIRAGANA}
  NLS_ROMAN          = $00400000; // DBCS for JPN: Roman/Noroman mode.
  {$EXTERNALSYM NLS_ROMAN}
  NLS_IME_CONVERSION = $00800000; // DBCS for JPN: IME conversion.
  {$EXTERNALSYM NLS_IME_CONVERSION}
  NLS_IME_DISABLE    = $20000000; // DBCS for JPN: IME enable/disable.
  {$EXTERNALSYM NLS_IME_DISABLE}

type
  PMOUSE_EVENT_RECORD = ^MOUSE_EVENT_RECORD;
  {$EXTERNALSYM PMOUSE_EVENT_RECORD}
  _MOUSE_EVENT_RECORD = record
    dwMousePosition: COORD;
    dwButtonState: DWORD;
    dwControlKeyState: DWORD;
    dwEventFlags: DWORD;
  end;
  {$EXTERNALSYM _MOUSE_EVENT_RECORD}
  MOUSE_EVENT_RECORD = _MOUSE_EVENT_RECORD;
  {$EXTERNALSYM MOUSE_EVENT_RECORD}
  TMouseEventRecord = MOUSE_EVENT_RECORD;
  PMouseEventRecord = PMOUSE_EVENT_RECORD;

//
// ButtonState flags
//

const
  FROM_LEFT_1ST_BUTTON_PRESSED = $0001;
  {$EXTERNALSYM FROM_LEFT_1ST_BUTTON_PRESSED}
  RIGHTMOST_BUTTON_PRESSED     = $0002;
  {$EXTERNALSYM RIGHTMOST_BUTTON_PRESSED}
  FROM_LEFT_2ND_BUTTON_PRESSED = $0004;
  {$EXTERNALSYM FROM_LEFT_2ND_BUTTON_PRESSED}
  FROM_LEFT_3RD_BUTTON_PRESSED = $0008;
  {$EXTERNALSYM FROM_LEFT_3RD_BUTTON_PRESSED}
  FROM_LEFT_4TH_BUTTON_PRESSED = $0010;
  {$EXTERNALSYM FROM_LEFT_4TH_BUTTON_PRESSED}

//
// EventFlags
//

  MOUSE_MOVED   = $0001;
  {$EXTERNALSYM MOUSE_MOVED}
  DOUBLE_CLICK  = $0002;
  {$EXTERNALSYM DOUBLE_CLICK}
  MOUSE_WHEELED = $0004;
  {$EXTERNALSYM MOUSE_WHEELED}

type
  PWINDOW_BUFFER_SIZE_RECORD = ^WINDOW_BUFFER_SIZE_RECORD;
  {$EXTERNALSYM PWINDOW_BUFFER_SIZE_RECORD}
  _WINDOW_BUFFER_SIZE_RECORD = record
    dwSize: COORD;
  end;
  {$EXTERNALSYM _WINDOW_BUFFER_SIZE_RECORD}
  WINDOW_BUFFER_SIZE_RECORD = _WINDOW_BUFFER_SIZE_RECORD;
  {$EXTERNALSYM WINDOW_BUFFER_SIZE_RECORD}
  TWindowBufferSizeRecord = WINDOW_BUFFER_SIZE_RECORD;
  PWindowBufferSizeRecord = PWINDOW_BUFFER_SIZE_RECORD;

  PMENU_EVENT_RECORD = ^MENU_EVENT_RECORD;
  {$EXTERNALSYM PMENU_EVENT_RECORD}
  _MENU_EVENT_RECORD = record
    dwCommandId: UINT;
  end;
  {$EXTERNALSYM _MENU_EVENT_RECORD}
  MENU_EVENT_RECORD = _MENU_EVENT_RECORD;
  {$EXTERNALSYM MENU_EVENT_RECORD}
  TMenuEventRecord = MENU_EVENT_RECORD;
  PMenuEventRecord = PMENU_EVENT_RECORD;

  PFOCUS_EVENT_RECORD = ^FOCUS_EVENT_RECORD;
  {$EXTERNALSYM PFOCUS_EVENT_RECORD}
  _FOCUS_EVENT_RECORD = record
    bSetFocus: BOOL;
  end;
  {$EXTERNALSYM _FOCUS_EVENT_RECORD}
  FOCUS_EVENT_RECORD = _FOCUS_EVENT_RECORD;
  {$EXTERNALSYM FOCUS_EVENT_RECORD}
  TFocusEventRecord = FOCUS_EVENT_RECORD;
  PFocusEventRecord = PFOCUS_EVENT_RECORD;

  PINPUT_RECORD = ^INPUT_RECORD;
  {$EXTERNALSYM PINPUT_RECORD}
  _INPUT_RECORD = record
    EventType: WORD;
    case Integer of
      0: (KeyEvent: KEY_EVENT_RECORD);
      1: (MouseEvent: MOUSE_EVENT_RECORD);
      2: (WindowBufferSizeEvent: WINDOW_BUFFER_SIZE_RECORD);
      3: (MenuEvent: MENU_EVENT_RECORD);
      4: (FocusEvent: FOCUS_EVENT_RECORD);
  end;
  {$EXTERNALSYM _INPUT_RECORD}
  INPUT_RECORD = _INPUT_RECORD;
  {$EXTERNALSYM INPUT_RECORD}
  TInputRecord = INPUT_RECORD;
  PInputRecord = PINPUT_RECORD;

//
//  EventType flags:
//

const
  KEY_EVENT                = $0001; // Event contains key event record
  {$EXTERNALSYM KEY_EVENT}
  MOUSE_EVENT_             = $0002; // Event contains mouse event record
  
  WINDOW_BUFFER_SIZE_EVENT = $0004; // Event contains window change event record
  {$EXTERNALSYM WINDOW_BUFFER_SIZE_EVENT}
  MENU_EVENT               = $0008; // Event contains menu event record
  {$EXTERNALSYM MENU_EVENT}
  FOCUS_EVENT              = $0010; // event contains focus change
  {$EXTERNALSYM FOCUS_EVENT}

type
  PCHAR_INFO = ^CHAR_INFO;
  {$EXTERNALSYM PCHAR_INFO}
  _CHAR_INFO = record
    uChar: TCharUnion;
    Attributes: WORD;
  end;
  {$EXTERNALSYM _CHAR_INFO}
  CHAR_INFO = _CHAR_INFO;
  {$EXTERNALSYM CHAR_INFO}
  TCharInfo = CHAR_INFO;
  PCharInfo = PCHAR_INFO;

//
// Attributes flags:
//

const
  FOREGROUND_BLUE            = $0001; // text color contains blue.
  {$EXTERNALSYM FOREGROUND_BLUE}
  FOREGROUND_GREEN           = $0002; // text color contains green.
  {$EXTERNALSYM FOREGROUND_GREEN}
  FOREGROUND_RED             = $0004; // text color contains red.
  {$EXTERNALSYM FOREGROUND_RED}
  FOREGROUND_INTENSITY       = $0008; // text color is intensified.
  {$EXTERNALSYM FOREGROUND_INTENSITY}
  BACKGROUND_BLUE            = $0010; // background color contains blue.
  {$EXTERNALSYM BACKGROUND_BLUE}
  BACKGROUND_GREEN           = $0020; // background color contains green.
  {$EXTERNALSYM BACKGROUND_GREEN}
  BACKGROUND_RED             = $0040; // background color contains red.
  {$EXTERNALSYM BACKGROUND_RED}
  BACKGROUND_INTENSITY       = $0080; // background color is intensified.
  {$EXTERNALSYM BACKGROUND_INTENSITY}
  COMMON_LVB_LEADING_BYTE    = $0100; // Leading Byte of DBCS
  {$EXTERNALSYM COMMON_LVB_LEADING_BYTE}
  COMMON_LVB_TRAILING_BYTE   = $0200; // Trailing Byte of DBCS
  {$EXTERNALSYM COMMON_LVB_TRAILING_BYTE}
  COMMON_LVB_GRID_HORIZONTAL = $0400; // DBCS: Grid attribute: top horizontal.
  {$EXTERNALSYM COMMON_LVB_GRID_HORIZONTAL}
  COMMON_LVB_GRID_LVERTICAL  = $0800; // DBCS: Grid attribute: left vertical.
  {$EXTERNALSYM COMMON_LVB_GRID_LVERTICAL}
  COMMON_LVB_GRID_RVERTICAL  = $1000; // DBCS: Grid attribute: right vertical.
  {$EXTERNALSYM COMMON_LVB_GRID_RVERTICAL}
  COMMON_LVB_REVERSE_VIDEO   = $4000; // DBCS: Reverse fore/back ground attribute.
  {$EXTERNALSYM COMMON_LVB_REVERSE_VIDEO}
  COMMON_LVB_UNDERSCORE      = $8000; // DBCS: Underscore.
  {$EXTERNALSYM COMMON_LVB_UNDERSCORE}

  COMMON_LVB_SBCSDBCS        = $0300; // SBCS or DBCS flag.
  {$EXTERNALSYM COMMON_LVB_SBCSDBCS}

type
  PCONSOLE_SCREEN_BUFFER_INFO = ^CONSOLE_SCREEN_BUFFER_INFO;
  {$EXTERNALSYM PCONSOLE_SCREEN_BUFFER_INFO}
  _CONSOLE_SCREEN_BUFFER_INFO = record
    dwSize: COORD;
    dwCursorPosition: COORD;
    wAttributes: WORD;
    srWindow: SMALL_RECT;
    dwMaximumWindowSize: COORD;
  end;
  {$EXTERNALSYM _CONSOLE_SCREEN_BUFFER_INFO}
  CONSOLE_SCREEN_BUFFER_INFO = _CONSOLE_SCREEN_BUFFER_INFO;
  {$EXTERNALSYM CONSOLE_SCREEN_BUFFER_INFO}
  TConsoleScreenBufferInfo = CONSOLE_SCREEN_BUFFER_INFO;
  PConsoleScreenBufferInfo = PCONSOLE_SCREEN_BUFFER_INFO;

  PCONSOLE_CURSOR_INFO = ^CONSOLE_CURSOR_INFO;
  {$EXTERNALSYM PCONSOLE_CURSOR_INFO}
  _CONSOLE_CURSOR_INFO = record
    dwSize: DWORD;
    bVisible: BOOL;
  end;
  {$EXTERNALSYM _CONSOLE_CURSOR_INFO}
  CONSOLE_CURSOR_INFO = _CONSOLE_CURSOR_INFO;
  {$EXTERNALSYM CONSOLE_CURSOR_INFO}
  TConsoleCursorInfo = CONSOLE_CURSOR_INFO;
  PConsoleCursorInfo = PCONSOLE_CURSOR_INFO;

  _CONSOLE_FONT_INFO = record
    nFont: DWORD;
    dwFontSize: COORD;
  end;
  {$EXTERNALSYM _CONSOLE_FONT_INFO}
  CONSOLE_FONT_INFO = _CONSOLE_FONT_INFO;
  {$EXTERNALSYM CONSOLE_FONT_INFO}
  PCONSOLE_FONT_INFO = ^CONSOLE_FONT_INFO;
  {$EXTERNALSYM PCONSOLE_FONT_INFO}
  TConsoleFontInfo = CONSOLE_FONT_INFO;
  PConsoleFontInfo = PCONSOLE_FONT_INFO;

  _CONSOLE_SELECTION_INFO = record
    dwFlags: DWORD;
    dwSelectionAnchor: COORD;
    srSelection: SMALL_RECT;
  end;
  {$EXTERNALSYM _CONSOLE_SELECTION_INFO}
  CONSOLE_SELECTION_INFO = _CONSOLE_SELECTION_INFO;
  {$EXTERNALSYM CONSOLE_SELECTION_INFO}
  PCONSOLE_SELECTION_INFO = ^CONSOLE_SELECTION_INFO;
  {$EXTERNALSYM PCONSOLE_SELECTION_INFO}
  TConsoleSelectionInfo = CONSOLE_SELECTION_INFO;
  PConsoleSelectionInfo = PCONSOLE_SELECTION_INFO;  

//
// Selection flags
//

const
  CONSOLE_NO_SELECTION          = $0000;
  {$EXTERNALSYM CONSOLE_NO_SELECTION}
  CONSOLE_SELECTION_IN_PROGRESS = $0001;   // selection has begun
  {$EXTERNALSYM CONSOLE_SELECTION_IN_PROGRESS}
  CONSOLE_SELECTION_NOT_EMPTY   = $0002;   // non-null select rectangle
  {$EXTERNALSYM CONSOLE_SELECTION_NOT_EMPTY}
  CONSOLE_MOUSE_SELECTION       = $0004;   // selecting with mouse
  {$EXTERNALSYM CONSOLE_MOUSE_SELECTION}
  CONSOLE_MOUSE_DOWN            = $0008;   // mouse is down
  {$EXTERNALSYM CONSOLE_MOUSE_DOWN}

//
// typedef for ctrl-c handler routines
//

type
  PHANDLER_ROUTINE = function(CtrlType: DWORD): BOOL; stdcall;
  {$EXTERNALSYM PHANDLER_ROUTINE}
  THandlerRoutine = PHANDLER_ROUTINE;

const
  CTRL_C_EVENT        = 0;
  {$EXTERNALSYM CTRL_C_EVENT}
  CTRL_BREAK_EVENT    = 1;
  {$EXTERNALSYM CTRL_BREAK_EVENT}
  CTRL_CLOSE_EVENT    = 2;
  {$EXTERNALSYM CTRL_CLOSE_EVENT}
  // 3 is reserved!
  // 4 is reserved!
  CTRL_LOGOFF_EVENT   = 5;
  {$EXTERNALSYM CTRL_LOGOFF_EVENT}
  CTRL_SHUTDOWN_EVENT = 6;
  {$EXTERNALSYM CTRL_SHUTDOWN_EVENT}

//
//  Input Mode flags:
//

  ENABLE_PROCESSED_INPUT = $0001;
  {$EXTERNALSYM ENABLE_PROCESSED_INPUT}
  ENABLE_LINE_INPUT      = $0002;
  {$EXTERNALSYM ENABLE_LINE_INPUT}
  ENABLE_ECHO_INPUT      = $0004;
  {$EXTERNALSYM ENABLE_ECHO_INPUT}
  ENABLE_WINDOW_INPUT    = $0008;
  {$EXTERNALSYM ENABLE_WINDOW_INPUT}
  ENABLE_MOUSE_INPUT     = $0010;
  {$EXTERNALSYM ENABLE_MOUSE_INPUT}

//
// Output Mode flags:
//

  ENABLE_PROCESSED_OUTPUT   = $0001;
  {$EXTERNALSYM ENABLE_PROCESSED_OUTPUT}
  ENABLE_WRAP_AT_EOL_OUTPUT = $0002;
  {$EXTERNALSYM ENABLE_WRAP_AT_EOL_OUTPUT}

//
// direct API definitions.
//

function PeekConsoleInputA(hConsoleInput: HANDLE; lpBuffer: PINPUT_RECORD;
  nLength: DWORD; var lpNumberOfEventsRead: DWORD): BOOL; stdcall;
{$EXTERNALSYM PeekConsoleInputA}
function PeekConsoleInputW(hConsoleInput: HANDLE; lpBuffer: PINPUT_RECORD;
  nLength: DWORD; var lpNumberOfEventsRead: DWORD): BOOL; stdcall;
{$EXTERNALSYM PeekConsoleInputW}
function PeekConsoleInput(hConsoleInput: HANDLE; lpBuffer: PINPUT_RECORD;
  nLength: DWORD; var lpNumberOfEventsRead: DWORD): BOOL; stdcall;
{$EXTERNALSYM PeekConsoleInput}

function ReadConsoleInputA(hConsoleInput: HANDLE; lpBuffer: PINPUT_RECORD;
  nLength: DWORD; var lpNumberOfEventsRead: DWORD): BOOL; stdcall;
{$EXTERNALSYM ReadConsoleInputA}
function ReadConsoleInputW(hConsoleInput: HANDLE; lpBuffer: PINPUT_RECORD;
  nLength: DWORD; var lpNumberOfEventsRead: DWORD): BOOL; stdcall;
{$EXTERNALSYM ReadConsoleInputW}
function ReadConsoleInput(hConsoleInput: HANDLE; lpBuffer: PINPUT_RECORD;
  nLength: DWORD; var lpNumberOfEventsRead: DWORD): BOOL; stdcall;
{$EXTERNALSYM ReadConsoleInput}

function WriteConsoleInputA(hConsoleInput: HANDLE; lpBuffer: PINPUT_RECORD;
  nLength: DWORD; var lpNumberOfEventsWritten: DWORD): BOOL; stdcall;
{$EXTERNALSYM WriteConsoleInputA}
function WriteConsoleInputW(hConsoleInput: HANDLE; lpBuffer: PINPUT_RECORD;
  nLength: DWORD; var lpNumberOfEventsWritten: DWORD): BOOL; stdcall;
{$EXTERNALSYM WriteConsoleInputW}
function WriteConsoleInput(hConsoleInput: HANDLE; lpBuffer: PINPUT_RECORD;
  nLength: DWORD; var lpNumberOfEventsWritten: DWORD): BOOL; stdcall;
{$EXTERNALSYM WriteConsoleInput}

function ReadConsoleOutputA(hConsoleOutput: HANDLE; lpBuffer: PCHAR_INFO;
  dwBufferSize: COORD; dwBufferCoord: COORD;
  var lpReadRegion: SMALL_RECT): BOOL; stdcall;
{$EXTERNALSYM ReadConsoleOutputA}
function ReadConsoleOutputW(hConsoleOutput: HANDLE; lpBuffer: PCHAR_INFO;
  dwBufferSize: COORD; dwBufferCoord: COORD;
  var lpReadRegion: SMALL_RECT): BOOL; stdcall;
{$EXTERNALSYM ReadConsoleOutputW}
function ReadConsoleOutput(hConsoleOutput: HANDLE; lpBuffer: PCHAR_INFO;
  dwBufferSize: COORD; dwBufferCoord: COORD;
  var lpReadRegion: SMALL_RECT): BOOL; stdcall;
{$EXTERNALSYM ReadConsoleOutput}

function WriteConsoleOutputA(hConsoleOutput: HANDLE; lpBuffer: PCHAR_INFO;
  dwBufferSize: COORD; dwBufferCoord: COORD;
  var lpWriteRegion: SMALL_RECT): BOOL; stdcall;
{$EXTERNALSYM WriteConsoleOutputA}
function WriteConsoleOutputW(hConsoleOutput: HANDLE; lpBuffer: PCHAR_INFO;
  dwBufferSize: COORD; dwBufferCoord: COORD;
  var lpWriteRegion: SMALL_RECT): BOOL; stdcall;
{$EXTERNALSYM WriteConsoleOutputW}
function WriteConsoleOutput(hConsoleOutput: HANDLE; lpBuffer: PCHAR_INFO;
  dwBufferSize: COORD; dwBufferCoord: COORD;
  var lpWriteRegion: SMALL_RECT): BOOL; stdcall;
{$EXTERNALSYM WriteConsoleOutput}

function ReadConsoleOutputCharacterA(hConsoleOutput: HANDLE; lpCharacter: LPSTR;
  nLength: DWORD; dwReadCoord: COORD; var lpNumberOfCharsRead: DWORD): BOOL; stdcall;
{$EXTERNALSYM ReadConsoleOutputCharacterA}
function ReadConsoleOutputCharacterW(hConsoleOutput: HANDLE; lpCharacter: LPWSTR;
  nLength: DWORD; dwReadCoord: COORD; var lpNumberOfCharsRead: DWORD): BOOL; stdcall;
{$EXTERNALSYM ReadConsoleOutputCharacterW}
function ReadConsoleOutputCharacter(hConsoleOutput: HANDLE; lpCharacter: LPTSTR;
  nLength: DWORD; dwReadCoord: COORD; var lpNumberOfCharsRead: DWORD): BOOL; stdcall;
{$EXTERNALSYM ReadConsoleOutputCharacter}

function ReadConsoleOutputAttribute(hConsoleOutput: HANDLE;
  var lpAttribute: DWORD; nLength: DWORD; dwReadCoord: COORD;
  var lpNumberOfAttrsRead: DWORD): BOOL; stdcall;
{$EXTERNALSYM ReadConsoleOutputAttribute}

function WriteConsoleOutputCharacterA(hConsoleOutput: HANDLE;
  lpCharacter: LPCSTR; nLength: DWORD; dwWriteCoord: COORD;
  var lpNumberOfCharsWritten: DWORD): BOOL; stdcall;
{$EXTERNALSYM WriteConsoleOutputCharacterA}
function WriteConsoleOutputCharacterW(hConsoleOutput: HANDLE;
  lpCharacter: LPCWSTR; nLength: DWORD; dwWriteCoord: COORD;
  var lpNumberOfCharsWritten: DWORD): BOOL; stdcall;
{$EXTERNALSYM WriteConsoleOutputCharacterW}
function WriteConsoleOutputCharacter(hConsoleOutput: HANDLE;
  lpCharacter: LPCTSTR; nLength: DWORD; dwWriteCoord: COORD;
  var lpNumberOfCharsWritten: DWORD): BOOL; stdcall;
{$EXTERNALSYM WriteConsoleOutputCharacter}

function WriteConsoleOutputAttribute(hConsoleOutput: HANDLE; lpAttribute: PWORD;
  nLength: DWORD; dwWriteCoord: COORD; var lpNumberOfAttrsWritten: DWORD): BOOL; stdcall;
{$EXTERNALSYM WriteConsoleOutputAttribute}

function FillConsoleOutputCharacterA(hConsoleOutput: HANDLE; cCharacter: AnsiChar;
  nLength: DWORD; dwWriteCoord: COORD; var lpNumberOfCharsWritten: DWORD): BOOL; stdcall;
{$EXTERNALSYM FillConsoleOutputCharacterA}
function FillConsoleOutputCharacterW(hConsoleOutput: HANDLE; cCharacter: WCHAR;
  nLength: DWORD; dwWriteCoord: COORD; var lpNumberOfCharsWritten: DWORD): BOOL; stdcall;
{$EXTERNALSYM FillConsoleOutputCharacterW}
function FillConsoleOutputCharacter(hConsoleOutput: HANDLE; cCharacter: TCHAR;
  nLength: DWORD; dwWriteCoord: COORD; var lpNumberOfCharsWritten: DWORD): BOOL; stdcall;
{$EXTERNALSYM FillConsoleOutputCharacter}

function FillConsoleOutputAttribute(hConsoleOutput: HANDLE; wAttribute: WORD;
  nLength: DWORD; dwWriteCoord: COORD; var lpNumberOfAttrsWritten: DWORD): BOOL; stdcall;
{$EXTERNALSYM FillConsoleOutputAttribute}
function GetConsoleMode(hConsoleHandle: HANDLE; var lpMode: DWORD): BOOL; stdcall;
{$EXTERNALSYM GetConsoleMode}
function GetNumberOfConsoleInputEvents(hConsoleInput: HANDLE;
  var lpNumberOfEvents: DWORD): BOOL; stdcall;
{$EXTERNALSYM GetNumberOfConsoleInputEvents}
function GetConsoleScreenBufferInfo(hConsoleOutput: HANDLE;
  var lpConsoleScreenBufferInfo: CONSOLE_SCREEN_BUFFER_INFO): BOOL; stdcall;
{$EXTERNALSYM GetConsoleScreenBufferInfo}
function GetLargestConsoleWindowSize(hConsoleOutput: HANDLE): COORD; stdcall;
{$EXTERNALSYM GetLargestConsoleWindowSize}
function GetConsoleCursorInfo(hConsoleOutput: HANDLE;
  var lpConsoleCursorInfo: CONSOLE_CURSOR_INFO): BOOL; stdcall;
function GetCurrentConsoleFont(hConsoleOutput: HANDLE; bMaximumWindow: BOOL;
  var lpConsoleCurrentFont: CONSOLE_FONT_INFO): BOOL; stdcall;
{$EXTERNALSYM GetCurrentConsoleFont}
function GetConsoleFontSize(hConsoleOutput: HANDLE; nFont: DWORD): COORD; stdcall;
{$EXTERNALSYM GetConsoleFontSize}
function GetConsoleSelectionInfo(var lpConsoleSelectionInfo: CONSOLE_SELECTION_INFO): BOOL; stdcall;
{$EXTERNALSYM GetConsoleSelectionInfo}
{$EXTERNALSYM GetConsoleCursorInfo}
function GetNumberOfConsoleMouseButtons(var lpNumberOfMouseButtons: DWORD): BOOL; stdcall;
{$EXTERNALSYM GetNumberOfConsoleMouseButtons}
function SetConsoleMode(hConsoleHandle: HANDLE; dwMode: DWORD): BOOL; stdcall;
{$EXTERNALSYM SetConsoleMode}
function SetConsoleActiveScreenBuffer(hConsoleOutput: HANDLE): BOOL; stdcall;
{$EXTERNALSYM SetConsoleActiveScreenBuffer}
function FlushConsoleInputBuffer(hConsoleInput: HANDLE): BOOL; stdcall;
{$EXTERNALSYM FlushConsoleInputBuffer}
function SetConsoleScreenBufferSize(hConsoleOutput: HANDLE; dwSize: COORD): BOOL; stdcall;
{$EXTERNALSYM SetConsoleScreenBufferSize}
function SetConsoleCursorPosition(hConsoleOutput: HANDLE; dwCursorPosition: COORD): BOOL; stdcall;
{$EXTERNALSYM SetConsoleCursorPosition}
function SetConsoleCursorInfo(hConsoleOutput: HANDLE;
  var lpConsoleCursorInfo: CONSOLE_CURSOR_INFO): BOOL; stdcall;
{$EXTERNALSYM SetConsoleCursorInfo}

function ScrollConsoleScreenBufferA(hConsoleOutput: HANDLE;
  const lpScrollRectangle: SMALL_RECT; lpClipRectangle: PSMALL_RECT;
  dwDestinationOrigin: COORD; const lpFill: CHAR_INFO): BOOL; stdcall;
{$EXTERNALSYM ScrollConsoleScreenBufferA}
function ScrollConsoleScreenBufferW(hConsoleOutput: HANDLE;
  const lpScrollRectangle: PSMALL_RECT; lpClipRectangle: PSMALL_RECT;
  dwDestinationOrigin: COORD; const lpFill: CHAR_INFO): BOOL; stdcall;
{$EXTERNALSYM ScrollConsoleScreenBufferW}
function ScrollConsoleScreenBuffer(hConsoleOutput: HANDLE;
  const lpScrollRectangle: PSMALL_RECT; lpClipRectangle: PSMALL_RECT;
  dwDestinationOrigin: COORD; const lpFill: CHAR_INFO): BOOL; stdcall;
{$EXTERNALSYM ScrollConsoleScreenBuffer}

function SetConsoleWindowInfo(hConsoleOutput: HANDLE; bAbsolute: BOOL;
  const lpConsoleWindow: SMALL_RECT): BOOL; stdcall;
{$EXTERNALSYM SetConsoleWindowInfo}
function SetConsoleTextAttribute(hConsoleOutput: HANDLE; wAttributes: WORD): BOOL; stdcall;
{$EXTERNALSYM SetConsoleTextAttribute}
function SetConsoleCtrlHandler(HandlerRoutine: PHANDLER_ROUTINE; Add: BOOL): BOOL; stdcall;
{$EXTERNALSYM SetConsoleCtrlHandler}
function GenerateConsoleCtrlEvent(dwCtrlEvent: DWORD; dwProcessGroupId: DWORD): BOOL; stdcall;
{$EXTERNALSYM GenerateConsoleCtrlEvent}
function AllocConsole: BOOL; stdcall;
{$EXTERNALSYM AllocConsole}
function FreeConsole: BOOL; stdcall;
{$EXTERNALSYM FreeConsole}
function AttachConsole(dwProcessId: DWORD): BOOL; stdcall;
{$EXTERNALSYM AttachConsole}

const
  ATTACH_PARENT_PROCESS = DWORD(-1);
  {$EXTERNALSYM ATTACH_PARENT_PROCESS}

function GetConsoleTitleA(lpConsoleTitle: LPSTR; nSize: DWORD): DWORD; stdcall;
{$EXTERNALSYM GetConsoleTitleA}
function GetConsoleTitleW(lpConsoleTitle: LPWSTR; nSize: DWORD): DWORD; stdcall;
{$EXTERNALSYM GetConsoleTitleW}
function GetConsoleTitle(lpConsoleTitle: LPTSTR; nSize: DWORD): DWORD; stdcall;
{$EXTERNALSYM GetConsoleTitle}

function SetConsoleTitleA(lpConsoleTitle: LPCSTR): BOOL; stdcall;
{$EXTERNALSYM SetConsoleTitleA}
function SetConsoleTitleW(lpConsoleTitle: LPCWSTR): BOOL; stdcall;
{$EXTERNALSYM SetConsoleTitleW}
function SetConsoleTitle(lpConsoleTitle: LPCTSTR): BOOL; stdcall;
{$EXTERNALSYM SetConsoleTitle}

function ReadConsoleA(hConsoleInput: HANDLE; lpBuffer: LPVOID;
  nNumberOfCharsToRead: DWORD; var lpNumberOfCharsRead: DWORD;
  lpReserved: LPVOID): BOOL; stdcall;
{$EXTERNALSYM ReadConsoleA}
function ReadConsoleW(hConsoleInput: HANDLE; lpBuffer: LPVOID;
  nNumberOfCharsToRead: DWORD; var lpNumberOfCharsRead: DWORD;
  lpReserved: LPVOID): BOOL; stdcall;
{$EXTERNALSYM ReadConsoleW}
function ReadConsole(hConsoleInput: HANDLE; lpBuffer: LPVOID;
  nNumberOfCharsToRead: DWORD; var lpNumberOfCharsRead: DWORD;
  lpReserved: LPVOID): BOOL; stdcall;
{$EXTERNALSYM ReadConsole}

function WriteConsoleA(hConsoleOutput: HANDLE; lpBuffer: LPVOID;
  nNumberOfCharsToWrite: DWORD; var lpNumberOfCharsWritten: DWORD;
  lpReserved: LPVOID): BOOL; stdcall;
{$EXTERNALSYM WriteConsoleA}
function WriteConsoleW(hConsoleOutput: HANDLE; lpBuffer: LPVOID;
  nNumberOfCharsToWrite: DWORD; var lpNumberOfCharsWritten: DWORD;
  lpReserved: LPVOID): BOOL; stdcall;
{$EXTERNALSYM WriteConsoleW}
function WriteConsole(hConsoleOutput: HANDLE; lpBuffer: LPVOID;
  nNumberOfCharsToWrite: DWORD; var lpNumberOfCharsWritten: DWORD;
  lpReserved: LPVOID): BOOL; stdcall;
{$EXTERNALSYM WriteConsole}

const
  CONSOLE_TEXTMODE_BUFFER = 1;
  {$EXTERNALSYM CONSOLE_TEXTMODE_BUFFER}

function CreateConsoleScreenBuffer(dwDesiredAccess: DWORD; dwShareMode: DWORD;
  lpSecurityAttributes: PSECURITY_ATTRIBUTES; dwFlags: DWORD;
  lpScreenBufferData: LPVOID): HANDLE; stdcall;
{$EXTERNALSYM CreateConsoleScreenBuffer}
function GetConsoleCP: UINT; stdcall;
{$EXTERNALSYM GetConsoleCP}
function SetConsoleCP(wCodePageID: UINT): BOOL; stdcall;
{$EXTERNALSYM SetConsoleCP}
function GetConsoleOutputCP: UINT; stdcall;
{$EXTERNALSYM GetConsoleOutputCP}
function SetConsoleOutputCP(wCodePageID: UINT): BOOL; stdcall;
{$EXTERNALSYM SetConsoleOutputCP}

const
  CONSOLE_FULLSCREEN = 1;            // fullscreen console
  {$EXTERNALSYM CONSOLE_FULLSCREEN}
  CONSOLE_FULLSCREEN_HARDWARE = 2;   // console owns the hardware
  {$EXTERNALSYM CONSOLE_FULLSCREEN_HARDWARE}

function GetConsoleDisplayMode(var lpModeFlags: DWORD): BOOL; stdcall;
{$EXTERNALSYM GetConsoleDisplayMode}

function GetConsoleWindow: HWND; stdcall;
{$EXTERNALSYM GetConsoleWindow}

function GetConsoleProcessList(var lpdwProcessList: LPDWORD; dwProcessCount: DWORD): DWORD; stdcall;
{$EXTERNALSYM GetConsoleProcessList}

//
// Aliasing apis.
//

function AddConsoleAliasA(Source, Target, ExeName: LPSTR): BOOL; stdcall;
{$EXTERNALSYM AddConsoleAliasA}
function AddConsoleAliasW(Source, Target, ExeName: LPWSTR): BOOL; stdcall;
{$EXTERNALSYM AddConsoleAliasW}
function AddConsoleAlias(Source, Target, ExeName: LPTSTR): BOOL; stdcall;
{$EXTERNALSYM AddConsoleAlias}

function GetConsoleAliasA(Source, TargetBuffer: LPSTR; TargetBufferLength: DWORD; ExeName: LPSTR): DWORD; stdcall;
{$EXTERNALSYM GetConsoleAliasA}
function GetConsoleAliasW(Source, TargetBuffer: LPWSTR; TargetBufferLength: DWORD; ExeName: LPWSTR): DWORD; stdcall;
{$EXTERNALSYM GetConsoleAliasW}
function GetConsoleAlias(Source, TargetBuffer: LPTSTR; TargetBufferLength: DWORD; ExeName: LPTSTR): DWORD; stdcall;
{$EXTERNALSYM GetConsoleAlias}

function GetConsoleAliasesLengthA(ExeName: LPSTR): DWORD; stdcall;
{$EXTERNALSYM GetConsoleAliasesLengthA}
function GetConsoleAliasesLengthW(ExeName: LPWSTR): DWORD; stdcall;
{$EXTERNALSYM GetConsoleAliasesLengthW}
function GetConsoleAliasesLength(ExeName: LPTSTR): DWORD; stdcall;
{$EXTERNALSYM GetConsoleAliasesLength}

function GetConsoleAliasExesLengthA: DWORD; stdcall;
{$EXTERNALSYM GetConsoleAliasExesLengthA}
function GetConsoleAliasExesLengthW: DWORD; stdcall;
{$EXTERNALSYM GetConsoleAliasExesLengthW}
function GetConsoleAliasExesLength: DWORD; stdcall;
{$EXTERNALSYM GetConsoleAliasExesLength}

function GetConsoleAliasesA(AliasBuffer: LPSTR; AliasBufferLength: DWORD; ExeName: LPSTR): DWORD; stdcall;
{$EXTERNALSYM GetConsoleAliasesA}
function GetConsoleAliasesW(AliasBuffer: LPWSTR; AliasBufferLength: DWORD; ExeName: LPWSTR): DWORD; stdcall;
{$EXTERNALSYM GetConsoleAliasesW}
function GetConsoleAliases(AliasBuffer: LPTSTR; AliasBufferLength: DWORD; ExeName: LPTSTR): DWORD; stdcall;
{$EXTERNALSYM GetConsoleAliases}

function GetConsoleAliasExesA(ExeNameBuffer: LPSTR; ExeNameBufferLength: DWORD): DWORD; stdcall;
{$EXTERNALSYM GetConsoleAliasExesA}
function GetConsoleAliasExesW(ExeNameBuffer: LPWSTR; ExeNameBufferLength: DWORD): DWORD; stdcall;
{$EXTERNALSYM GetConsoleAliasExesW}
function GetConsoleAliasExes(ExeNameBuffer: LPTSTR; ExeNameBufferLength: DWORD): DWORD; stdcall;
{$EXTERNALSYM GetConsoleAliasExes}

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

function PeekConsoleInputA; external kernel32 name 'PeekConsoleInputA' delayed;
function PeekConsoleInputW; external kernel32 name 'PeekConsoleInputW' delayed;
function PeekConsoleInput; external kernel32 name 'PeekConsoleInput' + AWSuffix delayed;
function ReadConsoleInputA; external kernel32 name 'ReadConsoleInputA' delayed;
function ReadConsoleInputW; external kernel32 name 'ReadConsoleInputW' delayed;
function ReadConsoleInput; external kernel32 name 'ReadConsoleInput' + AWSuffix delayed;
function WriteConsoleInputA; external kernel32 name 'WriteConsoleInputA' delayed;
function WriteConsoleInputW; external kernel32 name 'WriteConsoleInputW' delayed;
function WriteConsoleInput; external kernel32 name 'WriteConsoleInput' + AWSuffix delayed;
function ReadConsoleOutputA; external kernel32 name 'ReadConsoleOutputA' delayed;
function ReadConsoleOutputW; external kernel32 name 'ReadConsoleOutputW' delayed;
function ReadConsoleOutput; external kernel32 name 'ReadConsoleOutput' + AWSuffix delayed;
function WriteConsoleOutputA; external kernel32 name 'WriteConsoleOutputA' delayed;
function WriteConsoleOutputW; external kernel32 name 'WriteConsoleOutputW' delayed;
function WriteConsoleOutput; external kernel32 name 'WriteConsoleOutput' + AWSuffix delayed;
function ReadConsoleOutputCharacterA; external kernel32 name 'ReadConsoleOutputCharacterA' delayed;
function ReadConsoleOutputCharacterW; external kernel32 name 'ReadConsoleOutputCharacterW' delayed;
function ReadConsoleOutputCharacter; external kernel32 name 'ReadConsoleOutputCharacter' + AWSuffix delayed;
function ReadConsoleOutputAttribute; external kernel32 name 'ReadConsoleOutputAttribute' delayed;
function WriteConsoleOutputCharacterA; external kernel32 name 'WriteConsoleOutputCharacterA' delayed;
function WriteConsoleOutputCharacterW; external kernel32 name 'WriteConsoleOutputCharacterW' delayed;
function WriteConsoleOutputCharacter; external kernel32 name 'WriteConsoleOutputCharacter' + AWSuffix delayed;
function WriteConsoleOutputAttribute; external kernel32 name 'WriteConsoleOutputAttribute' delayed;
function FillConsoleOutputCharacterA; external kernel32 name 'FillConsoleOutputCharacterA' delayed;
function FillConsoleOutputCharacterW; external kernel32 name 'FillConsoleOutputCharacterW' delayed;
function FillConsoleOutputCharacter; external kernel32 name 'FillConsoleOutputCharacter' + AWSuffix delayed;
function FillConsoleOutputAttribute; external kernel32 name 'FillConsoleOutputAttribute' delayed;
function GetConsoleMode; external kernel32 name 'GetConsoleMode' delayed;
function GetNumberOfConsoleInputEvents; external kernel32 name 'GetNumberOfConsoleInputEvents' delayed;
function GetConsoleScreenBufferInfo; external kernel32 name 'GetConsoleScreenBufferInfo' delayed;
function GetLargestConsoleWindowSize; external kernel32 name 'GetLargestConsoleWindowSize' delayed;
function GetConsoleCursorInfo; external kernel32 name 'GetConsoleCursorInfo' delayed;
function GetCurrentConsoleFont; external kernel32 name 'GetCurrentConsoleFont' delayed;
function GetConsoleFontSize; external kernel32 name 'GetConsoleFontSize' delayed;
function GetConsoleSelectionInfo; external kernel32 name 'GetConsoleSelectionInfo' delayed;
function GetNumberOfConsoleMouseButtons; external kernel32 name 'GetNumberOfConsoleMouseButtons' delayed;
function SetConsoleMode; external kernel32 name 'SetConsoleMode' delayed;
function SetConsoleActiveScreenBuffer; external kernel32 name 'SetConsoleActiveScreenBuffer' delayed;
function FlushConsoleInputBuffer; external kernel32 name 'FlushConsoleInputBuffer' delayed;
function SetConsoleScreenBufferSize; external kernel32 name 'SetConsoleScreenBufferSize' delayed;
function SetConsoleCursorPosition; external kernel32 name 'SetConsoleCursorPosition' delayed;
function SetConsoleCursorInfo; external kernel32 name 'SetConsoleCursorInfo' delayed;
function ScrollConsoleScreenBufferA; external kernel32 name 'ScrollConsoleScreenBufferA' delayed;
function ScrollConsoleScreenBufferW; external kernel32 name 'ScrollConsoleScreenBufferW' delayed;
function ScrollConsoleScreenBuffer; external kernel32 name 'ScrollConsoleScreenBuffer' + AWSuffix delayed;
function SetConsoleWindowInfo; external kernel32 name 'SetConsoleWindowInfo' delayed;
function SetConsoleTextAttribute; external kernel32 name 'SetConsoleTextAttribute' delayed;
function SetConsoleCtrlHandler; external kernel32 name 'SetConsoleCtrlHandler' delayed;
function GenerateConsoleCtrlEvent; external kernel32 name 'GenerateConsoleCtrlEvent' delayed;
function AllocConsole; external kernel32 name 'AllocConsole' delayed;
function FreeConsole; external kernel32 name 'FreeConsole' delayed;
function AttachConsole; external kernel32 name 'AttachConsole' delayed;
function GetConsoleTitleA; external kernel32 name 'GetConsoleTitleA' delayed;
function GetConsoleTitleW; external kernel32 name 'GetConsoleTitleW' delayed;
function GetConsoleTitle; external kernel32 name 'GetConsoleTitle' + AWSuffix delayed;
function SetConsoleTitleA; external kernel32 name 'SetConsoleTitleA' delayed;
function SetConsoleTitleW; external kernel32 name 'SetConsoleTitleW' delayed;
function SetConsoleTitle; external kernel32 name 'SetConsoleTitle' + AWSuffix delayed;
function ReadConsoleA; external kernel32 name 'ReadConsoleA' delayed;
function ReadConsoleW; external kernel32 name 'ReadConsoleW' delayed;
function ReadConsole; external kernel32 name 'ReadConsole' + AWSuffix delayed;
function WriteConsoleA; external kernel32 name 'WriteConsoleA' delayed;
function WriteConsoleW; external kernel32 name 'WriteConsoleW' delayed;
function WriteConsole; external kernel32 name 'WriteConsole' + AWSuffix delayed;
function CreateConsoleScreenBuffer; external kernel32 name 'CreateConsoleScreenBuffer' delayed;
function GetConsoleCP; external kernel32 name 'GetConsoleCP' delayed;
function SetConsoleCP; external kernel32 name 'SetConsoleCP' delayed;
function GetConsoleOutputCP; external kernel32 name 'GetConsoleOutputCP' delayed;
function SetConsoleOutputCP; external kernel32 name 'SetConsoleOutputCP' delayed;
function GetConsoleDisplayMode; external kernel32 name 'GetConsoleDisplayMode' delayed;
function GetConsoleWindow; external kernel32 name 'GetConsoleWindow' delayed;
function GetConsoleProcessList; external kernel32 name 'GetConsoleProcessList' delayed;
function AddConsoleAliasA; external kernel32 name 'AddConsoleAliasA' delayed;
function AddConsoleAliasW; external kernel32 name 'AddConsoleAliasW' delayed;
function AddConsoleAlias; external kernel32 name 'AddConsoleAlias' + AWSuffix delayed;
function GetConsoleAliasA; external kernel32 name 'GetConsoleAliasA' delayed;
function GetConsoleAliasW; external kernel32 name 'GetConsoleAliasW' delayed;
function GetConsoleAlias; external kernel32 name 'GetConsoleAlias' + AWSuffix delayed;
function GetConsoleAliasesLengthA; external kernel32 name 'GetConsoleAliasesLengthA' delayed;
function GetConsoleAliasesLengthW; external kernel32 name 'GetConsoleAliasesLengthW' delayed;
function GetConsoleAliasesLength; external kernel32 name 'GetConsoleAliasesLength' + AWSuffix delayed;
function GetConsoleAliasExesLengthA; external kernel32 name 'GetConsoleAliasExesLengthA' delayed;
function GetConsoleAliasExesLengthW; external kernel32 name 'GetConsoleAliasExesLengthW' delayed;
function GetConsoleAliasExesLength; external kernel32 name 'GetConsoleAliasExesLength' + AWSuffix delayed;
function GetConsoleAliasesA; external kernel32 name 'GetConsoleAliasesA' delayed;
function GetConsoleAliasesW; external kernel32 name 'GetConsoleAliasesW' delayed;
function GetConsoleAliases; external kernel32 name 'GetConsoleAliases' + AWSuffix delayed;
function GetConsoleAliasExesA; external kernel32 name 'GetConsoleAliasExesA' delayed;
function GetConsoleAliasExesW; external kernel32 name 'GetConsoleAliasExesW' delayed;
function GetConsoleAliasExes; external kernel32 name 'GetConsoleAliasExes' + AWSuffix delayed;


{$ENDIF JWA_INTERFACESECTION}

{$IFNDEF JWA_OMIT_SECTIONS}
end.
{$ENDIF JWA_OMIT_SECTIONS}
