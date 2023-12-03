module register_file(input logic [31:0]in,input logic [3:0]s1,s2,s3,input logic w_r,rst,clk,en,output logic [31:0]op1,op2

    );
    logic [31:0]r_file[15:0];
    always_ff@(posedge clk)
    begin
    if(en)
     begin
       if(rst)
         begin
          for(int i=0;i<16;i++)
           begin
            r_file[i]<=32'd0;
           end 
         op1<=32'bx;
         op2<=32'bx;
        end
       else 
        begin
         if(w_r)
         begin
         r_file[s1]<=in;
         end
         else 
            begin
              op1<=r_file[s2];
              op2<=r_file[s3];
             
             end
          end 
        end 
    
   else
     begin 
     op1<=32'bz;
     op2<=32'bz;
     end
  end
endmodule
