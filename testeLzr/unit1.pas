unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, IdHTTP, IdSSLOpenSSL;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  // variaveis
  HTTP: TIdHTTP;
  SSLHandler: TIdSSLIOHandlerSocketOpenSSL;
  ResponseStream: TStringStream;
  ResponseStream2: TStringStream;
  ResponseContent: string;
  ResponseContent2: string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  HTTP := TIdHTTP.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  ResponseStream := TStringStream.Create('');
  try
    // Configuração do IOHandler SSL
    HTTP.IOHandler := SSLHandler;
    SSLHandler.SSLOptions.Method := sslvTLSv1_2; // Use a versão apropriada do SSL/TLS
    SSLHandler.SSLOptions.SSLVersions := [sslvTLSv1_2]; // Use a versão apropriada do SSL/TLS
    // Realizando Requisição
    HTTP.Get('https://viacep.com.br/ws/28540000/json/', ResponseStream);
    ResponseContent := UTF8Encode(ResponseStream.DataString);
    // Mostrando Resquisição com ShowMessage
    ShowMessage(ResponseContent);

  finally
    HTTP.Free;
    SSLHandler.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  HTTP := TIdHTTP.Create(nil);
  SSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  ResponseStream2 := TStringStream.Create('');
  try
     // Configuração do IOHandler SSL
    HTTP.IOHandler := SSLHandler;
    SSLHandler.SSLOptions.Method := sslvTLSv1_2; // Use a versão apropriada do SSL/TLS
    SSLHandler.SSLOptions.SSLVersions := [sslvTLSv1_2]; // Use a versão apropriada do SSL/TLS
    // Realizando Requisicao
     HTTP.Get('http://viacep.com.br/ws/' + Edit1.Text + '/json', ResponseStream2);
     ResponseContent2 := UTF8Encode(ResponseStream2.DataString);
     Memo1.Lines.Text := ResponseContent2;

  finally
    HTTP.Free;
    SSLHandler.Free;
  end;
end;

end.

