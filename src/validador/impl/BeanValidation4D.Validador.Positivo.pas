unit BeanValidation4D.Validador.Positivo;

interface

uses
  BeanValidation4D.Validador,
  BeanValidation4D.exceptions.ValidacaoEntidadeException,
  System.Rtti,
  System.SysUtils;

type
  TValidadorPositivo = class(TInterfacedObject,IValidador)
  public
    class function New: IValidador;
    procedure Validar(ANome: string; AValor: TValue);
  end;


implementation

{ TValidadorPositivo }

class function TValidadorPositivo.New: IValidador;
begin
  Result := Self.Create;
end;

procedure TValidadorPositivo.Validar(ANome: string; AValor: TValue);
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
