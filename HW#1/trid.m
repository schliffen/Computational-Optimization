function x = trid(md, ld , ud , b)
%
% Solve Ax = b f o r a t r i d i a g o n a l A
% md = di a g ona l ve c o to r o f A ( l eng th n)
% ld = lower di ag ona l o f A ( l ength (n?1)
% ud = upper di ag ona l o f A ( l ength (n?1)
% b = r i g h t hand s i d e ve c t o r
% LU de compos i t ion ( o v e rwr i t ing e n t r i e s )
n = length (b ) ;
for k=1:n?1
ld (k)=ld ( k )/md( k ) ; % compute mu l t i p l i e r
md( k+1)=md( k+1)-ld ( k )*ud( k ) ; % update pivot
b( k+1)=b( k+1)-ld ( k )*b( k ) ; % update r?h?s
end
% backward s u b s t i t u t i o n
x=b ;
x (n)=x (n)/md(n ) ;
for k=n?1:?1:1
x ( k)=(x ( k)?ud( k )? x ( k+1))/md( k ) ;
end