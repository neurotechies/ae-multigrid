function y = spmul_noflip(P, z)
   sz = size(z,2);
   y = zeros([P.sx sz]);
   spmm_mex(P.sp_vals, P.sp_cind, P.sp_roff, z.', P.sx, P.sy, sz, y, 1024);
   y = reshape(y,[sz P.sx]);
end
