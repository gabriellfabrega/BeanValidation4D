unit BeanValidation4D.exceptions.ValidacaoEntidadeException;

interface

uses
  System.SysUtils;

type
  EValidacaoEntidadeException = class(Exception)
  public
    constructor Create(const Msg: string); reintroduce;
  end;

implementation

{ EValidacaoEntidadeException }

constructor EValidacaoEntidadeException.Create(const Msg: string);
begin
  inherited Create(Msg);
end;

end.
