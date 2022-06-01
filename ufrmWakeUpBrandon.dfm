object frmWakeUpBrandon: TfrmWakeUpBrandon
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Wake Up, Brandon!!!'
  ClientHeight = 509
  ClientWidth = 632
  Color = clYellow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblWakeUp: TLabel
    Left = 384
    Top = 56
    Width = 246
    Height = 29
    Caption = 'Wake Up, Brandon!!!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblSnoozeTime: TLabel
    Left = 64
    Top = 344
    Width = 262
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object btnSnooze: TButton
    Left = 64
    Top = 72
    Width = 262
    Height = 121
    Caption = 'Snooze'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnSnoozeClick
  end
  object btnUp: TButton
    Left = 64
    Top = 200
    Width = 262
    Height = 57
    Caption = 'OK!  I'#39'm up already!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnUpClick
  end
  object MediaPlayer: TMediaPlayer
    Left = 64
    Top = 264
    Width = 262
    Height = 30
    AutoEnable = False
    AutoRewind = False
    Display = MediaPlayer
    Visible = False
    TabOrder = 2
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 490
    Width = 632
    Height = 19
    Panels = <>
    SimplePanel = True
    ExplicitLeft = 320
    ExplicitTop = 248
    ExplicitWidth = 0
  end
  object tmrBlinker: TTimer
    Enabled = False
    Interval = 400
    OnTimer = tmrBlinkerTimer
    Left = 72
    Top = 416
  end
  object tmrSnooze: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = tmrSnoozeTimer
    Left = 280
    Top = 416
  end
  object tmrSecond: TTimer
    Enabled = False
    OnTimer = tmrSecondTimer
    Left = 176
    Top = 416
  end
end
