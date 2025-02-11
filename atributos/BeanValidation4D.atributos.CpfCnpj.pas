unit BeanValidation4D.atributos.CpfCnpj;

interface

uses
  System.SysUtils, System.Rtti;

type
  CpfCnpj = class(TCustomAttribute)
  public
    class procedure Validar(ANome: string; AValor: TValue); static;
  end;

implementation

{ Cpf }

uses
  BeanValidation4D.atributos.NaoEmBranco,
  BeanValidation4D.atributos.TamanhoMinimo,
  BeanValidation4D.atributos.TamanhoMaximo,
  BeanValidation4D.atributos.TamanhoFixo,
  BeanValidation4D.utils.Util,
  BeanValidation4D.exceptions.ValidacaoEntidadeException;

class procedure CpfCnpj.Validar(ANome: string; AValor: TValue);
var
  LTamanhoMinimo: TamanhoMinimo;
  LTamanhoMaximo: TamanhoMaximo;
begin
  NaoEmBranco.Validar(ANome,AValor);

  LTamanhoMinimo := TamanhoMinimo.Create(11);
  try
    LTamanhoMinimo.Validar(ANome,AValor);
  finally
    LTamanhoMinimo.Free;
  end;

  LTamanhoMaximo := TamanhoMaximo.Create(14);
  try
    LTamanhoMaximo.Validar(ANome,AValor);
  finally
    LTamanhoMaximo.Free;
  end;

  if (AValor.ToString.Length > 11) and (AValor.ToString.Length < 14) then
    raise EValidacaoEntidadeException.Create(Format('%s deve ter tamanho 11 ou 14',[ANome]));
end;



end.
