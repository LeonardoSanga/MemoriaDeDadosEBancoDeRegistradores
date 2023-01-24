`timescale 1ns / 1ns

module dmem_tb();
  
  logic clk, we;
  logic[31:0] a, wd, rd;
  
  dmem dut(.clk(clk), .we(we), .a(a), .wd(wd), .rd(rd));
  
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
    
    // Experimento 1:
    $display("Experimento 1:\n");
    
    // Escrita
    a = 1;
    we = 1;
    wd = -4;
    #51
    $display("Escrita: Entrada = %b, Saida = %b, Endereco = %h, Clock = %d, Tempo = %d", wd, rd, a, clk, $time);
    
    // Leitura
    we = 0;
    $display("Leitura: Saida = %b, Endereco = %h, Clock = %d, Tempo = %d\n", rd, a, clk, $time);
    
    
   // Escrita
    a = 64;
    we = 1;
    wd = 25437;
    #100
    $display("Escrita: Entrada = %b, Saida = %b, Endereco = %h, Clock = %d, Tempo = %d", wd, rd, a, clk, $time);
    
    // Leitura
    we = 0;
    $display("Leitura: Saida = %b, Endereco = %h, Clock = %d, Tempo = %d\n", rd, a, clk, $time);
    
    
    // Escrita
    a = 255;
    we = 1;
    wd = 52332423;
    #100
    $display("Escrita: Entrada = %b, Saida = %b, Endereco = %h, Clock = %d, Tempo = %d", wd, rd, a, clk, $time);
    
    // Leitura
    we = 0;
    $display("Leitura: Saida = %b, Endereco = %h, Clock = %d, Tempo = %d\n", rd, a, clk, $time);
    
    
    // Escrita
    a = 127;
    we = 1;
    wd = -7;
    #100
    $display("Escrita: Entrada = %b, Saida = %b, Endereco = %h, Clock = %d, Tempo = %d", wd, rd, a, clk, $time);
    
    // Leitura
    we = 0;
    $display("Leitura: Saida = %b, Endereco = %h, Clock = %d, Tempo = %d\n", rd, a, clk, $time);
    
    // Escrita
    a = 191;
    we = 1;
    wd = -921232;
    #100
    $display("Escrita: Entrada = %b, Saida = %b, Endereco = %h, Clock = %d, Tempo = %d", wd, rd, a, clk, $time);
    
    // Leitura
    we = 0;
    $display("Leitura: Saida = %b, Endereco = %h, Clock = %d, Tempo = %d\n", rd, a, clk, $time);
    
    
    // Experimento 2:
    $display("Experimento 2:"); 
    
    $display("\nCaso 1:");
    
    #100
    we = 1;
    wd = 13;

    // Antes de apresentar o endereço
    $display("Entrada = %b, Conteudo = %b, Endereco = %h, Clock = %d, Tempo = %d", wd, rd, a, clk, $time);
    
    #10
    a = 1;
    // Depois de apresentar o endereço
    $display("Entrada = %b, Conteudo = %b, Endereco = %h, Clock = %d, Tempo = %d", wd, rd, a, clk, $time);
    
    #90
    // Após a borda do sinal de relógio
    $display("Entrada = %b, Conteudo = %b, Endereco = %h, Clock = %d, Tempo = %d", wd, rd, a, clk, $time);
    
    $display("\nCaso 2:");
    
    #100
    wd = 5356364;
    // Antes de apresentar o endereço
    $display("Entrada = %b, Conteudo = %b, Endereco = %h, Clock = %d, Tempo = %d", wd, rd, a, clk, $time);
    
    #10
    a = 98;
    // Depois de apresentar o endereço
    $display("Entrada = %b, Conteudo = %b, Endereco = %h, Clock = %d, Tempo = %d", wd, rd, a, clk, $time);
    
    #90
    // Após a borda do sinal de relógio
    $display("Entrada = %b, Conteudo = %b, Endereco = %h, Clock = %d, Tempo = %d", wd, rd, a, clk, $time);
    
    $stop;
  end
  
endmodule