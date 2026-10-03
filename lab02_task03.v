//MUX (Gate Level): 
module MUX_GateLevel(a0,a1,a2,a3,a4,a5,a6,a7,s0,s1,s2,y); 
input a0,a1,a2,a3,a4,a5,a6,a7,s0,s1,s2; 
output y; 
wire ns0,ns1,ns2; 
wire y0,y1,y2,y3,y4,y5,y6,y7; 
not n1(ns0,s0); 
not n2(ns1,s1); 
not n3(ns2,s2); 
and x1(y0,a0,ns2,ns1,ns0); //000 
and x2(y1,a1,ns2,ns1,s0); //001 
and x3(y2,a2,ns2,s1,ns0); //010 
and x4(y3,a3,ns2,s1,s0); //011 
and x5(y4,a4,s2,ns1,ns0); //100 
and x6(y5,a5,s2,ns1,s0); //101 
and x7(y6,a6,s2,s1,ns0); //110 
and x8(y7,a7,s2,s1,s0); //111 
or o1(y,y0,y1,y2,y3,y4,y5,y6,y7); 
endmodule
//MUX (Data Flow): 
module MUX_DataFlow(a0,a1,a2,a3,a4,a5,a6,a7,s0,s1,s2,y);
input a0,a1,a2,a3,a4,a5,a6,a7,s0,s1,s2;
output y;
assign y= (s2==0 & s1==0 & s0==0)? a0:
(s2==0 & s1==0 & s0==1)? a1:
(s2==0 & s1==1 & s0==0)? a2:
(s2==0 & s1==1 & s0==1)? a3:
(s2==1 & s1==0 & s0==0)? a4:
(s2==1 & s1==0 & s0==1)? a5:
(s2==1 & s1==1 & s0==0)? a6: a7;
endmodule
//Common testbench (MUX): 
module tb_MUX();
reg d0,d1,d2,d3,d4,d5,d6,d7,s0,s1,s2;
wire m;
MUX_GateLevel uut(d0,d1,d2,d3,d4,d5,d6,d7,s0,s1,s2,m);
initial 
begin 
d0=1; d1=1; d2=1; d3=1; d4=1; d5=1; d6=1; d7=1;
s0=0; s1=0; s2=0;
#50
s0=0; s1=0; s2=1;
#50
s0=0; s1=1; s2=0;
#50
s0=0; s1=1; s2=1;
#50
s0=1; s1=0; s2=0;
#50
s0=1; s1=0; s2=1;
#50
s0=1; s1=1; s2=0;
#50
s0=1; s1=1; s2=1;
end
endmodule
