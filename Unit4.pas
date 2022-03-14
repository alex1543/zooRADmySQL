unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  System.UITypes,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, ShellApi,
  Vcl.ExtDlgs;

type
  TForm4 = class(TForm)
    StringGrid1: TStringGrid;
    Memo1: TMemo;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    OpenTextFileDialog1: TOpenTextFileDialog;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'notepad.exe', PChar(Edit1.Text), nil, SW_SHOWNORMAL);
end;

procedure TForm4.Button2Click(Sender: TObject);
var
  FileName : String;
  Slfile : TStringList;
begin

  FileName := Edit1.Text;
  if not FileExists(FileName) then begin
    MessageDlg('Файл не найден. Действие отменено.', mtWarning, [mbOk], 0);
    Exit;
  end;

  Slfile := TStringList.Create;
  Slfile.LoadFromFile(FileName);

  Memo1.Text := Slfile.Text;

  FreeAndNil(Slfile);
end;

procedure TForm4.Button3Click(Sender: TObject);
var
  FileName : String;
  Slfile : TStringList;
begin
  FileName := Edit1.Text;
  Slfile := TStringList.Create;
  Slfile.Text := Memo1.Text;
  Slfile.SaveToFile(FileName);
  FreeAndNil(Slfile);
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  if OpenTextFileDialog1.Execute then
    begin
        Memo1.Lines.LoadFromFile(OpenTextFileDialog1.FileName);
        Edit1.Text := OpenTextFileDialog1.FileName;
    end;
end;

end.
