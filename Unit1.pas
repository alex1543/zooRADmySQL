unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  System.UITypes, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, mySQLDbTables, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Menus, Unit2, Unit3;

type
  TForm1 = class(TForm)
    MySQLQuery1: TMySQLQuery;
    MySQLDatabase1: TMySQLDatabase;
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    Label1: TLabel;
    Edit2: TEdit;
    StringGrid1: TStringGrid;
    Label2: TLabel;
    Edit3: TEdit;
    Image1: TImage;
    Button3: TButton;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Button4: TButton;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Memo2: TMemo;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Edit7: TEdit;
    Label4: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Open1: TMenuItem;
    Print1: TMenuItem;
    Exit1: TMenuItem;
    Settings1: TMenuItem;
    DataBase1: TMenuItem;
    Window1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Button9: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);

    function FillGrid(Sender: TObject; strSQL : String) : Boolean;
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DataBase1Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
      nRow:Integer;
      nCol:Integer;
      blDrop:Boolean;
      Slservs : TStringList;
      boolFirst : Boolean;

implementation

{$R *.dfm}

function TForm1.FillGrid(Sender: TObject; strSQL : String) : Boolean;
begin
  MySQLQuery1.Active:=false;
  MySQLQuery1.SQL.Clear;
  MySQLQuery1.SQL.Add(strSQL);
  MySQLQuery1.Active:=true;

  StringGrid1.Cells[0,0]:='#';
  StringGrid1.Cells[1,0]:='text';
  StringGrid1.Cells[2,0]:='description';
  StringGrid1.Cells[3,0]:='keywords';

  nRow:=1;
  repeat
    StringGrid1.RowCount:=nRow+1;
    StringGrid1.ColCount:=MySQLQuery1.FieldCount;

    nCol:=0;
    while nCol< MySQLQuery1.FieldCount do
    begin
      StringGrid1.Cells[nCol,nRow]:=MySQLQuery1.Fields[nCol].AsString;
      nCol:=nCol+1;
    end;

    MySQLQuery1.Next;
    nRow:=nRow+1;
  until MySQLQuery1.EOF;
  FillGrid := true;
end;

procedure TForm1.FormActivate(Sender: TObject);
const
  Fn = 'servers.cfg';
var
  FileName : String;
  iServ : Integer;
begin
//  конфиги читаются всего 1 раз
// за всю работу программы.
if boolFirst then
begin
  FileName := ExtractFilePath( ParamStr(0) ) + Fn;
  if not FileExists(FileName) then begin
    MessageDlg('Файл не найден. Действие отменено.', mtWarning, [mbOk], 0);
    Exit;
  end;

  Slservs := TStringList.Create;
  Slservs.LoadFromFile(FileName);
 // FreeAndNil(Sl);

   // заполнение выпадающего списка из файла
  ComboBox1.Clear;
  iServ := 1;
  repeat
    ComboBox1.Items.Add(Slservs[iServ]);
    iServ := iServ+6;
  until iServ > Slservs.Count;
  ComboBox1.ItemIndex := 0;
  ComboBox1.OnChange(Sender);

  boolFirst := false; //  больше никогда не читаем конфиги.
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  boolFirst := true; // всего 1 раз читать конфиги.
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 // ShowMessage('Программа учёта товаров на складе, Вер. 1.0');
  MessageDlg('Программа учёта товаров на складе, Вер. 1.0', mtInformation, [mbOk], 0);
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  Label1.Caption := RadioButton1.Caption;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  Label1.Caption := RadioButton2.Caption;
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
  Label1.Caption := RadioButton3.Caption;
end;

procedure TForm1.StringGrid1DblClick(Sender: TObject);
begin
 // ShowMessage(StringGrid1.Selection.Bottom.ToString);
 // ShowMessage(StringGrid1.Cells[1,StringGrid1.Selection.Bottom] );

  Form3.Edit1.Text := StringGrid1.Cells[1,StringGrid1.Selection.Bottom];
  Form3.Edit2.Text := StringGrid1.Cells[2,StringGrid1.Selection.Bottom];
  Form3.Edit3.Text := StringGrid1.Cells[3,StringGrid1.Selection.Bottom];

  Form3.Edit4.Text := StringGrid1.Selection.Bottom.ToString;
  Form3.Edit5.Text := StringGrid1.Cells[0,StringGrid1.Selection.Bottom];

  Form3.Show;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  strSQL : String;
