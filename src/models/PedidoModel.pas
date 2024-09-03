unit PedidoModel;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.Client, Vcl.Dialogs,
  PedidosProdutosModel, System.Generics.Collections, ClienteModel;

type
  TPedido = class
  private
    FNumero: Integer;
    FDataEmissao: TDateTime;
    FCodigoCliente: Integer;
    FValorTotal: Real;
    FCliente: TCliente;
    FItens: TList<TPedidosProdutos>;
  public
    property Numero: Integer read FNumero write FNumero;
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    property CodigoCliente: Integer read FCodigoCliente write FCodigoCliente;
    property Cliente: TCliente read FCliente write FCliente;
    property ValorTotal: Real read FValorTotal write FValorTotal;

    property Itens: TList<TPedidosProdutos> read FItens write FItens;
  end;

implementation


end.

