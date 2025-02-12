unit BeanValidation4D.Validador.Email;

interface

uses
  BeanValidation4D.Validador,
  BeanValidation4D.exceptions.ValidacaoEntidadeException,
  BeanValidation4D.utils.Util,
  System.Rtti,
  System.SysUtils,
  System.StrUtils, System.RegularExpressions;

type
  TValidadorEmail = class(TInterfacedObject,IValidador)
  public
    class function New: IValidador;
    procedure Validar(ANome: string; AValor: TValue);
  end;


implementation

{ TValidadorEmail }

class function TValidadorEmail.New: IValidador;
begin
  result := self.Create;
end;

procedure TValidadorEmail.Validar(ANome: string; AValor: TValue);
const
  EmailPattern = '^([A-Za-z0-9._%+-]+)@([A-Za-z0-9.-]+\.[A-Za-z]{2,})$';
var
  RegEx: TRegEx;
begin
  if AValor.AsString.IsEmpty then
    Exit;
  RegEx := TRegEx.Create(EmailPattern);
  if not (RegEx.IsMatch(AValor.ToString)) then
    raise EValidacaoEntidadeException.Create('Email inválido');
end;

end.
