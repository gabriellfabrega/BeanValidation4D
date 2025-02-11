unit BeanValidation4D.atributos.NaoEmBranco;

interface

uses
  System.SysUtils, System.RTTI;
type
  NaoEmBranco = class(TCustomAttribute)
  public
    class procedure Validar(ANome: string; AValor: TValue);
  end;

implementation

uses
   BeanValidation4D.exceptions.ValidacaoEntidadeException;

{ NaoEmBranco }

class procedure NaoEmBranco.Validar(ANome: string; AValor: TValue);
begin
  if AValor.AsString.Trim.IsEmpty then
    raise EValidacaoEntidadeException.Create(Format('%s não pode estar em branco.', [ANome,AValor.AsString]));
end;

end.
