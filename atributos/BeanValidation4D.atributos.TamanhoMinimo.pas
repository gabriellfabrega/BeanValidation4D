unit BeanValidation4D.atributos.TamanhoMinimo;

interface

uses
  System.Rtti, System.SysUtils;

type
  TamanhoMinimo = class(TCustomAttribute)
  private
    class var FTamanhoMinimo: integer;
  public
    constructor Create(ATamanhoMinimo: Integer);
    class procedure Validar(ANome: string; AValor: TValue); static;
  end;

implementation

uses
  BeanValidation4D.utils.Util,
  BeanValidation4D.exceptions.ValidacaoEntidadeException;

{ TamanhoMinimo }

constructor TamanhoMinimo.Create(ATamanhoMinimo: Integer);
begin
  FTamanhoMinimo := ATamanhoMinimo;
end;

class procedure TamanhoMinimo.Validar(ANome: string; AValor: TValue);
begin
  if AValor.AsString.Trim.Length < FTamanhoMinimo then
    raise EValidacaoEntidadeException.Create(Format('%s deve ter um tamanho mínimo de %s', [ANome,FTamanhoMinimo.ToString]));
end;

end.
