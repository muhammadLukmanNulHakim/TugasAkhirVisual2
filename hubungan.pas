unit hubungan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm10 = class(TForm)
    Label1: TLabel;
    Label4l2: TLabel;
    Label4l3: TLabel;
    Label4l4: TLabel;
    Label4l5: TLabel;
    Label4: TLabel;
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
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxreport1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    Button1: TButton;
    cmb2: TComboBox;
    cmb3: TComboBox;
    procedure posisiawal;
    procedure editbersih;
    procedure editenable;
    procedure editdisable;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dg1CellClick(Column: TColumn);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure b1Click(Sender: TObject);
    procedure Bb6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;
  id : string;

implementation

uses
  Menu;

{$R *.dfm}

{ TForm10 }

procedure TForm10.editbersih;
begin
edt1.Text := '';
edt2.Text := '';
cmb1.Text := ''; 
cmb2.Text := '';
cmb3.Text := '';
end;

procedure TForm10.editdisable;
begin
edt1.Enabled:= False;
edt2.Enabled:= False;
cmb1.Enabled:= False;  
cmb2.Enabled:= False;
cmb3.Enabled:= False;
end;

procedure TForm10.editenable;
begin
edt1.Enabled:= True;
edt2.Enabled:= True;
cmb1.Enabled:= True;  
cmb2.Enabled:= True;
cmb3.Enabled:= True;
end;

procedure TForm10.posisiawal;
begin
editbersih;

editdisable;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm10.Button1Click(Sender: TObject);
begin
hide;
Form4.Show;
end;

procedure TForm10.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm10.dg1CellClick(Column: TColumn);
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
cmb3.Text:= zqry1.FieldList[5].AsString;
end;

procedure TForm10.b2Click(Sender: TObject);
begin
  //SIMPAN

if(edt1.Text = '')or(edt2.Text = '')or(cmb1.Text = '')or(cmb2.Text = '')or(cmb3.Text = '') then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if(zqry1.Locate('id_siswa',edt1.Text,[]))then
begin
  ShowMessage('Data Hubungan sudah ada');
  posisiawal;
end else
begin
zqry1.sql.clear;
zqry1.sql.Add('insert into tabel_hubungan values(null,"'+edt1.Text+'","'+edt2.Text+'","'+cmb1.Text+'","'+cmb2.Text+'","'+cmb3.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_hubungan');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!!');
posisiawal;
end;
end;

procedure TForm10.b3Click(Sender: TObject);
begin
if(edt1.Text = '')or(edt2.Text = '')or(cmb1.Text = '')or(cmb2.Text = '')or(cmb3.Text = '')then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if (edt1.Text = zqry1.Fields[1].AsString) and (edt2.Text = zqry1.Fields[2].AsString)and (cmb1.Text = zqry1.Fields[3].AsString)and (cmb2.Text = zqry1.Fields[4].AsString)and (cmb3.Text = zqry1.Fields[5].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_hub').AsString;


zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_hubungan set id_siswa= "'+edt1.Text+'",id_ortu="'+edt2.Text+'", status_hubungan= "'+cmb1.Text+'", keterangan= "'+cmb2.Text+'", status_ortu= "'+cmb3.Text+'" where id_hub ="'+id+'"');
zqry1.ExecSQL;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_hubungan');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm10.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_hub').AsString;

zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_hubungan where id_hub ="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_hubungan');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm10.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm10.b1Click(Sender: TObject);
begin
editbersih;
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;
editenable;
end;

procedure TForm10.Bb6Click(Sender: TObject);
begin
frxreport1.ShowReport();
end;

end.
