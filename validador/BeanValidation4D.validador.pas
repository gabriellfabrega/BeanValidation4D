unit BeanValidation4D.validador;

interface

uses
  System.Rtti, System.TypInfo, System.SysUtils;

type
  TBeanValidation4DValidador<T: class> = class
  public
    class procedure Validar(AObjeto: T);
  end;

implementation

uses
  BeanValidation4D.atributos.EntidadeValida,
  BeanValidation4D.atributos.NaoEmBranco,
  BeanValidation4D.atributos.PositivoOuZero,
  BeanValidation4D.atributos.Positivo,
  BeanValidation4D.atributos.TamanhoMinimo,
  BeanValidation4D.atributos.TamanhoMaximo,
  BeanValidation4D.atributos.TamanhoFixo,
  BeanValidation4D.atributos.CpfCnpj,
  BeanValidation4D.atributos.Email;

{ TValidador }

class procedure TBeanValidation4DValidador<T>.Validar(AObjeto: T);
var
  Contexto: TRttiContext;
  TipoRtti: TRttiType;
  Propriedade: TRttiProperty;
  Atributo: TCustomAttribute;

  LValor: TValue;
  LEntidadeValida: EntidadeValida;
  LNaoEmBranco: NaoEmBranco;
  LPositivoOuZero: PositivoOuZero;
  LPositivo: Positivo;
  LTamanhoMinimo: TamanhoMinimo;
  LTamanhoMaximo: TamanhoMaximo;
  LTamanhoFixo: TamanhoFixo;
  LCpfCnpj: CpfCnpj;
  LEmail: Email;
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
      LValor := Propriedade.GetValue(TObject(AObjeto));

      LNaoEmBranco := Propriedade.GetAttribute<NaoEmBranco>;
      if Assigned(LNaoEmBranco) then
        NaoEmBranco.Validar(Propriedade.Name,LValor);

      LPositivoOuZero := Propriedade.GetAttribute<PositivoOuZero>;
      if Assigned(LPositivoOuZero) then
        PositivoOuZero.Validar(Propriedade.Name,LValor);

      LPositivo := Propriedade.GetAttribute<Positivo>;
      if Assigned(LPositivo) then
        Positivo.Validar(Propriedade.Name,LValor);

      LTamanhoMinimo := Propriedade.GetAttribute<TamanhoMinimo>;
      if Assigned(LTamanhoMinimo) then
        TamanhoMinimo.Validar(Propriedade.Name,LValor);

      LTamanhoMaximo := Propriedade.GetAttribute<TamanhoMaximo>;
      if Assigned(LTamanhoMinimo) then
        TamanhoMaximo.Validar(Propriedade.Name,LValor);

      LTamanhoFixo := Propriedade.GetAttribute<TamanhoFixo>;
      if Assigned(LTamanhoFixo) then
        LTamanhoFixo.Validar(Propriedade.Name,LValor);

      LCpfCnpj := Propriedade.GetAttribute<CpfCnpj>;
      if Assigned(LCpfCnpj) then
        LCpfCnpj.Validar(Propriedade.Name,LValor);

      LEmail := Propriedade.GetAttribute<Email>;
      if Assigned(LEmail) then
        LEmail.Validar(Propriedade.Name,LValor);
    end;
  end;
end;

end.
