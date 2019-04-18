unit classe;

interface

uses
  Windows, Messages, SysUtils, Variants, classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, pngimage, ExtCtrls, DB, ADODB, StdCtrls;

type
  TForm5 = class(TForm)
    Image1: TImage;
    ListView1: TListView;
    ImageList1: TImageList;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    intro: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Main;
{$R *.dfm}

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form3.show;
  Form5.hide;
end;

procedure TForm5.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  SetWindowLong(Handle, GWL_EXSTYLE, GetWindowLong(Handle,
      GWL_EXSTYLE) or WS_EX_APPWINDOW);
  intro.Caption := '';
end;

procedure TForm5.Image1Click(Sender: TObject);
begin
  Form3.show;
  Form5.hide;
end;

procedure TForm5.Image1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Image1.Cursor := crHandpoint;
end;

procedure TForm5.ListView1Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ListView1.Items.Count - 1 do
  begin
    if ListView1.Items[i].Selected = True then
    begin
      ADOQuery1.Parameters.ParamByName('name').Value := ListView1.Items[i]
        .Caption;
      ADOQuery1.Open;
      ADOQuery1.First;
      intro.Caption := '    ' + ADOQuery1.Fields[0].AsString;
      ADOQuery1.Close;
    end;
  end;
end;

end.
