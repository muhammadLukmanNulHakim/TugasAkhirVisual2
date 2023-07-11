unit semester;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, StdCtrls, Grids, DBGrids;

type
  TForm11 = class(TForm)
    Label1: TLabel;
    Label4l2: TLabel;
    Label4l3: TLabel;
    Label4l4: TLabel;
    Label4l5: TLabel;
    Label4l6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
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
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    cmb1: TComboBox;
    edt6: TEdit;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxreport1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    Button1: TButton;
    cmb2: TComboBox;
    cmb3: TComboBox;
    Label5: TLabel;
    procedure posisiawal;
    procedure editbersih;
    procedure editenable;
    procedure editdisable;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dg1CellClick(Column: TColumn);
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure Bb6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;
  id : string;

implementation

uses
  Menu;

{$R *.dfm}

{ TForm11 }

procedure TForm11.editbersih;
begin
edt1.Text := '';
edt2.Text := '';
edt3.Text := '';
edt4.Text := '';
edt5.Text := '';
edt6.Text := '';
cmb1.Text := ''; 
cmb2.Text := '';
cmb3.Text := '';
end;

procedure TForm11.editdisable;
begin
edt1.Enabled:= False;
edt2.Enabled:= False;
edt3.Enabled:= False;
edt4.Enabled:= False;
edt5.Enabled:= False;
edt6.Enabled:= False;
cmb1.Enabled:= False; 
cmb2.Enabled:= False;
cmb3.Enabled:= False;
end;

procedure TForm11.editenable;
begin
edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt5.Enabled:= True;
edt6.Enabled:= True;
cmb1.Enabled:= True; 
cmb2.Enabled:= True;
cmb3.Enabled:= True;
end;

procedure TForm11.posisiawal;
begin
editbersih;

editdisable;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm11.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm11.Button1Click(Sender: TObject);
begin
hide;
Form4.Show;
end;

procedure TForm11.dg1CellClick(Column: TColumn);
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
edt3.Text:= zqry1.FieldList[3].AsString;
edt4.Text:= zqry1.FieldList[4].AsString;
edt5.Text:= zqry1.FieldList[5].AsString;
edt6.Text:= zqry1.FieldList[6].AsString;
cmb1.Text:= zqry1.FieldList[7].AsString;
cmb2.Text:= zqry1.FieldList[8].AsString;
cmb3.Text:= zqry1.FieldList[9].AsString;
end;

procedure TForm11.b1Click(Sender: TObject);
begin
editbersih;
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;
editenable;
end;

procedure TForm11.b2Click(Sender: TObject);
begin
  //SIMPAN
  
if(edt1.Text = '')or(edt2.Text = '')or(edt3.Text = '')or(edt4.Text = '')or(edt5.Text = '')or(edt6.Text = '')or(cmb1.Text = '') or(cmb2.Text = '') or(cmb3.Text = '') then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if(zqry1.Locate('id_siswa',edt1.Text,[]))and(zqry1.Locate('id_kelas',edt5.Text,[]))then
begin
  ShowMessage('Data Semester sudah ada');
  posisiawal;
end else
begin
zqry1.sql.clear;
zqry1.sql.Add('insert into tabel_semester values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'","'+edt6.Text+'","'+cmb1.Text+'","'+cmb2.Text+'","'+cmb3.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_semester');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!!');
posisiawal;
end;
end;

procedure TForm11.b3Click(Sender: TObject);
begin
if(edt1.Text = '')or(edt2.Text = '')or(edt3.Text = '')or(edt4.Text = '')or(edt5.Text = '')or(edt6.Text = '')or(cmb1.Text = '') or(cmb2.Text = '') or(cmb3.Text = '') then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if (edt1.Text = zqry1.Fields[1].AsString) and (edt2.Text = zqry1.Fields[2].AsString)and(edt3.Text = zqry1.Fields[3].AsString)and(edt4.Text = zqry1.Fields[4].AsString)and(edt5.Text = zqry1.Fields[5].AsString)and(edt6.Text = zqry1.Fields[6].AsString)and (cmb1.Text = zqry1.Fields[7].AsString)and (cmb2.Text = zqry1.Fields[8].AsString)and (cmb3.Text = zqry1.Fields[9].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_semester').AsString;


zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_semester set id_siswa= "'+edt1.Text+'",id_poin="'+edt2.Text+'", id_wali= "'+edt3.Text+'",id_ortu= "'+edt4.Text+'",id_kelas= "'+edt5.Text+'",tanggal= "'+edt6.Text+'",semester= "'+cmb1.Text+'",status= "'+cmb2.Text+'" ,tingkat_kelas= "'+cmb3.Text+'"  where id_semester ="'+id+'"');
zqry1.ExecSQL;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_semester');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm11.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_semester').AsString;

zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_semester where id_semester ="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_semester');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm11.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm11.Bb6Click(Sender: TObject);
begin
frxreport1.ShowReport();
end;

end.
