unit siswa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, frxClass, frxDBSet, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, Grids,
  DBGrids, ComCtrls;

type
  TForm6 = class(TForm)
    Label4l2: TLabel;
    Label4l3: TLabel;
    Label4l4: TLabel;
    Label4l5: TLabel;
    Label4l6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dg1: TDBGrid;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    Bb6: TButton;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    frxreport1: TfrxReport;
    frxdbdtst1: TfrxDBDataset;
    Label6: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    edt7: TEdit;
    edt8: TEdit;
    cmb1: TComboBox;
    cmb2: TComboBox;
    dtp1: TDateTimePicker;
    edt6: TEdit;
    Button1: TButton;
    procedure b1Click(Sender: TObject);
    procedure posisiawal;
    procedure editbersih;
    procedure editenable;
    procedure editdisable;
    procedure FormShow(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure dg1CellClick(Column: TColumn);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure Bb6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  id : string;

implementation

uses
  Menu;

{$R *.dfm}

procedure TForm6.b1Click(Sender: TObject);
begin
editbersih;
b1.Enabled:= false;
b2.Enabled:= True;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= True;

editenable;
end;

procedure TForm6.editbersih;
begin
edt1.Text := '';
edt2.Text := '';
edt3.Text := '';
edt4.Text := '';
edt5.Text := '';
edt6.Text := '';
cmb1.Text := '';
edt7.Text := '';
edt8.Text := '';
cmb2.Text := '';
end;

procedure TForm6.editdisable;
begin
edt1.Enabled:= False;
edt2.Enabled:= False;
edt3.Enabled:= False;
edt4.Enabled:= False;
edt5.Enabled:= False;
edt6.Enabled:= False;
cmb1.Enabled:= False;
edt7.Enabled:= False;
edt8.Enabled:= False;
cmb2.Enabled:= False;
end;

procedure TForm6.editenable;
begin
edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt5.Enabled:= True;
edt6.Enabled:= True; 
cmb1.Enabled:= True;
edt7.Enabled:= True;
edt8.Enabled:= True; 
cmb2.Enabled:= True;
end;

procedure TForm6.posisiawal;
begin
editbersih;

editdisable;

b1.Enabled:= True;
b2.Enabled:= False;
b3.Enabled:= False;
b4.Enabled:= False;
b5.Enabled:= False;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm6.b2Click(Sender: TObject);
begin
  //SIMPAN
  
if(edt1.Text = '')or(edt2.Text = '')or(edt3.Text = '')or(edt4.Text = '')or(edt5.Text = '')or(edt6.Text = '')or(cmb1.Text = '')or(edt7.Text = '')or(edt8.Text = '')or(cmb2.Text = '')then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if(zqry1.Locate('nis',edt1.Text,[]))and(zqry1.Locate('nik',edt4.Text,[]))then
begin
  ShowMessage('Data Siswa sudah ada');
  posisiawal;
end else
begin
zqry1.sql.clear;
zqry1.sql.Add('insert into tabel_siswa values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'","'+edt6.Text+'","'+cmb1.Text+'","'+edt7.Text+'","'+edt8.Text+'","'+cmb2.Text+'")');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_siswa');
zqry1.Open;
ShowMessage('DATA BERHASIL DISIMPAN!!');
posisiawal;
end;
end;

procedure TForm6.dg1CellClick(Column: TColumn);
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
edt7.Text:= zqry1.FieldList[8].AsString;
edt8.Text:= zqry1.FieldList[9].AsString;
cmb2.Text:= zqry1.FieldList[10].AsString;
end;

procedure TForm6.b3Click(Sender: TObject);
begin
if(edt1.Text = '')or(edt2.Text = '')or(edt3.Text = '')or(edt4.Text = '')or(edt5.Text = '')or(edt6.Text = '')or(cmb1.Text = '')or(edt7.Text = '')or(edt8.Text = '')or(cmb2.Text = '')then
begin
  ShowMessage('DATA TIDAK BOLEH KOSONG !');
end else
if (edt1.Text = zqry1.Fields[1].AsString) and (edt2.Text = zqry1.Fields[2].AsString) and(edt3.Text = zqry1.Fields[3].AsString)and(edt4.Text = zqry1.Fields[4].AsString)and(edt5.Text = zqry1.Fields[5].AsString)and(edt6.Text = zqry1.Fields[6].AsString)and(cmb1.Text = zqry1.Fields[7].AsString)and(edt7.Text = zqry1.Fields[8].AsString)and(edt8.Text = zqry1.Fields[9].AsString)and(cmb2.Text = zqry1.Fields[10].AsString) then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
posisiawal;
end else
begin
id:=dg1.DataSource.DataSet.FieldByName('id_siswa').AsString;


zqry1.SQL.Clear;
zqry1.SQL.Add('Update tabel_siswa set nis= "'+edt1.Text+'",nisn="'+edt2.Text+'", nama= "'+edt3.Text+'",nik= "'+edt4.Text+'",tempat_lahir= "'+edt5.Text+'",tgl_lahir= "'+edt6.Text+'",jenis_kelamin= "'+cmb1.Text+'",alamat= "'+edt7.Text+'",telpon= "'+edt8.Text+'",status= "'+cmb2.Text+'"  where id_siswa ="'+id+'"');
zqry1.ExecSQL;
ShowMessage('DATA BERHASIL DIUPDATE!'); //UPDATE

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_siswa');
zqry1.Open;
posisiawal;
end;
end;

procedure TForm6.b4Click(Sender: TObject);
begin
if MessageDlg('APAKAH YAKIN MENGHAPUS DATA INI?',mtWarning,[mbYes,mbNo],0)= mryes then
begin
id:=dg1.DataSource.DataSet.FieldByName('id_wali').AsString;
zqry1.SQL.Clear;
zqry1.SQL.Add(' delete from tabel_wali_kelas where id_wali ="'+id+'"');
zqry1.ExecSQL;

zqry1.SQL.Clear;
zqry1.SQL.Add('select * from tabel_wali_kelas');
zqry1.Open;
ShowMessage('DATA BERHASIL DIHAPUS');
posisiawal;
end else
begin
ShowMessage('DATA BATAL DIHAPUS');
posisiawal;
end;
end;

procedure TForm6.b5Click(Sender: TObject);
begin
posisiawal;
end;

procedure TForm6.Bb6Click(Sender: TObject);
begin
frxreport1.ShowReport();
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
Hide;
Form4.Show;
end;

end.