begin
  strSQL := Edit1.Text;
  FillGrid(Sender, strSQL);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  MySQLQuery1.SQL.Clear;
  MySQLQuery1.SQL.Add('DELETE FROM '+Edit3.Text+' WHERE '+Label1.Caption+Edit2.Text);
  MySQLQuery1.ExecSQL;
  Button4.Click;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  MySQLQuery1.SQL.Clear;
  MySQLQuery1.SQL.Add('INSERT INTO products SET text="'+Edit4.Text+'", description="'+Edit5.Text+'", keywords="'+Edit6.Text+'"');

 Memo2.Text := 'INSERT INTO products SET text="'+Edit4.Text+'", description="'+Edit5.Text+'", keywords="'+Edit6.Text+'"';
  MySQLQuery1.ExecSQL;
  Button4.Click;
end;

// Refresh
procedure TForm1.Button4Click(Sender: TObject);
var
  strSQL : String;
begin
  mySQLDatabase1.Connected := false;
  mySQLDatabase1.DatabaseName := 'zoo';
  mySQLDatabase1.Connected := true;

  strSQL := 'SELECT * FROM products ORDER by id DESC; ';
  FillGrid(Sender, strSQL);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Memo1.Text := 'DROP TABLE IF EXISTS files;DROP TABLE IF EXISTS products;DROP DATABASE IF EXISTS zoo;';
  blDrop:=true;
end;

// Run down
procedure TForm1.Button6Click(Sender: TObject);
var
  I: Integer;
begin
  MySQLQuery1.SQL.Clear;
  MySQLQuery1.SQL.Add(Memo1.Text);
  MySQLQuery1.ExecSQL;

  if blDrop then
  begin
    for I := 0 to StringGrid1.ColCount - 1 do
      StringGrid1.Cols[I].Clear;
    StringGrid1.RowCount := 1;
  end else begin
    Button4.Click;
  end;
  blDrop := false;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  mySQLDatabase1.Connected := false;
  mySQLDatabase1.DatabaseName := '';
  mySQLDatabase1.Connected := true;

  Memo1.Text := 'CREATE DATABASE IF NOT EXISTS zoo;USE zoo;';
  Memo1.Text := Memo1.Text+'CREATE TABLE IF NOT EXISTS products (id int(11) NOT NULL auto_increment, text text NOT NULL, description text NOT NULL, keywords text NOT NULL, PRIMARY KEY (id)) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=cp1251;';
  Memo1.Text := Memo1.Text+'CREATE TABLE IF NOT EXISTS files (id_file int(11) NOT NULL auto_increment, id_my int(11) NOT NULL, description text NOT NULL, name_origin text NOT NULL, path text NOT NULL, date_upload text NOT NULL,';
  Memo1.Text := Memo1.Text+' PRIMARY KEY (id_file), FOREIGN KEY (id_my) REFERENCES products(id)) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=cp1251;';
  Memo1.Text := Memo1.Text+'INSERT INTO products (text, description, keywords) values ("at1", "at2", "at3");';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Memo1.Text := 'UPDATE products SET keywords = "Ivanov" WHERE id = 18;';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Memo1.Text := Slservs.Text;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  Edit7.Text := ComboBox1.Items[ComboBox1.ItemIndex];

   //  ShowMessage(ComboBox1.ItemIndex.ToString);
  mySQLDatabase1.Connected := false;

  MySQLDataBase1.Host := Slservs[2+(ComboBox1.ItemIndex*6)];
 // ShowMessage(MySQLDataBase1.Host);
  MySQLDataBase1.Port := Slservs[3+(ComboBox1.ItemIndex*6)].ToInteger;
  MySQLDataBase1.UserName := Slservs[4+(ComboBox1.ItemIndex*6)];
  MySQLDataBase1.UserPassword := Slservs[5+(ComboBox1.ItemIndex*6)];

  mySQLDatabase1.DatabaseName := 'zoo';
  mySQLDatabase1.Connected := true;

  Button4.Click;
end;

procedure TForm1.DataBase1Click(Sender: TObject);
begin
if Form1.Width < 370 then
  Form1.Width := 690 else
  Form1.Width := 363;
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
  Form1.Close;
end;

end.
