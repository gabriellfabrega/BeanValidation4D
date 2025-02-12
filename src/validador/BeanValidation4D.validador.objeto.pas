unit BeanValidation4D.validador.objeto;

interface

uses
  System.Rtti,
  System.TypInfo,
  System.SysUtils,
  System.Generics.Collections,
  BeanValidation4D.Validador,
  BeanValidation4D.Atributos, BeanValidation4D.Validador.TamanhoMaximo;
type
  TBeanValidation4DValidador<T: class> = class(TInterfacedObject)
  private
    FValidadores: TDictionary<TCustomAttributeClass,IValidador>;
    procedure ValidaTamanhoFixo(APropriedade: TRttiProperty; AObjeto: T);
    procedure PreencherListaValidadores;
    procedure ValidaTamanhoMaximo(APropriedade: TRttiProperty; AObjeto: T);
    procedure ValidaTamanhoMinimo(APropriedade: TRttiProperty; AObjeto: T);
  public
    class function New: TBeanValidation4DValidador<T>;
    constructor Create;
    destructor Destroy; override;
    procedure Validar(AObjeto: T);
  end;

implementation

uses
  BeanValidation4D.Validador.NaoEmBranco,
  BeanValidation4D.Validador.PositivoOuZero,
  BeanValidation4D.Validador.Positivo,
  BeanValidation4D.Validador.Email,
  BeanValidation4D.Validador.CpfCnpj,
  BeanValidation4D.Validador.TamanhoFixo,
  BeanValidation4D.Validador.TamanhoMinimo;

{ TValidador }

constructor TBeanValidation4DValidador<T>.Create;
begin
  FValidadores := TDictionary<TCustomAttributeClass,IValidador>.Create;
  PreencherListaValidadores;
end;

destructor TBeanValidation4DValidador<T>.Destroy;
begin
  FValidadores.Free;
  inherited;
end;

class function TBeanValidation4DValidador<T>.New: TBeanValidation4DValidador<T>;
begin
  result := Self.Create;
end;

procedure TBeanValidation4DValidador<T>.PreencherListaValidadores;
begin
  FValidadores.Add(NaoEmBranco,TValidadorNaoEmBranco.New);
  FValidadores.Add(PositivoOuZero,TValidadorPositivoOuZero.New);
  FValidadores.Add(Positivo,TValidadorPositivo.New);
  FValidadores.Add(Email,TValidadorEmail.New);
  FValidadores.Add(CpfCnpj,TValidadorCpfCnpj.New);
end;

procedure TBeanValidation4DValidador<T>.Validar(AObjeto: T);
var
  Contexto: TRttiContext;
  TipoRtti: TRttiType;
  Propriedade: TRttiProperty;
  LEntidadeValida: EntidadeValida;
  LValidador: IValidador;
  LAtributoCustom: TCustomAttribute;
begin
  TipoRtti := Contexto.GetType((T));

  if TipoRtti = nil then
    raise Exception.Create('Erro ao validar classe');

  LEntidadeValida := TipoRtti.GetAttribute<EntidadeValida>;

  if not Assigned(LEntidadeValida) then
    Exit;

  for Propriedade in TipoRtti.GetProperties do
  begin
    if Propriedade.IsReadable then
    begin
      for LAtributoCustom in Propriedade.GetAttributes do
      begin
        ValidaTamanhoFixo(Propriedade,AObjeto);
        ValidaTamanhoMinimo(Propriedade,AObjeto);
        ValidaTamanhoMaximo(Propriedade,AObjeto);
        begin
          FValidadores.TryGetValue(TCustomAttributeClass(LAtributoCustom.ClassType),LValidador);
          if Assigned(LValidador) then
          begin
            LValidador.Validar(
              Propriedade.Name,
              Propriedade.GetValue(TObject(AObjeto)));
          end;
        end;
      end;
    end;
  end;



end;


procedure TBeanValidation4DValidador<T>.ValidaTamanhoFixo(APropriedade: TRttiProperty; AObjeto: T);
var
  LTamanhoFixo: TamanhoFixo;
begin
  LTamanhoFixo := APropriedade.GetAttribute<TamanhoFixo>;
  if Assigned(LTamanhoFixo) and (LTamanhoFixo.ClassType = TamanhoFixo) then
  begin
    TValidadorTamanhoFixo
      .New(LTamanhoFixo.Tamanho, LTamanhoFixo.ApenasNumeros)
      .Validar(
        APropriedade.Name,
        APropriedade.GetValue(TObject(AObjeto)))
  end;
end;

procedure TBeanValidation4DValidador<T>.ValidaTamanhoMinimo(APropriedade: TRttiProperty; AObjeto: T);
var
  LTamanhoMinimo: TamanhoMinimo;
begin
  LTamanhoMinimo := APropriedade.GetAttribute<TamanhoMinimo>;
  if Assigned(LTamanhoMinimo) and (LTamanhoMinimo.ClassType = TamanhoMinimo) then
  begin
    TValidadorTamanhoMinimo
      .New(LTamanhoMinimo.Tamanho, LTamanhoMinimo.ApenasNumeros)
      .Validar(
        APropriedade.Name,
        APropriedade.GetValue(TObject(AObjeto)))
  end;
end;

procedure TBeanValidation4DValidador<T>.ValidaTamanhoMaximo(APropriedade: TRttiProperty; AObjeto: T);
var
  LTamanhoMaximo: TamanhoMaximo;
begin
  LTamanhoMaximo := APropriedade.GetAttribute<TamanhoMaximo>;
  if Assigned(LTamanhoMaximo) and (LTamanhoMaximo.ClassType = TamanhoMaximo) then
  begin
    TValidadorTamanhoMaximo
      .New(LTamanhoMaximo.Tamanho, LTamanhoMaximo.ApenasNumeros)
      .Validar(
        APropriedade.Name,
        APropriedade.GetValue(TObject(AObjeto)))
  end;
end;

end.
