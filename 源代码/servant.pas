unit servant;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, DB, ADODB, ComCtrls, ImgList, jpeg;

type
  TForm4 = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    number: TLabel;
    name: TLabel;
    job: TLabel;
    star: TLabel;
    Panel2: TPanel;
    GridPanel1: TGridPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    label1: TLabel;
    belong: TLabel;
    Label2: TLabel;
    baq: TLabel;
    Label4: TLabel;
    hp: TLabel;
    Label5: TLabel;
    atk: TLabel;
    Panel7: TPanel;
    Label3: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    ListBox: TListBox;
    col: TLabel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    story: TLabel;
    skills: TListView;
    baoju: TLabel;
    ADOQuery6: TADOQuery;
    Panel11: TPanel;
    Image3: TImage;
    Panel10: TPanel;
    Panel12: TPanel;
    ImageList1: TImageList;
    ADOQuery2: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure colClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure colMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  num: string;

implementation

uses list, Main, login;
{$R *.dfm}

procedure TForm4.colMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  col.Cursor := crHandpoint;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form3.Show;
  Form4.Hide;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle,
      GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;

procedure TForm4.FormShow(Sender: TObject);
var
  i, intnum: Integer;
  classnum, color: string;
begin
  for i := 3 to length(list.info) - 1 do
  begin
    if list.info[i] <> #13 then
    else
    begin
      break;
    end;
  end;
  num := copy(list.info, 4, i - 4); // ����Ĵ��߱��
  intnum := strtoint(num) - 1;
  ImageList1.GetBitmap(intnum, Image1.Picture.Bitmap); // ��ʾ��ӦͼƬ
  ADOQuery1.Close;
  ADOQuery1.Parameters.ParamByName('username').Value := num;
  ADOQuery1.Open;
  ADOQuery1.first;
  number.Caption := 'NO.' + ADOQuery1.Fields[0].AsString; // ���
  name.Caption := ADOQuery1.Fields[1].AsString; // ����
  star.Caption := ADOQuery1.Fields[3].AsString + '��'; // ϡ�ж�
  belong.Caption := ADOQuery1.Fields[7].AsString; // ��Ӫ
  baq.Caption := ADOQuery1.Fields[8].AsString + ':' + ADOQuery1.Fields[9]
    .AsString + ':' + ADOQuery1.Fields[10].AsString; // ɫ����
  story.Caption :='    '+ ADOQuery1.Fields[11].AsString; // ����
  baoju.Caption := ADOQuery1.Fields[12].AsString; // ������
  color := ADOQuery1.Fields[13].AsString; // ����ɫ
  if color = 'Buster' then // ���ݱ�����ɫ�ı�������ɫ
    baoju.font.color := clRed
  else
  begin
    if color = 'Art' then
      baoju.font.color := clBlue
    else
    begin
      if color = 'Quick' then
        baoju.font.color := clGreen
    end;
  end;
  ListBox.Clear; // ���߼���
  for i := 0 to 3 do
  begin
    if ADOQuery1.Fields[14 + i].IsNull then
      break
    else
      ListBox.Items.Add(ADOQuery1.Fields[14 + i].AsString)
  end;
  hp.Caption := ADOQuery1.Fields[18].AsString; // HP
  atk.Caption := ADOQuery1.Fields[19].AsString; // ATK
  classnum := ADOQuery1.Fields[2].AsString; // ְ��
  job.Caption := classnum;
  // �����б�
  skills.Items.Clear;

  ADOQuery2.Parameters.ParamByName('serventid').Value := num;
  ADOQuery2.Open;
  ADOQuery2.first;
  while not ADOQuery2.Eof do
  begin
    with skills.Items.Add do
    begin
      Caption := ADOQuery2.Fields[0].AsString;
      subitems.Add(ADOQuery2.Fields[1].AsString);
    end;
    ADOQuery2.Next;
  end;
  ADOQuery2.Close;
  skills.Column[0].Width := -1;
  skills.Column[1].Width := -1;
  ADOQuery1.Fields.Clear;

  if Main.flag = true then
    col.Caption := 'ȡ���ղ�'
  else
    col.Caption := '�����ղ�'
end;

procedure TForm4.Image3Click(Sender: TObject);
begin
  // �����б�
  Form1.Show;
  Form4.Hide;
end;

procedure TForm4.Image3MouseMove(Sender: TObject; Shift: TShiftState; // �������
  X, Y: Integer);
begin
  Image3.Cursor := crHandpoint;
end;

procedure TForm4.colClick(Sender: TObject); // �ղ���ȡ���ղ�
begin
  if Main.flag = false then
  begin
    ADOQuery6.Close;
    ADOQuery6.SQL.Clear;
    ADOQuery6.SQL.Text := 'insert into own values(:user,:serventid)';
    ADOQuery6.Parameters.ParamByName('user').Value := login.id;
    ADOQuery6.Parameters.ParamByName('serventid').Value := num;
    ADOQuery6.ExecSQL;
    showmessage('�ղسɹ���');
  end
  else
  begin
    ADOQuery6.Close;
    ADOQuery6.SQL.Clear;
    ADOQuery6.SQL.Text := 'delete from own where id=:user and sid=:serventid';
    ADOQuery6.Parameters.ParamByName('user').Value := login.id;
    ADOQuery6.Parameters.ParamByName('serventid').Value := num;
    ADOQuery6.ExecSQL;
    showmessage('ȡ���ղسɹ���');
  end
end;

end.
