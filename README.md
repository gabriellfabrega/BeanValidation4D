# BeanValidation4D

[![](https://raw.githubusercontent.com/gabriellfabrega/BeanValidation4D/refs/heads/main/logo.png)](https://raw.githubusercontent.com/gabriellfabrega/BeanValidation4D/refs/heads/main/logo.png)

O BeanValidator4D é uma biblioteca para validação simplificada de objetos e DTOs em Delphi, utilizando RTTI com atributes. Inspirado no Bean Validation do Spring Boot.

🚀 Recursos

####✅ Validações via atributos: 
 - CpfCnpj
 - Email
 - NaoEmBranco
 - Positivo
 - PositivoOuZero
 - TamanhoFixo,
 - TamanhoMinimo 
 - TamanhoMaximo

✅ Extensível – crie seus próprios validadores

📌 Exemplo de Uso

####Instale a biblioteca via [Boss](https://github.com/HashLoad/boss "")
```bash
boss install https://github.com/gabriellfabrega/BeanValidation4D
```

#### Mapeie sua classe ou DTO com os atributos

```delphi
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

```

#### Quando necessário realize a validação invocando o método validador, conforme exemplo abaixo:

```delphi
    try
      TBeanValidation4DValidador<TPessoa>.Validar(LPessoa);
    except on E:EValidacaoEntidadeException do
      ShowMessage('Sua tratativa aqui');
    end;
```
