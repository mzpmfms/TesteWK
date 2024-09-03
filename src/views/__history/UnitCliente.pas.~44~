unit UnitCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, ClienteController,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, ClienteModel,
  System.Generics.Collections, Vcl.StdCtrls, Vcl.WinXCtrls;

type
  TfrmConsultarCliente = class(TForm)
    gridClientes: TDBGrid;
    dsDados: TDataSource;
    Tabela: TFDMemTable;
    scCliente: TSearchBox;
    procedure FormShow(Sender: TObject);
    procedure scClienteInvokeSearch(Sender: TObject);
    procedure scClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gridClientesTitleClick(Column: TColumn);
  private
    { Private declarations }
    procedure filtrar;
    procedure PopularDados(Clientes: TList<TCliente>);
  public
    { Public declarations }
    var CampoOrdenado: String;
  end;

var
  frmConsultarCliente: TfrmConsultarCliente;

implementation

{$R *.dfm}

uses UnitPrincipal;


procedure TfrmConsultarCliente.filtrar;
var
  filtro: String;

  i: integer;
begin

  filtro := '';
  for i := 0 to Tabela.Fields.Count -1 do
    filtro := filtro + Tabela.Fields[i].FieldName + ' like ' + quotedStr('%' + scCliente.Text + '%') + ' or ';

  filtro := Copy(filtro, 1, Length(filtro) - 4);

  tabela.Filter := filtro;

end;

procedure TfrmConsultarCliente.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    Close;
end;

procedure TfrmConsultarCliente.FormShow(Sender: TObject);
var
  Clientes: TList<TCliente>;
begin

  try
    Clientes := frmPrincipal.ClienteController.ObterClientes();
    PopularDados(Clientes);
  finally
    Clientes.Free;
  end;

end;

procedure TfrmConsultarCliente.gridClientesTitleClick(Column: TColumn);
begin
  try
    if CampoOrdenado = Column.FieldName then
    begin
      Tabela.IndexFieldNames := Column.FieldName + ':D';
      CampoOrdenado := '';
    end
    else
    begin
      Tabela.IndexFieldNames := Column.FieldName;
      CampoOrdenado := Column.FieldName;
    end;
  except
    on E: Exception do
      ShowMessage('Erro ao aplicar ordenação: ' + E.Message);
  end;
end;


procedure TfrmConsultarCliente.PopularDados(Clientes: TList<TCliente>);
var
  Cliente: TCliente;
begin

  tabela.Close;
  With tabela.FieldDefs do
  begin
    Clear;
    Add('Codigo', ftInteger);
    Add('Nome', ftString, 60);
    Add('Cidade', ftString, 60);
    Add('UF', ftString, 3);
  end;
  tabela.CreateDataSet;
  tabela.Open;

  for Cliente in Clientes do
  begin

    With tabela do
    begin
      Append;
      FieldByName('Codigo').AsInteger := Cliente.Codigo;
      FieldByName('Nome').AsString := Cliente.Nome;
      FieldByName('Cidade').AsString := Cliente.Cidade;
      FieldByName('UF').AsString := Cliente.UF;
    end;

  end;

  tabela.First;
  scCliente.SetFocus;
end;

procedure TfrmConsultarCliente.scClienteInvokeSearch(Sender: TObject);
begin
  Filtrar;
end;

procedure TfrmConsultarCliente.scClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (scCliente.text <> '') and (key = VK_RETURN) then
    scCliente.OnInvokeSearch (self);
end;

end.
