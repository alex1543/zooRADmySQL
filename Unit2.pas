unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Data.DB,
  mySQLDbTables;

type
  TForm2 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit7: TEdit;
    Label7: TLabel;
    MySQLQuery1: TMySQLQuery;
    Memo1: TMemo;
    Label8: TLabel;
    Edit8: TEdit;
    CheckBox1: TCheckBox;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);

    function FillGridFood(Sender: TObject; strSQL : String) : Boolean;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
      nRow:Integer;
      nCol:Integer;

implementation

{$R *.dfm}

function TForm2.FillGridFood(Sender: TObject; strSQL : String) : Boolean;
begin
  MySQLQuery1.Active:=false;
  MySQLQuery1.SQL.Clear;
  MySQLQuery1.SQL.Add(strSQL);
  MySQLQuery1.Active:=true;

//  StringGrid1.Cells[0,0]:='#';
//  StringGrid1.Cells[1,0]:='text';
//  StringGrid1.Cells[2,0]:='description';
//  StringGrid1.Cells[3,0]:='keywords';

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
  FillGridFood := true;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  MySQLQuery1.SQL.Clear;
  Memo1.Text := 'USE zoo; INSERT INTO animals(id_worker, nickname, cell, place_origin, country, count_food, type_animals, type_food, under_type_food, date_add)';
  Memo1.Text := Memo1.Text + 'VALUES (1, '''+Edit1.Text+''','''+Edit2.Text+''','''+Edit8.Text+''','''+Edit3.Text+''','''+Edit4.Text+''','''+Edit5.Text+''','''+Edit6.Text+''','''+Edit7.Text+''','''+FormatDateTime('yyyy-mm-dd',Date)+''')';
   MySQLQuery1.SQL.Add(Memo1.Text);
  MySQLQuery1.ExecSQL;
  Button2.Click;

end;

procedure TForm2.Button2Click(Sender: TObject);
  var
  strSQL : String;
begin
  strSQL := 'USE zoo; SELECT * FROM animals ORDER by id_animals DESC; ';
  FillGridFood(Sender, strSQL);
end;

procedure TForm2.Button3Click(Sender: TObject);
  var
  strSQL : String;
begin
  strSQL := 'USE zoo; SELECT * FROM animals ORDER by id_animals ASC; ';
  FillGridFood(Sender, strSQL);
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
if Form2.Width < 370 then
  Form2.Width := 690 else
  Form2.Width := 350;
end;

end.
