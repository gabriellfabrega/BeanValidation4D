unit BeanValidation4D.Validador.TamanhoFixo;

interface

uses
  BeanValidation4D.Validador,
  BeanValidation4D.exceptions.ValidacaoEntidadeException,
  BeanValidation4D.utils.Util,
  System.Rtti,
  System.SysUtils,
  System.StrUtils;

type
  TValidadorTamanhoFixo = class(TInterfacedObject)
  private
    FTamanho: integer;
    FApenasNumeros: Boolean;
    constructor Create(ATamanho: integer; AApenasNumeros: boolean);
  public
    class function New(ATamanho: integer; AApenasNumeros: boolean): TValidadorTamanhoFixo;
    procedure Validar(ANome: string; AValor: TValue);
  end;


implementation

{ TValidadorTamanhoFixo }

constructor TValidadorTamanhoFixo.Create(ATamanho: integer;
  AApenasNumeros: boolean);
begin
  FTamanho := ATamanho;
  FApenasNumeros := AApenasNumeros;
end;

class function TValidadorTamanhoFixo.New(ATamanho: integer;
  AApenasNumeros: boolean): TValidadorTamanhoFixo;
begin
  result := Self.Create(ATamanho,AApenasNumeros);
end;

procedure TValidadorTamanhoFixo.Validar(ANome: string; AValor: TValue);
var
  LValor: string;
begin
  LValor := IfThen(FApenasNumeros,TBeanValidation4DUtil.ApenasNumeros(AValor.ToString),AValor.ToString);

  if LValor.Length <> FTamanho then
    raise EValidacaoEntidadeException.Create(Format('%s deve ter um tamanho de %d',[ANome,FTamanho]));
end;

end.
