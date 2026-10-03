//HALF ADDER (Gate level): 
module ha_GateLevel(A,B,sum,carry); 
input A,B; 
output sum,carry; 
xor(sum,A,B); 
and(carry,A,B); 
endmodule 
//HALF ADDER (Data Flow): 
module ha_DataFlow(A,B,sum,carry); 
input A,B; 
output sum,carry; 
assign sum= A^B; 
assign carry= A&B; 
endmodule 
//Common Testbench (HALF ADDER):
module tb_ha(); 
reg x,y; 
wire sum,carry; 
ha_DataFlow uut(x,y,sum,carry); 
initial  
begin 
x=0; y=0; 
#50; 
x=0; y=1; 
#50; 
x=1; y=0; 
#50; 
x=1; y=1; 
end 
endmodule
//FULL ADDER (Gate Level): 
module fa_GateLevel(a,b,CIN,SUM,CARRY);
input a,b,CIN; 
output SUM,CARRY; 
wire t1,t2,t3; 
half_adder ha1(a,b,t1,t2); 
half_adder ha2(t1,CIN,SUM,t3); 
or o1(CARRY,t2,t3); 
endmodule
//FULL ADDER (Data Flow): 
module fa_DataFlow(a,b,CIN,SUM,CARRY); 
input a,b,CIN; 
output SUM,CARRY; 
assign SUM= a^b^CIN; 
assign CARRY= (a&b) | (b&CIN) | (CIN&a); 
endmodule
//Common Testbench (FULL ADDER): 
module tb_fa(); 
reg x,y,z; 
wire sum,carry; 
fa_GateLevel uut(x,y,z,sum,carry); 
initial  
begin 
x=0; y=0; z=0; 
#50;
x=0; y=0; z=1; 
#50; 
x=0; y=1; z=0; 
#50; 
x=0; y=1; z=1; 
#50; 
x=1; y=0; z=0; 
#50; 
x=1; y=0; z=1; 
#50; 
x=1; y=1; z=0; 
#50; 
x=1; y=1; z=1; 
end 
endmodule
