unit BeanValidation4D.atributos.Positivo;

interface

uses
  System.Rtti, System.SysUtils;

type
  Positivo = class(TCustomAttribute)
  public
    class procedure Validar(ANome: string; AValor: TValue); static;
  end;

implementation

uses
  BeanValidation4D.exceptions.ValidacaoEntidadeException;

{ PositivoOuZero }

class procedure Positivo.Validar(ANome: string; AValor: TValue);
begin
  try
    if AValor.AsExtended <= 0 then
      raise EValidacaoEntidadeException.Create(Format('%s deve ser um número positivo', [ANome]))
  except
    on e:EValidacaoEntidadeException do
      raise EValidacaoEntidadeException.Create(Format('%s deve ser um número positivo', [ANome]))
    else
  end;
end;



end.
