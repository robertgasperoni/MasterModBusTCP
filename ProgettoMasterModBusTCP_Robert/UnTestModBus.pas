unit UnTestModBus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst, Vcl.Mask,
  Vcl.ExtCtrls,
  // elementi Modbus TCP
  IdModbusClient,
  idGlobal, Vcl.Grids;

type
  TForm1 = class(TForm)
    edIP_Slave: TLabeledEdit;
    btnConnect: TButton;
    btnReadCoils: TButton;
    btnWriteCoils: TButton;
    ckOutputs: TCheckListBox;
    ckInputs: TCheckListBox;
    btnReadDiscreteInputs: TButton;
    btnDisconnect: TButton;
    ckAutomatico: TCheckBox;
    Timer1: TTimer;
    ckWriteOutputs: TCheckListBox;
    sgDati: TStringGrid;
    btnLeggiRegister: TButton;
    btnScriviRegister: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnDisconnectClick(Sender: TObject);
    procedure btnReadCoilsClick(Sender: TObject);
    procedure btnWriteCoilsClick(Sender: TObject);
    procedure btnReadDiscreteInputsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ckAutomaticoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnLeggiRegisterClick(Sender: TObject);
    procedure btnScriviRegisterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    mctPLC: TIdModBusClient;
    procedure AbilitaLettureScritture(stato: boolean);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AbilitaLettureScritture(stato: boolean);
begin
  btnReadCoils.Enabled := stato;
  btnWriteCoils.Enabled := stato;
  btnReadDiscreteInputs.Enabled := stato;
  btnLeggiRegister.Enabled := stato;
  btnScriviRegister.Enabled := stato;
end;

procedure TForm1.btnConnectClick(Sender: TObject);
begin
  mctPLC.Host := edIP_Slave.Text;
  try
    mctPLC.Connect;
  except
    on ex: Exception do
    begin
      ShowMessage('Problemi: '+ex.Message);
    end;
  end;
  btnConnect.Enabled := false;
  btnDisconnect.Enabled := true;
  AbilitaLettureScritture(true);
end;

procedure TForm1.btnDisconnectClick(Sender: TObject);
begin
  try
   if mctPLC.Connected then
   begin
    mctPLC.Disconnect;
   end;
  except
    on ex: Exception do
    begin
      ShowMessage('Problemi: '+ex.Message);
    end;
  end;
  btnConnect.Enabled := true;
  btnDisconnect.Enabled := false;
  AbilitaLettureScritture(false);
end;

procedure TForm1.btnLeggiRegisterClick(Sender: TObject);
var vettore: TArray<Word>;
    i: integer;
begin
  // lettura dei registri di parametrizzazione
  if mctPLC.Connected then
  begin
    vettore := TArray<Word>.Create();
    SetLength(vettore,4);
    mctPLC.ReadHoldingRegisters(24576,4,vettore);
    for i := 0 to 4-1 do
    begin
      sgDati.Cells[0,i] := 'R'+IntToStr(i);
      sgDati.Cells[1,i] := IntToStr(vettore[i]);
      sgDati.Cells[2,i] := IntToHex(vettore[i]);
    end;
  end;
end;

procedure TForm1.btnReadCoilsClick(Sender: TObject);
var i: integer;
    flg: boolean;
begin
  try
   if mctPLC.Connected then
   begin
    for i := 0 to ckOutputs.Count - 1 do
    begin
     flg := false;
     mctPLC.ReadCoil(i+1,flg);
     ckOutputs.Checked[i] := flg;
    end;
   end;
  except
    on ex: Exception do
    begin
      ShowMessage('Problemi: '+ex.Message);
    end;
  end;
end;

procedure TForm1.btnReadDiscreteInputsClick(Sender: TObject);
var i: integer;
    flg: boolean;
    flgs: TArray<boolean>;
begin
  try
   if mctPLC.Connected then
   begin
    flgs := TArray<boolean>.Create();
    SetLength(flgs,9);
    mctPLC.ReadInputBits(1,9,flgs);
    for i := 0 to ckInputs.Count - 1 do
    begin
     (*
     flg := false;
     mctPLC.ReadInputBits(i+1,1,flg);
     ckInputs.Checked[i] := flg;
     *)
     ckInputs.Checked[i] := flgs[i];
    end;
   end;
  except
    on ex: Exception do
    begin
      ShowMessage('Problemi: '+ex.Message);
    end;
  end;
end;

procedure TForm1.btnScriviRegisterClick(Sender: TObject);
var vettore: TArray<Word>;
    i: integer;
begin
  if mctPLC.Connected then
  begin
    vettore := TArray<Word>.Create();
    SetLength(vettore,4);
    for i := 0 to 4-1 do
    begin
      vettore[i] := StrToIntDef(sgDati.Cells[3,i],0);
    end;
    mctPLC.WriteRegisters(24576,vettore);
  end;
end;

procedure TForm1.btnWriteCoilsClick(Sender: TObject);
var i: integer;
    flg: boolean;
begin
  try
   if mctPLC.Connected then
   begin
    for i := 0 to ckOutputs.Count - 1 do
    begin
     flg := ckWriteOutputs.Checked[i];
     mctPLC.WriteCoil(i+1,flg);
    end;
   end;
  except
    on ex: Exception do
    begin
      ShowMessage('Problemi: '+ex.Message);
    end;
  end;
end;

procedure TForm1.ckAutomaticoClick(Sender: TObject);
begin
  // cambia lo stato del flag
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  mctPLC := TIdModBusClient.Create(self);
  mctPLC.ConnectTimeout := 0;
  mctPLC.IPVersion := Id_IPv4;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  mctPLC.Free;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if ckAutomatico.Checked then
  begin
   try
    if mctPLC.Connected then
    begin
      btnReadCoils.Click;
      // btnWriteCoils.Click;
      btnReadDiscreteInputs.Click;
      // registri
      btnLeggiRegister.Click;
      // btnScriviRegister.Click;
    end;
   except
    on ex: Exception do
    begin
      ShowMessage('Problemi: '+ex.Message);
    end;
   end;
  end;
end;

end.
