comPort = ‘COM3’; % Change with actual com port.
baudRate = 9600; % Communication rate from computer to Velmex
vxm = serialport(comPort, baudRate); % Configures serial port to communicate with VXM
app.Connection = vmx; % Allows for us to close serial port when done
configureTerminator(vxm, ‘CR’); 
flush(vxm);
writeline(vxm, ‘/1M2S’); %1M permanently stores the following mode to motor 1. 2S sets the mode of motor 1 to mode 2. See VMX Stepping Motor Controller Manual for motor modes (Appendix M).
pause(0.2);
moveForward = “F,C, S1M2000, I1M400, LA1, RX”; %Command to move the motor 400 steps forward* 
moveBack = “F,C, S1M-2000, I1M-400, LA1, RX”; %Command to move the motor 400 steps back* 
writeline(vxm, moveForward); %Sends forward command to vxm
pause(3);
writeline(vxm, modeBack);  %Sends backward command to vxm
pause(3);
delete(app.Connection); % Closes serial connection
