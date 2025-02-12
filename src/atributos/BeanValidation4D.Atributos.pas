unit BeanValidation4D.Atributos;

interface

uses
  System.Rtti, System.SysUtils;

type
  PositivoOuZero = class(TCustomAttribute) end;
  NaoEmBranco = class(TCustomAttribute) end;
  Positivo = class(TCustomAttribute) end;
  Email = class(TCustomAttribute) end;
  EntidadeValida = class(TCustomAttribute) end;
  CpfCnpj = class(TCustomAttribute) end;

  TamanhoFixo = class(TCustomAttribute)
  private
    FTamanho: integer;
    FApenasNumeros: Boolean;
  public
    constructor Create(ATamanho: Integer; AApenasNumeros: Boolean);
    property Tamanho: integer read FTamanho;
    property ApenasNumeros: Boolean read FApenasNumeros;
  end;

  TamanhoMaximo = class(TamanhoFixo) end;
  TamanhoMinimo = class(TamanhoFixo) end;


implementation

  { TamanhoFixo }

constructor TamanhoFixo.Create(ATamanho: Integer; AApenasNumeros: Boolean);
begin
  FTamanho := ATamanho;
  FApenasNumeros := AApenasNumeros;
end;




end.
