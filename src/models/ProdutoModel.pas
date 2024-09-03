unit ProdutoModel;

interface

uses FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Conexao;

type
  TProduto = class
  private
    FCodigo: Integer;
    FDescricao: String;
    FPreco_Venda: Double;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: String read FDescricao write FDescricao;
    property Preco_Venda: Double read FPreco_Venda write FPreco_Venda;
  end;


implementation


{ TProduto }



end.
