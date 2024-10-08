unit ClienteDao;

interface

uses
  System.Classes, Data.DB, Datasnap.DBClient, Dao, ClienteModel,
  FireDAC.Comp.Client, Conexao, System.Generics.Collections,
  System.SysUtils, Vcl.Dialogs;

type
  TClienteDao = class
    FDao: TDao;
    FQuery: TFDQuery;
    private

    public
      property Dao: TDao read FDao write FDao;
      property Query: TFDQuery read FQuery write FQuery;

      constructor Create(AOwner: TComponent);
      destructor Destroy; override;

      function ObterClientes: TList<TCliente>;
      function ObterClientePorCodigo(codigo: String): String;
  end;


implementation


{ ClienteDao }

constructor TClienteDao.Create(AOwner: TComponent);
begin
  Dao := TDao.Create;

  Query := TFDQuery.Create(nil);
  Query.Connection := Dao.obterConexao;
end;

destructor TClienteDao.Destroy;
begin

  Query.Free;
  Dao.Free;

  inherited;
end;


function TClienteDao.ObterClientes: TList<TCliente>;
var
  ClientesList: TList<TCliente>;
  Cliente: TCliente;
begin

  ClientesList := TList<TCliente>.Create;
  try

    Query.SQL.Text := 'SELECT * FROM Clientes';
    Query.Open;

    while not (Query.eof) do
    begin
      Cliente := TCliente.Create;
      Cliente.Codigo := Query.FieldByName('Codigo').AsInteger;
      Cliente.Nome := Query.FieldByName('Nome').AsString;
      Cliente.Cidade := Query.FieldByName('Cidade').AsString;
      Cliente.UF := Query.FieldByName('UF').AsString;

      ClientesList.Add(Cliente);

      Query.Next;
    end;

    Result := ClientesList;
  except
    On E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;

end;

function TClienteDao.ObterClientePorCodigo(codigo: String): String;
begin
  Result := '';

  try
    Query.Close;
    Query.SQL.Text := 'Select Nome From Clientes Where Codigo = ' + codigo;
    Query.Open;

    Query.Open;

    if Query.RecordCount > 0 then
      Result := Query.FieldByName('Nome').AsString;
  except
    On E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;

end;

end.



