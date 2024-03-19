module full_adder( A,B,Cin,Sum,Cout);

input wire A;
input wire B;
input wire Cin;
 output wire Sum;
 output wire Cout;
  assign Sum = A^B^Cin;
  assign Cout =(A&B)|(Cin&(A^B));








    
endmodule