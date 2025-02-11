unit BeanValidation4D.samples.dto.pessoa;

interface

uses
  BeanValidation4D.atributos.EntidadeValida,
  BeanValidation4D.atributos.NaoEmBranco,
  BeanValidation4D.atributos.CpfCnpj,
  BeanValidation4D.atributos.PositivoOuZero,
  BeanValidation4D.atributos.Positivo,
  BeanValidation4D.atributos.TamanhoMinimo,
  BeanValidation4D.atributos.TamanhoMaximo,
  BeanValidation4D.atributos.TamanhoFixo,
  BeanValidation4D.atributos.Email;

type
  [EntidadeValida]
  TPessoa = class
  private
    FNome: string;
    FCpfCnpj: string;
    FAltura: Extended;
    FIdade: Integer;
    FEmail: string;
    FRg: string;
  public
    [NaoEmBranco]
    property Nome: string read FNome write FNome;

    [CpfCnpj]
    property CpfCnpj: string read FCpfCnpj write FCpfCnpj;

    [TamanhoFixo(9,True)]
    property Rg: string read FRg write FRg;

    [PositivoOuZero]
    property Altura: Extended read FAltura write FAltura;

    [Positivo]
    property Idade: Integer read FIdade write FIdade;

    [Email]
    [TamanhoMinimo(10)]
    [TamanhoMaximo(60)]
    property Email: string read FEmail write FEmail;
  end;

implementation

end.
