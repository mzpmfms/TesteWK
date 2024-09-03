program TesteWK;

uses
  Vcl.Forms,
  UnitPrincipal in '..\src\views\UnitPrincipal.pas' {frmPrincipal},
  Conexao in '..\src\models\Conexao.pas',
  ClienteModel in '..\src\models\ClienteModel.pas',
  ClienteController in '..\src\controllers\ClienteController.pas',
  UnitProduto in '..\src\views\UnitProduto.pas' {frmConsultarProduto},
  ProdutoModel in '..\src\models\ProdutoModel.pas',
  UnitCliente in '..\src\views\UnitCliente.pas' {frmConsultarCliente},
  PedidoModel in '..\src\models\PedidoModel.pas',
  PedidosProdutosModel in '..\src\models\PedidosProdutosModel.pas',
  ArquivoIniHelper in '..\helpers\ArquivoIniHelper.pas',
  ProdutoDao in '..\src\dao\ProdutoDao.pas',
  Dao in '..\src\dao\Dao.pas',
  ProdutoController in '..\src\controllers\ProdutoController.pas',
  ClienteDao in '..\src\dao\ClienteDao.pas',
  PedidoDao in '..\src\dao\PedidoDao.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmConsultarProduto, frmConsultarProduto);
  Application.CreateForm(TfrmConsultarCliente, frmConsultarCliente);
  Application.Run;
end.
