unit BeanValidation4D.Validador.PositivoOuZero;

interface

uses
  BeanValidation4D.Validador,
  BeanValidation4D.exceptions.ValidacaoEntidadeException,
  System.Rtti,
  System.SysUtils;

type
  TValidadorPositivoOuZero = class(TInterfacedObject,IValidador)
  public
    class function New: IValidador;
    procedure Validar(ANome: string; AValor: TValue);
  end;


implementation

{ TValidadorPositivoOuZero }

class function TValidadorPositivoOuZero.New: IValidador;
begin
  result := Self.Create;
end;

procedure TValidadorPositivoOuZero.Validar(ANome: string; AValor: TValue);
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
