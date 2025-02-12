unit BeanValidation4D.utils.Util;

interface

type
  TBeanValidation4DUtil = class
  public
    class function ApenasNumeros(const ATexto: string): string; static;
  end;

implementation

class function TBeanValidation4DUtil.ApenasNumeros(const ATexto: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(ATexto) do
    if ATexto[I] in ['0'..'9'] then
      Result := Result + ATexto[I];
end;

end.
