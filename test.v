`timescale 1ns / 1ps

module test();
wire [31:0] outpt;
reg [31:0] A;
reg [31:0] B;

topmodule a6( .A(A), .B(B),.outpt(outpt));

initial 
begin

#1 A=32'h42990000; B=32'h41086666;  //76.5+8.525
#5 A=32'hC0B80000; B=32'hC2C68000;  //-5.75-99.25
#5 A=32'hC29F0000; B=32'h41950000;  //-79.5+18.625
#5 A=32'h427F0000; B=32'hC25E0000;  //63.75-55.5
#5 A=32'h7F800000; B=32'hC25E0000;  //inf-number
#5 A=32'h7F800000; B=32'h425E0000;  //inf+number
#5 A=32'h7F800000; B=32'h00000000;  // inf +0
#15 $finish;

end

endmodule
