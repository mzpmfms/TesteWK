unit ProdutoController;

interface

uses
  System.Classes, Data.DB, Datasnap.DBClient, ProdutoDao, ProdutoModel,
  FireDAC.Comp.Client, Conexao, System.Generics.Collections;

type
  TProdutoController = class

  FDao: TProdutoDao;
  private

  public
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;

    function ObterProdutos: TList<TProduto>;
    function ObterProdutoPorCodigo(codigo: String): TProduto;
  end;


implementation


{ TProdutoController }

constructor TProdutoController.Create(AOwner: TComponent);
begin
  FDao := TProdutoDao.Create(nil);
end;

destructor TProdutoController.Destroy;
begin
  FDao.Free;

  inherited;
end;

function TProdutoController.ObterProdutoPorCodigo(codigo: String): TProduto;
begin
  Result := FDao.ObterProdutoPorCodigo(codigo);
end;

function TProdutoController.ObterProdutos: TList<TProduto>;
begin
  Result := FDao.ObterProdutos;
end;

end.



