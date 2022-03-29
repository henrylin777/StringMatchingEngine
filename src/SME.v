`timescale 1ns/10ps


module top;
 
   import uvm_pkg::*;
   `include "uvm_macros.svh"
 
   string name = "C Trip";
   string re = "C T.*";
 
   initial
   begin
      automatic bit success;
 
      //re = uvm_glob_to_re(re);
      success = uvm_re_match(re, name);
 
      if(success)
         $display("Match Detected");
      else
         $display("Match not Detected");
 
 
      $display("End of Test");
      $finish;
   end
 
endmodule



module SME(clk, reset, chardata, isstring, ispattern, valid, match, match_index);
    input clk;
    input reset;
    input chardata;
    input isstring;
    input ispattern;


    output reg match;
    output reg [4:0] match_index;
    output reg valid;

    reg [255:0] stringData; // 8bits 32chars 
    reg [63:0] pattern; // 8bits 8chars 



    always @(posedge clk) begin

        if (rst) begin
            isstring <= 1'b0;
            ispattern <= 1'b0;
            valid <= 1'b0;
            match <= 1'b0;
            match_index <= 1'b0;
        end 
        else 
            if (isstring)
                stringData <= {stringData[6:0], chardata};
            else if (ispattern)
                pattern <= {pattern[6:0], pattern};
    end


    always @(posedge isstring) begin

        if (rst) begin
            isstring <= 1'b0;
            ispattern <= 1'b0;
            valid <= 1'b0;
            match <= 1'b0;
            match_index <= 1'b0;
        end
    end

    always @(negedge ispattern) begin
        match = uvm_re_match(pattern, str);

    end
endmodule

module ParsePattern():

    input reg []
    parameter 

endmodule





module Compare(clk, data, pattern, valid, match, match_index);
    input clk;
    input [7:0] data;
    input [7:0] pattern;

    output valid;
    output match;
    output match_index;


    


endmodule

// module SME2(clk,reset,chardata,isstring,ispattern,valid,match,match_index);
    // input clk;
    // input reset;
    // input [7:0] chardata;
    // input isstring;
    // input ispattern;
    // output match;
    // output [4:0] match_index;
    // output valid;
    // reg match;
    // reg [4:0] match_index;
    // reg valid;
// endmodule
