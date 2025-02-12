unit BeanValidation4D.Validador.TamanhoMinimo;

interface

uses
  BeanValidation4D.Validador,
  BeanValidation4D.exceptions.ValidacaoEntidadeException,
  BeanValidation4D.utils.Util,
  System.Rtti,
  System.SysUtils,
  System.StrUtils;

type
  TValidadorTamanhoMinimo = class(TInterfacedObject)
  private
    FTamanho: integer;
    FApenasNumeros: Boolean;
    constructor Create(ATamanho: integer; AApenasNumeros: boolean);
  public
    class function New(ATamanho: integer; AApenasNumeros: boolean): TValidadorTamanhoMinimo;
    procedure Validar(ANome: string; AValor: TValue);
  end;


implementation

{ TValidadorTamanhoMinimo }

constructor TValidadorTamanhoMinimo.Create(ATamanho: integer;
  AApenasNumeros: boolean);
begin
  FTamanho := ATamanho;
  FApenasNumeros := AApenasNumeros;
end;

class function TValidadorTamanhoMinimo.New(ATamanho: integer;
  AApenasNumeros: boolean): TValidadorTamanhoMinimo;
begin
  result := Self.Create(ATamanho,AApenasNumeros);
end;

procedure TValidadorTamanhoMinimo.Validar(ANome: string; AValor: TValue);
var
  LValor: string;
begin
  LValor := IfThen(FApenasNumeros,TBeanValidation4DUtil.ApenasNumeros(AValor.ToString),AValor.ToString);

  if LValor.Length < FTamanho then
    raise EValidacaoEntidadeException.Create(Format('%s deve ter um mínimo de %d',[ANome,FTamanho]));
end;

end.
