unit ProdutoDao;

interface

uses
  System.Classes, Data.DB, Datasnap.DBClient, Dao, ProdutoModel,
  FireDAC.Comp.Client, Conexao, System.Generics.Collections,
  System.SysUtils, Vcl.Dialogs;

type
  TProdutoDao = class
    FDao: TDao;
    FQuery: TFDQuery;
    private

    public
      property Dao: TDao read FDao write FDao;
      property Query: TFDQuery read FQuery write FQuery;

      constructor Create(AOwner: TComponent);
      destructor Destroy; override;

      function ObterProdutos: TList<TProduto>;
      function ObterProdutoPorCodigo(codigo: String): TProduto;
  end;


implementation


{ ProdutoDao }

constructor TProdutoDao.Create(AOwner: TComponent);
begin
  Dao := TDao.Create;

  Query := TFDQuery.Create(nil);
  Query.Connection := Dao.obterConexao;
end;

destructor TProdutoDao.Destroy;
begin

  Query.Free;
  Dao.Free;

  inherited;
end;


function TProdutoDao.ObterProdutos: TList<TProduto>;
var
  ProdutosList: TList<TProduto>;
  Produto: TProduto;
begin

  ProdutosList := TList<TProduto>.Create;
  try

    Query.SQL.Text := 'SELECT * FROM Produtos';
    Query.Open;

    while not (Query.eof) do
    begin
      Produto := TProduto.Create;
      Produto.Codigo := Query.FieldByName('Codigo').AsInteger;
      Produto.Descricao := Query.FieldByName('Descricao').AsString;
      Produto.Preco_Venda := Query.FieldByName('Preco_Venda').AsFloat;

      ProdutosList.Add(Produto);

      Query.Next;
    end;

    Result := ProdutosList;
  except
    On E: Exception do
      ShowMessage('Erro: ' + E.Message);
  end;

end;

function TProdutoDao.ObterProdutoPorCodigo(codigo: String): TProduto;
begin
  Result := nil;
  try
    Query.Close;
    Query.SQL.Text := 'SELECT Codigo, Descricao, Preco_Venda FROM Produtos WHERE Codigo = :Codigo';
    Query.ParamByName('Codigo').AsString := codigo;
    Query.Open;

    if not Query.IsEmpty then
    begin
      Result := TProduto.Create;
      Result.Codigo := Query.FieldByName('Codigo').AsInteger;
      Result.Descricao := Query.FieldByName('Descricao').AsString;
      Result.Preco_Venda := Query.FieldByName('Preco_Venda').AsFloat;
    end;

  finally
    Query.Close;
  end;
end;


end.



