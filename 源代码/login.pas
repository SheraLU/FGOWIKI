unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, DB, ADODB,IdHashMessageDigest;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Label1: TLabel;
    user1: TEdit;
    Label2: TLabel;
    ps1: TEdit;
    Button1: TButton;
    Label3: TLabel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    user2: TEdit;
    Label6: TLabel;
    ps2: TEdit;
    Button2: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  id: string;

implementation

uses Main, list;
{$R *.dfm}

var
  id2, pswd2,psmd: string;
  MD5: TIdHashMessageDigest5;

procedure TForm2.Button1Click(Sender: TObject);
begin        //��¼
  MD5 := TIdHashMessageDigest5.Create;
  psmd := MD5.HashStringAsHex(ps1.Text);
  ADOQuery1.Close;
  ADOQuery1.Parameters.ParamByName('username').Value := user1.Text;
  ADOQuery1.Parameters.ParamByName('password').Value := psmd;
  try
    ADOQuery1.Open;
    if ADOQuery1.RecordCount > 0 then
    begin
      id := user1.Text;
      ShowMessage('��¼�ɹ�!');
      Form3.show;
      Form2.hide;
    end
    else
      ShowMessage('�û������������');
  except
    ShowMessage('��������ʧ�ܣ�');
  end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin      //ע��
  MD5 := TIdHashMessageDigest5.Create;
  pswd2 := ps2.Text;
  id2 := user2.Text;
  psmd := MD5.HashStringAsHex(pswd2);
  if (length(id2) > 10) or (length(pswd2) > 20) then
  begin
    ShowMessage('�û������ܳ���10�ַ������벻�ܳ���20�ַ���');
  end
  else
  begin
    ADOQuery2.Parameters.ParamByName('username').Value := user2.Text;
    try
      ADOQuery2.Open;
      if ADOQuery2.RecordCount > 0 then
      begin
        ShowMessage('�û����Ѵ��ڣ�');
      end
      else
      begin
        ADOQuery3.Parameters.ParamByName('username').Value := user2.Text;
        ADOQuery3.Parameters.ParamByName('password').Value := psmd;
        ADOQuery3.ExecSQL;
        ShowMessage('ע��ɹ������¼��');
        ADOQuery3.Close;
      end
      except
        ShowMessage('��������ʧ�ܣ�');
      end;
      ADOQuery2.Close;
    end
  end;

end.
