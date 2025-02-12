unit BeanValidation4D.samples.dto.pessoa;

interface

uses
  BeanValidation4D.Atributos;

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
    [TamanhoMinimo(10,false)]
    [TamanhoMaximo(60,false)]
    property Email: string read FEmail write FEmail;
  end;

implementation

end.
