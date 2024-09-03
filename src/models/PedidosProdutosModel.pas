unit PedidosProdutosModel;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client, Vcl.Dialogs,
  ProdutoModel;

type
  TPedidosProdutos = class
  private
    FId: Integer;
    FNumeroPedido: Integer;
    FCodigoProduto: Integer;
    FProduto: TProduto;
    FQuantidade: Integer;
    FValorUnitario: Real;
    FValorTotal: Real;
  public
    property Id: Integer read FId write FId;
    property NumeroPedido: Integer read FNumeroPedido write FNumeroPedido;
    property CodigoProduto: Integer read FCodigoProduto write FCodigoProduto;
    property Produto: TProduto read FProduto write FProduto;
    property Quantidade: Integer read FQuantidade write FQuantidade;
    property ValorUnitario: Real read FValorUnitario write FValorUnitario;
    property ValorTotal: Real read FValorTotal write FValorTotal;
  end;

implementation

end.

