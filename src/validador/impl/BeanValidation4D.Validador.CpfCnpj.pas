unit BeanValidation4D.Validador.CpfCnpj;

interface

uses
  BeanValidation4D.Validador,
  BeanValidation4D.exceptions.ValidacaoEntidadeException,
  BeanValidation4D.utils.Util,
  System.Rtti,
  System.SysUtils,
  System.StrUtils;

type
  TValidadorCpfCnpj = class(TInterfacedObject,IValidador)
  public
    class function New: IValidador;
    procedure Validar(ANome: string; AValor: TValue);
  end;


implementation

{ TValidadorCpfCnpj }

class function TValidadorCpfCnpj.New: IValidador;
begin
  result := self.Create;
end;

procedure TValidadorCpfCnpj.Validar(ANome: string; AValor: TValue);
var
  LValor: string;
begin
  LValor := TBeanValidation4DUtil.ApenasNumeros(AValor.AsString);
  if (LValor.Length < 11) then
    raise EValidacaoEntidadeException.Create(Format('%s deve ter tamanho 11 ou 14',[ANome]));
  if (LValor.Length > 11) and (LValor.Length < 14) then
    raise EValidacaoEntidadeException.Create(Format('%s deve ter tamanho 11 ou 14',[ANome]));
  if (LValor.Length > 11) and (LValor.Length > 14) then
    raise EValidacaoEntidadeException.Create(Format('%s deve ter tamanho 11 ou 14',[ANome]));

end;

end.
