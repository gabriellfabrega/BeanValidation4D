unit BeanValidation4D.atributos.TamanhoFixo;

interface

uses
  System.Rtti, System.SysUtils, System.StrUtils;

type
  TamanhoFixo = class(TCustomAttribute)
  private
    class var FTamanho: integer;
    class var FApenasNumeros: Boolean;
  public
    constructor Create(ATamanho: Integer; AApenasNumeros: Boolean);
    class procedure Validar(ANome: string; AValor: TValue); static;
  end;

implementation

uses
  BeanValidation4D.utils.Util,
  BeanValidation4D.exceptions.ValidacaoEntidadeException;

{ TamanhoFixo }

constructor TamanhoFixo.Create(ATamanho: Integer; AApenasNumeros: Boolean);
begin
  FTamanho := ATamanho;
  FApenasNumeros := AApenasNumeros;
end;

class procedure TamanhoFixo.Validar(ANome: string; AValor: TValue);
var
  LValor: string;
begin
  LValor := IfThen(FApenasNumeros,TBeanValidation4DUtil.ApenasNumeros(AValor.ToString),AValor.ToString);

  if LValor.Length <> FTamanho then
    raise EValidacaoEntidadeException.Create(Format('%s deve ter um tamanho de %d',[ANome,FTamanho]));
end;

end.
