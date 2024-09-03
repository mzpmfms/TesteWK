unit ArquivoIniHelper;

interface

uses
  System.SysUtils, System.IniFiles, Vcl.Forms, Vcl.Dialogs;

type
  TArquivoIniHelper = class
  private
    FArquivo: TIniFile;

    procedure VerificarECriarArquivo;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetArquivoIni(Secao, Identidade, Valor: String);
    function GetArquivoIni(Secao, Identidade, ValorDefault: String): String;

    function CaminhoDaAplicacao: String;
  end;

implementation


{ TIniFileHelper }

constructor TArquivoIniHelper.Create;
begin

  FArquivo := TIniFile.Create(CaminhoDaAplicacao + 'config.ini');

  VerificarECriarArquivo;

end;

destructor TArquivoIniHelper.Destroy;
begin
  FArquivo.Free;
  inherited;
end;

function TArquivoIniHelper.GetArquivoIni(Secao, Identidade,
  ValorDefault: String): String;
begin
  Result := FArquivo.ReadString(Secao, Identidade, ValorDefault);
end;

function TArquivoIniHelper.CaminhoDaAplicacao: String;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

procedure TArquivoIniHelper.SetArquivoIni(Secao, Identidade, Valor: String);
begin
  FArquivo.WriteString(Secao, Identidade, Valor);
end;

procedure TArquivoIniHelper.VerificarECriarArquivo;
begin
  if not FileExists(CaminhoDaAplicacao + 'config') then
  begin
    SetArquivoIni('DB', 'Database', 'wk');
    SetArquivoIni('DB', 'Usuario', 'root');
    SetArquivoIni('DB', 'Senha', '');
    SetArquivoIni('DB', 'Servidor', 'LocalHost');
    SetArquivoIni('DB', 'Porta', '3306');
  end;

end;

end.
