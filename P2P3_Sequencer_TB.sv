module sdmoore_tb;

 // Inputs
 logic din;
 logic clk;
 logic reset;

 // Outputs
 logic dout;

 // Instantiate the Sequence Detector using Moore FSM
 sdmoore uut (
  .din(din), 
  .clk(clk), 
  .reset(reset), 
  .dout(dout)
 );

// set up the clock
 initial begin
   $dumpfile("dump.vcd");
   $dumpvars(1,uut);
   $monitor($time, , ,"clk=%b",clk,,"dout=%b",dout,,"reset=%b",reset,,"din=%b",din);
 clk = 0;
 forever #5 clk = ~clk;
 end 

 initial begin
  // Initialize Inputs
  din = 0; reset =1;
   #5;
  reset = 0;
  #10;


  din = 0;//0110
  #10;
  din = 1;
  #10;
  din = 1; 
  #10;
  din = 0; 
  #10;

  din = 1; //1000 (2nd digit)
  #10;
  din = 0;
  #10;
  din = 0;
  #10;
  din = 0; 
  #20 $finish;
   

 end
      
endmodule