unit Conexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Async,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.DApt,  FireDAC.Stan.Intf,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Pool,FireDAC.Phys, Winapi.Windows, Vcl.Dialogs,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, ArquivoIniHelper;


type
  TConexao = class

  FConexao: TFDConnection;
  FDriver: TFDPhysMySQLDriverLink;
  FDWait: TFDGUIxWaitCursor;
  FQuery: TFDQuery;
  private
    FArquivoIni: TArquivoIniHelper;
    procedure ConfigureConnection;
  public
    constructor Create;
    destructor Destroy; override;

    function obterConexao: TFDConnection;
  end;

implementation

{ TConexao }

constructor TConexao.Create;
begin

  FConexao := TFDConnection.Create(nil);
  FDriver  := TFDPhysMySQLDriverLink.Create(nil);
  FDWait   := TFDGUIxWaitCursor.Create(nil);
  FQuery   := TFDQuery.Create(nil);
  FQuery.Connection := FConexao;


  FArquivoIni := TArquivoIniHelper.Create;

  ConfigureConnection;

end;

procedure TConexao.ConfigureConnection;
begin
  try
    FDriver.VendorLib := FArquivoIni.CaminhoDaAplicacao + 'libmysql.dll';

    FConexao.DriverName := 'MySQL';
    FConexao.Params.Values['Database'] := FArquivoIni.GetArquivoIni('DB', 'Database', '');
    FConexao.Params.Values['User_Name'] := FArquivoIni.GetArquivoIni('DB', 'Usuario', '');
    FConexao.Params.Values['Password'] := FArquivoIni.GetArquivoIni('DB', 'senha', '');
    FConexao.Params.Values['Server'] := FArquivoIni.GetArquivoIni('DB', 'servidor', '');
    FConexao.Params.Values['Port'] := FArquivoIni.GetArquivoIni('DB', 'porta', '');

    FConexao.Connected := True;

  except
    on E: Exception do
      MessageBox(0,PChar('Erro: ' + E.Message), 'Erro', MB_OK or MB_ICONWARNING);
  end;
end;

destructor TConexao.Destroy;
begin
  FDriver.Free;
  FDWait.Free;
  FConexao.Free;

  FArquivoIni.Free;
  inherited;
end;

function TConexao.obterConexao: TFDConnection;
begin
  Result := FConexao;
end;

end.

