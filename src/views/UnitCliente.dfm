object frmConsultarCliente: TfrmConsultarCliente
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Consultar Cliente'
  ClientHeight = 564
  ClientWidth = 867
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object gridClientes: TDBGrid
    AlignWithMargins = True
    Left = 10
    Top = 59
    Width = 847
    Height = 495
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alClient
    DataSource = dsDados
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnTitleClick = gridClientesTitleClick
  end
  object scCliente: TSearchBox
    AlignWithMargins = True
    Left = 10
    Top = 10
    Width = 847
    Height = 29
    Margins.Left = 10
    Margins.Top = 10
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyDown = scClienteKeyDown
    OnInvokeSearch = scClienteInvokeSearch
    ExplicitWidth = 843
  end
  object dsDados: TDataSource
    DataSet = Tabela
    Left = 808
    Top = 496
  end
  object Tabela: TFDMemTable
    Filtered = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 800
    Top = 416
  end
end
