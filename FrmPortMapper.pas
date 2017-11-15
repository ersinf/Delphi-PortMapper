unit FrmPortMapper;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdMappedPortTCP, Vcl.StdCtrls,  ShellAPI, Vcl.Menus,
  Vcl.ComCtrls;

const
  WM_ICONTRAY = WM_USER + 555;

type
  TForm1 = class(TForm)
    Button1: TButton;
    IdMappedPortTCP1: TIdMappedPortTCP;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    PopupMenu1: TPopupMenu;
    S1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    A1: TMenuItem;
    N4: TMenuItem;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    TrayIconData: TNotifyIconData;
    procedure TrayMessage(var Msg: TMessage); message WM_ICONTRAY;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

procedure TForm1.A1Click(Sender: TObject);
begin
Application.MessageBox('This application is written by Ersin Fidan.' + chr(10) +' E-Mail : ersinfidan@gmail.com','About',MB_ICONINFORMATION+MB_OK);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  IdMappedPortTCP1.MappedHost := Edit1.Text;
  IdMappedPortTCP1.MappedPort := StrToInt(Edit2.Text);
  IdMappedPortTCP1.DefaultPort := StrToInt(Edit3.Text);;
  IdMappedPortTCP1.Active :=  True;
  StatusBar1.Panels[0].Text:='Status = Active';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
IdMappedPortTCP1.Active :=  False;
StatusBar1.Panels[0].Text:='Status = Passive';
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := 256;
  if GetComputerName(buffer, size) then
  begin
    Edit1.Text := buffer;
    Edit2.Text := '3389';
    Edit3.Text := '80';
  end;

    with TrayIconData do
    begin
      cbSize := SizeOf;
      Wnd := Handle;
      uID := 0;
      uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
      uCallbackMessage := WM_ICONTRAY;
      hIcon := Application.Icon.Handle;
      StrPCopy(szTip, Application.Title);
    end;
    Shell_NotifyIcon(NIM_ADD, @TrayIconData);

end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
end;

procedure TForm1.FormResize(Sender: TObject);
begin

if Form1.WindowState = wsMinimized then
begin
    Form1.Hide;
end;

end;

procedure TForm1.N1Click(Sender: TObject);
begin
Form1.Hide;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.S1Click(Sender: TObject);
begin
Form1.Show;
Form1.WindowState:= wsNormal;
end;

procedure TForm1.TrayMessage(var Msg: TMessage);
begin
  case Msg.lParam of
    WM_LBUTTONDOWN:
    begin
      Form1.S1.Click;
    end;
    WM_RBUTTONDOWN:
      PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  end;
end;

end.
