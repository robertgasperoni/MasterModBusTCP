program ModBusTCP_Tester;

uses
  Vcl.Forms,
  UnTestModBus in 'UnTestModBus.pas' {Form1},
  IdModbusClient in 'IdModbusClient.pas',
  IdModbusServer in 'IdModbusServer.pas',
  ModbusConsts in 'ModbusConsts.pas',
  ModbusStrConsts in 'ModbusStrConsts.pas',
  ModbusTypes in 'ModbusTypes.pas',
  ModbusUtils in 'ModbusUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
