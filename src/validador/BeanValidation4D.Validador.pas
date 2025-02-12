unit BeanValidation4D.Validador;

interface

uses
  System.Rtti;

type
  IValidador = interface
    ['{FD40EE5B-688E-40FB-AB1C-D88865D76FBC}']
    procedure Validar(ANome: string; AValor: TValue);
  end;


implementation

end.
