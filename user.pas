unit user;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label4l2: TLabel;
    Label4l3: TLabel;
    Label4l4: TLabel;
    Label2: TLabel;
    dg1: TDBGrid;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    Bb6: TButton;
    edt1: TEdit;
    edt2: TEdit;
    cmb1: TComboBox;
    Button1: TButton;
    cmb2: TComboBox;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxreport1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    procedure Button1Click(Sender: TObject);
    procedure posisiawal;
    procedure editbersih;
    procedure editenable;
    procedure editdisable;
    procedure dg1CellClick(Column: TColumn);
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  id : string;

implementation

uses
  Menu;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
hide;
Form4.Show;
end;

procedure TForm1.editbersih;
begin
edt1.Text := '';
edt2.Text := '';
cmb1.Text := ''; 
cmb2.Text := '';
end;

procedure TForm1.editdisable;
begin
edt1.Enabled:= False;
edt2.Enabled:= False;
cmb1.Enabled:= False; 
cmb2.Enabled:= False;
end;

procedure TForm1.editenable;
begin
edt1.Enabled:= True;
edt2.Enabled:= True;
cmb1.Enabled:= True; 
cmb2.Enabled:= True;
end;

procedure TForm1.posisiawal;
begin
editbersih;

editdisable;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm1.dg1CellClick(Column: TColumn);
begin
editenable;

b1.Enabled:= true;
b2.Enabled:= False;
b3.Enabled:= True;
b4.Enabled:= True;
b5.Enabled:= True;

id:=zqry1.Fields[0].AsString;

edt1.Text:= zqry1.FieldList[1].AsString;
edt2.Text:= zqry1.FieldList[2].AsString;
cmb1.Text:= zqry1.FieldList[3].AsString;
cmb2.Text:= zqry1.FieldList[4].AsString;
end;

procedure TForm1.b1Click(Sender: TObject);
begin
editbersih;
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;
editenable;
end;

procedure TForm1.b2Click(Sender: TObject);
begin
  //SIMPAN
  
if(edt1.Text = '')or(edt2.Text = '')or(cmb1.Text = '') or(cmb2.Text = '') then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if(zqry1.Locate('username',edt1.Text,[]))then
begin
  ShowMessage('Username sudah ada');
  posisiawal;
end else
begin
zqry1.sql.clear;
zqry1.sql.Add('insert into tabel_user values(null,"'+edt1.Text+'","'+edt2.Text+'","'+cmb1.Text+'","'+cmb2.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_user');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!!');
posisiawal;
end;
end;

procedure TForm1.b3Click(Sender: TObject);
begin
if(edt1.Text = '')or(edt2.Text = '')or(cmb1.Text = '') or(cmb2.Text = '') then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if (edt1.Text = zqry1.Fields[1].AsString) and (edt2.Text = zqry1.Fields[2].AsString)and (cmb1.Text = zqry1.Fields[3].AsString)and (cmb2.Text = zqry1.Fields[4].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_user').AsString;


zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_semester set username= "'+edt1.Text+'",password="'+edt2.Text+'",level= "'+cmb1.Text+'",status= "'+cmb2.Text+'" where id_user ="'+id+'"');
zqry1.ExecSQL;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_user');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm1.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_user').AsString;

zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_user where id_user ="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_user');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm1.b5Click(Sender: TObject);
begin
posisiawal;
end;

end.
