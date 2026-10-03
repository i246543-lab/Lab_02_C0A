//DECODER (Gate Level): 
module decoder_GateLevel(a,b,c,y0,y1,y2,y3,y4,y5,y6,y7); 
input a,b,c; 
output y0,y1,y2,y3,y4,y5,y6,y7;
wire na,nb,nc; 
not n1(na,a); 
not n2(nb,b); 
not n3(nc,c); 
and(y0,na,nb,nc); //000 
and(y1,na,nb,c); //001 
and(y2,na,b,nc); //010 
and(y3,na,b,c); //011 
and(y4,a,nb,nc); //100 
and(y5,a,nb,c); //101 
and(y6,a,b,nc); //110 
and(y7,a,b,c); //111 
endmodule
//DECODER (Data Flow): 
module decoder_DataFlow(a,b,c,y0,y1,y2,y3,y4,y5,y6,y7); 
input a,b,c; 
output y0,y1,y2,y3,y4,y5,y6,y7; 
assign y0= ~a&~b&~c; //000 
assign y1= ~a&~b& c; //001 
assign y2= ~a& b&~c; //010 
assign y3= ~a& b& c; //011 
assign y4=  a&~b&~c; //100 
assign y5=  a&~b& c; //101 
assign y6=  a& b&~c; //110 
assign y7=  a& b& c; //111 
endmodule
//Common testbench (DECODER): 
module tb_decoder(); 
reg x,y,z; 
wire d0,d1,d2,d3,d4,d5,d6,d7; 
decoder_GateLevel uut(x,y,z,d0,d1,d2,d3,d4,d5,d6,d7); 
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
