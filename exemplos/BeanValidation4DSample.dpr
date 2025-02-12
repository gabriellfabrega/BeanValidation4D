program BeanValidation4DSample;

uses
  Vcl.Forms,
  View.Principal in 'view\View.Principal.pas' {Form1},
  BeanValidation4D.samples.dto.pessoa in 'dto\BeanValidation4D.samples.dto.pessoa.pas' {$R *.res},
  BeanValidation4D.exceptions.ValidacaoEntidadeException in '..\src\exceptions\BeanValidation4D.exceptions.ValidacaoEntidadeException.pas',
  BeanValidation4D.utils.Util in '..\src\utils\BeanValidation4D.utils.Util.pas',
  BeanValidation4D.validador.objeto in '..\src\validador\BeanValidation4D.validador.objeto.pas',
  BeanValidation4D.Validador in '..\src\validador\BeanValidation4D.Validador.pas',
  BeanValidation4D.Validador.NaoEmBranco in '..\src\validador\impl\BeanValidation4D.Validador.NaoEmBranco.pas',
  BeanValidation4D.Validador.PositivoOuZero in '..\src\validador\impl\BeanValidation4D.Validador.PositivoOuZero.pas',
  BeanValidation4D.Atributos in '..\src\atributos\BeanValidation4D.Atributos.pas',
  BeanValidation4D.Validador.Positivo in '..\src\validador\impl\BeanValidation4D.Validador.Positivo.pas',
  BeanValidation4D.Validador.TamanhoFixo in '..\src\validador\impl\BeanValidation4D.Validador.TamanhoFixo.pas',
  BeanValidation4D.Validador.Email in '..\src\validador\impl\BeanValidation4D.Validador.Email.pas',
  BeanValidation4D.Validador.CpfCnpj in '..\src\validador\impl\BeanValidation4D.Validador.CpfCnpj.pas',
  BeanValidation4D.Validador.TamanhoMaximo in '..\src\validador\impl\BeanValidation4D.Validador.TamanhoMaximo.pas',
  BeanValidation4D.Validador.TamanhoMinimo in '..\src\validador\impl\BeanValidation4D.Validador.TamanhoMinimo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
