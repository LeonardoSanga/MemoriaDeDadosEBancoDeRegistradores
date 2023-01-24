`timescale 1ns / 1ns

module regfile_tb();
  
  logic clk, we3;
  logic[4:0] a1, a2, a3;
  logic[31:0] wd3, rd1, rd2;
  
  regfile dut1(.clk(clk), .we3(we3), .a1(a1), .a2(a2), .a3(a3), .wd3(wd3), .rd1(rd1), .rd2(rd2));
  
  initial begin
    // criar arquivo para gerar as formas de onda
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  
  always begin
    #50 clk = ~clk;
  end
  
  initial begin
    clk = 0;
    
    we3 = 0;  // leitura
    a1 = 9;
    
    $display("\nLeitura do registrador de endereco %h antes da escrita", a1);
    $display("Saida = %b, Endereco = %h, Clock = %d, Tempo = %d", rd1, a1, clk, $time);
    
    #50
    we3 = 1;  // escrita
    a3 = a1;
    wd3 = 1;
    
    #10
    we3 = 0;  // leitura
    
    $display("Leitura do registrador de endereco %h depois da escrita", a1);
    $display("Saida = %b, Endereco = %h, Clock = %d, Tempo = %d\n", rd1, a1, clk, $time);
    
    #10
    a2 = 31;  
    
    $display("Leitura do registrador de endereco %h antes da escrita", a2);
    $display("Saida = %b, Endereco = %h, Clock = %d, Tempo = %d", rd2, a2, clk, $time);
    
    #80
    we3 = 1;  // escrita
    a3 = a2;
    wd3 = 3;
    
    #10
    we3 = 0;  // leitura
    
    $display("Leitura do registrador de endereco %h depois da escrita", a2);
    $display("Saida = %b, Endereco = %h, Clock = %d, Tempo = %d\n", rd2, a2, clk, $time);
    
    #10
    a2 = 9;
    
    $display("Leitura do registrador de endereco %h antes da escrita", a2);
    $display("Saida = %b, Endereco = %h, Clock = %d, Tempo = %d", rd2, a2, clk, $time);
    
    #80
    we3 = 1;  // escrita
    a3 = a2;
    wd3 = 123;
    
    #10
    we3 = 0;  // leitura
    
    $display("Leitura do registrador de endereco %h depois da escrita", a1);
    $display("Saida = %b, Endereco = %h, Clock = %d, Tempo = %d\n", rd2, a2, clk, $time);
    
    $stop;
  end
  
endmodule