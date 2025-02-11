unit BeanValidation4D.atributos.Email;

interface

uses
  System.RegularExpressions, System.SysUtils, System.Rtti;

type
  Email = class(TCustomAttribute)
  public
    class procedure Validar(ANome: string; AValor: TValue); static;
  end;

implementation

uses
  BeanValidation4D.exceptions.ValidacaoEntidadeException;

class procedure Email.Validar(ANome: string; AValor: TValue);
const
  EmailPattern = '^([A-Za-z0-9._%+-]+)@([A-Za-z0-9.-]+\.[A-Za-z]{2,})$';
var
  RegEx: TRegEx;
begin
  RegEx := TRegEx.Create(EmailPattern);
  if not (RegEx.IsMatch(AValor.ToString)) then
    raise EValidacaoEntidadeException.Create('Email inválido');
end;

end.
