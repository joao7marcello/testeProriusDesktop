unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Character;

type
  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    validar: TButton;
    nome: TEdit;
    senha: TEdit;
    procedure senhaChange(Sender: TObject);
    procedure validarClick(Sender: TObject);
  private
    function checkLetrasENumeros(const senhaCheck: string): Boolean;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.senhaChange(Sender: TObject);
begin
     senha.PasswordChar := '*';
     senha.SelStart := Length(senha.Text);

end;


procedure TForm1.validarClick(Sender: TObject);
begin
  if (nome.Text = '') and (senha.Text = '') then
  begin
    ShowMessage('Preencha os campos');
  end
  else
  if nome.Text = '' then
  begin
    ShowMessage('Nome nao pode estar vazio');
  end
  else
  if senha.Text = '' then
  begin
    ShowMessage('Senha nao pode estar vazia');
  end
  else
  if Length(senha.Text) <= 5 then
  begin
    ShowMessage('Senha deve ter mais de 6 caracteres');
  end
  else
  if not checkLetrasENumeros(senha.Text) then
  begin
    ShowMessage('Senha deve ter pelo menos 1 letra e 1 numero');
  end
  else
  begin
    ShowMessage('Bem-vindo ' + nome.Text + #13#10 + 'Usuario Cadastrado.');
    nome.Text := '';
    senha.Text := '';
  end;
end;


function TForm1.checkLetrasENumeros(const senhaCheck: string): Boolean;
var
  caracterNaString: Char;
  temLetra, temNumero: Boolean;
begin
  temLetra := False;
  temNumero := False;

  for caracterNaString in senhaCheck do
  begin
    if Character.IsLetter(caracterNaString) then
      temLetra := True
    else if Character.IsDigit(caracterNaString) then
      temNumero := True;

    if temLetra and temNumero then
      Exit(True);
  end;
  Result := False;
end;

end.

