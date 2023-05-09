# MasterModBusTCP
A small Delphi 11 demo for a ModBus TCP Master for the PLC_INOUT Project
I used a Delphi Library from P.L. Polak at https://github.com/coassoftwaresystems/delphi-modbus/blob/develop/demos/Indy9/Master/ModbusMaster.dpr

Type the IPv4 address of your Arduino Opta unit for a Modbus TCP (in PLC_INOUT demo the IPv4 is 192.168.1.232), then press Connect.

If you check Automatic polling every 200 ms all the inputs and outputs reading are reported in the checkbox groups and in the Grid.

The columns in the grid are: 

Register No., Decimal Value, Hexadecimal Value, Decimal Value to be written.

If you check the boxes in Write Outputs and then press the Write Coils button you will see the Read Coils working and their status shown in the Read Coils checkboxes.

If you press the User Button on the Arduino Opta 8 you will see the status of the Inputs/Outputs and Registers if you use the PLC_INOUT Ladder Script for the Arduino PLC IDE v.1.0.3.1 (Build Feb. 20, 2023)

The comments and the labels could be in Italian, you can change them if you wish.

