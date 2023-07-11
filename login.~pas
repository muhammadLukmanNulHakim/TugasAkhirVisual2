unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm2 = class(TForm)
    Label4l2: TLabel;
    Label4l3: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    b1: TButton;
    b2: TButton;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    procedure b2Click(Sender: TObject);
    procedure b1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses
  Unit1, daftar, Menu;

{$R *.dfm}

procedure TForm2.b2Click(Sender: TObject);
begin
Form3.Show;

end;

procedure TForm2.b1Click(Sender: TObject);
begin

with zqry1 do begin
SQL.Clear;
SQL.Add('select * from tabel_user where username='+QuotedStr(edit1.Text));
open;
end;

//end with
//jika tidak ditemukan data yang dicari
//maka tampilkan pesan

if zqry1.RecordCount=0
then
Application.MessageBox('Maaf user name tidak ditemukan','informasi',MB_OK or MB_ICONINFORMATION)
else
begin
if zqry1.FieldByName('password').AsString<>Edit2.Text
then
Application.MessageBox('Pastikan password yang anda masukkan benar','error',MB_OK or MB_ICONERROR)
else
begin
hide;
Form4.Show;
end;
end;
end;

end.
