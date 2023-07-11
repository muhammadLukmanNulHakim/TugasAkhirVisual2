unit daftar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls;

type
  TForm3 = class(TForm)
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
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    procedure b2Click(Sender: TObject);
    procedure b1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses
  login;

{$R *.dfm}

procedure TForm3.b2Click(Sender: TObject);
begin
Form3.Close;
end;

procedure TForm3.b1Click(Sender: TObject);
begin
if(Edit1.Text = '')or(Edit2.Text = '')or(ComboBox1.Text = '')or(ComboBox2.Text = '') then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if(zqry1.Locate('username',Edit1.Text,[])) then
begin
  ShowMessage('Username sudah digunakan!');
end else
begin
zqry1.sql.clear;
zqry1.sql.Add('insert into tabel_user values(null,"'+Edit1.Text+'","'+Edit2.Text+'","'+ComboBox1.Text+'","'+ComboBox2.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_user');
zqry1.Open;

Form2.zqry1.Active := False;
Form2.zqry1.Active := true;


ShowMessage('DATA BERHASIL DISIMPAN!!');
end;
end;

end.
