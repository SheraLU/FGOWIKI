unit list;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Menus, pngimage, DB, ADODB, ImgList,
  ComCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    TEdit1: TEdit;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    Image2: TImage;
    Image3: TImage;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    N3: TMenuItem;
    list: TListView;
    ImageList1: TImageList;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure NClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image3MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure listClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  info: string;

implementation

uses servant, Main, login;
{$R *.dfm}

var
  item: string;
  popitem: TMenuItem;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // 搜索
  List.Items.Clear;
  ADOQuery1.close;
  ADOQuery1.SQL.Text := (
    'Select * from servents where sname like :serventname order by sid');
  ADOQuery1.Parameters.ParamByName('serventname')
    .Value := '%' + TEdit1.Text + '%';
  ADOQuery1.Open;
  if ADOQuery1.RecordCount <= 0 then
    ShowMessage('没有相关从者信息');
  ADOQuery1.first;
  while not ADOQuery1.eof do
  begin
    with list.Items.Add do
    begin
      Caption :='No.'+ ADOQuery1.Fields[0].AsString + #13 + ADOQuery1.Fields[1]
        .AsString;
      ImageIndex := strtoint(ADOQuery1.Fields[0].AsString) - 1;
    end;
    ADOQuery1.next;
  end;
  ADOQuery2.close;
  ADOQuery2.Parameters.ParamByName('input').Value := TEdit1.Text;
  ADOQuery2.ExecSQL;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  // 返回主页
  List.Items.Clear;
  Form3.show;
  Form1.close;
end;

procedure TForm1.Image2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer); // 鼠标
begin
  Image2.Cursor := crHandpoint;
end;

procedure TForm1.Image3Click(Sender: TObject); // 下拉菜单
var
  i: Integer;
begin
  ADOQuery3.Open;
  ADOQuery3.first;
  i := 0;
  while not ADOQuery3.eof do // 最近三次记录
  begin
    PopupMenu1.Items[i].Caption := ADOQuery3.Fields[0].AsString;
    ADOQuery3.next;
    i := i + 1;
  end;
  ADOQuery3.Fields.Clear;
  ADOQuery3.close;
  PopupMenu1.Popup(Form1.left + 350, Form1.top + 100); // 显示菜单
end;

procedure TForm1.Image3MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer); // 鼠标
begin
  Image3.Cursor := crHandpoint;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin // 关闭窗口
  Form1.Hide;
  Form3.show;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin // 显示状态栏
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle,
      GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;

procedure TForm1.FormShow(Sender: TObject); // 窗体出现
begin
  if Main.flag then // 个人收藏
  begin
    List.Items.Clear;
    ADOQuery1.close;
    ADOQuery1.SQL.Text := (
      'Select * from servents where sid in (select sid from own where id = :username) order by sid');
    ADOQuery1.Parameters.ParamByName('username').Value := login.id;
    ADOQuery1.Open;
    ADOQuery1.first;
    while not ADOQuery1.eof do
    begin
      with list.Items.Add do
      begin
        Caption :='No.'+ ADOQuery1.Fields[0].AsString + #13 + ADOQuery1.Fields[1]
          .AsString;
        ImageIndex := strtoint(ADOQuery1.Fields[0].AsString) - 1;
      end;
      ADOQuery1.next;
    end
  end
  else // 灵基一览
  begin
    List.Items.Clear;
    ADOQuery1.close;
    ADOQuery1.SQL.Text := ('Select * from servents order by sid');
    ADOQuery1.Open;
    ADOQuery1.first;
    while not ADOQuery1.eof do
    begin
      with list.Items.Add do
      begin
        Caption :='No.'+ ADOQuery1.Fields[0].AsString + #13 + ADOQuery1.Fields[1]
          .AsString;
        ImageIndex := strtoint(ADOQuery1.Fields[0].AsString) - 1;
      end;
      ADOQuery1.next;
    end;
  end;
end;

procedure TForm1.listClick(Sender: TObject);
// 点击列表项
var
  i: Integer;
begin
  for i := 0 to List.Items.Count - 1 do
  begin
    if List.items[i].Selected = True then
    begin
      info := List.Items[i].Caption;
      Form4.show;
      Form1.Hide;
    end;
end;
end;

procedure TForm1.NClick(Sender: TObject); // 菜单点击事件
begin
  TEdit1.Text := TMenuItem(Sender).Caption;
end;

end.
