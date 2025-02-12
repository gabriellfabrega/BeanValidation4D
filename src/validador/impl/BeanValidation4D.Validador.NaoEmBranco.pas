unit BeanValidation4D.Validador.NaoEmBranco;

interface

uses
  BeanValidation4D.Validador,
  BeanValidation4D.exceptions.ValidacaoEntidadeException,
  System.Rtti,
  System.SysUtils;

type
  TValidadorNaoEmBranco = class(TInterfacedObject,IValidador)
  public
    class function New: IValidador;
    procedure Validar(ANome: string; AValor: TValue);
  end;

implementation

{ TValidadorNaoEmBranco }
class function TValidadorNaoEmBranco.New: IValidador;
begin
  result := Self.Create;
end;

procedure TValidadorNaoEmBranco.Validar(ANome: string; AValor: TValue);
begin
  if AValor.AsString.Trim.IsEmpty then
    raise EValidacaoEntidadeException.Create(Format('%s não pode estar em branco.', [ANome,AValor.AsString]));
end;

end.
