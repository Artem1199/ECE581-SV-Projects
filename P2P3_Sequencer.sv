// Code your design here
module sdmoore(input bit clk,
                   input logic reset,
                   input logic din,
                   output logic dout);

  typedef enum logic [4:0] {s0, s1, s2, s3, s4, s5, s6, s7, s8} state_t;



state_t state;
state_t next_state;


  always_ff @(posedge clk or posedge reset ) begin
    
    if(reset)
     	state <= s0;
      else 
        state <= next_state;

  end //always_ff
    

  always_comb begin // begin sequence
      
      unique case(state)
		//state 0
        s0: begin
          $display("not-matched (s0)");
          if(din) 
            next_state = s0;
          else 
           next_state = s1;
        end
        
		// state 1
        s1: begin
          if(din)
            next_state = s2; 
          else
            next_state = s0;
        end
        
		//state 2
        s2: begin
          if(din)
            next_state = s3; else
              next_state = s0;
        end
        
		// state 3
        s3: begin
          if(din)
            next_state = s0; else
            next_state = s4;
        end
        
		// state 4
        s4: begin
          if(din)
            next_state = s5; else
              next_state = s0;
        end
        
		// state 5
       s5: begin
         if(din) 
           next_state = s0; else
           next_state = s6;
        end
        
		// state 6
        s6: begin
          if(din) 
           next_state = s0;
          else
           next_state = s7;
        end
        
		// state 7
        s7: begin
          if(din)
            next_state = s0; else
           next_state = s8; 
        end
        
        
		// state 8
        s8: begin
          $display("matched");
          
          if (din) begin
            next_state = s0;$display("reset matching"); end
            else begin
              next_state = s0;$display("reset matching"); end
        end
        
        default: $display("displays 2 bug");

      endcase

    end //always_comb
  
  
assign dout = (state == s8);


endmodule