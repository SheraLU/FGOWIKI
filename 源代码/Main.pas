unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, pngimage, StdCtrls, ADODB, DB;

type
  TForm3 = class(TForm)
    Image1: TImage;
    GridPanel1: TGridPanel;
    allser: TImage;
    myser: TImage;
    intro: TImage;
    zhaohuan: TImage;
    procedure allserClick(Sender: TObject);
    procedure myserClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure myserMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure allserMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure introMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure zhaohuanMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure zhaohuanClick(Sender: TObject);
    procedure introClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  flag: bool; // true为个人收藏 false为灵基一览

implementation

uses list, login, servant,classe;
{$R *.dfm}

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form2.Close;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle,
      GWL_EXSTYLE) or WS_EX_APPWINDOW);
end;

procedure TForm3.introClick(Sender: TObject);
begin
  Form5.show;
  Form3.Hide;
end;

procedure TForm3.introMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  intro.Cursor := crHandpoint;
end;

procedure TForm3.allserClick(Sender: TObject);
begin
  flag := false;
  Form1.show;
  Form3.Hide;
end;

procedure TForm3.allserMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  allser.Cursor := crHandpoint;
end;

procedure TForm3.myserClick(Sender: TObject);
begin
  flag := true;
  Form1.show;
  Form3.Hide;
end;

procedure TForm3.myserMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  myser.Cursor := crHandpoint;
end;

procedure TForm3.zhaohuanClick(Sender: TObject);
var
  ran: Integer;
begin
  flag := false;
  ran := Random(39) + 1;
  ShowMessage('恭喜召唤出 No.'+inttostr(ran)+'号 从者！');
  list.info := 'No.' + inttostr(ran) + #13;
  servant.Form4.show();
  Form3.Hide;
end;

procedure TForm3.zhaohuanMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  zhaohuan.Cursor := crHandpoint;
end;

end.
