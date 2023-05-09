object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Client TCP Modbus verso Opta'
  ClientHeight = 808
  ClientWidth = 649
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object edIP_Slave: TLabeledEdit
    Left = 16
    Top = 32
    Width = 297
    Height = 23
    EditLabel.Width = 55
    EditLabel.Height = 15
    EditLabel.Caption = 'edIP_Slave'
    TabOrder = 0
    Text = '192.168.1.232'
  end
  object btnConnect: TButton
    Left = 336
    Top = 31
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 1
    OnClick = btnConnectClick
  end
  object btnReadCoils: TButton
    Left = 16
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Leggi Coils'
    Enabled = False
    TabOrder = 2
    OnClick = btnReadCoilsClick
  end
  object btnWriteCoils: TButton
    Left = 200
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Scrivi Coils'
    Enabled = False
    TabOrder = 3
    OnClick = btnWriteCoilsClick
  end
  object ckOutputs: TCheckListBox
    Left = 16
    Top = 120
    Width = 163
    Height = 241
    ItemHeight = 15
    Items.Strings = (
      'Out 1'
      'Out 2'
      'Out 3'
      'Out 4'
      'Led 1'
      'Led 2'
      'Led 3'
      'Led 4'
      'Led R'
      'Led G'
      'Led B')
    TabOrder = 4
  end
  object ckInputs: TCheckListBox
    Left = 354
    Top = 120
    Width = 153
    Height = 241
    ItemHeight = 15
    Items.Strings = (
      'In 1'
      'In 2'
      'In 3'
      'In 4'
      'In 5'
      'In 6'
      'In 7'
      'In 8')
    TabOrder = 5
  end
  object btnReadDiscreteInputs: TButton
    Left = 368
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Leggi Inputs'
    Enabled = False
    TabOrder = 6
    OnClick = btnReadDiscreteInputsClick
  end
  object btnDisconnect: TButton
    Left = 432
    Top = 31
    Width = 75
    Height = 25
    Caption = 'Disconnect'
    Enabled = False
    TabOrder = 7
    OnClick = btnDisconnectClick
  end
  object ckAutomatico: TCheckBox
    Left = 488
    Top = 84
    Width = 97
    Height = 17
    Caption = 'Automatico'
    TabOrder = 8
    OnClick = ckAutomaticoClick
  end
  object ckWriteOutputs: TCheckListBox
    Left = 185
    Top = 120
    Width = 163
    Height = 241
    ItemHeight = 15
    Items.Strings = (
      'Out 1'
      'Out 2'
      'Out 3'
      'Out 4'
      'Led 1'
      'Led 2'
      'Led 3'
      'Led 4'
      'Led R'
      'Led G'
      'Led B')
    TabOrder = 9
  end
  object sgDati: TStringGrid
    Left = 16
    Top = 424
    Width = 491
    Height = 305
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 10
  end
  object btnLeggiRegister: TButton
    Left = 16
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Leggi Reg.'
    Enabled = False
    TabOrder = 11
    OnClick = btnLeggiRegisterClick
  end
  object btnScriviRegister: TButton
    Left = 185
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Scrivi Reg.'
    Enabled = False
    TabOrder = 12
    OnClick = btnScriviRegisterClick
  end
  object Timer1: TTimer
    Interval = 200
    OnTimer = Timer1Timer
    Left = 4
    Top = 1
  end
end
