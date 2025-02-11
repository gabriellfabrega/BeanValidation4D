unit BeanValidation4D.atributos.TamanhoMaximo;

interface

uses
  System.Rtti, BeanValidation4D.Utils.Util, System.SysUtils;

type
  TamanhoMaximo = class(TCustomAttribute)
  private
    class var FTamanhoMaximo: integer;
  public
    constructor Create(ATamanhoMaximo: Integer);
    class procedure Validar(ANome: string; AValor: TValue); static;
  end;

implementation

uses
  BeanValidation4D.exceptions.ValidacaoEntidadeException;

{ TamanhoMinimo }

constructor TamanhoMaximo.Create(ATamanhoMaximo: Integer);
begin
  FTamanhoMaximo := ATamanhoMaximo;
end;

class procedure TamanhoMaximo.Validar(ANome: string; AValor: TValue);
begin
  if TBeanValidation4DUtil.ApenasNumeros(AValor.AsString).Trim.Length > FTamanhoMaximo then
    raise EValidacaoEntidadeException.Create(Format('%s deve ter um tamanho mínimo de %s', [ANome,FTamanhoMaximo.ToString]));
end;

end.
