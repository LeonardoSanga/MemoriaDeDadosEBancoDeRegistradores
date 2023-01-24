module dmem(input logic clk, we,
            input logic[31:0] a, wd,
            output logic[31:0] rd);
  
  logic[31:0] RAM[63:0];
  
  always @(posedge clk)
    if(we)
      RAM[a[31:2]] <= wd;
  
  assign rd = RAM[a[31:2]];
  
endmodule