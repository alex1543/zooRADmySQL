unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, mySQLDbTables;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit4: TEdit;
    Label2: TLabel;
    Edit5: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    MySQLQuery1: TMySQLQuery;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    CheckBox1: TCheckBox;
    Button3: TButton;
    Button2: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  MySQLQuery1.SQL.Clear;
  Memo1.Text :=  'UPDATE products SET text = '''+Edit1.Text+''', description = '''+Edit2.Text+''', keywords = '''+Edit3.Text+''' WHERE id = '''+Edit5.Text+''';';
  MySQLQuery1.SQL.Add(Memo1.Text);
  MySQLQuery1.ExecSQL;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  MySQLQuery1.SQL.Clear;
  MySQLQuery1.SQL.Add(Memo1.Text);
  MySQLQuery1.ExecSQL;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  Memo1.Text :=  'UPDATE products SET text = '''+Edit1.Text+''', description = '''+Edit2.Text+''', keywords = '''+Edit3.Text+''' WHERE id = '''+Edit5.Text+''';';
end;

procedure TForm3.Button4Click(Sender: TObject);
var
  AMsgDialog: TForm;
  AEdit: TEdit;
begin

  AMsgDialog := CreateMessageDialog('Вы действительно хотите удалить эту запись?',mtConfirmation, [mbYes, mbNo]);
  AEdit := TEdit.Create(AMsgDialog);
  with AMsgDialog do
    try
      Caption := 'Удаление записи с id='+Edit5.Text;

      with AEdit do
      begin
        Parent := AMsgDialog;
        Text := Edit5.Text;
        Top := 67;
        Left := 40;
        Width := 40;
      end;

      if ShowModal=ID_YES then
      begin
        MySQLQuery1.SQL.Clear;
        Memo1.Text :=  'DELETE FROM products WHERE id = '''+AEdit.Text+''';';
        MySQLQuery1.SQL.Add(Memo1.Text);
        MySQLQuery1.ExecSQL;
        Form3.Close;
      end;

    finally
      Free;
    end;

end;

procedure TForm3.CheckBox1Click(Sender: TObject);
begin
if Form3.Height < 370 then
  Form3.Height := 373 else
  Form3.Height := 188;
end;

end.
