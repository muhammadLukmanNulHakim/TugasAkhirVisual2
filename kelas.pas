unit kelas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm9 = class(TForm)
    Label1: TLabel;
    Label4l2: TLabel;
    Label4l3: TLabel;
    dg1: TDBGrid;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    Bb6: TButton;
    edt1: TEdit;
    cmb1: TComboBox;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxreport1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure posisiawal;
    procedure editbersih;
    procedure editenable;
    procedure editdisable;
    procedure FormShow(Sender: TObject);
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure dg1CellClick(Column: TColumn);
    procedure Bb6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  id : string;

implementation

uses
  Menu;

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
hide;
Form4.Show;
end;

procedure TForm9.editbersih;
begin
edt1.Text := '';
cmb1.Text := '';
end;

procedure TForm9.editdisable;
begin
edt1.Enabled:= False;
cmb1.Enabled:= False;
end;

procedure TForm9.editenable;
begin
edt1.Enabled:= True;
cmb1.Enabled:= True;
end;

procedure TForm9.posisiawal;
begin
editbersih;

editdisable;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm9.b1Click(Sender: TObject);
begin
editbersih;
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;
editenable;
end;

procedure TForm9.b2Click(Sender: TObject);
begin
  //SIMPAN
  
if(edt1.Text = '')or(cmb1.Text = '')then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if(zqry1.Locate('nama',edt1.Text,[]))then
begin
  ShowMessage('Data Poin sudah ada');
  posisiawal;
end else
begin
zqry1.sql.clear;
zqry1.sql.Add('insert into tabel_kelas values(null,"'+edt1.Text+'","'+cmb1.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_kelas');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!!');
posisiawal;
end;
end;

procedure TForm9.b3Click(Sender: TObject);
begin
if(edt1.Text = '')or(cmb1.Text = '')then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if (edt1.Text = zqry1.Fields[1].AsString) and (cmb1.Text = zqry1.Fields[2].AsString)then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_kelas').AsString;


zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_kelas set nama= "'+edt1.Text+'", jurusan= "'+cmb1.Text+'" where id_kelas ="'+id+'"');
zqry1.ExecSQL;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_kelas');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm9.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_kelas').AsString;

zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_kelas where id_kelas ="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_kelas');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm9.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm9.dg1CellClick(Column: TColumn);
begin
editenable;

b1.Enabled:= true;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;

id:=zqry1.Fields[0].AsString;

edt1.Text:= zqry1.FieldList[1].AsString;
cmb1.Text:= zqry1.FieldList[2].AsString; 
end;

procedure TForm9.Bb6Click(Sender: TObject);
begin
frxreport1.ShowReport();
end;

end.
