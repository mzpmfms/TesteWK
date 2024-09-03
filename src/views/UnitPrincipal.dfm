object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Teste WK'
  ClientHeight = 682
  ClientWidth = 1119
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  TextHeight = 15
  object bevelTotal: TBevel
    Left = 28
    Top = 500
    Width = 309
    Height = 106
    Style = bsRaised
  end
  object lblTotalDoPedido: TLabel
    Left = 34
    Top = 527
    Width = 295
    Height = 73
    Alignment = taCenter
    AutoSize = False
    Caption = '0,00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -53
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCodigoProduto: TLabel
    Left = 28
    Top = 165
    Width = 102
    Height = 15
    Caption = 'C'#243'digo do &Produto'
  end
  object lblQuantidade: TLabel
    Left = 28
    Top = 231
    Width = 62
    Height = 15
    Caption = '&Quantidade'
    FocusControl = edtQuantidade
  end
  object lblValorUnitario: TLabel
    Left = 189
    Top = 233
    Width = 74
    Height = 15
    Caption = '&Valor  Unit'#225'rio'
    FocusControl = edtValorUnitario
  end
  object lblTituloValorTotal: TLabel
    Left = 35
    Top = 505
    Width = 54
    Height = 15
    Caption = 'Valor Total'
  end
  object btnLocalizarProduto: TSpeedButton
    Left = 305
    Top = 179
    Width = 34
    Height = 31
    Cursor = crHandPoint
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
    OnClick = btnLocalizarProdutoClick
  end
  object gridDadosDoPedido: TDBGrid
    AlignWithMargins = True
    Left = 352
    Top = 165
    Width = 742
    Height = 441
    Margins.Left = 10
    Margins.Top = 0
    TabStop = False
    BorderStyle = bsNone
    DataSource = dsItensPedido
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnKeyDown = gridDadosDoPedidoKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 450
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorUnitario'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorTotal'
        Visible = True
      end>
  end
  object panTop: TPanel
    AlignWithMargins = True
    Left = 10
    Top = 69
    Width = 1099
    Height = 68
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 10
    Margins.Bottom = 10
    Align = alTop
    BevelOuter = bvNone
    Caption = 'panTop'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    ShowCaption = False
    TabOrder = 5
    ExplicitWidth = 1095
    DesignSize = (
      1099
      68)
    object lblTituloNumeroDoPedido: TLabel
      Left = 975
      Top = 7
      Width = 109
      Height = 21
      Margins.Right = 15
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Pedido N'#250'mero'
      ExplicitLeft = 850
    end
    object lblTituloDoCliente: TLabel
      Left = 15
      Top = 7
      Width = 124
      Height = 21
      Alignment = taRightJustify
      Caption = '&C'#243'digo do Cliente'
    end
    object lblNumeroDoPedido: TLabel
      Left = 988
      Top = 26
      Width = 96
      Height = 37
      Margins.Right = 15
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = '000000'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8421631
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 863
    end
    object lblNomeDoCliente: TLabel
      Left = 179
      Top = 34
      Width = 4
      Height = 21
      Layout = tlCenter
    end
    object btnLocalizarCliente: TSpeedButton
      Left = 138
      Top = 30
      Width = 34
      Height = 31
      Cursor = crHandPoint
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      OnClick = btnLocalizarClienteClick
    end
    object edtCliente: TEdit
      Left = 16
      Top = 31
      Width = 121
      Height = 29
      TabStop = False
      NumbersOnly = True
      TabOrder = 0
      OnChange = edtCliente2Change
      OnEnter = edtClienteEnter
      OnExit = edtClienteExit
      OnKeyDown = edtCodigoProdutoKeyDown
    end
  end
  object edtNomeDoProduto: TEdit
    AlignWithMargins = True
    Left = 10
    Top = 5
    Width = 1099
    Height = 64
    Margins.Left = 10
    Margins.Top = 5
    Margins.Right = 10
    Margins.Bottom = 0
    TabStop = False
    Align = alTop
    Alignment = taCenter
    AutoSize = False
    BevelInner = bvSpace
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16744448
    Font.Height = -40
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    Text = 'Informe o Produto'
    ExplicitWidth = 1095
  end
  object btnGravarPedido: TButton
    Left = 28
    Top = 366
    Width = 311
    Height = 53
    Caption = 'GRAVAR PEDIDO'
    TabOrder = 7
    TabStop = False
    OnClick = btnGravarPedidoClick
  end
  object btnCarregarPedido: TButton
    Left = 28
    Top = 425
    Width = 150
    Height = 51
    Caption = 'CARREGAR PEDIDO'
    TabOrder = 8
    TabStop = False
    OnClick = btnCarregarPedidoClick
  end
  object edtQuantidade: TEdit
    Left = 28
    Top = 248
    Width = 150
    Height = 29
    Alignment = taRightJustify
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 1
    OnEnter = edtQuantidadeEnter
    OnKeyDown = edtCodigoProdutoKeyDown
  end
  object edtValorUnitario: TEdit
    Left = 189
    Top = 250
    Width = 150
    Height = 29
    Alignment = taRightJustify
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnEnter = edtValorUnitarioEnter
    OnExit = edtValorUnitarioExit
    OnKeyDown = edtCodigoProdutoKeyDown
    OnKeyPress = edtValorUnitarioKeyPress
  end
  object btnConfirmar: TButton
    Left = 28
    Top = 299
    Width = 311
    Height = 53
    Caption = 'Confirmar'
    Enabled = False
    TabOrder = 4
    OnClick = btnConfirmarClick
  end
  object btnCancelarPedido: TButton
    Left = 189
    Top = 425
    Width = 150
    Height = 51
    Caption = 'CANCELAR PEDIDO'
    TabOrder = 9
    TabStop = False
    OnClick = btnCancelarPedidoClick
  end
  object edtCodigoProduto: TEdit
    Left = 28
    Top = 182
    Width = 274
    Height = 29
    NumbersOnly = True
    TabOrder = 0
    OnChange = edtCodigoProdutoChange
    OnEnter = edtCodigoProdutoEnter
    OnKeyDown = edtCodigoProdutoKeyDown
  end
  object tabItensPedido: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'Id'
        DataType = ftInteger
      end
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'Quantidade'
        DataType = ftInteger
      end
      item
        Name = 'ValorUnitario'
        DataType = ftFloat
      end
      item
        Name = 'ValorTotal'
        DataType = ftFloat
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 530
    Top = 347
    object tabItensPedidoId: TIntegerField
      FieldName = 'Id'
    end
    object tabItensPedidoCodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Codigo'
    end
    object tabItensPedidoNome: TStringField
      DisplayLabel = 'Descri'#231#227'o do Produto'
      FieldName = 'Nome'
      Size = 100
    end
    object tabItensPedidoQuantidade: TIntegerField
      DisplayLabel = 'Quant.'
      FieldName = 'Quantidade'
    end
    object tabItensPedidoValorUnitario: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'ValorUnitario'
      DisplayFormat = '#,###,##0.00'
    end
    object tabItensPedidoValorTotal: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'ValorTotal'
      DisplayFormat = '#,###,##0.00'
    end
  end
  object dsItensPedido: TDataSource
    DataSet = tabItensPedido
    Left = 522
    Top = 427
  end
end
