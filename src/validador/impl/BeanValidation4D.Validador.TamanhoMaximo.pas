unit BeanValidation4D.Validador.TamanhoMaximo;

interface

uses
  BeanValidation4D.Validador,
  BeanValidation4D.exceptions.ValidacaoEntidadeException,
  BeanValidation4D.utils.Util,
  System.Rtti,
  System.SysUtils,
  System.StrUtils;

type
  TValidadorTamanhoMaximo = class(TInterfacedObject)
  private
    FTamanho: integer;
    FApenasNumeros: Boolean;
    constructor Create(ATamanho: integer; AApenasNumeros: boolean);
  public
    class function New(ATamanho: integer; AApenasNumeros: boolean): TValidadorTamanhoMaximo;
    procedure Validar(ANome: string; AValor: TValue);
  end;


implementation

{ TValidadorTamanhoMaximo }

constructor TValidadorTamanhoMaximo.Create(ATamanho: integer;
  AApenasNumeros: boolean);
begin
  FTamanho := ATamanho;
  FApenasNumeros := AApenasNumeros;
end;

class function TValidadorTamanhoMaximo.New(ATamanho: integer;
  AApenasNumeros: boolean): TValidadorTamanhoMaximo;
begin
  result := Self.Create(ATamanho,AApenasNumeros);
end;

procedure TValidadorTamanhoMaximo.Validar(ANome: string; AValor: TValue);
var
  LValor: string;
begin
  LValor := IfThen(FApenasNumeros,TBeanValidation4DUtil.ApenasNumeros(AValor.ToString),AValor.ToString);

  if LValor.Length > FTamanho then
    raise EValidacaoEntidadeException.Create(Format('%s deve ter um máximo de %d',[ANome,FTamanho]));
end;

end.
