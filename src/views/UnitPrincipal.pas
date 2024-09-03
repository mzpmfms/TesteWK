
unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, ClienteDao,
  ClienteController, ProdutoController, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls,
  Vcl.Mask, ProdutoDao, PedidoDao, ProdutoModel, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    gridDadosDoPedido: TDBGrid;
    panTop: TPanel;
    lblTituloNumeroDoPedido: TLabel;
    edtNomeDoProduto: TEdit;
    lblTotalDoPedido: TLabel;
    btnGravarPedido: TButton;
    lblTituloDoCliente: TLabel;
    lblNumeroDoPedido: TLabel;
    btnCarregarPedido: TButton;
    lblCodigoProduto: TLabel;
    edtQuantidade: TEdit;
    lblQuantidade: TLabel;
    edtValorUnitario: TEdit;
    lblValorUnitario: TLabel;
    btnConfirmar: TButton;
    btnCancelarPedido: TButton;
    lblNomeDoCliente: TLabel;
    tabItensPedido: TFDMemTable;
    tabItensPedidoCodigo: TIntegerField;
    tabItensPedidoNome: TStringField;
    tabItensPedidoQuantidade: TIntegerField;
    tabItensPedidoValorUnitario: TFloatField;
    tabItensPedidoValorTotal: TFloatField;
    dsItensPedido: TDataSource;
    bevelTotal: TBevel;
    lblTituloValorTotal: TLabel;
    edtCliente: TEdit;
    btnLocalizarCliente: TSpeedButton;
    edtCodigoProduto: TEdit;
    btnLocalizarProduto: TSpeedButton;
    tabItensPedidoId: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtValorUnitarioEnter(Sender: TObject);
    procedure edtValorUnitarioExit(Sender: TObject);
    procedure edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure gridDadosDoPedidoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGravarPedidoClick(Sender: TObject);
    procedure btnCarregarPedidoClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtQuantidadeEnter(Sender: TObject);
    procedure edtCliente2Change(Sender: TObject);
    procedure edtCliente2Enter(Sender: TObject);
    procedure btnLocalizarClienteClick(Sender: TObject);
    procedure btnLocalizarProdutoClick(Sender: TObject);
    procedure edtCodigoProdutoChange(Sender: TObject);
    procedure edtCodigoProdutoEnter(Sender: TObject);
    procedure edtCodigoProdutoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtClienteExit(Sender: TObject);
    procedure edtClienteEnter(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
  private
    FNomeDoCliente: String;
    FValorDoProduto: Real;

    procedure LimparCamposProduto;
    procedure CarregarCliente(CodigoCliente: String);
    procedure CarregarProduto(CodigoProduto: String);
    procedure ObterTotal;
    function Validar: Boolean;

    var editando: Boolean;

  public
    { Public declarations }

    var ClienteDao: TClienteDao;
    var ClienteController: TClienteController;

    var ProdutoDao: TProdutoDao;
    var ProdutoController: TProdutoController;

    var PedidoDao: TPedidoDao;
    var Produto: TProduto;

    var TotalPedido: Real;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  UnitCliente, UnitProduto;

{ TfrmPrincipal }


procedure TfrmPrincipal.CarregarCliente(CodigoCliente: String);
begin
  if CodigoCliente.IsEmpty then
  begin
    lblNomeDoCliente.Caption := '';
    Exit;
  end;

  ClienteController := TClienteController.Create(nil);
  try
    lblNomeDoCliente.Caption := ClienteController.ObterClientePorCodigo(CodigoCliente);
  finally
    ClienteController.Free;
  end;
end;

procedure TfrmPrincipal.CarregarProduto(CodigoProduto: String);
begin

  edtNomeDoProduto.Clear;
  try
    Produto := ProdutoController.ObterProdutoPorCodigo(edtCodigoProduto.Text);

    if Produto = nil then
    begin
      ShowMessage('Produto não encontrado. Por favor, verifique o código.');
      edtCodigoProduto.SetFocus;
      edtNomeDoProduto.Clear;
      exit;
    end;

    edtNomeDoProduto.Text := Produto.Descricao;
    FValorDoProduto := Produto.Preco_Venda;
    edtQuantidade.Text := '1';
    edtValorUnitario.Text := FormatFloat('#,###,##0.00', FValorDoProduto);
  except
    On E:Exception do
      ShowMessage('Erro: ' + e.Message);
  end;

end;

procedure TfrmPrincipal.edtCodigoProdutoChange(Sender: TObject);
begin
  btnConfirmar.Enabled := edtCodigoProduto.Text <> '';
end;

procedure TfrmPrincipal.edtCodigoProdutoEnter(Sender: TObject);
begin
  LimparCamposProduto;
end;

procedure TfrmPrincipal.edtCodigoProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    SelectNext(Sender as TWinControl, True, True);
end;

procedure TfrmPrincipal.LimparCamposProduto;
begin
  edtNomeDoProduto.Clear;
  edtQuantidade.Clear;
  edtValorUnitario.Text := '0,00';
  FValorDoProduto := 0;
end;

procedure TfrmPrincipal.ObterTotal;
begin

  With tabItensPedido do
  begin
    DisableConstraints;
    First;
    TotalPedido := 0;

    while not eof do
    begin
      TotalPedido := TotalPedido + FieldByName('ValorTotal').AsFloat;
      Next;
    end;

    EnableConstraints;
    First;
  end;

  lblTotalDoPedido.Caption := FormatFloat('#,###,##0.00', TotalPedido);

end;

function TfrmPrincipal.Validar: Boolean;
var
  Msg: String;
  FocusEdtControl: TWinControl;
begin
  Result := True;
  Msg := '';
  FocusedtControl := nil;

  if edtCliente.Text = '' then
  begin
    Msg := 'É necessário informar o cliente';
    FocusEdtControl := edtCliente;
  end;

  if edtQuantidade.Text = '' then
  begin
    if Msg <> '' then
      Msg := Msg + sLineBreak;
    Msg := Msg + 'É necessário informar a quantidade.';
    if not Assigned(FocusedtControl) then
      FocusEdtControl := edtQuantidade;
  end;

  if Msg <> '' then
  begin
    ShowMessage(Msg);
    FocusEdtControl.SetFocus;
    Result := False;
  end;

end;

procedure TfrmPrincipal.btnLocalizarProdutoClick(Sender: TObject);
begin
  frmConsultarProduto.ShowModal;
  edtCodigoProduto.Text := frmConsultarProduto.Tabela.FieldByName('Codigo').AsString;
  edtCodigoProduto.SetFocus;
end;

procedure TfrmPrincipal.btnLocalizarClienteClick(Sender: TObject);
begin
  frmConsultarCliente.ShowModal;
  edtCliente.Text := frmConsultarCliente.Tabela.FieldByName('Codigo').AsString;
  edtCliente.SetFocus;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  ClienteDao := TClienteDao.Create(nil);
  ClienteController := TClienteController.Create(nil);

  ProdutoDao := TProdutoDao.Create(nil);
  ProdutoController := TProdutoController.Create(nil);

  PedidoDao := TPedidoDao.Create(nil);

  editando := False;

  edtCliente.SetFocus;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClienteDao.Free;
  ClienteController.Free;

  ProdutoDao.Free;
  ProdutoController.Free;

  PedidoDao.Free;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
    btnGravarPedidoClick(Self);
  Key := 0;
end;

procedure TfrmPrincipal.edtCliente2Change(Sender: TObject);
begin
  btnCarregarPedido.Visible := edtCliente.Text = '';
  btnCancelarPedido.Visible := edtCliente.Text = '';
  btnConfirmar.Enabled      := edtCliente.Text <> '';
end;

procedure TfrmPrincipal.edtCliente2Enter(Sender: TObject);
begin
  lblNomeDoCliente.Caption := '';
end;

procedure TfrmPrincipal.edtClienteEnter(Sender: TObject);
begin
  lblNomeDoCliente.Caption := '';
end;

procedure TfrmPrincipal.edtClienteExit(Sender: TObject);
var
  NomeCliente: string;
begin

  lblNomeDoCliente.Caption := '';
  if Trim(edtCliente.Text).IsEmpty then
    exit;

  try
    NomeCliente := ClienteController.ObterClientePorCodigo(edtCliente.Text);

    if NomeCliente.IsEmpty then
    begin
      ShowMessage('Cliente não encontrado. Por favor, verifique o código.');
      edtCliente.SetFocus;
      lblNomeDoCliente.Caption := '';
      edtCliente.Clear;
    end
    else
    begin
      // novo pedido
      lblNomeDoCliente.Caption := NomeCliente;
      tabItensPedido.EmptyDataSet;
      lblTotalDoPedido.Caption := '0,00';
      lblNumeroDoPedido.Caption := Format('%.6d', [PedidoDao.ObterProximoNumero]);
    end;
  except
    On E:Exception do
      ShowMessage('Erro: ' + e.Message);
  end;

end;

procedure TfrmPrincipal.edtQuantidadeEnter(Sender: TObject);
begin
  if edtCodigoProduto.Text = '' then
  begin
    ShowMessage('Código do produto inválido.');
    edtCodigoProduto.SetFocus;
    Exit;
  end;

  try
    CarregarProduto(edtCodigoProduto.Text);
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao carregar o produto: ' + E.Message);
      edtCodigoProduto.SetFocus;
    end;
  end;

  edtQuantidade.SelectAll;
end;

procedure TfrmPrincipal.edtValorUnitarioEnter(Sender: TObject);
begin
  if (edtQuantidade.Text <> '') and (StrToInt(edtQuantidade.Text) <> 0) then
    edtValorUnitario.Text := FormatFloat('#,###,##0.00', StrToFloat(edtQuantidade.Text) * FValorDoProduto);

  edtValorUnitario.SelectAll;
end;

procedure TfrmPrincipal.edtValorUnitarioExit(Sender: TObject);
var
  Numero: Double;
begin
  if TryStrToFloat(edtValorUnitario.Text, Numero) then
    edtValorUnitario.Text := FormatFloat('#,##0.00', Numero);
end;

procedure TfrmPrincipal.edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9', ',', #8]) then
    Key := #0;
end;

procedure TfrmPrincipal.gridDadosDoPedidoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
    begin
      edtCodigoProduto.SetFocus;

      edtNomeDoProduto.Text := tabItensPedidoNOME.AsString;
      edtCodigoProduto.Text := tabItensPedidoCODIGO.AsString;
      edtQuantidade.Text := tabItensPedidoQUANTIDADE.AsString;
      edtValorUnitario.Text := FormatFloat('#,###,##0.00', tabItensPedidoVALORUNITARIO.AsFloat);

      editando := true;
    end;

    VK_DELETE:
    begin
      var Resultado: integer;
      Resultado := MessageBox(0, 'Deseja realmente excluir o produto?', 'Confirmação', MB_YESNO + MB_ICONQUESTION);
      if Resultado = IDYES then
      begin
        tabItensPedido.Delete;
        obterTotal;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.btnConfirmarClick(Sender: TObject);
begin

  if not validar then exit;

  if not editando then
    tabItensPedido.Append
  else
    tabItensPedido.Edit;
  tabItensPedido.FieldByName('Codigo').AsInteger  := Produto.Codigo;
  tabItensPedido.FieldByName('Nome').AsString := Produto.Descricao;
  tabItensPedido.FieldByName('Quantidade').AsInteger := StrToInt(edtQuantidade.Text);
  tabItensPedido.FieldByName('ValorUnitario').AsFloat := FValorDoProduto;
  tabItensPedido.FieldByName('ValorTotal').AsFloat := FValorDoProduto * StrToFloat(edtQuantidade.Text);
  tabItensPedido.Post;

  editando := false;

  obterTotal;

  edtCodigoProduto.SetFocus;

end;

procedure TfrmPrincipal.btnGravarPedidoClick(Sender: TObject);
var
  ValorTotal: Real;
begin
  btnGravarPedido.Caption := 'Aguarde...';
  ValorTotal := 0;

  try

    if not PedidoDao.PedidoExistePorNumero(StrToInt(lblNumeroDoPedido.Caption)) then
    begin
      tabItensPedido.First;
      while not tabItensPedido.Eof do
      begin
          PedidoDao.AdicionarItens( StrToInt(lblNumeroDoPedido.Caption),
                                    tabItensPedido.FieldByName('Codigo').AsInteger,
                                    tabItensPedido.FieldByName('Quantidade').AsInteger,
                                    tabItensPedido.FieldByName('ValorUnitario').AsFloat,
                                    tabItensPedido.FieldByName('ValorTotal').AsFloat );

        ValorTotal := ValorTotal + tabItensPedidoVALORTOTAL.AsFloat;
        tabItensPedido.Next;
      end;
      PedidoDao.Adicionar(StrToInt(lblNumeroDoPedido.Caption),
                          Date, StrToInt(edtCliente.Text), ValorTotal);


    end
    else
    begin
      tabItensPedido.First;
      while not tabItensPedido.Eof do
      begin
        PedidoDao.AtualizarItem(tabItensPedido.FieldByName('id').AsInteger,
                                tabItensPedido.FieldByName('Codigo').AsInteger,
                                tabItensPedido.FieldByName('Quantidade').AsInteger,
                                tabItensPedido.FieldByName('ValorUnitario').AsFloat,
                                tabItensPedido.FieldByName('ValorTotal').AsFloat);
        tabItensPedido.Next;
      end;
    end;

    tabItensPedido.EmptyDataSet;
    edtCliente.SetFocus;
    lblTotalDoPedido.Caption := '0,00';
    lblNumeroDoPedido.Caption := Format('%.6d', [(StrToInt(lblNumeroDoPedido.Caption) + 1)]);

  except
    On E: Exception do
      ShowMessage('Erro: ' + e.Message);
  end;

  btnGravarPedido.Caption := 'GRAVAR PEDIDO';
end;

procedure TfrmPrincipal.btnCancelarPedidoClick(Sender: TObject);
var
  NumeroPedido: String;
  Vok: Boolean;
begin

  Vok := InputQuery('Número do pedido', 'Digite o número do pedido', NumeroPedido);
  if not (Vok) or (NumeroPedido = '') then exit;

  if not PedidoDao.PedidoExistePorNumero(StrToInt(NumeroPedido)) then
  begin
    ShowMessage('Pedido não encontrado');
    exit;
  end;


  try
    var Resultado: integer;
    Resultado := MessageBox(0, 'Deseja realmente excluir o pedido ', 'Confirmação', MB_YESNO + MB_ICONQUESTION);
    if Resultado = IDYES then
    begin
      PedidoDao.Remover(StrToInt(NumeroPedido));
      ShowMessage('O pedido ' + numeroPedido + ' foi cancelado');
    end;
  except
    On E: Exception do
      ShowMessage('Erro: ' + e.Message);

  end;
end;

procedure TfrmPrincipal.btnCarregarPedidoClick(Sender: TObject);
var
  NumeroPedido: String;
  Vok: Boolean;

  Qry: TFDQuery;
  TotalPedido: Real;
begin

  Vok := InputQuery('Número do pedido', 'Digite o número do pedido', NumeroPedido);
  if not (Vok) or (NumeroPedido = '') then exit;

  try
    edtCliente.Text := '';
    lblNomeDoCliente.Caption := '';
    lblTotalDoPedido.Caption := '0,00';
    tabItensPedido.EmptyDataSet;

    Qry := PedidoDao.ObterPedidoPorNumero(StrToInt(NumeroPedido));
    Qry.Open;
    if Qry.RecordCount = 0  then
    begin
      ShowMessage('Pedido não encontrado');
      exit;
    end;

    TotalPedido := 0;
    tabItensPedido.EmptyDataSet;
    while not Qry.Eof do
    begin
      tabItensPedido.Append;
      tabItensPedidoID.AsInteger := Qry.FieldByName('id').AsInteger;
      tabItensPedidoCODIGO.AsInteger := Qry.FieldByName('Codigo_Produto').AsInteger;
      tabItensPedidoNOME.AsString := Qry.FieldByName('Produto').AsString;
      tabItensPedidoQUANTIDADE.AsInteger := Qry.FieldByName('Quantidade').AsInteger;
      tabItensPedidoVALORUNITARIO.AsFloat := Qry.FieldByName('Valor_Unitario').AsFloat;
      tabItensPedidoVALORTOTAL.AsFloat := Qry.FieldByName('Valor_Total').AsFloat;
      tabItensPedido.Post;

      TotalPedido := TotalPedido + Qry.FieldByName('Valor_Total').AsFloat;
      Qry.Next;
    end;

    lblNumeroDoPedido.Caption := Format('%.6d', [Qry.FieldByName('Numero_Pedido').AsInteger]);

    edtCliente.Text := Qry.FieldByName('Codigo_Cliente').AsString;
    lblNomeDoCliente.Caption := Qry.FieldByName('Nome').AsString;
    lblTotalDoPedido.Caption := FormatFloat('#,###,##0.00', TotalPedido);

    editando := true;

  except
    On E:Exception do
      ShowMessage('Erro: ' + e.Message);
  end;

end;

end.

