unit BeanValidation4D.atributos.PositivoOuZero;

interface

uses
  System.Rtti, System.SysUtils;

type
  PositivoOuZero = class(TCustomAttribute)
  public
    class procedure Validar(ANome: string; AValor: TValue); static;
  end;

implementation

uses
  BeanValidation4D.exceptions.ValidacaoEntidadeException;

{ PositivoOuZero }

class procedure PositivoOuZero.Validar(ANome: string; AValor: TValue);
begin
  try
    if AValor.AsExtended < 0 then
      raise EValidacaoEntidadeException.Create(Format('%s deve ser um número positivo ou zero.', [ANome]))
  except
    on e:EValidacaoEntidadeException do
      raise EValidacaoEntidadeException.Create(Format('%s deve ser um número positivo ou zero.', [ANome]))
    else
  end;
end;

end.
