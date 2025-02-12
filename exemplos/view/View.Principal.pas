unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.Dialogs;

type
  TForm1 = class(TForm)
    btnValidar: TButton;
    procedure btnValidarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  BeanValidation4D.Validador.Objeto,
  BeanValidation4D.samples.dto.pessoa,
  BeanValidation4D.exceptions.ValidacaoEntidadeException;

{$R *.dfm}

procedure TForm1.btnValidarClick(Sender: TObject);
var
  LPessoa: TPessoa;
begin
  LPessoa := TPessoa.Create;
  try
    LPessoa.Nome := 'Gabriel';
    LPessoa.Altura := 1.82;
    LPessoa.Idade := 20;
    LPessoa.Rg := '00.000.000-0';
    LPessoa.CpfCnpj := '000.000.000-00';
    LPessoa.Email := 'gabriel.fabrega@outlook.com';
    try
      TBeanValidation4DValidador<TPessoa>
        .New
        .Validar(LPessoa);
    except on E:EValidacaoEntidadeException do
      ShowMessage('Sua tratativa aqui ' + e.Message);
    end;
  finally
    LPessoa.Free;
  end;
end;

end.
