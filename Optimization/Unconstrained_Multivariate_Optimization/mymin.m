% 求最优步长的函数
function r_solve = mymin(x,s,fun)
% 在x点，方向为s，求最优的步长lambda(这里命名叫r)
syms r;
fun_r = fun(x + r*s);
dfr = diff(fun_r,r);
r_solve = solve(dfr,r);
tmp = 1e10;
t = 1;
if length(r_solve) > 1
    reval = eval(r_solve);
    for i = 1:length(r_solve)
        if subs(fun_r,r,reval(i)) < tmp
            tmp = subs(fun_r,r,reval(i));
            t =i;
        end
    end
    r_solve = reval(t);
else
    r_solve =eval(r_solve);
end
end
