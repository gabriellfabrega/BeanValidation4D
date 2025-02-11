program BeanValidation4DSample;

uses
  Vcl.Forms,
  View.Principal in 'view\View.Principal.pas' {Form1},
  BeanValidation4D.samples.dto.pessoa in 'dto\BeanValidation4D.samples.dto.pessoa.pas',
  BeanValidation4D.atributos.CpfCnpj in '..\atributos\BeanValidation4D.atributos.CpfCnpj.pas',
  BeanValidation4D.atributos.Email in '..\atributos\BeanValidation4D.atributos.Email.pas',
  BeanValidation4D.atributos.EntidadeValida in '..\atributos\BeanValidation4D.atributos.EntidadeValida.pas',
  BeanValidation4D.atributos.NaoEmBranco in '..\atributos\BeanValidation4D.atributos.NaoEmBranco.pas',
  BeanValidation4D.atributos.Positivo in '..\atributos\BeanValidation4D.atributos.Positivo.pas',
  BeanValidation4D.atributos.PositivoOuZero in '..\atributos\BeanValidation4D.atributos.PositivoOuZero.pas',
  BeanValidation4D.atributos.TamanhoFixo in '..\atributos\BeanValidation4D.atributos.TamanhoFixo.pas',
  BeanValidation4D.atributos.TamanhoMaximo in '..\atributos\BeanValidation4D.atributos.TamanhoMaximo.pas',
  BeanValidation4D.atributos.TamanhoMinimo in '..\atributos\BeanValidation4D.atributos.TamanhoMinimo.pas',
  BeanValidation4D.exceptions.ValidacaoEntidadeException in '..\exceptions\BeanValidation4D.exceptions.ValidacaoEntidadeException.pas',
  BeanValidation4D.utils.Util in '..\utils\BeanValidation4D.utils.Util.pas',
  BeanValidation4D.validador in '..\validador\BeanValidation4D.validador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
